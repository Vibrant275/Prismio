#include "ir_generator.h"
#include <llvm/IR/Verifier.h>
#include <llvm/Support/FileSystem.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/TargetSelect.h>
#include <llvm/Target/TargetMachine.h>
#include <llvm/Target/TargetOptions.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/IR/LegacyPassManager.h>
#include <llvm/ADT/SmallVector.h>
#include <iostream>

IRGenerator::IRGenerator(const std::string& moduleName) {
    context = std::make_unique<llvm::LLVMContext>();
    module = std::make_unique<llvm::Module>(moduleName, *context);
    builder = std::make_unique<llvm::IRBuilder<>>(*context);

    // Initialize global scope
    pushScope();

    // Declare built-in functions
    declareBuiltins();
}

void IRGenerator::pushScope() {
    scopes.push_back(Scope());
}

void IRGenerator::popScope() {
    if (!scopes.empty()) {
        scopes.pop_back();
    }
}

llvm::AllocaInst* IRGenerator::getVariable(const std::string& name) {
    // Search from innermost to outermost scope
    for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
        auto found = it->namedValues.find(name);
        if (found != it->namedValues.end()) {
            return found->second;
        }
    }
    return nullptr;
}

void IRGenerator::setVariable(const std::string& name, llvm::AllocaInst* value) {
    if (!scopes.empty()) {
        scopes.back().namedValues[name] = value;
    }
}

void IRGenerator::generate(const ModuleNode& moduleNode) {
    for (const auto& stmt : moduleNode.statements) {
        switch (stmt->type) {
            case NodeType::IMPORT_STATEMENT:
                generateImport(dynamic_cast<ImportStatementNode*>(stmt.get()));
                break;
        case NodeType::EXTERN_FUNCTION:  // ADD THIS CASE
            generateExternFunction(dynamic_cast<ExternFunctionNode*>(stmt.get()));
            break;
            case NodeType::VARIABLE_DECL:
                generateGlobalVariable(dynamic_cast<VariableDeclNode*>(stmt.get()));
                break;
            case NodeType::FUNCTION:
                generateFunction(dynamic_cast<FunctionNode*>(stmt.get()));
                break;
            case NodeType::STRUCT_DECL:
                generateStruct(dynamic_cast<StructDeclNode*>(stmt.get()));
                break;
            case NodeType::ENUM_DECL:
                generateEnum(dynamic_cast<EnumDeclNode*>(stmt.get()));
                break;
            case NodeType::TRAIT_DECL:
                generateTrait(dynamic_cast<TraitDeclNode*>(stmt.get()));
                break;
            case NodeType::IMPL_DECL:
                generateImpl(dynamic_cast<ImplDeclNode*>(stmt.get()));
                break;
            default:
                std::cerr << "Unknown top-level statement type" << std::endl;
                break;
        }
    }
}

void IRGenerator::generateImport(const ImportStatementNode* node) {
    // For now, imports are no-op in IR generation
    // Later we'll link against other modules
}

void IRGenerator::generateExternFunction(const ExternFunctionNode* node) {
    // Skip if this extern function was already declared (duplicate from merged imports)
    if (module->getFunction(node->name)) {
        return;
    }

    // Build parameter types using SmallVector
    llvm::SmallVector<llvm::Type*, 8> paramTypes;
    for (const auto& param : node->parameters) {
        auto* paramNode = dynamic_cast<FunctionParameterNode*>(param.get());
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(paramNode->type_annotation.get());
        llvm::Type* paramType = convertType(typeNode);
        paramTypes.push_back(paramType);
    }

    // Build return type
    llvm::Type* returnType = llvm::Type::getVoidTy(*context);
    if (node->return_type) {
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(node->return_type.get());
        returnType = convertType(typeNode);
    }

    // Create function type
    llvm::FunctionType* funcType = llvm::FunctionType::get(
        returnType,
        paramTypes,
        node->is_vararg  // variadic flag
    );

    // Create extern function declaration (no body)
    llvm::Function* function = llvm::Function::Create(
        funcType,
        llvm::Function::ExternalLinkage,  // External linkage for C functions
        node->name,
        module.get()
    );

    // Set parameter names
    unsigned idx = 0;
    for (auto& arg : function->args()) {
        auto* paramNode = dynamic_cast<FunctionParameterNode*>(node->parameters[idx].get());
        arg.setName(paramNode->name);
        idx++;
    }

    // No body generation for extern functions - they're just declarations
}

void IRGenerator::generateGlobalVariable(const VariableDeclNode* node) {
    llvm::Type* varType = llvm::Type::getInt32Ty(*context); // Default to i32

    if (node->type_annotation) {
        varType = convertType(dynamic_cast<TypeAnnotationNode*>(node->type_annotation.get()));
    } else if (node->initializer) {
        // Infer type from initializer
        auto* litNode = dynamic_cast<LiteralExprNode*>(node->initializer.get());
        if (litNode) {
            if (litNode->literal_type == TokenType::NUMBER_LITERAL) {
                varType = llvm::Type::getInt32Ty(*context);
            } else if (litNode->literal_type == TokenType::BOOL_LITERAL) {
                varType = llvm::Type::getInt1Ty(*context);
            } else if (litNode->literal_type == TokenType::STRING_LITERAL) {
                varType = llvm::PointerType::get(llvm::Type::getInt8Ty(*context), 0);
            } else if (litNode->literal_type == TokenType::CHAR_LITERAL) {
                varType = llvm::Type::getInt8Ty(*context);
            }
        }
    }

    llvm::Constant* initializer = nullptr;
    if (node->initializer) {
        auto* litNode = dynamic_cast<LiteralExprNode*>(node->initializer.get());
        if (litNode) {
            if (litNode->literal_type == TokenType::NUMBER_LITERAL) {
                initializer = llvm::ConstantInt::get(varType, std::stoi(litNode->value));
            } else if (litNode->literal_type == TokenType::BOOL_LITERAL) {
                initializer = llvm::ConstantInt::get(varType, litNode->value == "true" ? 1 : 0);
            } else {
                initializer = llvm::Constant::getNullValue(varType);
            }
        } else {
            initializer = llvm::Constant::getNullValue(varType);
        }
    } else {
        initializer = llvm::Constant::getNullValue(varType);
    }

    auto* globalVar = new llvm::GlobalVariable(
        *module,
        varType,
        !node->is_mutable, // isConstant
        llvm::GlobalValue::ExternalLinkage,
        initializer,
        node->name
    );

    // Store in global scope for later access
    if (!scopes.empty()) {
        // Create a fake AllocaInst pointer to store the global
        // We'll handle this specially in generateIdentifierExpr
        scopes[0].namedValues[node->name] = reinterpret_cast<llvm::AllocaInst*>(globalVar);
    }
}

void IRGenerator::generateFunction(const FunctionNode* node) {
    // Skip if a function with this name already has a body (duplicate from merged imports)
    if (auto* existing = module->getFunction(node->name)) {
        if (!existing->empty()) {
            return;
        }
    }

    // Build parameter types using SmallVector
    llvm::SmallVector<llvm::Type*, 8> paramTypes;
    for (const auto& param : node->parameters) {
        auto* paramNode = dynamic_cast<FunctionParameterNode*>(param.get());
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(paramNode->type_annotation.get());
        llvm::Type* paramType = convertType(typeNode);
        paramTypes.push_back(paramType);
    }

    // Build return type
    llvm::Type* returnType = llvm::Type::getVoidTy(*context);
    if (node->return_type) {
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(node->return_type.get());
        returnType = convertType(typeNode);
    }

    // Create function type
    llvm::FunctionType* funcType = llvm::FunctionType::get(returnType, paramTypes, false);

    // Reuse existing declaration if present (e.g., from a previous extern), otherwise create new
    llvm::Function* function = module->getFunction(node->name);
    if (!function) {
        function = llvm::Function::Create(
            funcType,
            llvm::Function::ExternalLinkage,
            node->name,
            module.get()
        );
    }

    // Set parameter names
    unsigned idx = 0;
    for (auto& arg : function->args()) {
        auto* paramNode = dynamic_cast<FunctionParameterNode*>(node->parameters[idx].get());
        arg.setName(paramNode->name);
        idx++;
    }

    // Create entry block
    llvm::BasicBlock* entryBlock = llvm::BasicBlock::Create(*context, "entry", function);
    builder->SetInsertPoint(entryBlock);

    // Push new scope for function
    pushScope();
    currentFunction = function;

    // Allocate space for parameters
    idx = 0;
    for (auto& arg : function->args()) {
        auto* paramNode = dynamic_cast<FunctionParameterNode*>(node->parameters[idx].get());
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(paramNode->type_annotation.get());
        llvm::Type* paramType = convertType(typeNode);

        llvm::AllocaInst* alloca = createEntryBlockAlloca(function, paramNode->name, paramType);
        builder->CreateStore(&arg, alloca);
        setVariable(paramNode->name, alloca);

        idx++;
    }

    // Generate function body
    if (node->body) {
        generateBlock(dynamic_cast<BlockNode*>(node->body.get()));
    }

    // If no return statement, add default return
    if (!builder->GetInsertBlock()->getTerminator()) {
        if (returnType->isVoidTy()) {
            builder->CreateRetVoid();
        } else {
            builder->CreateRet(llvm::Constant::getNullValue(returnType));
        }
    }

    // Verify function
    if (llvm::verifyFunction(*function, &llvm::errs())) {
        std::cerr << "Error: Function verification failed for " << node->name << std::endl;
    }

    popScope();
    currentFunction = nullptr;
}

void IRGenerator::generateStruct(const StructDeclNode* node) {
    // Skip if this struct type already exists (duplicate from merged imports)
    if (llvm::StructType::getTypeByName(*context, node->name)) {
        return;
    }

    // Build field types using SmallVector
    llvm::SmallVector<llvm::Type*, 8> fieldTypes;
    for (const auto& field : node->fields) {
        auto* typeNode = dynamic_cast<TypeAnnotationNode*>(field.type_annotation.get());
        llvm::Type* fieldType = convertType(typeNode);
        fieldTypes.push_back(fieldType);
    }

    // Create struct type
    llvm::StructType* structType = llvm::StructType::create(*context, fieldTypes, node->name);

    // Store in type table
    if (!scopes.empty()) {
        scopes.back().namedTypes[node->name] = structType;
    }

    // Store field name -> index mapping
    std::map<std::string, int> fieldMap;
    for (int i = 0; i < (int)node->fields.size(); i++) {
        fieldMap[node->fields[i].name] = i;
    }
    structFieldIndices[node->name] = fieldMap;
}

void IRGenerator::generateEnum(const EnumDeclNode* node) {
    // Skip if this enum type already exists (duplicate from merged imports)
    if (!scopes.empty() && scopes.back().namedTypes.count(node->name)) {
        return;
    }

    // Enums are represented as i32 (tag) for now
    llvm::Type* enumType = llvm::Type::getInt32Ty(*context);

    if (!scopes.empty()) {
        scopes.back().namedTypes[node->name] = enumType;
    }

    // Store variant name -> index mapping
    std::map<std::string, int> variantMap;
    for (int i = 0; i < (int)node->variants.size(); i++) {
        variantMap[node->variants[i].name] = i;
    }
    enumVariants[node->name] = variantMap;
}

void IRGenerator::generateTrait(const TraitDeclNode* node) {
    // Traits are interface declarations - no IR needed yet
    // Will be used for vtables later
}

void IRGenerator::generateImpl(const ImplDeclNode* node) {
    // Generate methods
    for (const auto& method : node->methods) {
        generateFunction(dynamic_cast<FunctionNode*>(method.get()));
    }
}

llvm::Value* IRGenerator::generateStatement(const Node* node) {
    switch (node->type) {
        case NodeType::BLOCK:
            return generateBlock(dynamic_cast<const BlockNode*>(node));
        case NodeType::IF_STATEMENT:
            return generateIfStatement(dynamic_cast<const IfStatementNode*>(node));
        case NodeType::WHILE_STATEMENT:
            return generateWhileStatement(dynamic_cast<const WhileStatementNode*>(node));
        case NodeType::FOR_STATEMENT:
            return generateForStatement(dynamic_cast<const ForStatementNode*>(node));
        case NodeType::LOOP_STATEMENT:
            return generateLoopStatement(dynamic_cast<const LoopStatementNode*>(node));
        case NodeType::RETURN_STATEMENT:
            return generateReturnStatement(dynamic_cast<const ReturnStatementNode*>(node));
        case NodeType::VARIABLE_DECL:
            return generateVariableDecl(dynamic_cast<const VariableDeclNode*>(node));
        case NodeType::ASSIGNMENT_STATEMENT:
            return generateAssignmentStatement(dynamic_cast<const AssignmentStatementNode*>(node));
        case NodeType::EXPRESSION_STATEMENT:
            return generateExpressionStatement(dynamic_cast<const ExpressionStatementNode*>(node));
        case NodeType::BREAK_STATEMENT:
        case NodeType::CONTINUE_STATEMENT:
            // TODO: Implement with loop context
            return nullptr;
        default:
            std::cerr << "Unknown statement type" << std::endl;
            return nullptr;
    }
}

llvm::Value* IRGenerator::generateBlock(const BlockNode* node) {
    pushScope();

    llvm::Value* lastValue = nullptr;
    for (const auto& stmt : node->statements) {
        lastValue = generateStatement(stmt.get());
    }

    popScope();
    return lastValue;
}

llvm::Value* IRGenerator::generateIfStatement(const IfStatementNode* node) {
    llvm::Value* condValue = generateExpression(node->condition.get());

    // Convert condition to i1
    condValue = builder->CreateICmpNE(
        condValue,
        llvm::ConstantInt::get(*context, llvm::APInt(1, 0)),
        "ifcond"
    );

    llvm::Function* function = builder->GetInsertBlock()->getParent();

    llvm::BasicBlock* thenBlock = llvm::BasicBlock::Create(*context, "then", function);
    llvm::BasicBlock* elseBlock = llvm::BasicBlock::Create(*context, "else");
    llvm::BasicBlock* mergeBlock = llvm::BasicBlock::Create(*context, "ifcont");

    if (node->else_block) {
        builder->CreateCondBr(condValue, thenBlock, elseBlock);
    } else {
        builder->CreateCondBr(condValue, thenBlock, mergeBlock);
    }

    // Then block
    builder->SetInsertPoint(thenBlock);
    generateStatement(node->then_block.get());
    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(mergeBlock);
    }

    // Else block
    if (node->else_block) {
        function->insert(function->end(), elseBlock);
        builder->SetInsertPoint(elseBlock);
        generateStatement(node->else_block.get());
        if (!builder->GetInsertBlock()->getTerminator()) {
            builder->CreateBr(mergeBlock);
        }
    }

    // Merge block
    function->insert(function->end(), mergeBlock);
    builder->SetInsertPoint(mergeBlock);

    return nullptr;
}

llvm::Value* IRGenerator::generateWhileStatement(const WhileStatementNode* node) {
    llvm::Function* function = builder->GetInsertBlock()->getParent();

    llvm::BasicBlock* condBlock = llvm::BasicBlock::Create(*context, "whilecond", function);
    llvm::BasicBlock* bodyBlock = llvm::BasicBlock::Create(*context, "whilebody");
    llvm::BasicBlock* afterBlock = llvm::BasicBlock::Create(*context, "afterwhile");

    builder->CreateBr(condBlock);
    builder->SetInsertPoint(condBlock);

    llvm::Value* condValue = generateExpression(node->condition.get());

    // Handle boolean conversion properly
    if (condValue && condValue->getType()->isIntegerTy()) {
        if (condValue->getType()->getIntegerBitWidth() != 1) {
            condValue = builder->CreateICmpNE(
                condValue,
                llvm::ConstantInt::get(condValue->getType(), 0),
                "whilecond"
            );
        }
    }

    builder->CreateCondBr(condValue, bodyBlock, afterBlock);

    function->insert(function->end(), bodyBlock);
    builder->SetInsertPoint(bodyBlock);

    if (node->body) {
        generateStatement(node->body.get());
    }

    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(condBlock);
    }

    function->insert(function->end(), afterBlock);
    builder->SetInsertPoint(afterBlock);

    return nullptr;
}

llvm::Value* IRGenerator::generateForStatement(const ForStatementNode* node) {
    // For now, implement as while loop
    // TODO: Proper iterator implementation
    return nullptr;
}

llvm::Value* IRGenerator::generateLoopStatement(const LoopStatementNode* node) {
    llvm::Function* function = builder->GetInsertBlock()->getParent();

    llvm::BasicBlock* loopBlock = llvm::BasicBlock::Create(*context, "loop", function);
    llvm::BasicBlock* afterBlock = llvm::BasicBlock::Create(*context, "afterloop");

    builder->CreateBr(loopBlock);
    builder->SetInsertPoint(loopBlock);

    generateStatement(node->body.get());

    if (!builder->GetInsertBlock()->getTerminator()) {
        builder->CreateBr(loopBlock);
    }

    function->insert(function->end(), afterBlock);
    builder->SetInsertPoint(afterBlock);

    return nullptr;
}

llvm::Value* IRGenerator::generateReturnStatement(const ReturnStatementNode* node) {
    if (node->value) {
        llvm::Value* retValue = generateExpression(node->value.get());
        return builder->CreateRet(retValue);
    } else {
        return builder->CreateRetVoid();
    }
}

llvm::Value* IRGenerator::generateVariableDecl(const VariableDeclNode* node) {
    llvm::Type* varType = llvm::Type::getInt32Ty(*context);
    llvm::Value* initValue = nullptr;

    // Determine variable type and generate initializer if present
    if (node->type_annotation) {
        varType = convertType(dynamic_cast<TypeAnnotationNode*>(node->type_annotation.get()));
    }
    
    if (node->initializer) {
        // Generate the initializer expression
        initValue = generateExpression(node->initializer.get());
        
        // Infer type from initializer if no explicit type annotation
        if (!node->type_annotation && initValue && initValue->getType()) {
            varType = initValue->getType();
        }
    }

    llvm::AllocaInst* alloca = createEntryBlockAlloca(currentFunction, node->name, varType);

    // Check if this is a 2D array
    bool is2D = false;
    // First check type annotation
    if (node->type_annotation) {
        auto* typeAnn = dynamic_cast<TypeAnnotationNode*>(node->type_annotation.get());
        if (typeAnn && typeAnn->is_array && typeAnn->element_type) {
            auto* elemType = dynamic_cast<TypeAnnotationNode*>(typeAnn->element_type.get());
            if (elemType && elemType->is_array) {
                is2D = true;
            }
        }
    }
    // Also check initializer (this should catch nested array literals)
    if (node->initializer && node->initializer->type == NodeType::ARRAY_LITERAL_EXPR) {
        auto* arrayLit = dynamic_cast<ArrayLiteralExprNode*>(node->initializer.get());
        if (arrayLit && !arrayLit->elements.empty() && 
            arrayLit->elements[0]->type == NodeType::ARRAY_LITERAL_EXPR) {
            is2D = true;
        }
    }

    // Store initializer value (generate if not already generated)
    if (node->initializer) {
        if (!initValue) {
            initValue = generateExpression(node->initializer.get());
        }
        if (initValue) {
            builder->CreateStore(initValue, alloca);
        }
    }

    setVariable(node->name, alloca);
    if (is2D && !scopes.empty()) {
        scopes.back().is2DArray[node->name] = true;
    }

    return alloca;
}

llvm::Value* IRGenerator::generateAssignmentStatement(const AssignmentStatementNode* node) {
    llvm::Value* value = generateExpression(node->value.get());

    // Handle different target types
    if (auto* identNode = dynamic_cast<IdentifierExprNode*>(node->target.get())) {
        // Simple variable assignment
        llvm::AllocaInst* variable = getVariable(identNode->name);
        if (!variable) {
            std::cerr << "Unknown variable: " << identNode->name << std::endl;
            return nullptr;
        }
        return builder->CreateStore(value, variable);
    }
    else if (auto* memberNode = dynamic_cast<MemberAccessExprNode*>(node->target.get())) {
        // Member access assignment (obj.field = value)
        auto* objIdent = dynamic_cast<IdentifierExprNode*>(memberNode->object.get());
        if (!objIdent) {
            std::cerr << "Error: Member assignment target must be an identifier" << std::endl;
            return nullptr;
        }

        // Load the struct pointer from the variable
        llvm::AllocaInst* variable = getVariable(objIdent->name);
        if (!variable) {
            std::cerr << "Unknown variable: " << objIdent->name << std::endl;
            return nullptr;
        }
        llvm::Value* structPtr = builder->CreateLoad(variable->getAllocatedType(), variable, "structptr");

        // Find the struct type and field index
        llvm::StructType* structType = nullptr;
        int fieldIndex = -1;
        for (auto& [sname, fieldMap] : structFieldIndices) {
            auto it = fieldMap.find(memberNode->member_name);
            if (it != fieldMap.end()) {
                structType = lookupStructType(sname);
                fieldIndex = it->second;
                break;
            }
        }

        if (!structType || fieldIndex < 0) {
            std::cerr << "Unknown struct field: " << memberNode->member_name << std::endl;
            return nullptr;
        }

        // GEP to the field and store
        llvm::Value* fieldPtr = builder->CreateStructGEP(structType, structPtr, fieldIndex, "fieldptr");
        return builder->CreateStore(value, fieldPtr);
    }
    else if (auto* indexNode = dynamic_cast<IndexExprNode*>(node->target.get())) {
        // Array index assignment (arr[i] = value)
        llvm::Value* arrayValue = generateExpression(indexNode->object.get());
        llvm::Value* indexValue = generateExpression(indexNode->index.get());

        if (!arrayValue || !indexValue) {
            return nullptr;
        }

        // Get element pointer
        llvm::Type* elemType = llvm::Type::getInt32Ty(*context);
        llvm::Value* elemPtr = builder->CreateGEP(
            elemType,
            arrayValue,
            indexValue,
            "index_ptr"
        );

        return builder->CreateStore(value, elemPtr);
    }

    std::cerr << "Unsupported assignment target type" << std::endl;
    return nullptr;
}

llvm::Value* IRGenerator::generateExpressionStatement(const ExpressionStatementNode* node) {
    return generateExpression(node->expression.get());
}

llvm::Value* IRGenerator::generateArrayLiteral(const ArrayLiteralExprNode* node) {
    if (node->elements.empty()) {
        return llvm::ConstantPointerNull::get(
            llvm::PointerType::get(llvm::Type::getInt32Ty(*context), 0)
        );
    }

    // Check for nested arrays
    bool isNested = (node->elements[0]->type == NodeType::ARRAY_LITERAL_EXPR);

    if (isNested) {
        // 2D array - allocate array of pointers to inner arrays
        auto* firstInner = dynamic_cast<ArrayLiteralExprNode*>(node->elements[0].get());
        size_t innerSize = firstInner->elements.size();

        llvm::Type* innerElemType = llvm::Type::getInt32Ty(*context);
        llvm::ArrayType* innerArrayType = llvm::ArrayType::get(innerElemType, innerSize);

        // Allocate array to hold pointers to each inner array
        llvm::ArrayType* ptrArrayType = llvm::ArrayType::get(
            llvm::PointerType::get(innerElemType, 0),
            node->elements.size()
        );

        llvm::AllocaInst* ptrArray = createEntryBlockAlloca(
            currentFunction,
            "array_literal",
            ptrArrayType
        );

        // Generate each inner array
        for (size_t i = 0; i < node->elements.size(); i++) {
            auto* innerNode = dynamic_cast<ArrayLiteralExprNode*>(node->elements[i].get());

            // Allocate space for this inner array
            llvm::ArrayType* currentInnerType = llvm::ArrayType::get(
                innerElemType,
                innerNode->elements.size()
            );

            llvm::AllocaInst* innerArray = createEntryBlockAlloca(
                currentFunction,
                "inner_array",
                currentInnerType
            );

            // Fill the inner array with values
            for (size_t j = 0; j < innerNode->elements.size(); j++) {
                llvm::Value* elem = generateExpression(innerNode->elements[j].get());

                llvm::Value* elemPtr = builder->CreateConstGEP2_32(
                    currentInnerType,
                    innerArray,
                    0, j,
                    "elem_ptr"
                );

                builder->CreateStore(elem, elemPtr);
            }

            // Store the pointer to this inner array in the pointer array
            llvm::Value* innerPtr = builder->CreatePointerCast(
                innerArray,
                llvm::PointerType::get(innerElemType, 0)
            );

            llvm::Value* ptrSlot = builder->CreateConstGEP2_32(
                ptrArrayType,
                ptrArray,
                0, i,
                "ptr_slot"
            );

            builder->CreateStore(innerPtr, ptrSlot);
        }

        // Return pointer to the array of pointers
        return builder->CreatePointerCast(
            ptrArray,
            llvm::PointerType::get(llvm::PointerType::get(innerElemType, 0), 0)
        );
    }

    // 1D array - same as before
    llvm::Value* firstElem = generateExpression(node->elements[0].get());
    llvm::Type* elemType = firstElem->getType();

    llvm::ArrayType* arrayType = llvm::ArrayType::get(
        elemType,
        node->elements.size()
    );

    llvm::AllocaInst* arrayAlloca = createEntryBlockAlloca(
        currentFunction,
        "array_literal",
        arrayType
    );

    for (size_t i = 0; i < node->elements.size(); i++) {
        llvm::Value* elem = generateExpression(node->elements[i].get());

        llvm::Value* elemPtr = builder->CreateConstGEP2_32(
            arrayType,
            arrayAlloca,
            0, i,
            "elem_ptr"
        );

        builder->CreateStore(elem, elemPtr);
    }

    return builder->CreatePointerCast(
        arrayAlloca,
        llvm::PointerType::get(elemType, 0)
    );
}

llvm::Value* IRGenerator::generateIndexExpr(const IndexExprNode* node) {
    llvm::Value* indexValue = generateExpression(node->index.get());

    if (!indexValue) {
        std::cerr << "Error: Invalid index in index expression" << std::endl;
        return nullptr;
    }

    // Handle nested indexing (2D arrays: arr[i][j])
    if (node->object->type == NodeType::INDEX_EXPR) {
        // Generate the outer index expression first
        // This returns a pointer to the inner array
        llvm::Value* innerArrayPtr = generateIndexExpr(
            dynamic_cast<const IndexExprNode*>(node->object.get())
        );

        if (!innerArrayPtr || !innerArrayPtr->getType()->isPointerTy()) {
            std::cerr << "Error: Nested index did not return pointer" << std::endl;
            return nullptr;
        }

        // Now this is a simple pointer + index operation
        llvm::Type* elemType = llvm::Type::getInt32Ty(*context);

        llvm::Value* elemPtr = builder->CreateGEP(
            elemType,
            innerArrayPtr,
            indexValue,
            "index_ptr"
        );

        return builder->CreateLoad(elemType, elemPtr, "index_load");
    }

    // Base case: simple array access or first level of 2D array
    llvm::Value* arrayValue = generateExpression(node->object.get());

    if (!arrayValue) {
        std::cerr << "Error: Invalid array in index expression" << std::endl;
        return nullptr;
    }

    // For arrays stored as pointers
    if (arrayValue->getType()->isPointerTy()) {
        // Check if this might be a 2D array
        bool is2DArray = false;
        if (node->object->type == NodeType::ARRAY_LITERAL_EXPR) {
            auto* arrayLit = dynamic_cast<const ArrayLiteralExprNode*>(node->object.get());
            if (!arrayLit->elements.empty() && 
                arrayLit->elements[0]->type == NodeType::ARRAY_LITERAL_EXPR) {
                is2DArray = true;
            }
        } else if (node->object->type == NodeType::IDENTIFIER_EXPR) {
            // For identifiers, check if it was declared as a 2D array
            auto* identNode = dynamic_cast<const IdentifierExprNode*>(node->object.get());
            // Search scopes for the variable's 2D array flag
            for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
                auto found = it->is2DArray.find(identNode->name);
                if (found != it->is2DArray.end() && found->second) {
                    is2DArray = true;
                    break;
                }
            }
        }

        // Try to detect 2D array: with opaque pointers, we can't check pointee type directly
        // So we'll use a workaround: try GEP with pointer type first
        llvm::Type* ptrType = llvm::PointerType::get(llvm::Type::getInt32Ty(*context), 0);
        
        if (is2DArray) {
            // 2D array case: use GEP with pointer type to get the pointer at index
            llvm::Value* innerPtrSlot = builder->CreateGEP(
                ptrType,
                arrayValue,
                indexValue,
                "inner_ptr_slot"
            );
            
            // Load the pointer to the inner array
            llvm::Value* innerArrayPtr = builder->CreateLoad(ptrType, innerPtrSlot, "inner_array_ptr");
            
            // Return the pointer to the inner array (not the value)
            return innerArrayPtr;
        } else {
            // 1D array case: use GEP with integer type
            llvm::Type* elemType = llvm::Type::getInt32Ty(*context);
            
            llvm::Value* elemPtr = builder->CreateGEP(
                elemType,
                arrayValue,
                indexValue,
                "index_ptr"
            );

            return builder->CreateLoad(elemType, elemPtr, "index_load");
        }
    }

    std::cerr << "Error: Array value is not a pointer type" << std::endl;
    return nullptr;
}

llvm::Value* IRGenerator::generateExpression(const Node* node) {
    switch (node->type) {
        case NodeType::BINARY_EXPR:
            return generateBinaryExpr(dynamic_cast<const BinaryExprNode*>(node));
        case NodeType::UNARY_EXPR:
            return generateUnaryExpr(dynamic_cast<const UnaryExprNode*>(node));
        case NodeType::LITERAL_EXPR:
            return generateLiteralExpr(dynamic_cast<const LiteralExprNode*>(node));
        case NodeType::IDENTIFIER_EXPR:
            return generateIdentifierExpr(dynamic_cast<const IdentifierExprNode*>(node));
        case NodeType::CALL_EXPR:
            return generateCallExpr(dynamic_cast<const CallExprNode*>(node));
    case NodeType::ARRAY_LITERAL_EXPR:
        return generateArrayLiteral(
            dynamic_cast<const ArrayLiteralExprNode*>(node)
        );

    case NodeType::INDEX_EXPR:
        return generateIndexExpr(
            dynamic_cast<const IndexExprNode*>(node)
        );
        case NodeType::MEMBER_ACCESS_EXPR:
            return generateMemberAccessExpr(dynamic_cast<const MemberAccessExprNode*>(node));
    case NodeType::STRUCT_LITERAL_EXPR:
        return generateStructLiteral(dynamic_cast<const StructLiteralExprNode*>(node));
        default:
            std::cerr << "Unknown expression type: " << getNodeTypeString(node->type) << std::endl;
            return nullptr;
    }
}

llvm::Value* IRGenerator::generateBinaryExpr(const BinaryExprNode* node) {
    llvm::Value* left = generateExpression(node->left.get());
    llvm::Value* right = generateExpression(node->right.get());

    if (!left || !right) return nullptr;

    switch (node->op) {
    case BinaryOp::ADD:
        return builder->CreateAdd(left, right, "addtmp");
    case BinaryOp::SUB:
        return builder->CreateSub(left, right, "subtmp");
    case BinaryOp::MUL:
        return builder->CreateMul(left, right, "multmp");
    case BinaryOp::DIV:
        return builder->CreateSDiv(left, right, "divtmp");
    case BinaryOp::MOD:
        return builder->CreateSRem(left, right, "modtmp");
    case BinaryOp::EQ:
        return builder->CreateICmpEQ(left, right, "eqtmp");
    case BinaryOp::NEQ:
        return builder->CreateICmpNE(left, right, "neqtmp");
    case BinaryOp::LT:
        return builder->CreateICmpSLT(left, right, "lttmp");
    case BinaryOp::GT:
        return builder->CreateICmpSGT(left, right, "gttmp");
    case BinaryOp::LTE:
        return builder->CreateICmpSLE(left, right, "letmp");
    case BinaryOp::GTE:
        return builder->CreateICmpSGE(left, right, "getmp");
    case BinaryOp::AND:
        return builder->CreateAnd(left, right, "andtmp");
    case BinaryOp::OR:
        return builder->CreateOr(left, right, "ortmp");
    default:
        std::cerr << "Unknown binary operator" << std::endl;
        return nullptr;
    }
}

llvm::Value* IRGenerator::generateUnaryExpr(const UnaryExprNode* node) {
    llvm::Value* operand = generateExpression(node->operand.get());

    if (!operand) return nullptr;

    switch (node->op) {
        case UnaryOp::NEG:
            return builder->CreateNeg(operand, "negtmp");
        case UnaryOp::NOT:
            return builder->CreateNot(operand, "nottmp");
        default:
            std::cerr << "Unknown unary operator" << std::endl;
            return nullptr;
    }
}

llvm::Value* IRGenerator::generateLiteralExpr(const LiteralExprNode* node) {
    switch (node->literal_type) {
    case TokenType::NUMBER_LITERAL:
        return llvm::ConstantInt::get(*context, llvm::APInt(32, std::stoi(node->value), true));
    case TokenType::BOOL_LITERAL:
        return llvm::ConstantInt::get(*context, llvm::APInt(1, node->value == "true" ? 1 : 0));
    case TokenType::STRING_LITERAL: {
            // Create a global string constant and return pointer to it
            llvm::Constant* strConstant = llvm::ConstantDataArray::getString(*context, node->value, true);
            llvm::GlobalVariable* strGlobal = new llvm::GlobalVariable(
                *module,
                strConstant->getType(),
                true,  // isConstant
                llvm::GlobalValue::PrivateLinkage,
                strConstant,
                ".str"
            );
            strGlobal->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::Global);

            // Return pointer to the string (i8*)
            return builder->CreatePointerCast(
                strGlobal,
                llvm::PointerType::get(llvm::Type::getInt8Ty(*context), 0)
            );
    }
    case TokenType::CHAR_LITERAL:
        return llvm::ConstantInt::get(*context, llvm::APInt(8, node->value[0]));
    default:
        return nullptr;
    }
}

llvm::Value* IRGenerator::generateIdentifierExpr(const IdentifierExprNode* node) {
    llvm::AllocaInst* variable = getVariable(node->name);
    if (!variable) {
        // Check if it's a global variable
        llvm::GlobalVariable* globalVar = module->getNamedGlobal(node->name);
        if (globalVar) {
            return builder->CreateLoad(globalVar->getValueType(), globalVar, node->name.c_str());
        }

        std::cerr << "Unknown variable: " << node->name << std::endl;
        return nullptr;
    }

    // Check if it's actually a global variable stored in the symbol table
    llvm::GlobalVariable* possibleGlobal = module->getNamedGlobal(node->name);
    if (possibleGlobal) {
        return builder->CreateLoad(possibleGlobal->getValueType(), possibleGlobal, node->name.c_str());
    }

    return builder->CreateLoad(variable->getAllocatedType(), variable, node->name.c_str());
}

llvm::Value* IRGenerator::generateCallExpr(const CallExprNode* node) {
    auto* calleeNode = dynamic_cast<IdentifierExprNode*>(node->callee.get());
    if (!calleeNode) {
        std::cerr << "Invalid callee in function call" << std::endl;
        return nullptr;
    }

    std::string functionName = calleeNode->name;

    // Handle println/print with no arguments - just print empty string (newline)
    if ((functionName == "println" || functionName == "print") && node->arguments.empty()) {
        llvm::Function* calleeFunc = module->getFunction(functionName);
        if (!calleeFunc) {
            std::cerr << "Unknown function: " << functionName << std::endl;
            return nullptr;
        }
        // Pass empty string
        llvm::Constant* emptyStr = llvm::ConstantDataArray::getString(*context, "", true);
        llvm::GlobalVariable* strGlobal = new llvm::GlobalVariable(
            *module, emptyStr->getType(), true,
            llvm::GlobalValue::PrivateLinkage, emptyStr, ".str.empty"
        );
        strGlobal->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::Global);
        llvm::Value* strPtr = builder->CreatePointerCast(
            strGlobal, llvm::PointerType::get(llvm::Type::getInt8Ty(*context), 0)
        );
        return builder->CreateCall(calleeFunc, {strPtr});
    }

    // Handle print/println overloading based on argument type
    if ((functionName == "println" || functionName == "print") && node->arguments.size() == 1) {
        llvm::Value* arg = generateExpression(node->arguments[0].get());
        if (!arg) return nullptr;

        llvm::Type* argType = arg->getType();

        // Determine which overload to call
        if (argType->isIntegerTy(32)) {
            functionName = functionName + "_int";
        } else if (argType->isIntegerTy(1)) {
            arg = builder->CreateZExt(arg, llvm::Type::getInt32Ty(*context));
            functionName = functionName + "_bool";
        } else if (argType->isIntegerTy(8)) {
            functionName = functionName + "_char";
        } else if (argType->isPointerTy()) {
            // String pointer - use default println/print
        } else {
            std::cerr << "Unsupported type for " << calleeNode->name << std::endl;
            return nullptr;
        }

        llvm::Function* calleeFunc = module->getFunction(functionName);
        if (!calleeFunc) {
            std::cerr << "Unknown function: " << functionName << std::endl;
            return nullptr;
        }

        llvm::SmallVector<llvm::Value*, 1> args;
        args.push_back(arg);

        return builder->CreateCall(calleeFunc, args);
    }

    // Regular function call
    llvm::Function* calleeFunc = module->getFunction(functionName);
    if (!calleeFunc) {
        std::cerr << "Unknown function: " << functionName << std::endl;
        return nullptr;
    }

    llvm::SmallVector<llvm::Value*, 8> args;
    unsigned paramIdx = 0;

    for (const auto& argNode : node->arguments) {
        llvm::Value* argVal = generateExpression(argNode.get());
        if (!argVal) {
            std::cerr << "Failed to generate argument " << paramIdx << " for function " << functionName << std::endl;
            return nullptr;
        }

        // Type checking and conversion
        if (paramIdx < calleeFunc->arg_size()) {
            llvm::Type* expectedType = calleeFunc->getFunctionType()->getParamType(paramIdx);
            llvm::Type* actualType = argVal->getType();

            // Handle integer type mismatches
            if (expectedType->isIntegerTy() && actualType->isIntegerTy()) {
                unsigned expectedBits = expectedType->getIntegerBitWidth();
                unsigned actualBits = actualType->getIntegerBitWidth();

                if (expectedBits > actualBits) {
                    argVal = builder->CreateZExt(argVal, expectedType);
                } else if (expectedBits < actualBits) {
                    argVal = builder->CreateTrunc(argVal, expectedType);
                }
            }
            // Handle pointer conversions
            else if (expectedType->isPointerTy() && actualType->isPointerTy()) {
                if (expectedType != actualType) {
                    argVal = builder->CreateBitCast(argVal, expectedType);
                }
            }
            // Handle pointer vs integer mismatch (shouldn't happen but be safe)
            else if (expectedType->isPointerTy() != actualType->isPointerTy()) {
                std::cerr << "Type mismatch for argument " << paramIdx
                          << " in function " << functionName
                          << ": expected " << (expectedType->isPointerTy() ? "pointer" : "integer")
                          << " but got " << (actualType->isPointerTy() ? "pointer" : "integer")
                          << std::endl;
                return nullptr;
            }
        }

        args.push_back(argVal);
        paramIdx++;
    }

    // Argument count validation
    if (!calleeFunc->isVarArg() && args.size() != calleeFunc->arg_size()) {
        std::cerr << "Error: Function " << functionName
                  << " expects " << calleeFunc->arg_size()
                  << " arguments but got " << args.size() << std::endl;
        return nullptr;
    }

    if (calleeFunc->getReturnType()->isVoidTy()) {
        return builder->CreateCall(calleeFunc, args);
    }

    return builder->CreateCall(calleeFunc, args, "calltmp");
}

llvm::Value* IRGenerator::generateMemberAccessExpr(const MemberAccessExprNode* node) {
    // Case 1: Enum variant access (e.g., TokenType.EOF)
    auto* identNode = dynamic_cast<const IdentifierExprNode*>(node->object.get());
    if (identNode) {
        auto enumIt = enumVariants.find(identNode->name);
        if (enumIt != enumVariants.end()) {
            auto variantIt = enumIt->second.find(node->member_name);
            if (variantIt != enumIt->second.end()) {
                return llvm::ConstantInt::get(llvm::Type::getInt32Ty(*context), variantIt->second);
            }
            std::cerr << "Unknown enum variant: " << identNode->name << "." << node->member_name << std::endl;
            return nullptr;
        }
    }

    // Case 2: Struct field access (e.g., lex.pos)
    // Generate the object expression to get the struct pointer
    llvm::Value* objValue = nullptr;
    std::string varName;

    if (identNode) {
        varName = identNode->name;
        // Load the struct pointer from the variable's alloca
        llvm::AllocaInst* variable = getVariable(varName);
        if (!variable) {
            std::cerr << "Unknown variable in member access: " << varName << std::endl;
            return nullptr;
        }
        objValue = builder->CreateLoad(variable->getAllocatedType(), variable, "structptr");
    } else {
        objValue = generateExpression(node->object.get());
    }

    if (!objValue) {
        std::cerr << "Failed to generate object for member access" << std::endl;
        return nullptr;
    }

    // Find the struct type and field index by searching all known structs
    llvm::StructType* structType = nullptr;
    int fieldIndex = -1;
    for (auto& [sname, fieldMap] : structFieldIndices) {
        auto it = fieldMap.find(node->member_name);
        if (it != fieldMap.end()) {
            structType = lookupStructType(sname);
            fieldIndex = it->second;
            break;
        }
    }

    if (!structType || fieldIndex < 0) {
        std::cerr << "Unknown struct field: " << node->member_name << std::endl;
        return nullptr;
    }

    // GEP to the field
    llvm::Value* fieldPtr = builder->CreateStructGEP(structType, objValue, fieldIndex, node->member_name + "_ptr");

    // Load and return the field value
    llvm::Type* fieldType = structType->getElementType(fieldIndex);
    return builder->CreateLoad(fieldType, fieldPtr, node->member_name);
}

llvm::StructType* IRGenerator::lookupStructType(const std::string& name) {
    return llvm::StructType::getTypeByName(*context, name);
}

llvm::Value* IRGenerator::generateStructLiteral(const StructLiteralExprNode* node) {
    // Look up the LLVM struct type
    llvm::StructType* structType = lookupStructType(node->struct_name);
    if (!structType) {
        std::cerr << "Unknown struct type: " << node->struct_name << std::endl;
        return nullptr;
    }

    // Heap-allocate the struct using malloc (so pointers survive function returns)
    llvm::Function* mallocFn = module->getFunction("malloc");
    if (!mallocFn) {
        std::cerr << "malloc not declared" << std::endl;
        return nullptr;
    }

    // Compute struct size using GEP-null trick
    llvm::Value* nullPtr = llvm::ConstantPointerNull::get(llvm::PointerType::get(structType, 0));
    llvm::Value* sizeGEP = builder->CreateConstGEP1_32(structType, nullPtr, 1, "sizeptr");
    llvm::Value* structSize = builder->CreatePtrToInt(sizeGEP, llvm::Type::getInt64Ty(*context), "structsize");

    // Call malloc
    llvm::Value* rawPtr = builder->CreateCall(mallocFn, {structSize}, "structmem");

    // Get field index mapping
    auto fieldMapIt = structFieldIndices.find(node->struct_name);
    if (fieldMapIt == structFieldIndices.end()) {
        std::cerr << "No field mapping for struct: " << node->struct_name << std::endl;
        return nullptr;
    }

    // Fill each field
    for (const auto& [fieldName, valueNode] : node->field_values) {
        auto indexIt = fieldMapIt->second.find(fieldName);
        if (indexIt == fieldMapIt->second.end()) {
            std::cerr << "Unknown field " << fieldName << " in struct " << node->struct_name << std::endl;
            return nullptr;
        }

        int fieldIdx = indexIt->second;
        llvm::Value* fieldValue = generateExpression(valueNode.get());
        if (!fieldValue) {
            std::cerr << "Failed to generate value for field " << fieldName << std::endl;
            return nullptr;
        }

        // Type coerce if needed (e.g., i1 to i32 for enum fields)
        llvm::Type* expectedType = structType->getElementType(fieldIdx);
        if (fieldValue->getType() != expectedType) {
            if (expectedType->isIntegerTy() && fieldValue->getType()->isIntegerTy()) {
                unsigned expectedBits = expectedType->getIntegerBitWidth();
                unsigned actualBits = fieldValue->getType()->getIntegerBitWidth();
                if (expectedBits > actualBits) {
                    fieldValue = builder->CreateZExt(fieldValue, expectedType);
                } else if (expectedBits < actualBits) {
                    fieldValue = builder->CreateTrunc(fieldValue, expectedType);
                }
            }
        }

        llvm::Value* fieldPtr = builder->CreateStructGEP(structType, rawPtr, fieldIdx, fieldName + "_ptr");
        builder->CreateStore(fieldValue, fieldPtr);
    }

    return rawPtr;
}

llvm::Type* IRGenerator::convertType(const TypeAnnotationNode* typeNode) {
    if (typeNode->type_name == "Int") {
        return llvm::Type::getInt32Ty(*context);
    } else if (typeNode->type_name == "Bool") {
        return llvm::Type::getInt1Ty(*context);
    } else if (typeNode->type_name == "Char") {
        return llvm::Type::getInt8Ty(*context);
    } else if (typeNode->type_name == "String") {
        return llvm::PointerType::get(llvm::Type::getInt8Ty(*context), 0);
    } else if (typeNode->is_array) {
        if (typeNode->element_type) {
            auto* elemTypeNode = dynamic_cast<TypeAnnotationNode*>(
                typeNode->element_type.get()
            );
            llvm::Type* elemType = convertType(elemTypeNode);

            // Represent arrays as pointers
            // In LLVM 14+, use opaque pointer type
            return llvm::PointerType::get(elemType, 0);
        }
    }

    // Check for user-defined types
    for (auto it = scopes.rbegin(); it != scopes.rend(); ++it) {
        auto found = it->namedTypes.find(typeNode->type_name);
        if (found != it->namedTypes.end()) {
            // Struct types are always passed/stored as pointers
            if (llvm::dyn_cast<llvm::StructType>(found->second)) {
                return llvm::PointerType::get(found->second, 0);
            }
            return found->second;
        }
    }

    return llvm::Type::getInt32Ty(*context); // Default
}

llvm::AllocaInst* IRGenerator::createEntryBlockAlloca(llvm::Function* function,
                                                       const std::string& varName,
                                                       llvm::Type* type) {
    llvm::IRBuilder<> tmpBuilder(&function->getEntryBlock(), function->getEntryBlock().begin());
    return tmpBuilder.CreateAlloca(type, nullptr, varName.c_str());
}

void IRGenerator::declareBuiltins() {
    llvm::Type* int8PtrType = llvm::PointerType::get(llvm::Type::getInt8Ty(*context), 0);
    llvm::Type* int32Type = llvm::Type::getInt32Ty(*context);
    llvm::Type* int8Type = llvm::Type::getInt8Ty(*context);
    llvm::Type* voidType = llvm::Type::getVoidTy(*context);
    llvm::Type* int64Type = llvm::Type::getInt64Ty(*context);

    // Declare malloc for struct heap allocation
    {
        llvm::FunctionType* mallocType = llvm::FunctionType::get(int8PtrType, {int64Type}, false);
        llvm::Function::Create(mallocType, llvm::Function::ExternalLinkage, "malloc", module.get());
    }

    // Declare printf
    llvm::SmallVector<llvm::Type*, 1> printfArgs;
    printfArgs.push_back(int8PtrType);

    llvm::FunctionType* printfType = llvm::FunctionType::get(
        int32Type,
        printfArgs,
        true
    );

    llvm::Function::Create(
        printfType,
        llvm::Function::ExternalLinkage,
        "printf",
        module.get()
    );

    // Declare println(string)
    llvm::SmallVector<llvm::Type*, 1> printlnStrArgs;
    printlnStrArgs.push_back(int8PtrType);

    llvm::FunctionType* printlnStrType = llvm::FunctionType::get(
        voidType,
        printlnStrArgs,
        false
    );

    llvm::Function::Create(
        printlnStrType,
        llvm::Function::ExternalLinkage,
        "println",
        module.get()
    );

    // Declare print(string)
    llvm::FunctionType* printStrType = llvm::FunctionType::get(
        voidType,
        printlnStrArgs,
        false
    );

    llvm::Function::Create(
        printStrType,
        llvm::Function::ExternalLinkage,
        "print",
        module.get()
    );

    // Declare println_int(i32)
    llvm::SmallVector<llvm::Type*, 1> printIntArgs;
    printIntArgs.push_back(int32Type);

    llvm::FunctionType* printlnIntType = llvm::FunctionType::get(
        voidType,
        printIntArgs,
        false
    );

    llvm::Function::Create(
        printlnIntType,
        llvm::Function::ExternalLinkage,
        "println_int",
        module.get()
    );

    // Declare print_int(i32)
    llvm::FunctionType* printIntType = llvm::FunctionType::get(
        voidType,
        printIntArgs,
        false
    );

    llvm::Function::Create(
        printIntType,
        llvm::Function::ExternalLinkage,
        "print_int",
        module.get()
    );

    // str_equals(s1: String, s2: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_equals", module.get());
    }

    // str_length(s: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 1> params;
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_length", module.get());
    }

    // str_concat(s1: String, s2: String) -> String
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int8PtrType, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_concat", module.get());
    }

    // str_substring(s: String, start: Int, length: Int) -> String
    {
        llvm::SmallVector<llvm::Type*, 3> params;
        params.push_back(int8PtrType);
        params.push_back(int32Type);
        params.push_back(int32Type);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int8PtrType, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_substring", module.get());
    }

    // str_char_at(s: String, index: Int) -> Char
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int32Type);

        llvm::FunctionType* funcType = llvm::FunctionType::get(
            llvm::Type::getInt8Ty(*context),  // Return i8, not i8*
            params,
            false
        );
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_char_at", module.get());
    }

    // str_contains(haystack: String, needle: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_contains", module.get());
    }

    // str_starts_with(s: String, prefix: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_starts_with", module.get());
    }

    // str_index_of(haystack: String, needle: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 2> params;
        params.push_back(int8PtrType);
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_index_of", module.get());
    }

    // int_to_str(n: Int) -> String
    {
        llvm::SmallVector<llvm::Type*, 1> params;
        params.push_back(int32Type);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int8PtrType, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "int_to_str", module.get());
    }

    // str_to_int(s: String) -> Int
    {
        llvm::SmallVector<llvm::Type*, 1> params;
        params.push_back(int8PtrType);

        llvm::FunctionType* funcType = llvm::FunctionType::get(int32Type, params, false);
        llvm::Function::Create(funcType, llvm::Function::ExternalLinkage,
                              "str_to_int", module.get());
    }

    // Declare println_bool(i1)
    llvm::SmallVector<llvm::Type*, 1> printBoolArgs;
    printBoolArgs.push_back(int32Type);  // Use i32 for bool to match C convention

    llvm::FunctionType* printlnBoolType = llvm::FunctionType::get(
        voidType,
        printBoolArgs,
        false
    );

    llvm::Function::Create(
        printlnBoolType,
        llvm::Function::ExternalLinkage,
        "println_bool",
        module.get()
    );

    // Declare print_bool(i1)
    llvm::FunctionType* printBoolType = llvm::FunctionType::get(
        voidType,
        printBoolArgs,
        false
    );

    llvm::Function::Create(
        printBoolType,
        llvm::Function::ExternalLinkage,
        "print_bool",
        module.get()
    );

    // Declare println_char(i8)
    llvm::SmallVector<llvm::Type*, 1> printCharArgs;
    printCharArgs.push_back(llvm::Type::getInt8Ty(*context));

    llvm::FunctionType* printlnCharType = llvm::FunctionType::get(
     llvm::Type::getVoidTy(*context),
     printCharArgs,
     false
 );

    llvm::Function::Create(
        printlnCharType,
        llvm::Function::ExternalLinkage,
        "println_char",
        module.get()
    );

    // Declare print_char(i8)
    llvm::FunctionType* printCharType = llvm::FunctionType::get(
         llvm::Type::getVoidTy(*context),
         printCharArgs,
         false
     );

    llvm::Function::Create(
        printCharType,
        llvm::Function::ExternalLinkage,
        "print_char",
        module.get()
    );
}

void IRGenerator::printIR() {
    module->print(llvm::outs(), nullptr);
}

void IRGenerator::writeIRToFile(const std::string& filename) {
    std::error_code EC;
    llvm::raw_fd_ostream dest(filename, EC, llvm::sys::fs::OF_None);

    if (EC) {
        std::cerr << "Could not open file: " << EC.message() << std::endl;
        return;
    }

    module->print(dest, nullptr);
}
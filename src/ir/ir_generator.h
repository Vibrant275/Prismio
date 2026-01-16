#ifndef IR_GENERATOR_H
#define IR_GENERATOR_H

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Value.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Verifier.h>
#include <map>
#include <string>
#include <memory>
#include "../parser/node.h"

class IRGenerator {
public:
    IRGenerator(const std::string& moduleName);

    // Main generation function
    void generate(const ModuleNode& module);

    // Get the generated module
    llvm::Module* getModule() { return module.get(); }

    // Print IR to stdout
    void printIR();

    // Write IR to file
    void writeIRToFile(const std::string& filename);

    // Write object file
    void writeObjectFile(const std::string& filename);

private:
    // LLVM context and module
    std::unique_ptr<llvm::LLVMContext> context;
    std::unique_ptr<llvm::Module> module;
    std::unique_ptr<llvm::IRBuilder<>> builder;

    // Symbol tables (per scope)
    struct Scope {
        std::map<std::string, llvm::AllocaInst*> namedValues;
        std::map<std::string, llvm::Type*> namedTypes;
    };

    std::vector<Scope> scopes;

    // Current function being generated
    llvm::Function* currentFunction = nullptr;

    // Scope management
    void pushScope();
    void popScope();
    llvm::AllocaInst* getVariable(const std::string& name);
    void setVariable(const std::string& name, llvm::AllocaInst* value);

    // Top-level generation
    void generateImport(const ImportStatementNode* node);
    void generateExternFunction(const ExternFunctionNode* node);
    void generateGlobalVariable(const VariableDeclNode* node);
    void generateFunction(const FunctionNode* node);
    void generateStruct(const StructDeclNode* node);
    void generateEnum(const EnumDeclNode* node);
    void generateTrait(const TraitDeclNode* node);
    void generateImpl(const ImplDeclNode* node);

    // Statement generation
    llvm::Value* generateStatement(const Node* node);
    llvm::Value* generateBlock(const BlockNode* node);
    llvm::Value* generateIfStatement(const IfStatementNode* node);
    llvm::Value* generateWhileStatement(const WhileStatementNode* node);
    llvm::Value* generateForStatement(const ForStatementNode* node);
    llvm::Value* generateLoopStatement(const LoopStatementNode* node);
    llvm::Value* generateReturnStatement(const ReturnStatementNode* node);
    llvm::Value* generateVariableDecl(const VariableDeclNode* node);
    llvm::Value* generateAssignmentStatement(const AssignmentStatementNode* node);
    llvm::Value* generateExpressionStatement(const ExpressionStatementNode* node);
    llvm::Value* generateArrayLiteral(const ArrayLiteralExprNode* node);

    llvm::Value* generateIndexExpr(const IndexExprNode* node);
    // Expression generation
    llvm::Value* generateExpression(const Node* node);
    llvm::Value* generateBinaryExpr(const BinaryExprNode* node);
    llvm::Value* generateUnaryExpr(const UnaryExprNode* node);
    llvm::Value* generateLiteralExpr(const LiteralExprNode* node);
    llvm::Value* generateIdentifierExpr(const IdentifierExprNode* node);
    llvm::Value* generateCallExpr(const CallExprNode* node);
    llvm::Value* generateMemberAccessExpr(const MemberAccessExprNode* node);

    // Type conversion
    llvm::Type* convertType(const TypeAnnotationNode* typeNode);
    llvm::Type* getTypeFromDataType(DataType dataType);

    // Utility functions
    llvm::AllocaInst* createEntryBlockAlloca(llvm::Function* function,
                                              const std::string& varName,
                                              llvm::Type* type);

    // Built-in functions
    void declareBuiltins();
    llvm::Function* getPrintFunction();
    llvm::Function* getPrintlnFunction();
};

#endif // IR_GENERATOR_H
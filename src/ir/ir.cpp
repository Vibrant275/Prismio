#include <iostream>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/FileSystem.h>
#include "../parser/node.h"

llvm::GlobalVariable* generateGlobalVariable(llvm::Module& module, const VariableDeclarationNode& varNode, llvm::Function* printfFunc, llvm::BasicBlock* entryBlock, llvm::IRBuilder<>& builder)
{

    std::cout << "[IR] Creating global variable: " << varNode.identifier << std::endl;
    std::cout << "[IR] varNode.dataType: " << static_cast<int>(varNode.dataType) << ", value index: " << varNode.value.index() << std::endl;
    if (std::holds_alternative<int>(varNode.value)) {
        std::cout << "[IR] varNode.value: " << std::get<int>(varNode.value) << std::endl;
    } else if (std::holds_alternative<std::string>(varNode.value)) {
        std::cout << "[IR] varNode.value: " << std::get<std::string>(varNode.value) << std::endl;
    } else {
        std::cout << "[IR] varNode.value: unknown type" << std::endl;
    }

    llvm::LLVMContext& context = module.getContext();
    llvm::Type* varType = nullptr;

    // Determine LLVM type based on varNode.dataType
    switch (varNode.dataType)
    {
        case DataType::INT:
            varType = llvm::Type::getInt32Ty(context);
            break;
        case DataType::STRING:
            varType = llvm::PointerType::get(context, 0);
            break;
        default:
            std::cerr << "[IR] Unsupported data type for variable: " << varNode.identifier << std::endl;
            return nullptr;
    }

    std::cout << "[IR] Creating constant value for: " << varNode.identifier << std::endl;
    llvm::Constant* constValue = nullptr;

    // Create constant based on varNode.dataType and varNode.value
    try
    {
        if (varNode.dataType == DataType::INT)
        {
            if (std::holds_alternative<int>(varNode.value))
            {
                constValue = llvm::ConstantInt::get(varType, std::get<int>(varNode.value));
            }
            else if (std::holds_alternative<std::string>(varNode.value))
            {
                std::string strVal = std::get<std::string>(varNode.value);
                try {
                    int intVal = std::stoi(strVal);
                    constValue = llvm::ConstantInt::get(varType, intVal);
                } catch (const std::exception& e) {
                    std::cerr << "[IR] Failed to convert string to int for variable " << varNode.identifier << ": " << e.what() << std::endl;
                    return nullptr;
                }
            }
            else
            {
                std::cerr << "[IR] Type mismatch: expected int for variable: " << varNode.identifier << std::endl;
                return nullptr;
            }
        }
        else if (varNode.dataType == DataType::STRING && std::holds_alternative<std::string>(varNode.value))
        {
            constValue = llvm::ConstantDataArray::getString(context, std::get<std::string>(varNode.value));
        }
        else
        {
            std::cerr << "[IR] Type mismatch: dataType does not match value for variable: " << varNode.identifier << std::endl;
            return nullptr;
        }
    }
    catch (const std::bad_variant_access& e)
    {
        std::cerr << "[IR] Bad variant access for variable " << varNode.identifier << ": " << e.what() << std::endl;
        return nullptr;
    }

    // Create the global variable
    auto* globalVar = new llvm::GlobalVariable(
        module,
        varType,
        varNode.access == "const",
        llvm::GlobalValue::ExternalLinkage,
        constValue,
        varNode.identifier
    );

    std::cout << "[IR] Global variable created: " << globalVar->getName().str() << std::endl;

    // Verify the global variable was added to the module
    if (module.getGlobalVariable(varNode.identifier) != globalVar)
    {
        std::cerr << "[IR] Failed to add global variable " << varNode.identifier << " to module." << std::endl;
        return nullptr;
    }
    std::cout << "[IR] Global variable " << varNode.identifier << " successfully added to module." << std::endl;

    // Generate code to print the variable's value in the main function
    if (varNode.dataType == DataType::INT)
    {
        // Create format string for printf (e.g., "%d\n")
        std::string formatStrContent = "%d\n";
        auto* i8Type = llvm::Type::getInt8Ty(context);
        auto* formatStr = llvm::ConstantDataArray::getString(context, formatStrContent, true);
        auto* arrayType = llvm::ArrayType::get(i8Type, formatStrContent.size() + 1);
        auto* formatStrVar = new llvm::GlobalVariable(
            module,
            arrayType,
            true,
            llvm::GlobalValue::PrivateLinkage,
            formatStr,
            ".str." + varNode.identifier
        );
        auto* formatStrPtr = builder.CreateBitCast(
            formatStrVar,
            llvm::PointerType::get(context, 0),
            "formatStrPtr." + varNode.identifier
        );

        // Load the global variable's value
        auto* loadVar = builder.CreateLoad(varType, globalVar, varNode.identifier + ".load");

        // Call printf with the format string and variable value
        builder.CreateCall(printfFunc, {formatStrPtr, loadVar});
        std::cout << "[IR] Generated printf call for variable: " << varNode.identifier << std::endl;
    }
    else
    {
        std::cout << "[IR] Skipping printf for non-int variable: " << varNode.identifier << std::endl;
    }

    return globalVar;
}

void generateIR(const ModuleNode& moduleNode)
{
    std::cout << "[IR] Starting IR generation..." << std::endl;

    llvm::LLVMContext context;
    llvm::Module module("example_module", context);

    // Declare printf function
    auto* printfType = llvm::FunctionType::get(
        llvm::Type::getInt32Ty(context),
        {llvm::PointerType::get(context, 0)},
        true
    );
    auto* printfFunc = llvm::Function::Create(
        printfType,
        llvm::Function::ExternalLinkage,
        "printf",
        module
    );

    // Create main function
    auto* mainType = llvm::FunctionType::get(llvm::Type::getInt32Ty(context), false);
    auto* mainFunc = llvm::Function::Create(
        mainType,
        llvm::Function::ExternalLinkage,
        "main",
        module
    );
    auto* entryBlock = llvm::BasicBlock::Create(context, "entry", mainFunc);
    llvm::IRBuilder<> builder(entryBlock);

    std::cout << "[IR] Iterating through AST nodes..." << std::endl;

    for (const auto& node : moduleNode.module)
    {
        std::cout << "[IR] Found node of type: " << static_cast<int>(node->node_type) << std::endl;
        std::cout << "[IR] Node: " << getNodeTypeString(node->node_type) << std::endl;

        if (node->node_type == NodeType::VARIABLE_DECLARATION)
        {
            std::cout << "[IR] Node is VARIABLE_DECLARATION." << std::endl;

            if (auto* varNode = dynamic_cast<VariableDeclarationNode*>(node.get()))
            {
                std::cout << "[IR] Successfully casted to VariableDeclarationNode." << std::endl;
                std::cout << "[IR] Generating global variable for: " << varNode->identifier << std::endl;
                auto* globalVar = generateGlobalVariable(module, *varNode, printfFunc, entryBlock, builder);
                if (!globalVar)
                {
                    std::cerr << "[IR] Failed to generate global variable for: " << varNode->identifier << std::endl;
                    continue;
                }
            }
            else
            {
                std::cout << "[IR] Failed to cast node to VariableDeclarationNode." << std::endl;
            }
        }
        else
        {
            std::cout << "[IR] Skipping node, not a VARIABLE_DECLARATION." << std::endl;
        }
    }

    // Return 0 from main
    builder.CreateRet(llvm::ConstantInt::get(llvm::Type::getInt32Ty(context), 0));

    // Verify the module
    std::string errStr;
    llvm::raw_string_ostream errStream(errStr);
    if (llvm::verifyModule(module, &errStream)) {
        std::cerr << "[IR] Module verification failed: " << errStr << std::endl;
        return;
    }

    // Debug: Print all global variables in the module
    std::cout << "[IR] Listing all global variables in module:" << std::endl;
    for (auto& global : module.globals())
    {
        std::cout << "[IR] Global: " << global.getName().str() << std::endl;
    }

    std::error_code EC;
    std::string outputPath = "C:\\Prismio_IR\\output.ll";
    llvm::raw_fd_ostream outFile(outputPath, EC, llvm::sys::fs::OF_None);

    if (EC)
    {
        std::cerr << "[IR] Could not open file: " << EC.message() << std::endl;
        return;
    }

    std::cout << "[IR] Writing module to file: " << outputPath << std::endl;
    module.print(outFile, nullptr);
    std::cout << "[IR] IR generation complete." << std::endl;
}
#include <iostream>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Constants.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Support/FileSystem.h>
#include "../parser/node.h"

llvm::GlobalVariable* generateGlobalVariable(llvm::Module& module, const VariableDeclarationNode& varNode)
{
    std::cout << "[IR] Creating global variable: " << varNode.identifier << std::endl;

    llvm::LLVMContext& context = module.getContext();
    llvm::Type* varType = llvm::Type::getInt32Ty(context);

    std::cout << "[IR] Creating constant value for: " << varNode.identifier << std::endl;
    llvm::Constant* constValue = llvm::ConstantInt::get(varType, std::get<int>(varNode.value));

    auto* globalVar = new llvm::GlobalVariable(
        module,
        varType,
        varNode.access == "const",
        llvm::GlobalValue::ExternalLinkage,
        constValue,
        varNode.identifier
    );

    std::cout << "[IR] Global variable created: " << globalVar->getName().str() << std::endl;
    return globalVar;
}

void generateIR(const ModuleNode& moduleNode)
{
    std::cout << "[IR] Starting IR generation..." << std::endl;

    llvm::LLVMContext context;
    llvm::Module module("example_module", context);

    std::cout << "[IR] Iterating through AST nodes..." << std::endl;
    std::cout << getNodeTypeString(moduleNode.module.at(0)->node_type) << std::endl;

    // for (const auto& node : moduleNode.module.size()) {
    //     std::cout << "[IR] Found node of type: " << static_cast<int>(node->node_type) << std::endl;
    //     std::cout << "[IR] Node: " << getNodeTypeString(node->node_type) << std::endl;
    //
    //     if (node->node_type == NodeType::VARIABLE_DECLARATION) {
    //         std::cout << "[IR] Node is VARIABLE_DECLARATION." << std::endl;
    //
    //         if (auto varNode = dynamic_cast<VariableDeclarationNode*>(node.get())) {
    //             std::cout << "[IR] Successfully casted to VariableDeclarationNode." << std::endl;
    //             std::cout << "[IR] Generating global variable for: " << varNode->identifier << std::endl;
    //             generateGlobalVariable(module, *varNode);
    //         } else {
    //             std::cout << "[IR] Failed to cast node to VariableDeclarationNode." << std::endl;
    //         }
    //     } else {
    //         std::cout << "[IR] Skipping node, not a VARIABLE_DECLARATION." << std::endl;
    //     }
    // }

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

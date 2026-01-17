#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <filesystem>
#include "./lexer/lexer.h"
#include "./parser/parser.h"
#include "./parser/node.h"
#include "./ir/ir_generator.h"
#include "./utils/extension.h"
#include "./utils/module_resolver.h"

using namespace std;

std::string readSourceCodeFromFile(const std::string& filePath)
{
    std::ifstream file(filePath, std::ios::in | std::ios::binary | std::ios::ate);
    if (!file)
    {
        throw std::runtime_error("Error: Could not open file " + filePath);
    }

    std::streamsize size = file.tellg();
    if (size < 0)
    {
        throw std::runtime_error("Error: Could not determine file size: " + filePath);
    }

    std::string buffer(static_cast<size_t>(size), '\0');
    file.seekg(0);
    if (!file.read(buffer.data(), size))
    {
        throw std::runtime_error("Error: Could not read file: " + filePath);
    }

    return buffer;
}

void printAST(const Node* node, int indent = 0)
{
    if (!node) return;

    std::string indentStr(indent * 2, ' ');
    std::cout << indentStr << getNodeTypeString(node->type);

    // Print node-specific information
    switch (node->type)
    {
    case NodeType::IMPORT_STATEMENT:
        {
            const auto* importNode = dynamic_cast<const ImportStatementNode*>(node);
            std::cout << " [";
            for (size_t i = 0; i < importNode->module_path.size(); i++)
            {
                if (i > 0) std::cout << ".";
                std::cout << importNode->module_path[i];
            }
            std::cout << "]";
            break;
        }
    case NodeType::EXTERN_FUNCTION:
        {
            // ADD THIS CASE
            const auto* externNode = dynamic_cast<const ExternFunctionNode*>(node);
            std::cout << " [" << externNode->name << " (extern)]";
            break;
        }
    case NodeType::VARIABLE_DECL:
        {
            const auto* varNode = dynamic_cast<const VariableDeclNode*>(node);
            std::cout << " [" << varNode->name;
            if (varNode->is_mutable) std::cout << " (mut)";
            std::cout << "]";
            break;
        }
    case NodeType::FUNCTION:
        {
            const auto* funcNode = dynamic_cast<const FunctionNode*>(node);
            std::cout << " [" << funcNode->name << "]";
            break;
        }
    case NodeType::STRUCT_DECL:
        {
            const auto* structNode = dynamic_cast<const StructDeclNode*>(node);
            std::cout << " [" << structNode->name << "]";
            break;
        }
    case NodeType::ENUM_DECL:
        {
            const auto* enumNode = dynamic_cast<const EnumDeclNode*>(node);
            std::cout << " [" << enumNode->name << "]";
            break;
        }
    case NodeType::IDENTIFIER_EXPR:
        {
            const auto* identNode = dynamic_cast<const IdentifierExprNode*>(node);
            std::cout << " [" << identNode->name << "]";
            break;
        }
    case NodeType::LITERAL_EXPR:
        {
            const auto* litNode = dynamic_cast<const LiteralExprNode*>(node);
            std::cout << " [" << litNode->value << "]";
            break;
        }
    case NodeType::BINARY_EXPR:
        {
            const auto* binNode = dynamic_cast<const BinaryExprNode*>(node);
            std::cout << " [op=" << static_cast<int>(binNode->op) << "]";
            break;
        }
    default:
        break;
    }

    std::cout << "\n";

    // Recursively print children
    if (node->type == NodeType::MODULE)
    {
        const auto* moduleNode = dynamic_cast<const ModuleNode*>(node);
        for (const auto& stmt : moduleNode->statements)
        {
            printAST(stmt.get(), indent + 1);
        }
    }
    else if (node->type == NodeType::FUNCTION)
    {
        const auto* funcNode = dynamic_cast<const FunctionNode*>(node);

        std::cout << indentStr << "  Parameters:\n";
        for (const auto& param : funcNode->parameters)
        {
            printAST(param.get(), indent + 2);
        }

        if (funcNode->return_type)
        {
            std::cout << indentStr << "  Return type:\n";
            printAST(funcNode->return_type.get(), indent + 2);
        }

        if (funcNode->body)
        {
            std::cout << indentStr << "  Body:\n";
            printAST(funcNode->body.get(), indent + 2);
        }
    }
    else if (node->type == NodeType::BLOCK)
    {
        const auto* blockNode = dynamic_cast<const BlockNode*>(node);
        for (const auto& stmt : blockNode->statements)
        {
            printAST(stmt.get(), indent + 1);
        }
    }
    else if (node->type == NodeType::IF_STATEMENT)
    {
        const auto* ifNode = dynamic_cast<const IfStatementNode*>(node);

        std::cout << indentStr << "  Condition:\n";
        printAST(ifNode->condition.get(), indent + 2);

        std::cout << indentStr << "  Then:\n";
        printAST(ifNode->then_block.get(), indent + 2);

        if (ifNode->else_block)
        {
            std::cout << indentStr << "  Else:\n";
            printAST(ifNode->else_block.get(), indent + 2);
        }
    }
    else if (node->type == NodeType::EXTERN_FUNCTION)
    {
        // ADD THIS BLOCK
        const auto* externNode = dynamic_cast<const ExternFunctionNode*>(node);

        std::cout << indentStr << "  Parameters:\n";
        for (const auto& param : externNode->parameters)
        {
            printAST(param.get(), indent + 2);
        }

        if (externNode->return_type)
        {
            std::cout << indentStr << "  Return type:\n";
            printAST(externNode->return_type.get(), indent + 2);
        }
    }
    else if (node->type == NodeType::VARIABLE_DECL)
    {
        const auto* varNode = dynamic_cast<const VariableDeclNode*>(node);

        if (varNode->type_annotation)
        {
            std::cout << indentStr << "  Type:\n";
            printAST(varNode->type_annotation.get(), indent + 2);
        }

        if (varNode->initializer)
        {
            std::cout << indentStr << "  Initializer:\n";
            printAST(varNode->initializer.get(), indent + 2);
        }
    }
    else if (node->type == NodeType::BINARY_EXPR)
    {
        const auto* binNode = dynamic_cast<const BinaryExprNode*>(node);

        std::cout << indentStr << "  Left:\n";
        printAST(binNode->left.get(), indent + 2);

        std::cout << indentStr << "  Right:\n";
        printAST(binNode->right.get(), indent + 2);
    }
    else if (node->type == NodeType::STRUCT_DECL)
    {
        const auto* structNode = dynamic_cast<const StructDeclNode*>(node);

        std::cout << indentStr << "  Fields:\n";
        for (const auto& field : structNode->fields)
        {
            std::cout << indentStr << "    " << field.name << ":\n";
            if (field.type_annotation)
            {
                printAST(field.type_annotation.get(), indent + 3);
            }
        }
    }
}

int main(int argc, char* argv[])
{
    std::ios::sync_with_stdio(false);

    if (argc < 2)
    {
        std::cerr << "Usage: " << argv[0] << " <source_file.psm>\n";
        return EXIT_FAILURE;
    }

    const std::string filePath = argv[1];

    if (filePath.length() < 4 || filePath.substr(filePath.length() - 4) != ".psm")
    {
        std::cerr << "Error: File must have a .psm extension.\n";
        return EXIT_FAILURE;
    }

    std::string input;
    try
    {
        input = readSourceCodeFromFile(filePath);
    }
    catch (const std::exception& e)
    {
        std::cerr << e.what() << '\n';
        return EXIT_FAILURE;
    }

    // Tokenization
    std::cout << "=== TOKENIZATION ===" << std::endl;
    Lexer lexer(input);
    auto result = lexer.tokenize();

    if (!result.errors.empty())
    {
        for (const auto& error : result.errors)
            displayError(error.message);
        return EXIT_FAILURE;
    }

    std::cout << "✓ Tokenization complete. " << result.tokens.size() << " tokens generated.\n\n";

    // Parsing
    std::cout << "=== PARSING ===" << std::endl;
    Parser parser(result.tokens);
    ModuleNode ast = parser.parse();

    std::cout << "✓ Parsing complete.\n\n";
    
    // Process imports
    std::cout << "=== PROCESSING IMPORTS ===" << std::endl;
    
    // Get the directory of the source file for module resolution
    std::filesystem::path sourcePath(filePath);
    std::string sourceDir = sourcePath.parent_path().string();
    if (sourceDir.empty()) {
        sourceDir = ".";
    }
    
    ModuleResolver resolver(sourceDir);
    
    // Store imported modules to keep them alive
    std::vector<std::unique_ptr<ModuleNode>> importedModules;
    
    // Collect all import statements and process them
    std::vector<size_t> importIndices;
    for (size_t i = 0; i < ast.statements.size(); i++) {
        if (ast.statements[i]->type == NodeType::IMPORT_STATEMENT) {
            importIndices.push_back(i);
        }
    }
    
    // Process each import
    for (size_t idx : importIndices) {
        auto* importNode = dynamic_cast<ImportStatementNode*>(ast.statements[idx].get());
        
        std::cout << "Importing: ";
        for (size_t i = 0; i < importNode->module_path.size(); i++) {
            if (i > 0) std::cout << ".";
            std::cout << importNode->module_path[i];
        }
        std::cout << std::endl;
        
        // Resolve and load the module
        auto importedModule = resolver.resolveModule(importNode->module_path);
        if (importedModule) {
            // Store the imported module to keep it alive
            importedModules.push_back(std::move(importedModule));
            auto* modulePtr = importedModules.back().get();
            
            // Merge imported declarations into the main module
            // Add all non-import statements from the imported module
            for (auto& importedStmt : modulePtr->statements) {
                // Skip import statements in imported modules (for now)
                if (importedStmt->type != NodeType::IMPORT_STATEMENT) {
                    // Move the statement to the main module
                    ast.statements.push_back(std::move(importedStmt));
                }
            }
            std::cout << "  ✓ Successfully imported" << std::endl;
        } else {
            std::cerr << "  ✗ Failed to import module" << std::endl;
        }
    }
    
    std::cout << "✓ Import processing complete.\n\n";

    // Print AST
    std::cout << "=== ABSTRACT SYNTAX TREE ===" << std::endl;
    printAST(&ast);

    // IR Generation
    std::cout << "\n=== IR GENERATION ===" << std::endl;
    IRGenerator irGen("main_module");
    irGen.generate(ast);

    std::cout << "✓ IR generation complete.\n\n";

    // Print IR
    std::cout << "=== LLVM IR ===" << std::endl;
    irGen.printIR();

    // Write IR to file
    std::string irFilename = filePath.substr(0, filePath.length() - 4) + ".ll";
    irGen.writeIRToFile(irFilename);
    std::cout << "\n✓ IR written to " << irFilename << "\n";

    std::cout << "\n✓ Compilation successful!\n";

    return EXIT_SUCCESS;
}

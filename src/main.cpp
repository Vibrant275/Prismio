#include "./ir/ir_generator.h"
#include "./lexer/lexer.h"
#include "./parser/node.h"
#include "./parser/parser.h"
#include "./utils/extension.h"
#include "./utils/module_resolver.h"
#include <filesystem>
#include <fstream>
#include <functional>
#include <iostream>
#include <set>
#include <string>
#include <vector>


using namespace std;

std::string readSourceCodeFromFile(const std::string &filePath) {
  std::ifstream file(filePath, std::ios::in | std::ios::binary | std::ios::ate);
  if (!file) {
    throw std::runtime_error("Error: Could not open file " + filePath);
  }

  std::streamsize size = file.tellg();
  if (size < 0) {
    throw std::runtime_error("Error: Could not determine file size: " +
                             filePath);
  }

  std::string buffer(static_cast<size_t>(size), '\0');
  file.seekg(0);
  if (!file.read(buffer.data(), size)) {
    throw std::runtime_error("Error: Could not read file: " + filePath);
  }

  return buffer;
}

void printAST(const Node *node, int indent = 0) {
  if (!node)
    return;

  std::string indentStr(indent * 2, ' ');
  std::cout << indentStr << getNodeTypeString(node->type);

  // Print node-specific information
  switch (node->type) {
  case NodeType::IMPORT_STATEMENT: {
    const auto *importNode = dynamic_cast<const ImportStatementNode *>(node);
    std::cout << " [";
    for (size_t i = 0; i < importNode->module_path.size(); i++) {
      if (i > 0)
        std::cout << ".";
      std::cout << importNode->module_path[i];
    }
    std::cout << "]";
    break;
  }
  case NodeType::EXTERN_FUNCTION: {
    const auto *externNode = dynamic_cast<const ExternFunctionNode *>(node);
    std::cout << " [" << externNode->name << " (extern)]";
    break;
  }
  case NodeType::VARIABLE_DECL: {
    const auto *varNode = dynamic_cast<const VariableDeclNode *>(node);
    std::cout << " [" << varNode->name;
    if (varNode->is_mutable)
      std::cout << " (mut)";
    std::cout << "]";
    break;
  }
  case NodeType::FUNCTION: {
    const auto *funcNode = dynamic_cast<const FunctionNode *>(node);
    std::cout << " [" << funcNode->name << "]";
    break;
  }
  case NodeType::STRUCT_DECL: {
    const auto *structNode = dynamic_cast<const StructDeclNode *>(node);
    std::cout << " [" << structNode->name << "]";
    break;
  }
  case NodeType::ENUM_DECL: {
    const auto *enumNode = dynamic_cast<const EnumDeclNode *>(node);
    std::cout << " [" << enumNode->name << "]";
    break;
  }
  case NodeType::IDENTIFIER_EXPR: {
    const auto *identNode = dynamic_cast<const IdentifierExprNode *>(node);
    std::cout << " [" << identNode->name << "]";
    break;
  }
  case NodeType::LITERAL_EXPR: {
    const auto *litNode = dynamic_cast<const LiteralExprNode *>(node);
    std::cout << " [" << litNode->value << "]";
    break;
  }
  case NodeType::BINARY_EXPR: {
    const auto *binNode = dynamic_cast<const BinaryExprNode *>(node);
    std::cout << " [op=" << static_cast<int>(binNode->op) << "]";
    break;
  }
  default:
    break;
  }

  std::cout << "\n";

  // Recursively print children
  if (node->type == NodeType::MODULE) {
    const auto *moduleNode = dynamic_cast<const ModuleNode *>(node);
    for (const auto &stmt : moduleNode->statements) {
      printAST(stmt.get(), indent + 1);
    }
  } else if (node->type == NodeType::FUNCTION) {
    const auto *funcNode = dynamic_cast<const FunctionNode *>(node);

    std::cout << indentStr << "  Parameters:\n";
    for (const auto &param : funcNode->parameters) {
      printAST(param.get(), indent + 2);
    }

    if (funcNode->return_type) {
      std::cout << indentStr << "  Return type:\n";
      printAST(funcNode->return_type.get(), indent + 2);
    }

    if (funcNode->body) {
      std::cout << indentStr << "  Body:\n";
      printAST(funcNode->body.get(), indent + 2);
    }
  } else if (node->type == NodeType::BLOCK) {
    const auto *blockNode = dynamic_cast<const BlockNode *>(node);
    for (const auto &stmt : blockNode->statements) {
      printAST(stmt.get(), indent + 1);
    }
  } else if (node->type == NodeType::IF_STATEMENT) {
    const auto *ifNode = dynamic_cast<const IfStatementNode *>(node);

    std::cout << indentStr << "  Condition:\n";
    printAST(ifNode->condition.get(), indent + 2);

    std::cout << indentStr << "  Then:\n";
    printAST(ifNode->then_block.get(), indent + 2);

    if (ifNode->else_block) {
      std::cout << indentStr << "  Else:\n";
      printAST(ifNode->else_block.get(), indent + 2);
    }
  } else if (node->type == NodeType::EXTERN_FUNCTION) {
    const auto *externNode = dynamic_cast<const ExternFunctionNode *>(node);

    std::cout << indentStr << "  Parameters:\n";
    for (const auto &param : externNode->parameters) {
      printAST(param.get(), indent + 2);
    }

    if (externNode->return_type) {
      std::cout << indentStr << "  Return type:\n";
      printAST(externNode->return_type.get(), indent + 2);
    }
  } else if (node->type == NodeType::VARIABLE_DECL) {
    const auto *varNode = dynamic_cast<const VariableDeclNode *>(node);

    if (varNode->type_annotation) {
      std::cout << indentStr << "  Type:\n";
      printAST(varNode->type_annotation.get(), indent + 2);
    }

    if (varNode->initializer) {
      std::cout << indentStr << "  Initializer:\n";
      printAST(varNode->initializer.get(), indent + 2);
    }
  } else if (node->type == NodeType::BINARY_EXPR) {
    const auto *binNode = dynamic_cast<const BinaryExprNode *>(node);

    std::cout << indentStr << "  Left:\n";
    printAST(binNode->left.get(), indent + 2);

    std::cout << indentStr << "  Right:\n";
    printAST(binNode->right.get(), indent + 2);
  } else if (node->type == NodeType::STRUCT_DECL) {
    const auto *structNode = dynamic_cast<const StructDeclNode *>(node);

    std::cout << indentStr << "  Fields:\n";
    for (const auto &field : structNode->fields) {
      std::cout << indentStr << "    " << field.name << ":\n";
      if (field.type_annotation) {
        printAST(field.type_annotation.get(), indent + 3);
      }
    }
  }
}

int main(int argc, char *argv[]) {
  std::ios::sync_with_stdio(false);

  if (argc < 2) {
    std::cerr << "Usage: " << argv[0] << " <source_file.psm>\n";
    return EXIT_FAILURE;
  }

  const std::string filePath = argv[1];

  if (filePath.length() < 4 ||
      filePath.substr(filePath.length() - 4) != ".psm") {
    std::cerr << "Error: File must have a .psm extension.\n";
    return EXIT_FAILURE;
  }

  std::string input;
  try {
    input = readSourceCodeFromFile(filePath);
  } catch (const std::exception &e) {
    std::cerr << e.what() << '\n';
    return EXIT_FAILURE;
  }

  // Tokenization
  std::cout << "=== TOKENIZATION ===" << std::endl;
  Lexer lexer(input);
  auto result = lexer.tokenize();

  if (!result.errors.empty()) {
    for (const auto &error : result.errors)
      displayError(error.message);
    return EXIT_FAILURE;
  }

  std::cout << "✓ Tokenization complete. " << result.tokens.size()
            << " tokens generated.\n\n";

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

  // Create a new merged module that will contain everything
  auto mergedModule = std::make_unique<ModuleNode>();

  // Track which imports we've already processed to avoid duplicates
  std::set<std::string> processedImports;

  // Recursive function to process imports
  std::function<bool(ModuleNode &)> processImports =
      [&](ModuleNode &currentModule) -> bool {
    std::cout << "[DEBUG] processImports called with module containing "
              << currentModule.statements.size() << " statements" << std::endl;

    // First, collect all import statements
    std::vector<const ImportStatementNode *> importsToProcess;

    std::cout << "[DEBUG] Scanning for import statements..." << std::endl;
    for (size_t i = 0; i < currentModule.statements.size(); i++) {
      // Skip null statements (already moved)
      if (!currentModule.statements[i]) {
        continue;
      }

      std::cout << "[DEBUG]   Statement " << i << ": "
                << getNodeTypeString(currentModule.statements[i]->type)
                << std::endl;

      if (currentModule.statements[i]->type == NodeType::IMPORT_STATEMENT) {
        auto *importNode = dynamic_cast<const ImportStatementNode *>(
            currentModule.statements[i].get());
        std::cout << "[DEBUG]     Found import statement!" << std::endl;
        importsToProcess.push_back(importNode);
      }
    }

    std::cout << "[DEBUG] Found " << importsToProcess.size()
              << " import statements to process" << std::endl;

    // Process each import (depth-first)
    for (const auto *importNode : importsToProcess) {
      // Create import key
      std::string importKey;
      for (size_t i = 0; i < importNode->module_path.size(); i++) {
        if (i > 0)
          importKey += ".";
        importKey += importNode->module_path[i];
      }

      std::cout << "[DEBUG] Processing import: " << importKey << std::endl;

      // Skip if already processed
      if (processedImports.count(importKey)) {
        std::cout << "[DEBUG] Skipping already imported: " << importKey
                  << std::endl;
        continue;
      }
      processedImports.insert(importKey);

      std::cout << "Importing: " << importKey << std::endl;

      // Resolve and load the module
      std::cout << "[DEBUG] Calling resolver.resolveModule..." << std::endl;
      auto importedModule = resolver.resolveModule(importNode->module_path);

      if (!importedModule) {
        std::cerr << "[ERROR] Failed to import module: " << importKey
                  << std::endl;
        return false;
      }

      std::cout << "[DEBUG] Import resolved successfully. Module has "
                << importedModule->statements.size() << " statements"
                << std::endl;

      // FIRST: Recursively process any imports in the imported module
      // This ensures dependencies are loaded before dependents (depth-first)
      std::cout
          << "[DEBUG] Recursively processing imports in imported module..."
          << std::endl;
      if (!processImports(*importedModule)) {
        std::cerr << "[ERROR] Failed to process nested imports in: "
                  << importKey << std::endl;
        return false;
      }

      // THEN: Add non-import statements from imported module to merged module
      // At this point, nested imports have been processed, but statements are
      // still intact because processImports only adds to mergedModule, it
      // doesn't clear the source
      std::cout << "[DEBUG] Adding statements from imported module to merged "
                   "module..."
                << std::endl;
      size_t addedCount = 0;
      for (auto &importedStmt : importedModule->statements) {
        if (importedStmt && importedStmt->type != NodeType::IMPORT_STATEMENT) {
          std::cout << "[DEBUG]   Adding: "
                    << getNodeTypeString(importedStmt->type) << std::endl;
          mergedModule->statements.push_back(std::move(importedStmt));
          addedCount++;
        }
      }

      std::cout << "[DEBUG] Added " << addedCount
                << " statements from imported module" << std::endl;
      std::cout << "  ✓ Successfully imported: " << importKey << std::endl;
    }

    std::cout << "[DEBUG] Adding non-import statements from current module..."
              << std::endl;
    // Now add non-import statements from current module to merged module
    size_t addedCount = 0;
    for (auto &stmt : currentModule.statements) {
      if (stmt && stmt->type != NodeType::IMPORT_STATEMENT) {
        std::cout << "[DEBUG]   Adding: " << getNodeTypeString(stmt->type)
                  << std::endl;
        mergedModule->statements.push_back(std::move(stmt));
        addedCount++;
      }
    }

    std::cout << "[DEBUG] Added " << addedCount << " non-import statements"
              << std::endl;
    std::cout << "[DEBUG] Merged module now has "
              << mergedModule->statements.size() << " total statements"
              << std::endl;

    return true;
  };
  // Process starting from main module
  if (!processImports(ast)) {
    std::cerr << "Error: Failed to process imports" << std::endl;
    return EXIT_FAILURE;
  }

  // Move merged module to ast
  ast.statements = std::move(mergedModule->statements);

  std::cout << "✓ Import processing complete. Total statements: "
            << ast.statements.size() << "\n\n";

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

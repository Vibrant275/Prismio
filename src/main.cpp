#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include "./lexer/lexer.h"
#include "./parser/parser.h"
#include "./semantic/semantic.h"
#include "./ir/ir.h"
#include "./codegen/codegen.h"

// Function to read source code from a file
std::string readSourceCodeFromFile(const std::string& filePath) {
    std::ifstream file(filePath);
    if (!file.is_open()) {
        std::cerr << "Error: Could not open file " << filePath << std::endl;
        exit(1);
    }
    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

int main(int argc, char* argv[]) {
    std::string input;

    if (argc > 1) {
        std::string filePath = argv[1];
        if (filePath.size() < 5 || filePath.substr(filePath.size() - 5) != ".psmi") {
            std::cerr << "Error: File must have a .psmi extension." << std::endl;
            return 1;
        }
        input = readSourceCodeFromFile(filePath);
    } else {
        std::cerr << "Usage: " << argv[0] << " <source_file.psmi>" << std::endl;
        return 1;
    }

    // Tokenization
    Lexer lexer(input);
    std::vector<Token> tokens = lexer.tokenize();
    std::cout << "Tokens generated: \n" << std::endl;

     for (const auto& token : tokens) {
         std::cout << "Token: " << token.value << std::endl;
     }

    try {
        // Parsing
        Parser parser(tokens);
        auto parseTree = parser.parse();
        std::cout << "Parsing complete." << std::endl;

        // Semantic Analysis
        SemanticAnalyzer semanticAnalyzer(parseTree);
        if (!semanticAnalyzer.analyze()) {
            std::cerr << "Semantic analysis failed." << std::endl;
            return 1;
        }

        // Intermediate Representation Generation
        IRGenerator irGenerator(parseTree);
        std::string irCode = irGenerator.generateIR();
        std::cout << "Intermediate representation generated:" << std::endl;
        std::cout << irCode << std::endl;

        // Code Generation
        CodeGenerator codeGenerator(irCode);
        codeGenerator.generateCode();
        std::cout << "Code generation complete." << std::endl;
    } catch (const std::runtime_error& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}

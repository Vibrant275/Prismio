#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include "./lexer/lexer.h"
#include "./parser/parser.h"

using namespace std;

std::string readSourceCodeFromFile(const std::string& filePath) {
    std::ifstream file(filePath);
    if (!file.is_open()) {
        throw std::runtime_error("Error: Could not open file " + filePath);
    }

    std::stringstream buffer;
    buffer << file.rdbuf();

    return buffer.str();
}

int main(const int argc, char* argv[]) {
    std::string input;

    if (argc > 1) {
        const std::string filePath = argv[1];
        const string extension = filePath.substr(filePath.size() - 4);
        if (extension != ".psm" && extension != ".ums") {
            std::cerr << "Error: File must have a .psm extension." << std::endl;
            return 1;
        }
        input = readSourceCodeFromFile(filePath);
    } else {
        std::cerr << "Usage: " << argv[0] << " <source_file.psm>" << std::endl;
        return 1;
    }

    // Tokenization
    Lexer lexer(input);
    vector<Token> tokens = lexer.tokenize();
    std::cout << "Tokenization complete." << std::endl;

    /*
    std::cout << "Tokens generated: \n" << std::endl;

     for (const auto& token : tokens) {
         std::cout << "Token: " << token.value << std::endl;
     }
     */

    Parser parser(tokens);
    parser.parse();
    std::cout << "Parsing complete." << std::endl;

//    try {
//        // Parsing
//
//        // Semantic Analysis
//        SemanticAnalyzer semanticAnalyzer(parseTree);
//        if (!semanticAnalyzer.analyze()) {
//            std::cerr << "Semantic analysis failed." << std::endl;
//            return 1;
//        }
//
//        // Intermediate Representation Generation
//        IRGenerator irGenerator(parseTree);
//        std::string irCode = irGenerator.generateIR();
//        std::cout << "Intermediate representation generated:" << std::endl;
//        std::cout << irCode << std::endl;
//
//        // Code Generation
//        CodeGenerator codeGenerator(irCode);
//        codeGenerator.generateCode();
//        std::cout << "Code generation complete." << std::endl;
//    } catch (const std::runtime_error& e) {
//        std::cerr << "Error: " << e.what() << std::endl;
//        return 1;
//    }

    return 0;
}

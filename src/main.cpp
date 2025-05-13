#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include "./lexer/lexer.h"
#include "./parser/parser.h"
#include "./ir/ir.h"
#include "parser/node.h"

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
    const auto ast = parser.parse();
    std::cout << "Parsing complete." << std::endl;

    std::cout << getNodeTypeString(ast.module.at(3)->node_type) << std::endl;
    std::cout << ast.module.size() << std::endl;
    generateIR(ast);

    return 0;
}

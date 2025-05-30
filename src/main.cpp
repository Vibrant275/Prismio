#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include "./lexer/lexer.h"
#include "./parser/parser.h"
#include "./ir/ir.h"
#include "parser/node.h"
#include "utils/extension.h"

using namespace std;

std::string readSourceCodeFromFile(const std::string& filePath) {
    std::ifstream file(filePath, std::ios::in | std::ios::binary | std::ios::ate);
    if (!file) {
        throw std::runtime_error("Error: Could not open file " + filePath);
    }

    std::streamsize size = file.tellg();
    if (size < 0) {
        throw std::runtime_error("Error: Could not determine file size: " + filePath);
    }

    std::string buffer(static_cast<size_t>(size), '\0');
    file.seekg(0);
    if (!file.read(buffer.data(), size)) {
        throw std::runtime_error("Error: Could not read file: " + filePath);
    }

    return buffer;
}


int main(int argc, char* argv[]) {
    std::ios::sync_with_stdio(false);

    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <source_file.psm>\n";
        return EXIT_FAILURE;
    }

    const std::string filePath = argv[1];

    if (filePath.length() < 4 || filePath.substr(filePath.length() - 4) != ".psm") {
        std::cerr << "Error: File must have a .psm extension.\n";
        return EXIT_FAILURE;
    }

    std::string input;
    try {
        input = readSourceCodeFromFile(filePath);
    } catch (const std::exception& e) {
        std::cerr << e.what() << '\n';
        return EXIT_FAILURE;
    }

    // Tokenization
    Lexer lexer(input);
    auto result = lexer.tokenize();

    if (!result.errors.empty()) {
        for (const auto& error : result.errors)
            displayError(error.message);
        return EXIT_FAILURE;
    }

    std::cout << "Tokenization complete.\n";

#ifdef DEBUG_TOKENS
    std::cout << "Tokens generated:\n";
    for (const auto& token : result.tokens)
        std::cout << "Token: " << token.value << '\n';
#endif

    Parser parser(result.tokens);
    const auto ast = parser.parse();
    std::cout << "Parsing complete.\n";

    if (ast.module.size() > 3)
        std::cout << getNodeTypeString(ast.module[3]->node_type) << '\n';

    std::cout << ast.module.size() << '\n';

    generateIR(ast);
    return EXIT_SUCCESS;
}

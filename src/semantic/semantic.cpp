#include "semantic.h"
#include <iostream>
#include <functional>

SemanticAnalyzer::SemanticAnalyzer(const ParseTree& parseTree) : parseTree(parseTree) {}

bool SemanticAnalyzer::analyze() {
    std::function<void(const ParseNode&)> analyzeNode = [&](const ParseNode& node) {
        // Check for valid keywords
        if (node.token.value == "clas") {
            std::cerr << "Error: 'clas' is not a valid tokens, did you mean 'class'?" << std::endl;
            throw std::runtime_error("Syntax error");
        }
        std::cout << "Analyzing: " << node.token.value << std::endl;
        for (const auto& child : node.children) {
            analyzeNode(child);
        }
    };

    try {
        analyzeNode(parseTree);
        std::cout << "Semantic analysis complete and successful." << std::endl;
        return true;
    } catch (const std::runtime_error& e) {
        std::cerr << "Semantic analysis failed: " << e.what() << std::endl;
        return false;
    }
}


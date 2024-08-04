#include "ir.h"
#include <iostream>
#include <functional>

IRGenerator::IRGenerator(const ParseTree& parseTree) : parseTree(parseTree) {}

std::string IRGenerator::generateIR() {
    std::string irCode;

    // Lambda function to generate IR code for each node
    std::function<void(const ParseNode&)> generateNodeIR = [&](const ParseNode& node) {
        // Append IR code for the current node
        irCode += "IR: " + node.token.value + "\n";

        // Recursively process child nodes
        for (const auto& child : node.children) {
            generateNodeIR(child);
        }
    };

    // Start generating IR from the root of the parse tree
    generateNodeIR(parseTree);

    return irCode;
}

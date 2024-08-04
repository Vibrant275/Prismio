#ifndef PARSER_NODES_H
#define PARSER_NODES_H

#include "../lexer/token.h"
#include <vector>

// Define ParseNode and ParseTree in this header
struct ParseNode {
    Token token;
    std::vector<ParseNode> children;

    ParseNode(Token token) : token(token) {}
    void addChild(ParseNode child) {
        children.push_back(child);
    }
};

using ParseTree = ParseNode;

#endif // PARSER_NODES_H

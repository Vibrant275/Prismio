#ifndef SEMANTIC_H
#define SEMANTIC_H

#include "../parser/parser_nodes.h"

class SemanticAnalyzer {
public:
    SemanticAnalyzer(const ParseTree& parseTree);
    bool analyze();

private:
    ParseTree parseTree;
};

#endif // SEMANTIC_H

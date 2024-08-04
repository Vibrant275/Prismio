#ifndef IR_H
#define IR_H

#include "../parser/parser_nodes.h"
#include <string>

class IRGenerator {
public:
    IRGenerator(const ParseTree& parseTree);
    std::string generateIR();

private:
    ParseTree parseTree;
};

#endif // IR_H

#ifndef IR_H
#define IR_H

#include "../parser/parser_nodes.h"
#include <string>

#include "../parser/node.h"

void generateIR(const ModuleNode &moduleNode);

#endif // IR_H

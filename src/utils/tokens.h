#ifndef LEXER_UTILS_H
#define LEXER_UTILS_H

#include <string>

bool isArithmeticOperator(char c);

bool isRelationalOperator(const std::string& op);

bool isLogicalOperator(char c);

bool isAssignmentOperator(const std::string& op);

bool isUnaryOperator(const std::string& op);

bool isSeparator(char c);
bool isOperator(char c);

#endif // LEXER_UTILS_H

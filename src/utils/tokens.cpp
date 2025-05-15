#include "tokens.h"

#include <string>
#include <unordered_set>

const std::unordered_set arithmeticOperators = {'+', '-', '*', '/', '%'};

const std::unordered_set<std::string> relationalOperators = {"<", ">", "==", "!=", "<=", ">="};

const std::unordered_set logicalOperators = {'!', '&', '|'};

const std::unordered_set<std::string> assignmentOperators = {"=", "+=", "-=", "*=", "/=", "%="};

const std::unordered_set<std::string> unaryOperators = {"++", "--"};

const std::unordered_set separators = {'(', ')', '{', '}', '[', ']', ',', '.', ':',}; // "->"

bool isArithmeticOperator(const char c)
{
    return arithmeticOperators.contains(c);
}

bool isRelationalOperator(const std::string& op)
{
    return relationalOperators.contains(op);
}

bool isLogicalOperator(const char c)
{
    return logicalOperators.contains(c);
}

bool isAssignmentOperator(const std::string& op)
{
    return assignmentOperators.contains(op);
}

bool isUnaryOperator(const std::string& op)
{
    return unaryOperators.contains(op);
}

bool isSeparator(const char c)
{
    return separators.contains(c);
}

bool isOperator(const char c)
{
    return
        isArithmeticOperator(c) ||
        isRelationalOperator(std::string{c}) ||
        isLogicalOperator(c) ||
        isAssignmentOperator(std::string{c}) ||
        isUnaryOperator(std::string{c});
}

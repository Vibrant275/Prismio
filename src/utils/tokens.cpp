#include "tokens.h"

#include <string>
#include <unordered_set>

const std::unordered_set arithmeticOperators = {'+', '-', '*', '/', '%'};

const std::unordered_set<std::string> relationalOperators = {"<", ">", "==", "!=", "<=", ">="};

const std::unordered_set<std::string> assignmentOperators = {"=", "+=", "-=", "*=", "/=", "%="};

const std::unordered_set<std::string> unaryOperators = {"++", "--"};

const std::unordered_set separators = {'(', ')', '{', '}', '[', ']', ',', '.', ':',};

const std::unordered_set operators = {'+', '-', '*', '/', '%', '<', '>', '!', '&', '|', '=', '_'};

bool isArithmeticOperator(const char c)
{
    return arithmeticOperators.contains(c);
}

bool isRelationalOperator(const std::string& op)
{
    return relationalOperators.contains(op);
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
    return operators.contains(c);
}

// lexer_utils.cpp
#include "tokens.h"
#include <unordered_set>
// Define a set of operator characters
const std::unordered_set<char> operators = {'+', '-', '*', '/', '=', '<', '>', '!', '&', '|', '%', '^'};

// Define a set of separator characters
const std::unordered_set<char> separators = {'(', ')', '{', '}', '[', ']', ';', ',' ,'.', ':'};

bool isOperator(char c) {
    return operators.find(c) != operators.end();
}

bool isSeparator(char c) {
    return separators.find(c) != separators.end();
}

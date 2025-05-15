#ifndef TOKEN_H
#define TOKEN_H

#include <string>

#include <string>

enum class TokenType {

    // Literals
    STRING,
    CHAR,
    NUMBER,

    DATA_TYPE,
    IDENTIFIER,
    SEPARATOR,

    ARITHMETIC_OPERATOR,
    RELATIONAL_OPERATOR,
    LOGICAL_OPERATOR,
    ASSIGNMENT_OPERATOR,
    UNARY_OPERATOR,

    KEYWORD,
    UNKNOWN,

    // Reserved keywords
    ACCESS_SPECIFIER,
    DECLARATIONS,
    FLOW_CONTROL,
    LOOPS,
    IMPORT,
    CONDITIONALS
};

// Token structure
struct Token {
    TokenType type;
    std::string value;
    int line;
};

#endif // TOKEN_H

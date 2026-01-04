#ifndef TOKEN_H
#define TOKEN_H

#include <string>

enum class TokenType
{
    STRING_LITERAL,
    CHAR_LITERAL,
    NUMBER_LITERAL,
    BOOL_LITERAL,

    IDENTIFIER,
    SEPARATOR,

    UNDERSCORE,

    ARITHMETIC_OPERATOR,
    RELATIONAL_OPERATOR,
    NEGATION,
    BITWISE_OR,
    ASSIGNMENT_OPERATOR,
    UNARY_OPERATOR,
    AMPERSAND,

    ARROW,
    FAT_ARROW,

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


// Converts a token type to a string
inline std::string toString(const TokenType type)
{
    switch (type)
    {
    case TokenType::STRING_LITERAL:
        return "STRING";
    case TokenType::CHAR_LITERAL:
        return "CHAR";
    case TokenType::NUMBER_LITERAL:
        return "INT_LITERAL";
    case TokenType::IDENTIFIER:
        return "IDENTIFIER";
    case TokenType::SEPARATOR:
        return "SEPARATOR";
    case TokenType::ARITHMETIC_OPERATOR:
        return "ARITHMETIC_OPERATOR";
    case TokenType::RELATIONAL_OPERATOR:
        return "RELATIONAL_OPERATOR";
    case TokenType::AMPERSAND:
        return "AMPERSAND";
    case TokenType::ASSIGNMENT_OPERATOR:
        return "ASSIGNMENT_OPERATOR";
    case TokenType::UNARY_OPERATOR:
        return "UNARY_OPERATOR";
    case TokenType::KEYWORD:
        return "KEYWORD";
    case TokenType::UNKNOWN:
        return "UNKNOWN";
    case TokenType::ACCESS_SPECIFIER:
        return "ACCESS_SPECIFIER";
    case TokenType::DECLARATIONS:
        return "DECLARATIONS";
    case TokenType::FLOW_CONTROL:
        return "FLOW_CONTROL";
    case TokenType::LOOPS:
        return "LOOPS";
    case TokenType::IMPORT:
        return "IMPORT";
    case TokenType::CONDITIONALS:
        return "CONDITIONALS";
    case TokenType::NEGATION:
        return "NEGATION";
    case TokenType::BITWISE_OR:
        return "BITWISE_OR";
    case TokenType::ARROW:
        return "ARROW";
    case TokenType::FAT_ARROW:
        return "FAT_ARROW";
    case TokenType::UNDERSCORE:
        return "UNDERSCORE";
    case TokenType::BOOL_LITERAL:
        return "BOOL_LITERAL";
    default: return "UNKNOWN";
    }
}

// Token structure
struct Token
{
    TokenType type;
    std::string value;
    int line;
};

#endif // TOKEN_H

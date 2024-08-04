#ifndef TOKEN_H
#define TOKEN_H

#include <string>

// Token types
enum class TokenType {
    IDENTIFIER,
    NUMBER,
    STRING_LITERAL,
    OPERATOR,
    PUNCTUATION,
    KEYWORD,
    COMMENT,
    WHITESPACE,
    UNKNOWN,
    CLASS,    // Add additional types here
    ENUM,
    CONST,
    VAL,
    OPEN_PAREN,
    CLOSE_PAREN,
    OPEN_BRACKET,
    CLOSE_BRACKET,
    OPEN_BRACE,
    CLOSE_BRACE,
};


// Token structure
struct Token {
    TokenType type;
    std::string value;
    int line;
};

#endif // TOKEN_H

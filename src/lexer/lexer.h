#ifndef LEXER_H
#define LEXER_H

#include <vector>
#include <string>
#include "Token.h"

class Lexer {
public:
    Lexer(const std::string& input);
    std::vector<Token> tokenize();

private:
    void advance();
    char currentChar();
    void skipWhitespace();
    Token identifier();
    Token number();
    Token operatorToken();

    bool forwardSlash();

    Token stringLiteral();
    Token operatorOrPunctuation();
    Token createToken(TokenType type, const std::string& value);

    std::string input_;
    int lineNumber_;
    int columnIndex_;
    char currentChar_;
};

#endif  // LEXER_H
#ifndef LEXER_H
#define LEXER_H

#include <vector>
#include <string>
#include "../utils/token.h"

class Lexer {
public:
    Lexer(const std::string &input);

    std::vector<Token> tokenize();

private:
    void advance();

    char currentChar();

    void skipWhitespace();

    Token identifierOrKeyword();

    Token number();

    Token operatorToken();

    bool isDivisionOperator();

    Token stringLiteral();

    Token createToken(TokenType type, const std::string &value);

    Token charLiteral();

    Token separatorToken();

    std::string input_;
    int lineNumber_;
    int columnIndex_;
    char currentChar_;

    void reverse();
};

#endif  // LEXER_H
#ifndef LEXER_H
#define LEXER_H

#include <vector>
#include <string>
#include "../utils/token.h"
#include "LexError.h"

struct LexerResult
{
    std::vector<Token> tokens;
    std::vector<LexError> errors;
};

class Lexer {
public:
    Lexer(const std::string &input);

    // std::vector<Token> tokenize();
    LexerResult tokenize();

    // Error handling
    std::vector<LexError> errors;

private:
    void advance();

    char currentChar();

    void skipWhitespace();

    Token identifierOrKeyword();

    Token number();

    Token operatorToken();
    char peek(int offset) const;
    char peekBack(int offset) const;

    bool isDivisionOperator();

    Token stringLiteral();

    Token createToken(TokenType type, const std::string &value) const;

    Token charLiteral();
    void submitError(const std::string& error);

    Token separatorToken() const;

    std::string input_;
    int lineNumber_;
    int columnIndex_;
    char currentChar_;

    void reverse();
    void skipComment();
};

#endif  // LEXER_H
#include <stdexcept>
#include <iostream>
#include "Lexer.h"
#include "../../utils/lexer_utils.h"
#include "../keyword/keywords.h"

Lexer::Lexer(const std::string &input) : input_(input), lineNumber_(1), columnIndex_(0), currentChar_(input[0]) {}

std::vector<Token> Lexer::tokenize() {
    std::vector<Token> tokens;

    while (currentChar_ != '\0') {

        if (isspace(currentChar_)) {
            skipWhitespace();
        } else if (currentChar_ == '/') {
            if (forwardSlash()) {
                tokens.push_back(operatorToken());
            }
        } else if (isalpha(currentChar_) || currentChar_ == '_') {
            tokens.push_back(identifierOrKeyword());
        } else if (isdigit(currentChar_)) {
            tokens.push_back(number());
        } else if (currentChar_ == '"') {
            tokens.push_back(stringLiteral());
        } else {

            Token token = operatorOrSeperator();

            if (token.type == TokenType::UNKNOWN) {
                const std::string redColor = "\033[31m";
                const std::string resetColor = "\033[0m";

                std::cerr << redColor
                          << "Error: Unknown token type [ Line: "
                          << lineNumber_
                          << " Col: "
                          << columnIndex_
                          << " ]" << resetColor
                          << std::endl;

                exit(1);
            } else {
                tokens.push_back(token);
            }

            advance();
        }
    }

    return tokens;
}

void Lexer::advance() {
    columnIndex_++;
    if (columnIndex_ >= input_.size()) {
        currentChar_ = '\0';
    } else {
        currentChar_ = input_[columnIndex_];
    }

}

void Lexer::skipWhitespace() {
    while (isspace(currentChar_)) {
        if (currentChar_ == '\n') {
            lineNumber_++; // Increment lineNumber_ when encountering a newline
        }
        advance();
    }
}

Token Lexer::identifierOrKeyword() {
    std::string value;

    while (isalpha(currentChar_) || isdigit(currentChar_) || currentChar_ == '_') {
        value += currentChar_;
        advance();
    }

    if (isKeyword(value))
        return createToken(TokenType::KEYWORD, value);
    else
        return createToken(TokenType::IDENTIFIER, value);
}

Token Lexer::number() {
    std::string value;
    while (isdigit(currentChar_)) {
        value += currentChar_;
        advance();
    }
    return createToken(TokenType::NUMBER, value);
}

Token Lexer::operatorToken() {
    std::string value;

    value = input_[columnIndex_ - 1];

    return createToken(TokenType::OPERATOR, value);
}

bool Lexer::forwardSlash() {
    std::string value;
    bool returnValue = false;

    while (currentChar_ == '/') {
        value += currentChar_;
        advance();
    }

    if (value == "//") {
        // single-line comment
        while (currentChar_ != '\n')
            advance();

    } else if (value == "/" && currentChar_ == '*') {
        // multi-line comment
        while (true) {
            advance();
            if (currentChar_ == '*' && input_[columnIndex_ + 1] == '/') {
                advance(); // skip the '*'
                advance(); // skip the '/'
                break;
            }
        }
    } else if (value == "/") {
        returnValue = true;
    } else {
        createToken(TokenType::STRING_LITERAL, value);
    }

    return returnValue;
}

Token Lexer::stringLiteral() {
    std::string value;
    advance(); // skip the opening quote

    while (currentChar_ != '"' && currentChar_ != '\0') {
        value += currentChar_;
        advance();
    }

    if (currentChar_ != '"') {
        const std::string redColor = "\033[31m";
        const std::string resetColor = "\033[0m";

        std::cerr << redColor << "Error: Unclosed string literal [ Line: " << lineNumber_ << " ]" << resetColor
                  << std::endl;

        exit(1);
//        return createToken(TokenType::UNKNOWN, value);
    }

    advance(); // skip the closing quote
    return createToken(TokenType::STRING_LITERAL, value);
}

Token Lexer::operatorOrSeperator() {
    std::string value;
    value = currentChar_;

    if (isOperator(currentChar_)) { return createToken(TokenType::OPERATOR, value); }
    else if (isSeparator(currentChar_)) { return createToken(TokenType::SEPERATOR, value); }
    else { return createToken(TokenType::UNKNOWN, value); };
}

Token Lexer::createToken(TokenType type, const std::string &value) {
    return Token(type, value, lineNumber_);
}
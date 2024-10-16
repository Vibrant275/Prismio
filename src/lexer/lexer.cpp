#include <stdexcept>
#include <iostream>
#include <format>
#include "Lexer.h"
#include "../utils/lexer_utils.h"
#include "../utils/extension.h"
#include "../tokens/keywords.h"
#include "../utils/constants.h"

Lexer::Lexer(const std::string &input) : input_(input), lineNumber_(1), columnIndex_(0), currentChar_(input[0]) {}

Token Lexer::createToken(TokenType type, const std::string &value) {
    return Token(type, value, lineNumber_);
}

std::vector<Token> Lexer::tokenize() {
    std::vector<Token> tokens;

    while (currentChar_ != '\0') {

        if (isspace(currentChar_)) {
            skipWhitespace();
        } else if (currentChar_ == '/') {
            if (isDivisionOperator()) {
                reverse();
                tokens.push_back(operatorToken());
                advance();
            }
        } else if (isalpha(currentChar_) || currentChar_ == '_') {
            tokens.push_back(identifierOrKeyword());
        } else if (isdigit(currentChar_)) {
            tokens.push_back(number());
        } else if (currentChar_ == '"') {
            tokens.push_back(stringLiteral());
        } else if (currentChar_ == '\'') {
            tokens.push_back(charLiteral());
        } else if (isSeparator(currentChar_)) {
            tokens.push_back(separatorToken());
            advance();
        } else if (isOperator(currentChar_)) {
            tokens.push_back(operatorToken());
            advance();
        } else {
            std::cerr << redColor
                      << "Error: Unknown token type [ Line: "
                      << lineNumber_
                      << " Col: "
                      << columnIndex_
                      << " ]" << resetColor
                      << std::endl;

            exit(1);
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

void Lexer::reverse() {
    columnIndex_--;
    currentChar_ = input_[columnIndex_];
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

    value = currentChar_;

    return createToken(TokenType::OPERATOR, value);
}

bool Lexer::isDivisionOperator() {
    std::string value;
    bool returnValue = false;
    bool stringState = false;

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
            if (currentChar_ == '"')
                stringState = !stringState;

            if (currentChar_ == '*' && input_[columnIndex_ + 1] == '/' && !stringState) {
                advance(); // skip the '*'
                advance(); // skip the '/'
                break;
            }

            if (currentChar_ == '\0') {
                const std::string redColor = "\033[31m";
                const std::string resetColor = "\033[0m";

                std::cerr << redColor << "Syntax error: Expecting a top level declaration. [ */ ] not found"
                          << resetColor
                          << std::endl;

                exit(1);
            }
        }
    } else if (value == "/") {
        returnValue = true;
    } else {
        while (currentChar_ != '\n')
            advance();
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
        std::string error = std::format("Error: Unclosed string literal [ Line:  {}  ]", lineNumber_);
        displayError(error);
        exit(1);
    }

    advance(); // skip the closing quote
    return createToken(TokenType::STRING_LITERAL, value);
}

Token Lexer::separatorToken() {
    std::string value;
    value = currentChar_;
    return createToken(TokenType::SEPARATOR, value);
}

Token Lexer::charLiteral() {
    std::string value;
    advance();

    while (currentChar_ != '\'' && currentChar_ != '\0') {
        value += currentChar_;
        advance();
    }

    if (currentChar_ != '\'') {
        std::string error = std::format("Error: Unclosed character literal [ Line:  {}  ]", lineNumber_);
        displayError(error);
        exit(1);
    }

    if (value.length() > 1) {
        std::string error = std::format("Error: Invalid character length [ Line:  {}  ]", lineNumber_);
        displayError(error);
        exit(1);
    }

    advance();
    return createToken(TokenType::CHAR_LITERAL, value);
}

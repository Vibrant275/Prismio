#include <iostream>
#include <format>
#include "lexer.h"
#include "../utils/tokens.h"
#include "../utils/extension.h"
#include "../utils/keywords.h"
#include "../utils/constants.h"
#include "../utils/dataTypes.h"

Lexer::Lexer(const std::string& input) : input_(input), lineNumber_(1), columnIndex_(0), currentChar_(input[0])
{
}

Token Lexer::createToken(TokenType type, const std::string& value) const
{
    return Token(type, value, lineNumber_);
}

LexerResult Lexer::tokenize()
{
    std::vector<Token> tokens;

    while (currentChar_ != '\0')
    {
        if (isspace(currentChar_))
        {
            skipWhitespace();
        }
        else if (currentChar_ == '/')
        {
            if (isDivisionOperator())
            {
                reverse();
                tokens.push_back(operatorToken());
            }
        }
        else if (isalpha(currentChar_) || currentChar_ == '_')
        {
            tokens.push_back(identifierOrKeyword());
        }
        else if (isdigit(currentChar_))
        {
            tokens.push_back(number());
        }
        else if (currentChar_ == '"')
        {
            tokens.push_back(stringLiteral());
        }
        else if (currentChar_ == '\'')
        {
            tokens.push_back(charLiteral());
        }
        else if (isSeparator(currentChar_))
        {
            tokens.push_back(separatorToken());
            advance();
        }
        else if (isOperator(currentChar_))
        {
            tokens.push_back(operatorToken());
        }
        else
        {
            std::string error = invalidTokenError("Invalid token type", currentChar_, lineNumber_);
            submitError(error);
            advance();
        }
    }

    return LexerResult{tokens, errors};
}

void Lexer::advance()
{
    columnIndex_++;
    if (columnIndex_ >= input_.size())
    {
        currentChar_ = '\0';
    }
    else
    {
        currentChar_ = input_[columnIndex_];
    }
}

void Lexer::reverse()
{
    columnIndex_--;
    currentChar_ = input_[columnIndex_];
}

void Lexer::skipWhitespace()
{
    while (isspace(currentChar_))
    {
        if (currentChar_ == '\n')
        {
            lineNumber_++; // Increment lineNumber_ when encountering a newline
        }
        advance();
    }
}

Token Lexer::identifierOrKeyword()
{
    std::string value;

    while (isalpha(currentChar_) || isdigit(currentChar_) || currentChar_ == '_')
    {
        value += currentChar_;
        advance();
    }

    if (isAccessSpecifier(value))
        return createToken(TokenType::ACCESS_SPECIFIER, value);

    if (isDeclarations(value))
        return createToken(TokenType::DECLARATIONS, value);

    if (isLoop(value))
        return createToken(TokenType::LOOPS, value);

    if (isImport(value))
        return createToken(TokenType::IMPORT, value);

    if (isConditionals(value))
        return createToken(TokenType::CONDITIONALS, value);

    if (isFlowControl(value))
        return createToken(TokenType::FLOW_CONTROL, value);

    if (isDataType(value))
        return createToken(TokenType::DATA_TYPE, value);

    return createToken(TokenType::IDENTIFIER, value);
}

Token Lexer::number()
{
    std::string value;
    while (isdigit(currentChar_))
    {
        value += currentChar_;
        advance();
    }
    return createToken(TokenType::NUMBER, value);
}

Token Lexer::operatorToken()
{
    if (isLogicalOperator(currentChar_) && currentChar_ != '!')
    {
        advance();
        return createToken(TokenType::LOGICAL_OPERATOR, std::string{currentChar_});
    }

    if (isArithmeticOperator(currentChar_))
    {
        auto operatorValue = std::string{currentChar_};
        advance();

        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::ASSIGNMENT_OPERATOR, operatorValue);
        }

        if (operatorValue == "+" && currentChar_ == '+')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::UNARY_OPERATOR, operatorValue);
        }

        if (operatorValue == "-" && currentChar_ == '-')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::UNARY_OPERATOR, operatorValue);
        }

        if (operatorValue == "-" && currentChar_ == '>')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::SEPARATOR, operatorValue);
        }

        return createToken(TokenType::ARITHMETIC_OPERATOR, operatorValue);
    }

    if (currentChar_ == '=')
    {
        auto operatorValue = std::string{currentChar_};
        advance();

        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }

        return createToken(TokenType::ASSIGNMENT_OPERATOR, operatorValue);
    }

    if (currentChar_ == '!')
    {
        auto operatorValue = std::string{currentChar_};
        advance();
        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }
        return createToken(TokenType::LOGICAL_OPERATOR, operatorValue);
    }

    if (currentChar_ == '<')
    {
        auto operatorValue = std::string{currentChar_};
        advance();
        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }
        return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
    }

    if (currentChar_ == '>')
    {
        auto operatorValue = std::string{currentChar_};
        advance();
        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }
        return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
    }

    advance();
    return createToken(TokenType::UNKNOWN, std::string{currentChar_});
}

bool Lexer::isDivisionOperator()
{
    std::string value;
    bool returnValue = false;

    while (currentChar_ == '/')
    {
        value += currentChar_;
        advance();
    }

    if (value == "//")
        // single-line comment
        while (currentChar_ != '\n')
        {
            advance();
        }
    else if (value == "/" && currentChar_ == '*')
    {
        bool stringState = false;
        // multi-line comment
        while (true)
        {
            advance();
            if (currentChar_ == '"')
                stringState = !stringState;

            if (
                currentChar_ == '*' &&
                (columnIndex_ + 1 < input_.size()) &&
                input_[columnIndex_ + 1] == '/'
                && !stringState
            )
            {
                advance(); // skip the '*'
                advance(); // skip the '/'
                break;
            }

            if (currentChar_ == '\0')
                submitError("Syntax error: Multi-line comment /* ... not closed. [ */ ] not found");
        }
    }
    else if (value == "/")
    {
        returnValue = true;
    }
    else
    {
        while (currentChar_ != '\n')
            advance();
    }

    return returnValue;
}

Token Lexer::stringLiteral()
{
    std::string value;
    advance(); // skip the opening quote

    while (currentChar_ != '"' && currentChar_ != '\0')
    {
        value += currentChar_;
        advance();
    }

    if (currentChar_ != '"')
    {
        const std::string error = std::format("Error: Unclosed string literal [ Line:  {}  ]", lineNumber_);
        submitError(error);
    }

    advance(); // skip the closing quote
    return createToken(TokenType::STRING, value);
}

Token Lexer::separatorToken() const
{
    return createToken(TokenType::SEPARATOR, std::string{currentChar_});
}

Token Lexer::charLiteral()
{
    std::string value;
    advance();

    while (currentChar_ != '\'' && currentChar_ != '\0')
    {
        value += currentChar_;
        advance();
    }

    if (currentChar_ != '\'')
    {
        const std::string error = std::format("Error: Unclosed character literal [ Line:  {}  ]", lineNumber_);
        submitError(error);
    }

    if (value.length() > 1)
    {
        const std::string error = std::format("Error: Invalid character length [ Line:  {}  ]", lineNumber_);
        submitError(error);
    }

    advance();
    return createToken(TokenType::CHAR, value);
}

void Lexer::submitError(const std::string& error)
{
    errors.push_back({error, lineNumber_, columnIndex_});
}

#include <format>
#include "lexer.h"
#include "../utils/tokens.h"
#include "../utils/extension.h"
#include "../utils/keywords.h"
#include "../utils/dataTypes.h"

Lexer::Lexer(const std::string& input) : input_(input), lineNumber_(1), columnIndex_(0), currentChar_(input[0])
{
}

Token Lexer::createToken(TokenType type, const std::string& value) const
{
    return Token(type, value, lineNumber_);
}


char Lexer::peek(const int offset = 1) const
{
    const size_t i = columnIndex_ + offset;
    return (i < input_.size()) ? input_[i] : '\0';
}

char Lexer::peekBack(const int offset = 1) const
{
    const size_t i = columnIndex_ - offset;
    return input_[i];
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
        else if (isalpha(currentChar_) || currentChar_ == '_')
        {
            tokens.push_back(identifierOrKeyword());
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
    if (columnIndex_ > 0)
    {
        columnIndex_--;
        currentChar_ = input_[columnIndex_];
    }
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

    if (isBoolean(value))
        return createToken(TokenType::BOOL_LITERAL, value);

    if (isKeyword(value))
        return createToken(TokenType::KEYWORD, value);

    return createToken(TokenType::IDENTIFIER, value);
}

Token Lexer::number()
{
    std::string value;

    // ---- base detection ----
    if (currentChar_ == '0' && std::string_view("xXbBoO").contains(peek()))
    {
        value += currentChar_;
        advance();

        value += currentChar_; // x, X, b, B, o, O
        advance();

        while (isalnum(currentChar_) || currentChar_ == '_')
        {
            value += currentChar_;
            advance();
        }

        return createToken(TokenType::NUMBER_LITERAL, value);
    }

    // ---- whole integer ----

    while (
        isdigit(currentChar_) ||
        currentChar_ == '_' ||
        currentChar_ == '.' ||
        currentChar_ == 'e' ||
        currentChar_ == 'E'
    )
    {
        if (currentChar_ == '_' || currentChar_ == '.')
        {
            if (!isdigit(peekBack()) || !isdigit(peek()))
            {
                submitError(invalidTokenError("Invalid token type", currentChar_, lineNumber_));
            }
        }

        if (currentChar_ == 'e' || currentChar_ == 'E')
        {
            if (
                (std::string_view("+-").contains(peek()) || isdigit(peek())) &&
                isdigit(peekBack())
            )
            {
                if (std::string_view("+-").contains(peek()))
                {
                    value += currentChar_; // adds e/E
                    advance();

                    if (!isdigit(peek()))
                    {
                        submitError(invalidTokenError("Invalid token type", currentChar_, lineNumber_));
                    }
                }
            }
            else
            {
                submitError(invalidTokenError("Invalid token type", currentChar_, lineNumber_));
            }
        }
        value += currentChar_;
        advance();
    }

    return createToken(
        TokenType::NUMBER_LITERAL,
        value
    );
}

Token Lexer::operatorToken()
{
    const char value = currentChar_;
    advance();

    if (isArithmeticOperator(value))
    {
        if (currentChar_ == '=')
        {
            std::string token = {value};
            token += currentChar_;

            advance();
            return createToken(TokenType::ASSIGNMENT_OPERATOR, token);
        }

        if (
            (value == '+' && currentChar_ == '+') ||
            (value == '-' && currentChar_ == '-')
        )
        {
            std::string token = {value};
            token += currentChar_;

            advance();
            return createToken(TokenType::UNARY_OPERATOR, token);
        }

        if (value == '-' and currentChar_ == '>')
        {
            std::string token = {value};
            token += currentChar_;

            advance();
            return createToken(TokenType::ARROW, {token});
        }

        return createToken(TokenType::ARITHMETIC_OPERATOR, {value});
    }

    if (value == '!')
    {
        if (currentChar_ == '=')
        {
            std::string token = {value};
            token += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, token);
        }
        return createToken(TokenType::NEGATION, std::string{value});
    }

    if (value == '&')
        return createToken(TokenType::AMPERSAND, {value});

    if (value == '|')
        return createToken(TokenType::BITWISE_OR, {value});

    if (value == '_')
        return createToken(TokenType::UNDERSCORE, {value});

    if (value == '=')
    {
        auto operatorValue = std::string{value};

        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }

        if (currentChar_ == '>')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::FAT_ARROW, operatorValue);
        }

        return createToken(TokenType::ASSIGNMENT_OPERATOR, operatorValue);
    }

    if (value == '<')
    {
        auto operatorValue = std::string{value};

        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }

        return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
    }

    if (value == '>')
    {
        auto operatorValue = std::string{value};

        if (currentChar_ == '=')
        {
            operatorValue += currentChar_;
            advance();
            return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
        }
        return createToken(TokenType::RELATIONAL_OPERATOR, operatorValue);
    }

    return createToken(TokenType::UNKNOWN, std::string{currentChar_});
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
    return createToken(TokenType::STRING_LITERAL, value);
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
    return createToken(TokenType::CHAR_LITERAL, value);
}

void Lexer::submitError(const std::string& error)
{
    errors.push_back({error, lineNumber_, columnIndex_});
}

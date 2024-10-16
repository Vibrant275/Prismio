#ifndef PARSER_H
#define PARSER_H

#include <vector>
#include <string>
#include <unordered_map>
#include <functional>
#include "parser_nodes.h" // Make sure this is included correctly
#include "../tokens/token.h"

class Parser {
public:
    Parser(const std::vector<Token>& tokens);

    ParseTree parse();

    // New method for checking balanced braces
    bool checkBracesBalance();

private:
    std::vector<Token> tokens;
    size_t position;
    std::unordered_map<std::string, std::function<ParseNode()>> keywordHandlers;

    Token currentToken();
    void advance();
    void expect(TokenType type);
    void expect(TokenType type, const std::string& expectedValue);

    ParseNode parseClass();
    ParseNode parseEnum();
    ParseNode parseStatement();
    ParseNode parseConst();
    ParseNode parseVar();
    ParseNode parseMethod();

    void reportError(const std::string& message);
    bool isValidKeyword(const std::string& value);
};

#endif // PARSER_H

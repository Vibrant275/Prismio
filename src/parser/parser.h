#ifndef PARSER_H
#define PARSER_H

#include <vector>
#include <string>
#include <unordered_map>
#include <functional>
#include "parser_nodes.h" // Make sure this is included correctly
#include "../utils/token.h"
#include "node.h"

class Parser {
public:
    Parser(const std::vector<Token>& tokens);

    void parse();

    bool checkBracesBalance();

    void printStructure(ModuleNode& node, std::string indentStr = "");


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

    void collectImportStatements();

    void generateAST();

    void handleDeclaration();
};

#endif // PARSER_H

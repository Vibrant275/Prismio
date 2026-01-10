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

    ModuleNode parse();

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

    bool isValidKeyword(const std::string& value);

    static void printModuleNames();
    void collectImportStatements();

    void handleDeclaration(const std::string& accessSpecifier);
    void handleVariableDeclaration();

    std::vector<std::unique_ptr<Node>> handleFunctionBody();
    std::vector<std::unique_ptr<Node>> collectFunctionParameters();
    void handleFunction();
    void handleFunctionParameters(FunctionNode* function_node);
    void handleClasses();
};

#endif // PARSER_H

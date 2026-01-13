#ifndef PARSER_H
#define PARSER_H

#include <vector>
#include <string>
#include "../utils/token.h"
#include "node.h"

class Parser {
public:
    Parser(const std::vector<Token>& tokens);

    ModuleNode parse();

private:
    std::vector<Token> tokens;
    size_t position;

    Token currentToken();
    void advance();
    void expect(TokenType type);
    void expect(TokenType type, const std::string& expectedValue);

    static void printModuleNames();
    void collectImportStatements();

    std::unique_ptr<VariableDeclNode> handleVariableDeclaration();

    std::unique_ptr<AssignmentTree> getAssignmentTree();
    std::unique_ptr<Node> handleIfStatement();
    std::unique_ptr<Node> handleForStatement();
    std::unique_ptr<Node> handleWhileStatement();
    std::unique_ptr<Node> handleLoopStatement();
    std::unique_ptr<Node> handlePrintStatement();
    std::unique_ptr<Node> handleReturnStatement(DataType data);
    std::unique_ptr<Node> handleMatchStatement();
    std::vector<std::unique_ptr<Node>> handleFunctionBody();
    std::vector<std::unique_ptr<Node>> collectFunctionParameters();
    void handleFunction();
};

#endif // PARSER_H

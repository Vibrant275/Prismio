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

    // Token utilities
    Token currentToken();
    Token peek(int offset = 1);
    void advance();
    bool check(TokenType type);
    bool check(TokenType type, const std::string& value);
    bool match(TokenType type);
    bool match(TokenType type, const std::string& value);
    void expect(TokenType type, const std::string& context);
    void expect(TokenType type, const std::string& value, const std::string& context);

    // Top-level parsing
    std::unique_ptr<Node> parseImportStatement();
    std::unique_ptr<Node> parseExternFunctionDecl();
    std::unique_ptr<Node> parseDeclaration();

    // Declarations
    std::unique_ptr<Node> parseVariableDecl();
    std::unique_ptr<Node> parseFunctionDecl();
    std::unique_ptr<Node> parseStructDecl();
    std::unique_ptr<Node> parseEnumDecl();
    std::unique_ptr<Node> parseTraitDecl();
    std::unique_ptr<Node> parseImplDecl();

    // Statements
    std::unique_ptr<Node> parseStatement();
    std::unique_ptr<Node> parseBlock();
    std::unique_ptr<Node> parseIfStatement();
    std::unique_ptr<Node> parseMatchStatement();
    std::unique_ptr<Node> parseForStatement();
    std::unique_ptr<Node> parseWhileStatement();
    std::unique_ptr<Node> parseLoopStatement();
    std::unique_ptr<Node> parseReturnStatement();
    std::unique_ptr<Node> parseAssignmentStatement();

    // Expressions
    std::unique_ptr<Node> parseExpression(int precedence = 0);
    std::unique_ptr<Node> parsePrimary();

    // Type annotations
    std::unique_ptr<Node> parseTypeAnnotation();

    // Helpers
    int getOperatorPrecedence(const Token& token);
    bool isLeftAssociative(const std::string& op);
};

#endif // PARSER_H
#include "parser.h"
#include "parser_nodes.h"
#include "node.h"
#include "../utils/extension.h"
#include "../utils/constants.h"
#include "../utils/keywords.h"
#include <iostream>
#include <stdexcept>
#include <unordered_set>

ModuleNode root = ModuleNode();

Parser::Parser(const std::vector<Token> &tokens) : tokens(tokens), position(0) {
    keywordHandlers["class"] = [this]() { return parseClass(); };
    keywordHandlers["enum"] = [this]() { return parseEnum(); };
}

Token Parser::currentToken() {
    if (position < tokens.size()) {
        return tokens[position];
    }
    return {TokenType::UNKNOWN, "", 0};
}

void Parser::advance() {
    if (position < tokens.size()) {
        position++;
    }
}

void Parser::expect(TokenType type) {
    if (currentToken().type != type) {
        std::cerr << "Error: Expected token type " << static_cast<int>(type)
                  << " at line " << currentToken().line
                  << ", but got " << static_cast<int>(currentToken().type)
                  << " at line " << currentToken().line << std::endl;
        throw std::runtime_error("Syntax error: Expected different token type");
    }
}

void Parser::expect(TokenType type, const std::string &expectedValue) {
    if (currentToken().type != type || currentToken().value != expectedValue) {
        std::cerr << "Error: Expected token type " << static_cast<int>(type)
                  << " with value '" << expectedValue
                  << "' at line " << currentToken().line
                  << ", but got type " << static_cast<int>(currentToken().type)
                  << " with value '" << currentToken().value
                  << "' at line " << currentToken().line << std::endl;
        throw std::runtime_error("Syntax error: Expected different token");
    }
}

void Parser::parse() {
    collectImportStatements();
    generateAST();


//    printStructure(root);
//    if (current.type == TokenType::KEYWORD) {
//        auto it = keywordHandlers.find(current.value);
//        if (it != keywordHandlers.end()) {
//            return ParseTree(it->second());
//        } else {
//            throw std::runtime_error("Syntax error: Unrecognized tokens '" + current.value + "'");
//        }
//    } else if (current.type == TokenType::CLASS ||
//               current.type == TokenType::ENUM ||
//               current.type == TokenType::CONST ||
//               current.type == TokenType::VAL) {
//        return ParseTree(parseStatement());
//    } else {
//        std::cerr << "Unexpected token type: " << static_cast<int>(current.type)
//                  << " at line " << current.line << std::endl;
//        throw std::runtime_error("Syntax error: Unexpected token type '" + std::to_string(static_cast<int>(current.type)) + "'");
//    }
}

ParseNode Parser::parseClass() {
    expect(TokenType::KEYWORD, "class");

    // Parse class name
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string className = currentToken().value;
    advance();

    // Parse class body
    expect(TokenType::SEPARATOR, "{");
    advance();

    ParseNode classNode(Token{TokenType::KEYWORD, "class", currentToken().line});
    classNode.token.value = className;

    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}") {
        if (currentToken().value == "const") {
            classNode.addChild(parseConst());
        } else if (currentToken().value == "val") {
            classNode.addChild(parseVar());
        } else if (currentToken().value == "func") {
            classNode.addChild(parseMethod());
        } else {
            displayError("Unexpected token" , currentToken());
        }
    }
    expect(TokenType::SEPARATOR, "}");
    advance();

    return classNode;
}

ParseNode Parser::parseEnum() {
    expect(TokenType::KEYWORD, "enum");

    // Parse enum name
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    Token enumName = currentToken();
    advance();

    // Parse enum body
    expect(TokenType::SEPARATOR, "{");
    advance();

    ParseNode enumNode(enumName);
    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}") {
        enumNode.addChild(parseStatement());
    }

    expect(TokenType::SEPARATOR, "}");
    advance();

    return enumNode;
}

ParseNode Parser::parseStatement() {
    Token token = currentToken();
    advance(); // Move to the next token
    return ParseNode(token);
}

ParseNode Parser::parseConst() {
    expect(TokenType::KEYWORD, "const");

    // Parse type
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string type = currentToken().value;
    advance();

    // Parse identifier
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string name = currentToken().value;
    advance();

    // Parse assignment
    expect(TokenType::OPERATOR, "=");
    advance();

    // Parse value
    expect(TokenType::NUMBER, "");
    std::string value = currentToken().value;
    advance();

    // Parse semicolon
    expect(TokenType::SEPARATOR, ";");

    ParseNode constNode(Token{TokenType::KEYWORD, "const", currentToken().line});
    constNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, type, currentToken().line}));
    constNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, name, currentToken().line}));
    constNode.addChild(ParseNode(Token{TokenType::NUMBER, value, currentToken().line}));

    return constNode;
}

ParseNode Parser::parseVar() {
    expect(TokenType::KEYWORD, "val");

    // Parse type
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string type = currentToken().value;
    advance();

    // Parse identifier
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string name = currentToken().value;
    advance();

    // Parse assignment
    expect(TokenType::OPERATOR, "=");
    advance();

    // Parse value
    expect(TokenType::NUMBER, "");
    std::string value = currentToken().value;
    advance();

    // Parse semicolon
    expect(TokenType::SEPARATOR, ";");

    ParseNode varNode(Token{TokenType::KEYWORD, "val", currentToken().line});
    varNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, type, currentToken().line}));
    varNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, name, currentToken().line}));
    varNode.addChild(ParseNode(Token{TokenType::NUMBER, value, currentToken().line}));

    return varNode;
}

ParseNode Parser::parseMethod() {
    expect(TokenType::KEYWORD, "func");

    // Parse return type
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string returnType = currentToken().value;
    advance();

    // Parse method name
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    std::string methodName = currentToken().value;
    advance();

    // Parse parameters
    expect(TokenType::SEPARATOR, "(");
    advance();

    // Parameters (simplified)
    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != ")") {
        // Parsing parameters (could be extended)
        expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
        advance();
    }
    expect(TokenType::SEPARATOR, ")");
    advance();

    // Parse method body
    expect(TokenType::SEPARATOR, "{");
    advance();

    // This should handle method body (simplified here)
    ParseNode methodNode(Token{TokenType::KEYWORD, "func", currentToken().line});
    methodNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, returnType, currentToken().line}));
    methodNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, methodName, currentToken().line}));

    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}") {
        // Parsing method body (could be extended)
        advance();
    }
    expect(TokenType::SEPARATOR, "}");
    advance();

    return methodNode;
}

void Parser::collectImportStatements() {

    while (currentToken().type == TokenType::KEYWORD && currentToken().value == "import") {
        advance();

        std::vector<std::string> moduleNameParts;

        while (currentToken().type == TokenType::IDENTIFIER) {
            moduleNameParts.push_back(currentToken().value);
            advance();

            if (currentToken().type == TokenType::SEPARATOR && currentToken().value == ".") {
                advance();

                if(currentToken().type != TokenType::IDENTIFIER) {
                    displayError("Unexpected token" , currentToken());
                    exit(0);
                }
            }
        }
        auto *importStatement = new ImportStatementNode(moduleNameParts);

        root.add_import_statement(importStatement);
    }
    std::cout << "Finished collecting import statements." << std::endl;
}

void Parser::generateAST() {
    if (currentToken().type == TokenType::KEYWORD) {
        while (position < tokens.size()) {
            if (isAccessSpecifier(currentToken().value)) {
                advance();
            } else if (isDeclarations(currentToken().value)) {
                handleDeclaration();
            } else if (isFunction(currentToken().value)) {
                advance();
            } else {
                if (currentToken().value == "import"){
                    displayError(ISDB);
                    exit(0);
                }
                advance();
//                displayError(ITLD, currentToken());
//                exit(1);
            }
        }

        displaySuccess("Successfully generated AST.");
    } else {
        displayError(ETLD, currentToken());
        exit(1);
    }
}

void Parser::handleDeclaration() {

    VariableDeclarationNode node = VariableDeclarationNode();
    node.property = getVariableType(currentToken().value);
    advance();

    if (currentToken().type == TokenType::IDENTIFIER) {
        node.identifier = currentToken().value;
        advance();
    } else {
        displayError("Invalid identifier", currentToken());
        exit(1);
    }

    if (currentToken().value == ":") {
        advance();
        if (getDataType(currentToken().value) != DataType::UNKNOWN) {
            node.dataType = getDataType(currentToken().value);
            advance();
        } else {
            displayError("Invalid data type", currentToken());
            exit(1);
        }
    }

    if (currentToken().value == "=") {
        advance();

        if (
                currentToken().type == TokenType::IDENTIFIER ||
                currentToken().type == TokenType::NUMBER ||
                currentToken().type == TokenType::STRING_LITERAL ||
                currentToken().type == TokenType::CHAR_LITERAL
                ) {

            node.value = currentToken().value;

            if (node.dataType == DataType::UNKNOWN) {
                node.dataType = getDataTypeFromTokenType(currentToken().type);
            }
            advance();
        } else {
            displayError("Invalid data", currentToken());
            exit(1);
        }

    } else {

        if (node.dataType == DataType::UNKNOWN) {
            displayError("Variable must be initialized.", currentToken());
            exit(1);
        } else {
            node.value = getDefaultValue(node.dataType);
        }
    }

    std::visit([&node](const auto &value) {
                   std::cout
                           << "VariableDeclarationNode: "
                           << node.identifier
                           << " "
                           << getDataTypeValue(node.dataType)
                           << " "
                           << value
                           << std::endl;
               },
               node.value);
}

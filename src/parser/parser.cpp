#include "parser.h"
#include "parser_nodes.h"
#include "node.h"
#include "../utils/extension.h"
#include "../utils/constants.h"
#include "../utils/keywords.h"
#include "../utils/declaration.h"
#include "../utils/dataTypes.h"
#include <iostream>
#include <unordered_set>

using namespace std;

auto root = ModuleNode();

Parser::Parser(const std::vector<Token>& tokens) : tokens(tokens), position(0)
{
    keywordHandlers["class"] = [this]() { return parseClass(); };
    keywordHandlers["enum"] = [this]() { return parseEnum(); };
}

Token Parser::currentToken()
{
    if (position < tokens.size())
    {
        return tokens[position];
    }
    return {TokenType::UNKNOWN, "", 0};
}

void Parser::advance()
{
    if (position < tokens.size())
    {
        position++;
    }
}

void Parser::expect(TokenType type)
{
    if (currentToken().type != type)
    {
        std::cerr << "Error: Expected token type " << static_cast<int>(type)
            << " at line " << currentToken().line
            << ", but got " << static_cast<int>(currentToken().type)
            << " at line " << currentToken().line << std::endl;

        exit(1);
    }
}

void Parser::expect(TokenType type, const std::string& expectedValue)
{
    if (currentToken().type != type || currentToken().value != expectedValue)
    {
        std::cerr << "Error: Expected token type " << static_cast<int>(type)
            << " with value '" << expectedValue
            << "' at line " << currentToken().line
            << ", but got type " << static_cast<int>(currentToken().type)
            << " with value '" << currentToken().value
            << "' at line " << currentToken().line << std::endl;

        exit(1);
    }
}

ModuleNode Parser::parse()
{
    collectImportStatements();

    while (position < tokens.size())
    {
        if (isGlobalKeyword(currentToken().value))
        {
            std::string accessSpecifier = "public";

            if (isAccessSpecifier(currentToken().value))
            {
                accessSpecifier = currentToken().value;
                advance();

                if (!isDeclarations(currentToken().value))
                {
                    displayError(IAD, currentToken());
                    exit(1);
                }

                handleDeclaration(accessSpecifier);
            }
            else handleDeclaration(accessSpecifier);
        }
        else
        {
            displayError(ITLD, currentToken());
            exit(1);
        }
    }

    return std::move(root);
}

ParseNode Parser::parseClass()
{
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

    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}")
    {
        if (currentToken().value == "const")
        {
            classNode.addChild(parseConst());
        }
        else if (currentToken().value == "val")
        {
            classNode.addChild(parseVar());
        }
        else if (currentToken().value == "func")
        {
            classNode.addChild(parseMethod());
        }
        else
        {
            displayError("Unexpected token", currentToken());
        }
    }
    expect(TokenType::SEPARATOR, "}");
    advance();

    return classNode;
}

ParseNode Parser::parseEnum()
{
    expect(TokenType::KEYWORD, "enum");

    // Parse enum name
    expect(TokenType::IDENTIFIER, ""); // Expecting an identifier
    Token enumName = currentToken();
    advance();

    // Parse enum body
    expect(TokenType::SEPARATOR, "{");
    advance();

    ParseNode enumNode(enumName);
    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}")
    {
        enumNode.addChild(parseStatement());
    }

    expect(TokenType::SEPARATOR, "}");
    advance();

    return enumNode;
}

ParseNode Parser::parseStatement()
{
    Token token = currentToken();
    advance(); // Move to the next token
    return ParseNode(token);
}

ParseNode Parser::parseConst()
{
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

ParseNode Parser::parseVar()
{
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

ParseNode Parser::parseMethod()
{
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
    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != ")")
    {
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

    while (currentToken().type != TokenType::SEPARATOR || currentToken().value != "}")
    {
        // Parsing method body (could be extended)
        advance();
    }
    expect(TokenType::SEPARATOR, "}");
    advance();

    return methodNode;
}

void Parser::collectImportStatements()
{
    while (currentToken().type == TokenType::KEYWORD && currentToken().value == "import")
    {
        advance();

        std::vector<std::string> moduleNameParts;

        while (currentToken().type == TokenType::IDENTIFIER)
        {
            moduleNameParts.push_back(currentToken().value);
            advance();

            if (currentToken().type == TokenType::SEPARATOR && currentToken().value == ".")
            {
                advance();

                if (currentToken().type != TokenType::IDENTIFIER)
                {
                    displayError("Unexpected token", currentToken());
                    exit(0);
                }
            }
            else if (currentToken().type == TokenType::IDENTIFIER)
            {
                displayError("Missing '.' in import statement.", currentToken());
                exit(0);
            }
        }
        auto importStatement = std::make_unique<ImportStatementNode>();
        importStatement->module_names = moduleNameParts;
        root.module.push_back(std::move(importStatement));

        /*
        importStatement.printModuleNames();
        std::cout << endl;
        */
    }
    std::cout << "Finished collecting import statements." << std::endl;
}

void Parser::handleDeclaration(const std::string& accessSpecifier)
{
    if (currentToken().value == "const" || currentToken().value == "var")
    {
        handleVariableDeclaration(accessSpecifier);
    }
    else if (currentToken().value == "fun")
    {
        handleFunction();
    }
    else
    {
        handleClasses();
    }
}

void Parser::handleVariableDeclaration(std::string accessSpecifier)
{
    auto node = std::make_unique<VariableDeclarationNode>();
    node->access = std::move(accessSpecifier);
    node->property = getVariableType(currentToken().value);
    advance();

    if (currentToken().type == TokenType::IDENTIFIER)
    {
        node->identifier = currentToken().value;
        advance();

        if (currentToken().value == "=")
        {
            advance();

            if (
                currentToken().type == TokenType::IDENTIFIER ||
                currentToken().type == TokenType::NUMBER ||
                currentToken().type == TokenType::STRING_LITERAL ||
                currentToken().type == TokenType::CHAR_LITERAL
                // currentToken().type == TokenType::BOOLEAN
            )
            {
                node->value = currentToken().value;

                if (node->dataType == DataType::UNKNOWN)
                {
                    node->dataType = getDataTypeFromTokenType(currentToken().type);
                }
                advance();
            }
            else
            {
                displayError("Invalid data", currentToken());
                exit(1);
            }
        }
        else
        {
            displayError("Variable must be initialized.", currentToken());
            exit(1);
        }
    }
    else
    {
        displayError("Invalid identifier", currentToken());
        exit(1);
    }

    root.module.push_back(std::move(node));
}


void Parser::handleFunction()
{
    advance();

    if (currentToken().type == TokenType::IDENTIFIER)
    {
        string functionName = currentToken().value;
        auto functionNode = FunctionNode(functionName);

        advance();

        if (currentToken().value == "(")
        {
            advance();
            handleFunctionParameters(&functionNode);
            advance(); // Skip ")"
            advance(); // Skip "{"
        }
        else if (currentToken().value == "{")
        {
            advance();
        }
        else
        {
            displayError("Invalid function syntax", currentToken());
            exit(1);
        }

        handleFunctionBody(&functionNode);
        root.module.emplace_back(&functionNode);
    }
    else
    {
        displayError("Invalid function name", currentToken());
        exit(1);
    }
}

void Parser::handleFunctionBody(FunctionNode* function_node)
{
    while (currentToken().value != "}")
    {
        if (currentToken().type == TokenType::KEYWORD)
        {
            std::string identifier = currentToken().value;
            advance();
        }
        else
        {
            displayError("Invalid identifier", currentToken());
            exit(1);
        }
    }
}

void Parser::handleFunctionParameters(FunctionNode* function_node)
{
    // Modifying the function_node here will affect the original, as the pointer
    // allows direct access to the original object.

    while (currentToken().value != ")")
    {
        if (currentToken().type == TokenType::IDENTIFIER)
        {
            std::string paramName = currentToken().value;
            advance();

            expect(TokenType::SEPARATOR, ":");
            advance();

            if (currentToken().type == TokenType::DATA_TYPE)
            {
                DataType paramType = getDataType(currentToken().value);
                function_node->params.push_back(new FunctionParameterNode(paramName, paramType));
            }
            else
            {
                displayError("Invalid data type", currentToken());
                exit(1);
            }

            advance();

            if (currentToken().type == TokenType::SEPARATOR && currentToken().value == ",")
                advance();

            if (currentToken().type == TokenType::IDENTIFIER)
            {
                displayError("Expecting a semi-colon here", currentToken());
                exit(1);
            }
        }
        else if (currentToken().type == TokenType::KEYWORD)
        {
            displayError("Keywords cannot be used as function parameters", currentToken());
            exit(1);
        }
        else
        {
            displayError("Invalid function parameter name", currentToken());
            exit(1);
        }
    }
}

void Parser::handleClasses()
{
}

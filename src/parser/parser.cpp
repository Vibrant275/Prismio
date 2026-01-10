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
        if (isDeclarations(currentToken().value))
        {
            if (currentToken().value == "let")
                handleVariableDeclaration();

            if (currentToken().value == "fn")
                handleFunction();

            // if (currentToken().value == "struct")
            //     handleStruct();
            //
            // if (currentToken().value == "enum")
            //     handleEnum();
            //
            // if (currentToken().value == "trait")
            //     handleTrait();
            //
            // if (currentToken().value == "impl")
            //     handleImplementation();
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
    expect(TokenType::ASSIGNMENT_OPERATOR, "=");
    advance();

    // Parse value
    expect(TokenType::NUMBER_LITERAL, "");
    std::string value = currentToken().value;
    advance();

    // Parse semicolon
    expect(TokenType::SEPARATOR, ";");

    ParseNode constNode(Token{TokenType::KEYWORD, "const", currentToken().line});
    constNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, type, currentToken().line}));
    constNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, name, currentToken().line}));
    constNode.addChild(ParseNode(Token{TokenType::NUMBER_LITERAL, value, currentToken().line}));

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
    expect(TokenType::ASSIGNMENT_OPERATOR, "=");
    advance();

    // Parse value
    expect(TokenType::NUMBER_LITERAL, "");
    std::string value = currentToken().value;
    advance();

    // Parse semicolon
    expect(TokenType::SEPARATOR, ";");

    ParseNode varNode(Token{TokenType::KEYWORD, "val", currentToken().line});
    varNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, type, currentToken().line}));
    varNode.addChild(ParseNode(Token{TokenType::IDENTIFIER, name, currentToken().line}));
    varNode.addChild(ParseNode(Token{TokenType::NUMBER_LITERAL, value, currentToken().line}));

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

void Parser::printModuleNames()
{
    for (const auto& statements : root.statements)
    {
        if (statements->type == NodeType::IMPORT_STATEMENT)
        {
            const auto* importStatements = dynamic_cast<const ImportStatementNode*>(statements.get());

            std::cout << "import ";

            for (const auto& i : importStatements->module_path)
            {
                std::cout << i << "\n";
            }
            std::cout << "\n";
        }
    }
}

void Parser::collectImportStatements()
{
    while (currentToken().value == "import")
    {
        advance();

        std::vector<std::string> moduleNameParts;

        while (currentToken().type == TokenType::IDENTIFIER or currentToken().type == TokenType::KEYWORD)
        {
            moduleNameParts.push_back(currentToken().value);
            advance();

            if (currentToken().type == TokenType::SEPARATOR && currentToken().value == ".")
            {
                advance();

                if (currentToken().type != TokenType::IDENTIFIER and currentToken().type != TokenType::KEYWORD)
                {
                    displayError("Unexpected token", currentToken());
                    exit(0);
                }
            }
        }
        auto importStatement = std::make_unique<ImportStatementNode>();
        importStatement->module_path = moduleNameParts;
        root.statements.push_back(std::move(importStatement));
    }
    std::cout << "Finished collecting import statements." << std::endl;
}

void Parser::handleVariableDeclaration()
{
    advance();
    bool isMutable = false;

    if (currentToken().value == "mut")
    {
        isMutable = true;
        advance();
    }

    expect(TokenType::IDENTIFIER);

    std::string identifier = currentToken().value;
    advance();

    if (currentToken().value != "=")
    {
        std::cerr << "Error: Expected token type " << static_cast<int>(currentToken().type)
            << " at line " << currentToken().line
            << ", but got " << static_cast<int>(currentToken().type)
            << " at line " << currentToken().line << std::endl;

        exit(1);
    }

    advance();

    TokenType tokenType = currentToken().type;
    std::string value = currentToken().value;

    advance();

    auto node = std::make_unique<VariableDeclNode>();

    node->name = std::move(identifier);
    node->value = std::move(value);
    node->is_mutable = isMutable;
    node->type = tokenType;

    root.statements.push_back(std::move(node));
}

vector<unique_ptr<Node>> Parser::collectFunctionParameters()
{
    std::vector<std::unique_ptr<Node>> parameters;

    while (currentToken().value != ")")
    {
        if (currentToken().type == TokenType::IDENTIFIER)
        {
            std::string paramName = currentToken().value;
            DataType type;
            advance();

            expect(TokenType::SEPARATOR, ":");
            advance();

            if (isDataType(currentToken().value))
            {
                type = getDataType(currentToken().value);
                advance();
            }
            else
            {
                displayError("Invalid data type", currentToken());
                exit(1);
            }

            if (currentToken().type == TokenType::SEPARATOR && currentToken().value == ",")
                advance();

            auto paramNode = std::make_unique<FunctionParameterNode>(paramName, type);
            parameters.push_back(std::move(paramNode));
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

    return parameters;
}

void Parser::handleFunction()
{
    advance();

    expect(TokenType::IDENTIFIER);
    std::string functionName = currentToken().value;
    advance();

    expect(TokenType::SEPARATOR, "(");
    advance();

    auto parameters = collectFunctionParameters();

    expect(TokenType::SEPARATOR, ")");
    advance();

    auto functionNode = std::make_unique<FunctionNode>();
    functionNode->parameters = std::move(parameters);
    functionNode->name = functionName;

    auto functionBody = handleFunctionBody();
    functionNode->body = std::move(functionBody);

    root.statements.push_back(std::move(functionNode));
}

vector<unique_ptr<Node>> Parser::handleFunctionBody()
{

    if (currentToken().value == "{")
    {
        advance();

    }

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
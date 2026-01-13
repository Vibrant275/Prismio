#include "parser.h"
#include "parser_nodes.h"
#include "node.h"
#include "../utils/extension.h"
#include "../utils/constants.h"
#include "../utils/keywords.h"
#include "../utils/declaration.h"
#include "../utils/dataTypes.h"
#include <iostream>

auto root = ModuleNode();

Parser::Parser(const std::vector<Token>& tokens) : tokens(tokens), position(0)
{
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
            {
                auto variableDeclaration = handleVariableDeclaration();
                root.statements.push_back(std::move(variableDeclaration));
            }

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
            else
            {
                break;
            }
        }
        auto importStatement = std::make_unique<ImportStatementNode>();
        importStatement->module_path = moduleNameParts;
        root.statements.push_back(std::move(importStatement));
    }
    std::cout << "Finished collecting import statements." << std::endl;
}

std::unique_ptr<VariableDeclNode> Parser::handleVariableDeclaration()
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

    return node;
}

std::vector<std::unique_ptr<Node>> Parser::collectFunctionParameters()
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

std::unique_ptr<AssignmentTree> Parser::getAssignmentTree()
{
    auto assignmentTree = std::make_unique<AssignmentTree>();

    while (
        currentToken().type == TokenType::STRING_LITERAL or
        currentToken().type == TokenType::BOOL_LITERAL or
        currentToken().type == TokenType::NUMBER_LITERAL or
        currentToken().type == TokenType::CHAR_LITERAL or
        currentToken().type == TokenType::IDENTIFIER or
        currentToken().type == TokenType::ARITHMETIC_OPERATOR
    )
    {
        auto node = std::make_unique<AssignmentTreeNode>();

        std::string value = currentToken().value;
        TokenType type = currentToken().type;

        advance();

        if (type == TokenType::IDENTIFIER and currentToken().value == "(")
        {
            node->type = AssignmentTreeNodeType::FUNCTION;
            advance(); // Skip (
            advance(); // Skip )
        }

        node->value = value;
        node->type = getAssignmentTreeNodeTypeFromTokenType(type);

        assignmentTree->tree.push_back(std::move(node));
    }

    return assignmentTree;
}

std::unique_ptr<Node> Parser::handleIfStatement()
{
}


std::unique_ptr<Node> Parser::handleForStatement()
{
}


std::unique_ptr<Node> Parser::handleWhileStatement()
{
}


std::unique_ptr<Node> Parser::handleLoopStatement()
{
}


std::unique_ptr<Node> Parser::handlePrintStatement()
{
}

std::unique_ptr<Node> Parser::handleReturnStatement(DataType data)
{
}

std::unique_ptr<Node> Parser::handleMatchStatement()
{
}

std::vector<std::unique_ptr<Node>> Parser::handleFunctionBody()
{
    std::vector<std::unique_ptr<Node>> body;

    DataType returnType = DataType::UNKNOWN;

    if (currentToken().value == "{")
    {
        advance();
    }

    if (currentToken().value == "->")
    {
        advance();
        returnType = getDataType(currentToken().value);
        advance();
        expect(TokenType::SEPARATOR, "{");
        advance();
    }

    while (currentToken().value != "}")
    {
        if (currentToken().type == TokenType::IDENTIFIER)
        {
            const std::string identifier = currentToken().value;
            advance();
            expect(TokenType::ASSIGNMENT_OPERATOR);
            advance();

            auto assignmentTree = getAssignmentTree();

            auto assignmentBody = std::make_unique<AssignmentBody>();
            assignmentBody->identifier = identifier;
            assignmentBody->tree = std::move(assignmentTree);

            body.push_back(std::move(assignmentTree));
        }
        else if (isFunctionStarter(currentToken().value))
        {
            std::string keyword = currentToken().value;
            advance();

            if (keyword == "if")
                body.push_back(std::move(handleIfStatement()));

            else if (keyword == "for")
                body.push_back(std::move(handleForStatement()));

            else if (keyword == "while")
                body.push_back(std::move(handleWhileStatement()));

            else if (keyword == "loop")
                body.push_back(std::move(handleLoopStatement()));

            else if (keyword == "print")
                body.push_back(std::move(handlePrintStatement()));

            else if (keyword == "return")
                body.push_back(std::move(handleReturnStatement(returnType)));

            else if (keyword == "let")
                body.push_back(std::move(handleVariableDeclaration()));

            else if (keyword == "match")
                body.push_back(handleMatchStatement());
            else
            {
                displayError("Invalid identifier", currentToken());
                exit(1);
            }
        }
    }
    return body;
}

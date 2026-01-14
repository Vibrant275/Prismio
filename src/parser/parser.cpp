#include "parser.h"
#include "node.h"
#include "../utils/extension.h"
#include "../utils/constants.h"
#include "../utils/keywords.h"
#include <iostream>

Parser::Parser(const std::vector<Token>& tokens) : tokens(tokens), position(0) {}

Token Parser::currentToken() {
    if (position < tokens.size()) {
        return tokens[position];
    }
    return {TokenType::UNKNOWN, "", 0};
}

Token Parser::peek(int offset) {
    if (position + offset < tokens.size()) {
        return tokens[position + offset];
    }
    return {TokenType::UNKNOWN, "", 0};
}

void Parser::advance() {
    if (position < tokens.size()) {
        position++;
    }
}

bool Parser::check(TokenType type) {
    return currentToken().type == type;
}

bool Parser::check(TokenType type, const std::string& value) {
    return currentToken().type == type && currentToken().value == value;
}

bool Parser::match(TokenType type) {
    if (check(type)) {
        advance();
        return true;
    }
    return false;
}

bool Parser::match(TokenType type, const std::string& value) {
    if (check(type, value)) {
        advance();
        return true;
    }
    return false;
}

void Parser::expect(TokenType type, const std::string& context) {
    if (!check(type)) {
        std::cerr << "Error in " << context << ": Expected token type "
                  << static_cast<int>(type) << " at line " << currentToken().line
                  << ", but got " << static_cast<int>(currentToken().type) << std::endl;
        exit(1);
    }
    advance();
}

void Parser::expect(TokenType type, const std::string& value, const std::string& context) {
    if (!check(type, value)) {
        std::cerr << "Error in " << context << ": Expected '" << value
                  << "' at line " << currentToken().line
                  << ", but got '" << currentToken().value << "'" << std::endl;
        exit(1);
    }
    advance();
}

// ==================================================
// MAIN PARSE FUNCTION
// ==================================================

ModuleNode Parser::parse() {
    ModuleNode module;

    // Collect imports first
    while (check(TokenType::KEYWORD, "import")) {
        module.statements.push_back(parseImportStatement());
    }

    // Parse top-level declarations
    while (position < tokens.size()) {
        if (isDeclarations(currentToken().value)) {
            module.statements.push_back(parseDeclaration());
        } else {
            displayError(ITLD, currentToken());
            exit(1);
        }
    }

    return module;
}

// ==================================================
// IMPORT STATEMENTS
// ==================================================

std::unique_ptr<Node> Parser::parseImportStatement() {
    expect(TokenType::KEYWORD, "import", "import statement");

    auto importNode = std::make_unique<ImportStatementNode>();

    // Parse module path: import prismio.net.AsyncLoader
    while (check(TokenType::IDENTIFIER) || check(TokenType::KEYWORD)) {
        importNode->module_path.push_back(currentToken().value);
        advance();

        if (match(TokenType::SEPARATOR, ".")) {
            if (!check(TokenType::IDENTIFIER) && !check(TokenType::KEYWORD)) {
                displayError("Expected identifier after '.'", currentToken());
                exit(1);
            }
        } else {
            break;
        }
    }

    return importNode;
}

// ==================================================
// DECLARATIONS
// ==================================================

std::unique_ptr<Node> Parser::parseDeclaration() {
    if (check(TokenType::KEYWORD, "let")) {
        return parseVariableDecl();
    }
    if (check(TokenType::KEYWORD, "fn")) {
        return parseFunctionDecl();
    }
    if (check(TokenType::KEYWORD, "struct")) {
        return parseStructDecl();
    }
    if (check(TokenType::KEYWORD, "enum")) {
        return parseEnumDecl();
    }
    if (check(TokenType::KEYWORD, "trait")) {
        return parseTraitDecl();
    }
    if (check(TokenType::KEYWORD, "impl")) {
        return parseImplDecl();
    }

    displayError("Unknown declaration", currentToken());
    exit(1);
}

std::unique_ptr<Node> Parser::parseVariableDecl() {
    expect(TokenType::KEYWORD, "let", "variable declaration");

    auto varNode = std::make_unique<VariableDeclNode>();

    // Check for mut
    if (check(TokenType::KEYWORD, "mut")) {
        varNode->is_mutable = true;
        advance();
    }

    // Variable name
    expect(TokenType::IDENTIFIER, "variable name");
    varNode->name = tokens[position - 1].value;

    // Optional type annotation
    if (match(TokenType::SEPARATOR, ":")) {
        varNode->type_annotation = parseTypeAnnotation();
    }

    // Optional initializer
    if (check(TokenType::ASSIGNMENT_OPERATOR)) {
        advance();
        varNode->initializer = parseExpression();
    }

    return varNode;
}

std::unique_ptr<Node> Parser::parseFunctionDecl() {
    expect(TokenType::KEYWORD, "fn", "function declaration");

    auto funcNode = std::make_unique<FunctionNode>();

    // Function name
    expect(TokenType::IDENTIFIER, "function name");
    funcNode->name = tokens[position - 1].value;

    // Parameters
    expect(TokenType::SEPARATOR, "(", "function parameters");

    if (!check(TokenType::SEPARATOR, ")")) {
        do {
            auto param = std::make_unique<FunctionParameterNode>();

            expect(TokenType::IDENTIFIER, "parameter name");
            param->name = tokens[position - 1].value;

            expect(TokenType::SEPARATOR, ":", "parameter type");
            param->type_annotation = parseTypeAnnotation();

            funcNode->parameters.push_back(std::move(param));

        } while (match(TokenType::SEPARATOR, ","));
    }

    expect(TokenType::SEPARATOR, ")", "function parameters");

    // Return type
    if (match(TokenType::ARROW)) {
        funcNode->return_type = parseTypeAnnotation();
    }

    // Function body
    funcNode->body = parseBlock();

    return funcNode;
}

std::unique_ptr<Node> Parser::parseStructDecl() {
    expect(TokenType::KEYWORD, "struct", "struct declaration");

    auto structNode = std::make_unique<StructDeclNode>();

    expect(TokenType::IDENTIFIER, "struct name");
    structNode->name = tokens[position - 1].value;

    expect(TokenType::SEPARATOR, "{", "struct body");

    // Parse fields
    while (!check(TokenType::SEPARATOR, "}")) {
        StructField field;

        expect(TokenType::IDENTIFIER, "field name");
        field.name = tokens[position - 1].value;

        expect(TokenType::SEPARATOR, ":", "field type");
        field.type_annotation = parseTypeAnnotation();

        structNode->fields.push_back(std::move(field));

        // Optional comma
        match(TokenType::SEPARATOR, ",");
    }

    expect(TokenType::SEPARATOR, "}", "struct body");

    return structNode;
}

std::unique_ptr<Node> Parser::parseEnumDecl() {
    expect(TokenType::KEYWORD, "enum", "enum declaration");

    auto enumNode = std::make_unique<EnumDeclNode>();

    expect(TokenType::IDENTIFIER, "enum name");
    enumNode->name = tokens[position - 1].value;

    expect(TokenType::SEPARATOR, "{", "enum body");

    // Parse variants
    while (!check(TokenType::SEPARATOR, "}")) {
        EnumVariant variant;

        expect(TokenType::IDENTIFIER, "variant name");
        variant.name = tokens[position - 1].value;

        // Optional associated types
        if (match(TokenType::SEPARATOR, "(")) {
            while (!check(TokenType::SEPARATOR, ")")) {
                variant.associated_types.push_back(parseTypeAnnotation());

                if (!check(TokenType::SEPARATOR, ")")) {
                    expect(TokenType::SEPARATOR, ",", "variant types");
                }
            }
            expect(TokenType::SEPARATOR, ")", "variant types");
        }

        enumNode->variants.push_back(std::move(variant));

        // Optional comma
        match(TokenType::SEPARATOR, ",");
    }

    expect(TokenType::SEPARATOR, "}", "enum body");

    return enumNode;
}

std::unique_ptr<Node> Parser::parseTraitDecl() {
    expect(TokenType::KEYWORD, "trait", "trait declaration");

    auto traitNode = std::make_unique<TraitDeclNode>();

    expect(TokenType::IDENTIFIER, "trait name");
    traitNode->name = tokens[position - 1].value;

    expect(TokenType::SEPARATOR, "{", "trait body");

    // Parse method signatures
    while (!check(TokenType::SEPARATOR, "}")) {
        traitNode->methods.push_back(parseFunctionDecl());
    }

    expect(TokenType::SEPARATOR, "}", "trait body");

    return traitNode;
}

std::unique_ptr<Node> Parser::parseImplDecl() {
    expect(TokenType::KEYWORD, "impl", "impl declaration");

    auto implNode = std::make_unique<ImplDeclNode>();

    expect(TokenType::IDENTIFIER, "type name");
    implNode->type_name = tokens[position - 1].value;

    expect(TokenType::SEPARATOR, "{", "impl body");

    // Parse methods
    while (!check(TokenType::SEPARATOR, "}")) {
        implNode->methods.push_back(parseFunctionDecl());
    }

    expect(TokenType::SEPARATOR, "}", "impl body");

    return implNode;
}

// ==================================================
// STATEMENTS
// ==================================================

std::unique_ptr<Node> Parser::parseStatement() {
    // Control flow statements
    if (check(TokenType::KEYWORD, "if")) {
        return parseIfStatement();
    }
    if (check(TokenType::KEYWORD, "match")) {
        return parseMatchStatement();
    }
    if (check(TokenType::KEYWORD, "for")) {
        return parseForStatement();
    }
    if (check(TokenType::KEYWORD, "while")) {
        return parseWhileStatement();
    }
    if (check(TokenType::KEYWORD, "loop")) {
        return parseLoopStatement();
    }
    if (check(TokenType::KEYWORD, "return")) {
        return parseReturnStatement();
    }
    if (check(TokenType::KEYWORD, "break")) {
        advance();
        return std::make_unique<BreakStatementNode>();
    }
    if (check(TokenType::KEYWORD, "continue")) {
        advance();
        return std::make_unique<ContinueStatementNode>();
    }

    // Variable declaration
    if (check(TokenType::KEYWORD, "let")) {
        return parseVariableDecl();
    }

    // Assignment or expression statement
    // Look ahead to check for assignment
    if (check(TokenType::IDENTIFIER) &&
        (peek(1).type == TokenType::ASSIGNMENT_OPERATOR ||
         peek(1).value == "=")) {
        return parseAssignmentStatement();
    }

    // Expression statement
    auto expr = parseExpression();
    auto exprStmt = std::make_unique<ExpressionStatementNode>();
    exprStmt->expression = std::move(expr);
    return exprStmt;
}

std::unique_ptr<Node> Parser::parseBlock() {
    expect(TokenType::SEPARATOR, "{", "block");

    auto block = std::make_unique<BlockNode>();

    while (!check(TokenType::SEPARATOR, "}")) {
        block->statements.push_back(parseStatement());
    }

    expect(TokenType::SEPARATOR, "}", "block");

    return block;
}

std::unique_ptr<Node> Parser::parseIfStatement() {
    expect(TokenType::KEYWORD, "if", "if statement");

    auto ifNode = std::make_unique<IfStatementNode>();

    expect(TokenType::SEPARATOR, "(", "if condition");
    ifNode->condition = parseExpression();
    expect(TokenType::SEPARATOR, ")", "if condition");

    ifNode->then_block = parseBlock();

    // Optional else
    if (match(TokenType::KEYWORD, "else")) {
        if (check(TokenType::KEYWORD, "if")) {
            // else if
            ifNode->else_block = parseIfStatement();
        } else {
            // else
            ifNode->else_block = parseBlock();
        }
    }

    return ifNode;
}

std::unique_ptr<Node> Parser::parseMatchStatement() {
    expect(TokenType::KEYWORD, "match", "match statement");

    auto matchNode = std::make_unique<MatchStatementNode>();

    matchNode->value = parseExpression();

    expect(TokenType::SEPARATOR, "{", "match body");

    while (!check(TokenType::SEPARATOR, "}")) {
        auto arm = std::make_unique<MatchArmNode>();

        // Pattern (simplified: just identifier or underscore)
        if (check(TokenType::UNDERSCORE)) {
            auto pattern = std::make_unique<IdentifierExprNode>();
            pattern->name = "_";
            arm->pattern = std::move(pattern);
            advance();
        } else {
            arm->pattern = parseExpression();
        }

        expect(TokenType::FAT_ARROW, "match arm");

        arm->expression = parseExpression();

        matchNode->arms.push_back(std::move(arm));

        // Optional comma
        match(TokenType::SEPARATOR, ",");
    }

    expect(TokenType::SEPARATOR, "}", "match body");

    return matchNode;
}

std::unique_ptr<Node> Parser::parseForStatement() {
    expect(TokenType::KEYWORD, "for", "for statement");

    auto forNode = std::make_unique<ForStatementNode>();

    expect(TokenType::SEPARATOR, "(", "for loop");

    expect(TokenType::IDENTIFIER, "iterator variable");
    forNode->iterator_var = tokens[position - 1].value;

    expect(TokenType::KEYWORD, "in", "for loop");

    forNode->iterable = parseExpression();

    expect(TokenType::SEPARATOR, ")", "for loop");

    forNode->body = parseBlock();

    return forNode;
}

std::unique_ptr<Node> Parser::parseWhileStatement() {
    expect(TokenType::KEYWORD, "while", "while statement");

    auto whileNode = std::make_unique<WhileStatementNode>();

    expect(TokenType::SEPARATOR, "(", "while condition");
    whileNode->condition = parseExpression();
    expect(TokenType::SEPARATOR, ")", "while condition");

    whileNode->body = parseBlock();

    return whileNode;
}

std::unique_ptr<Node> Parser::parseLoopStatement() {
    expect(TokenType::KEYWORD, "loop", "loop statement");

    auto loopNode = std::make_unique<LoopStatementNode>();

    loopNode->body = parseBlock();

    return loopNode;
}

std::unique_ptr<Node> Parser::parseReturnStatement() {
    expect(TokenType::KEYWORD, "return", "return statement");

    auto returnNode = std::make_unique<ReturnStatementNode>();

    // Optional return value
    if (!check(TokenType::SEPARATOR, "}")) {
        returnNode->value = parseExpression();
    }

    return returnNode;
}

std::unique_ptr<Node> Parser::parseAssignmentStatement() {
    auto assignNode = std::make_unique<AssignmentStatementNode>();

    // Target (identifier for now, can extend to member access)
    assignNode->target = parsePrimary();

    // Assignment operator
    std::string opValue = currentToken().value;
    assignNode->op = getBinaryOpFromToken(opValue);
    advance();

    // Value
    assignNode->value = parseExpression();

    return assignNode;
}

// ==================================================
// EXPRESSIONS (Pratt parser / Precedence climbing)
// ==================================================

std::unique_ptr<Node> Parser::parseExpression(int precedence) {
    auto left = parsePrimary();

    while (true) {
        // Check if current token is actually an operator
        if (currentToken().type != TokenType::ARITHMETIC_OPERATOR &&
            currentToken().type != TokenType::RELATIONAL_OPERATOR &&
            currentToken().value != "and" &&
            currentToken().value != "or") {
            break;
        }

        int currentPrecedence = getOperatorPrecedence(currentToken());

        if (currentPrecedence < precedence || currentPrecedence == 0) {
            break;
        }

        std::string op = currentToken().value;
        advance();

        auto right = parseExpression(currentPrecedence + 1);

        auto binExpr = std::make_unique<BinaryExprNode>();
        binExpr->op = getBinaryOpFromToken(op);
        binExpr->left = std::move(left);
        binExpr->right = std::move(right);

        left = std::move(binExpr);
    }

    return left;
}

std::unique_ptr<Node> Parser::parsePrimary() {
    // Literals
    if (check(TokenType::NUMBER_LITERAL) ||
        check(TokenType::STRING_LITERAL) ||
        check(TokenType::CHAR_LITERAL) ||
        check(TokenType::BOOL_LITERAL)) {

        auto lit = std::make_unique<LiteralExprNode>();
        lit->literal_type = currentToken().type;
        lit->value = currentToken().value;
        advance();
        return lit;
    }

    // Identifiers and function calls
    if (check(TokenType::IDENTIFIER)) {
        auto ident = std::make_unique<IdentifierExprNode>();
        ident->name = currentToken().value;
        advance();

        // Function call
        if (match(TokenType::SEPARATOR, "(")) {
            auto call = std::make_unique<CallExprNode>();
            call->callee = std::move(ident);

            if (!check(TokenType::SEPARATOR, ")")) {
                do {
                    call->arguments.push_back(parseExpression());
                } while (match(TokenType::SEPARATOR, ","));
            }

            expect(TokenType::SEPARATOR, ")", "function call");
            return call;
        }

        // Member access
        if (match(TokenType::SEPARATOR, ".")) {
            auto member = std::make_unique<MemberAccessExprNode>();
            member->object = std::move(ident);

            expect(TokenType::IDENTIFIER, "member name");
            member->member_name = tokens[position - 1].value;

            return member;
        }

        return ident;
    }

    // Parenthesized expression
    if (match(TokenType::SEPARATOR, "(")) {
        auto expr = parseExpression();
        expect(TokenType::SEPARATOR, ")", "parenthesized expression");
        return expr;
    }

    // Unary operators
    if (check(TokenType::NEGATION) || check(TokenType::ARITHMETIC_OPERATOR, "-")) {
        auto unary = std::make_unique<UnaryExprNode>();
        unary->op = currentToken().value == "!" ? UnaryOp::NOT : UnaryOp::NEG;
        advance();
        unary->operand = parsePrimary();
        return unary;
    }

    displayError("Unexpected token in expression", currentToken());
    exit(1);
}

// ==================================================
// TYPE ANNOTATIONS
// ==================================================

std::unique_ptr<Node> Parser::parseTypeAnnotation() {
    auto typeNode = std::make_unique<TypeAnnotationNode>();

    // Check for reference (&)
    if (match(TokenType::AMPERSAND)) {
        typeNode->is_reference = true;
    }

    // Type name
    if (check(TokenType::IDENTIFIER) || check(TokenType::KEYWORD)) {
        typeNode->type_name = currentToken().value;
        advance();
    } else {
        displayError("Expected type name", currentToken());
        exit(1);
    }

    // Check for array ([])
    if (match(TokenType::SEPARATOR, "[")) {
        typeNode->is_array = true;
        expect(TokenType::SEPARATOR, "]", "array type");
    }

    return typeNode;
}

// ==================================================
// OPERATOR PRECEDENCE
// ==================================================

int Parser::getOperatorPrecedence(const Token& token) {
    // Don't treat keywords as operators
    if (token.type == TokenType::KEYWORD) return 0;

    if (token.value == "or") return 1;
    if (token.value == "and") return 2;
    if (token.value == "==" || token.value == "!=") return 3;
    if (token.value == "<" || token.value == ">" ||
        token.value == "<=" || token.value == ">=") return 4;
    if (token.value == "+" || token.value == "-") return 5;
    if (token.value == "*" || token.value == "/" || token.value == "%") return 6;

    return 0;
}
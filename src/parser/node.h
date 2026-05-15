#ifndef PRISMIO_NODE_H
#define PRISMIO_NODE_H

#include <string>
#include <vector>
#include <memory>
#include "../utils/class_type.h"
#include "../utils/dataTypes.h"
#include "../utils/token.h"

// --------------------------------------------------
// Source location (for diagnostics)
// --------------------------------------------------
struct SourceLocation
{
    std::size_t line = 0;
    std::size_t column = 0;
};

// --------------------------------------------------
// Node types
// --------------------------------------------------
enum class NodeType
{
    // Top level
    MODULE,
    IMPORT_STATEMENT,

    // Declarations
    FUNCTION,
    FUNCTION_PARAMETER,
    VARIABLE_DECL,
    STRUCT_DECL,
    ENUM_DECL,
    TRAIT_DECL,
    IMPL_DECL,

    // Statements
    IF_STATEMENT,
    MATCH_STATEMENT,
    MATCH_ARM,
    FOR_STATEMENT,
    WHILE_STATEMENT,
    LOOP_STATEMENT,
    RETURN_STATEMENT,
    BREAK_STATEMENT,
    CONTINUE_STATEMENT,
    EXPRESSION_STATEMENT,
    ASSIGNMENT_STATEMENT,

    // Expressions
    BINARY_EXPR,
    UNARY_EXPR,
    LITERAL_EXPR,
    IDENTIFIER_EXPR,
    CALL_EXPR,
    MEMBER_ACCESS_EXPR,
    INDEX_EXPR,

    // Other
    BLOCK,
    TYPE_ANNOTATION,

    EXTERN_FUNCTION, ARRAY_LITERAL_EXPR, STRUCT_LITERAL_EXPR
};

// --------------------------------------------------
// Access modifiers
// --------------------------------------------------
enum class AccessModifier
{
    PUBLIC,
    PRIVATE,
    INTERNAL
};

// --------------------------------------------------
// Binary operators
// --------------------------------------------------
enum class BinaryOp
{
    ADD, SUB, MUL, DIV, MOD,
    EQ, NEQ, LT, GT, LTE, GTE,
    AND, OR,
    ASSIGN, ADD_ASSIGN, SUB_ASSIGN, MUL_ASSIGN, DIV_ASSIGN, MOD_ASSIGN
};

// --------------------------------------------------
// Unary operators
// --------------------------------------------------
enum class UnaryOp
{
    NEG, NOT,
    PRE_INC, PRE_DEC,
    POST_INC, POST_DEC
};

// --------------------------------------------------
// Base AST node
// --------------------------------------------------
class Node
{
public:
    const NodeType type;
    SourceLocation loc;

    explicit Node(NodeType type) : type(type)
    {
    }

    virtual ~Node() = default;
};

// ==================================================
// TOP LEVEL NODES
// ==================================================

// --------------------------------------------------
// Module (root)
// --------------------------------------------------
class ModuleNode final : public Node
{
public:
    std::vector<std::unique_ptr<Node>> statements;

    ModuleNode() : Node(NodeType::MODULE)
    {
    }
};

// --------------------------------------------------
// Import statement
// --------------------------------------------------
class ImportStatementNode final : public Node
{
public:
    std::vector<std::string> module_path;

    ImportStatementNode() : Node(NodeType::IMPORT_STATEMENT)
    {
    }
};

// ==================================================
// DECLARATION NODES
// ==================================================

// --------------------------------------------------
// Variable declaration (let / let mut)
// --------------------------------------------------
class VariableDeclNode final : public Node
{
public:
    std::string name;
    bool is_mutable = false;
    std::unique_ptr<Node> type_annotation; // optional
    std::unique_ptr<Node> initializer; // optional

    VariableDeclNode() : Node(NodeType::VARIABLE_DECL)
    {
    }
};

// --------------------------------------------------
// Function parameter
// --------------------------------------------------
class FunctionParameterNode final : public Node
{
public:
    std::string name;
    std::unique_ptr<Node> type_annotation;

    FunctionParameterNode() : Node(NodeType::FUNCTION_PARAMETER)
    {
    }
};

// --------------------------------------------------
// Function
// --------------------------------------------------
class FunctionNode final : public Node
{
public:
    std::string name;
    std::vector<std::unique_ptr<Node>> parameters;
    std::unique_ptr<Node> return_type; // optional
    std::unique_ptr<Node> body; // BlockNode

    FunctionNode() : Node(NodeType::FUNCTION)
    {
    }
};

// --------------------------------------------------
// Struct field
// --------------------------------------------------
struct StructField
{
    std::string name;
    std::unique_ptr<Node> type_annotation;
    AccessModifier access = AccessModifier::PUBLIC;
};

// --------------------------------------------------
// Struct declaration
// --------------------------------------------------
class StructDeclNode final : public Node
{
public:
    std::string name;
    std::vector<StructField> fields;
    std::vector<std::unique_ptr<Node>> methods; // FunctionNodes

    StructDeclNode() : Node(NodeType::STRUCT_DECL)
    {
    }
};

class StructLiteralExprNode final : public Node {
public:
    std::string struct_name;
    std::vector<std::pair<std::string, std::unique_ptr<Node>>> field_values;

    StructLiteralExprNode() : Node(NodeType::STRUCT_LITERAL_EXPR) {}
};

class ArrayLiteralExprNode final : public Node {
public:
    std::vector<std::unique_ptr<Node>> elements;

    ArrayLiteralExprNode() : Node(NodeType::ARRAY_LITERAL_EXPR) {}
};

// --------------------------------------------------
// Enum variant
// --------------------------------------------------
struct EnumVariant
{
    std::string name;
    std::vector<std::unique_ptr<Node>> associated_types; // optional
};

// --------------------------------------------------
// Enum declaration
// --------------------------------------------------
class EnumDeclNode final : public Node
{
public:
    std::string name;
    std::vector<EnumVariant> variants;

    EnumDeclNode() : Node(NodeType::ENUM_DECL)
    {
    }
};

// --------------------------------------------------
// Trait declaration
// --------------------------------------------------
class TraitDeclNode final : public Node
{
public:
    std::string name;
    std::vector<std::unique_ptr<Node>> methods; // Function signatures

    TraitDeclNode() : Node(NodeType::TRAIT_DECL)
    {
    }
};

// --------------------------------------------------
// Implementation block
// --------------------------------------------------
class ImplDeclNode final : public Node
{
public:
    std::string type_name;
    std::string trait_name; // optional, empty if not implementing a trait
    std::vector<std::unique_ptr<Node>> methods;

    ImplDeclNode() : Node(NodeType::IMPL_DECL)
    {
    }
};

// ==================================================
// STATEMENT NODES
// ==================================================

// --------------------------------------------------
// Block (list of statements)
// --------------------------------------------------
class BlockNode final : public Node
{
public:
    std::vector<std::unique_ptr<Node>> statements;

    BlockNode() : Node(NodeType::BLOCK)
    {
    }
};

// --------------------------------------------------
// If statement
// --------------------------------------------------
class IfStatementNode final : public Node
{
public:
    std::unique_ptr<Node> condition;
    std::unique_ptr<Node> then_block;
    std::unique_ptr<Node> else_block; // optional

    IfStatementNode() : Node(NodeType::IF_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Match arm
// --------------------------------------------------
class MatchArmNode final : public Node
{
public:
    std::unique_ptr<Node> pattern;
    std::unique_ptr<Node> expression;

    MatchArmNode() : Node(NodeType::MATCH_ARM)
    {
    }
};

// --------------------------------------------------
// Match statement
// --------------------------------------------------
class MatchStatementNode final : public Node
{
public:
    std::unique_ptr<Node> value;
    std::vector<std::unique_ptr<Node>> arms; // MatchArmNodes

    MatchStatementNode() : Node(NodeType::MATCH_STATEMENT)
    {
    }
};

// --------------------------------------------------
// For statement
// --------------------------------------------------
class ForStatementNode final : public Node
{
public:
    std::string iterator_var;
    std::unique_ptr<Node> iterable;
    std::unique_ptr<Node> body;

    ForStatementNode() : Node(NodeType::FOR_STATEMENT)
    {
    }
};

// --------------------------------------------------
// While statement
// --------------------------------------------------
class WhileStatementNode final : public Node
{
public:
    std::unique_ptr<Node> condition;
    std::unique_ptr<Node> body;

    WhileStatementNode() : Node(NodeType::WHILE_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Loop statement (infinite loop)
// --------------------------------------------------
class LoopStatementNode final : public Node
{
public:
    std::unique_ptr<Node> body;

    LoopStatementNode() : Node(NodeType::LOOP_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Return statement
// --------------------------------------------------
class ReturnStatementNode final : public Node
{
public:
    std::unique_ptr<Node> value; // optional

    ReturnStatementNode() : Node(NodeType::RETURN_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Break statement
// --------------------------------------------------
class BreakStatementNode final : public Node
{
public:
    BreakStatementNode() : Node(NodeType::BREAK_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Continue statement
// --------------------------------------------------
class ContinueStatementNode final : public Node
{
public:
    ContinueStatementNode() : Node(NodeType::CONTINUE_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Expression statement (expression used as statement)
// --------------------------------------------------
class ExpressionStatementNode final : public Node
{
public:
    std::unique_ptr<Node> expression;

    ExpressionStatementNode() : Node(NodeType::EXPRESSION_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Assignment statement
// --------------------------------------------------
class AssignmentStatementNode final : public Node
{
public:
    std::unique_ptr<Node> target; // identifier or member access
    BinaryOp op; // ASSIGN, ADD_ASSIGN, etc.
    std::unique_ptr<Node> value;

    AssignmentStatementNode() : Node(NodeType::ASSIGNMENT_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Extern Function Declaration
// --------------------------------------------------
class ExternFunctionNode final : public Node
{
public:
    std::string name;
    std::vector<std::unique_ptr<Node>> parameters;
    std::unique_ptr<Node> return_type; // optional
    bool is_vararg = false; // for variadic functions like printf

    ExternFunctionNode() : Node(NodeType::EXTERN_FUNCTION)
    {
    }
};

// ==================================================
// EXPRESSION NODES
// ==================================================

// --------------------------------------------------
// Binary expression
// --------------------------------------------------
class BinaryExprNode final : public Node
{
public:
    BinaryOp op;
    std::unique_ptr<Node> left;
    std::unique_ptr<Node> right;

    BinaryExprNode() : Node(NodeType::BINARY_EXPR)
    {
    }
};

// --------------------------------------------------
// Unary expression
// --------------------------------------------------
class UnaryExprNode final : public Node
{
public:
    UnaryOp op;
    std::unique_ptr<Node> operand;

    UnaryExprNode() : Node(NodeType::UNARY_EXPR)
    {
    }
};

// --------------------------------------------------
// Literal expression
// --------------------------------------------------
class LiteralExprNode final : public Node
{
public:
    TokenType literal_type;
    std::string value;

    LiteralExprNode() : Node(NodeType::LITERAL_EXPR)
    {
    }
};

// --------------------------------------------------
// Identifier expression
// --------------------------------------------------
class IdentifierExprNode final : public Node
{
public:
    std::string name;

    IdentifierExprNode() : Node(NodeType::IDENTIFIER_EXPR)
    {
    }
};

// --------------------------------------------------
// Function call expression
// --------------------------------------------------
class CallExprNode final : public Node
{
public:
    std::unique_ptr<Node> callee; // usually IdentifierExprNode or MemberAccessExprNode
    std::vector<std::unique_ptr<Node>> arguments;

    CallExprNode() : Node(NodeType::CALL_EXPR)
    {
    }
};

// --------------------------------------------------
// Member access expression (obj.member)
// --------------------------------------------------
class MemberAccessExprNode final : public Node
{
public:
    std::unique_ptr<Node> object;
    std::string member_name;

    MemberAccessExprNode() : Node(NodeType::MEMBER_ACCESS_EXPR)
    {
    }
};

// --------------------------------------------------
// Index expression (arr[index])
// --------------------------------------------------
class IndexExprNode final : public Node
{
public:
    std::unique_ptr<Node> object;
    std::unique_ptr<Node> index;

    IndexExprNode() : Node(NodeType::INDEX_EXPR)
    {
    }
};

// --------------------------------------------------
// Type annotation
// --------------------------------------------------
class TypeAnnotationNode final : public Node {
public:
    std::string type_name;
    bool is_array = false;
    bool is_reference = false;
    std::unique_ptr<Node> element_type;  // ADD THIS - for array element type

    TypeAnnotationNode() : Node(NodeType::TYPE_ANNOTATION) {}
};

// ==================================================
// HELPER FUNCTIONS
// ==================================================

inline std::string getNodeTypeString(NodeType type)
{
    switch (type)
    {
    case NodeType::MODULE: return "MODULE";
    case NodeType::IMPORT_STATEMENT: return "IMPORT_STATEMENT";
    case NodeType::FUNCTION: return "FUNCTION";
    case NodeType::FUNCTION_PARAMETER: return "FUNCTION_PARAMETER";
    case NodeType::VARIABLE_DECL: return "VARIABLE_DECL";
    case NodeType::STRUCT_DECL: return "STRUCT_DECL";
    case NodeType::ENUM_DECL: return "ENUM_DECL";
    case NodeType::TRAIT_DECL: return "TRAIT_DECL";
    case NodeType::IMPL_DECL: return "IMPL_DECL";
    case NodeType::IF_STATEMENT: return "IF_STATEMENT";
    case NodeType::MATCH_STATEMENT: return "MATCH_STATEMENT";
    case NodeType::MATCH_ARM: return "MATCH_ARM";
    case NodeType::FOR_STATEMENT: return "FOR_STATEMENT";
    case NodeType::WHILE_STATEMENT: return "WHILE_STATEMENT";
    case NodeType::LOOP_STATEMENT: return "LOOP_STATEMENT";
    case NodeType::RETURN_STATEMENT: return "RETURN_STATEMENT";
    case NodeType::BREAK_STATEMENT: return "BREAK_STATEMENT";
    case NodeType::CONTINUE_STATEMENT: return "CONTINUE_STATEMENT";
    case NodeType::EXPRESSION_STATEMENT: return "EXPRESSION_STATEMENT";
    case NodeType::ASSIGNMENT_STATEMENT: return "ASSIGNMENT_STATEMENT";
    case NodeType::BINARY_EXPR: return "BINARY_EXPR";
    case NodeType::UNARY_EXPR: return "UNARY_EXPR";
    case NodeType::LITERAL_EXPR: return "LITERAL_EXPR";
    case NodeType::IDENTIFIER_EXPR: return "IDENTIFIER_EXPR";
    case NodeType::CALL_EXPR: return "CALL_EXPR";
    case NodeType::ARRAY_LITERAL_EXPR: return "ARRAY_LITERAL_EXPR";
    case NodeType::MEMBER_ACCESS_EXPR: return "MEMBER_ACCESS_EXPR";
    case NodeType::INDEX_EXPR: return "INDEX_EXPR";
    case NodeType::BLOCK: return "BLOCK";
    case NodeType::EXTERN_FUNCTION: return "EXTERN_FUNCTION";
    case NodeType::TYPE_ANNOTATION: return "TYPE_ANNOTATION";
    default: return "UNKNOWN";
    }
}

inline BinaryOp getBinaryOpFromToken(const std::string& op) {
    if (op == "+") return BinaryOp::ADD;
    if (op == "-") return BinaryOp::SUB;
    if (op == "*") return BinaryOp::MUL;
    if (op == "/") return BinaryOp::DIV;
    if (op == "%") return BinaryOp::MOD;
    if (op == "==") return BinaryOp::EQ;
    if (op == "!=") return BinaryOp::NEQ;
    if (op == "<") return BinaryOp::LT;
    if (op == ">") return BinaryOp::GT;
    if (op == "<=") return BinaryOp::LTE;
    if (op == ">=") return BinaryOp::GTE;
    if (op == "and") return BinaryOp::AND;
    if (op == "or") return BinaryOp::OR;
    if (op == "=") return BinaryOp::ASSIGN;
    if (op == "+=") return BinaryOp::ADD_ASSIGN;
    if (op == "-=") return BinaryOp::SUB_ASSIGN;
    if (op == "*=") return BinaryOp::MUL_ASSIGN;
    if (op == "/=") return BinaryOp::DIV_ASSIGN;
    if (op == "%=") return BinaryOp::MOD_ASSIGN;

    return BinaryOp::ADD; // fallback
}

#endif // PRISMIO_NODE_H

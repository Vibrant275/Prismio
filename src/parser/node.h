#ifndef PRISMIO_NODE_H
#define PRISMIO_NODE_H

#include <string>
#include <vector>
#include <memory>

#include "../utils/class_type.h"
#include "../utils/dataTypes.h"
#include "../utils/token.h"

enum class TokenType;
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
    MODULE,
    IMPORT_STATEMENT,
    CLASS,
    FUNCTION,
    FUNCTION_PARAMETER,
    VARIABLE_DECL
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

    ImportStatementNode()
        : Node(NodeType::IMPORT_STATEMENT)
    {
    }
};

// --------------------------------------------------
// Class / Struct / Enum
// --------------------------------------------------
class ClassNode final : public Node
{
public:
    std::string name;
    AccessModifier access;
    ClassType kind;

    std::vector<std::unique_ptr<Node>> members;

    ClassNode(
        std::string name,
        AccessModifier access = AccessModifier::PUBLIC,
        ClassType kind = ClassType::STRUCT
    )
        : Node(NodeType::CLASS),
          name(std::move(name)),
          access(access),
          kind(kind)
    {
    }
};

// --------------------------------------------------
// Variable declaration (let / let mut)
// --------------------------------------------------
class VariableDeclNode final : public Node
{
public:
    std::string name;
    std::string value;
    bool is_mutable = false;
    TokenType type;

    VariableDeclNode() : Node(NodeType::VARIABLE_DECL), type(TokenType::UNKNOWN)
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
    std::vector<std::unique_ptr<Node>> body;

    explicit FunctionNode()
        : Node(NodeType::FUNCTION)
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
    DataType type;

    FunctionParameterNode(std::string name, DataType type)
        : Node(NodeType::FUNCTION_PARAMETER),
          name(std::move(name)),
          type(type)
    {
    }
};

#endif // PRISMIO_NODE_H

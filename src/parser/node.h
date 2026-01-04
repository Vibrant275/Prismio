#ifndef PRISMIO_NODE_H
#define PRISMIO_NODE_H

#include <string>
#include <vector>
#include <map>
#include <iostream>
#include <any>
#include <variant>
#include <memory>
#include "../utils/class_type.h"
#include "../utils/dataTypes.h"
#include "../utils/declaration.h"

enum class DataType;

enum class NodeType
{
    MODULE,
    IMPORT_STATEMENT,
    CLASS,
    FUNCTION,
    FUNCTION_PARAMETER,
    VARIABLE_DECLARATION
};

inline std::string getNodeTypeString(const NodeType type)
{
    switch (type)
    {
        case NodeType::MODULE:
            return "MODULE";
        case NodeType::IMPORT_STATEMENT:
            return "IMPORT_STATEMENT";
        case NodeType::CLASS:
            return "CLASS";
        case NodeType::FUNCTION:
            return "FUNCTION";
        case NodeType::FUNCTION_PARAMETER:
            return "FUNCTION_PARAMETER";
        case NodeType::VARIABLE_DECLARATION:
            return "VARIABLE_DECLARATION";
        default:
            return "Unknown";
    }
}

enum class AccessModifier
{
    PUBLIC,
    PRIVATE,
    INTERNAL,
};


class Node
{
public:
    NodeType node_type;

    virtual ~Node() = default;

    Node(NodeType type) : node_type(type){}
};

class ModuleNode : public Node
{
public:
    std::vector<std::unique_ptr<Node>> module;
    ModuleNode() : Node(NodeType::MODULE){}
};

class ImportStatementNode : public Node
{
public:
    std::vector<std::string> module_names;

    ImportStatementNode() : Node(NodeType::IMPORT_STATEMENT){}
};

class ClassNode : public Node
{
public:
    std::string class_name;
    AccessModifier access_modifier;
    ClassType class_type;

    std::vector<Node*> content;
    //    std::vector<Node*> functions;

    ClassNode(std::string name, AccessModifier access = AccessModifier::PUBLIC, ClassType type = ClassType::STRUCT)
        : Node(NodeType::CLASS), class_name(name), access_modifier(access), class_type(type)
    {
    }

    void addContent(Node* content)
    {
        this->content.push_back(content);
    }
};

class VariableDeclarationNode : public Node
{
public:
    std::string identifier;
    std::string access;
    DataType dataType;
    TypeSet value;

    VariableDeclarationNode()
        : Node(NodeType::VARIABLE_DECLARATION),
          dataType(DataType::UNKNOWN)
    {
    }
};

class FunctionNode : public Node
{
public:
    std::string func_name;
    std::vector<Node*> params;
    std::vector<Node*> body;

    FunctionNode(std::string name) : Node(NodeType::FUNCTION), func_name(name)
    {
    }
};

class FunctionParameterNode : public Node
{
public:
    std::string identifier;
    DataType dataType;

    FunctionParameterNode(std::string identifier, DataType dataType) : Node(NodeType::FUNCTION_PARAMETER),
                                                                       identifier(identifier), dataType(dataType)
    {
    }
};

#endif

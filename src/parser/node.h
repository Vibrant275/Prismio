
#ifndef PRISMIO_NODE_H
#define PRISMIO_NODE_H

#include <string>
#include <vector>
#include <map>
#include <iostream>
#include <any>
#include "../utils/class_type.h"
#include "../utils/declaration.h"

enum class NodeType {
    MODULE,
    IMPORT_STATEMENT,
    CLASS,
    FUNCTION_DECLARATION,
    VARIABLE_DECLARATION
};

enum class AccessModifier {
    PUBLIC,
    PRIVATE,
    PROTECTED,
    INTERNAL,
};


class Node {
public:
    NodeType node_type;
    Node(NodeType type) : node_type(type) {}
};

class ModuleNode : public Node {
public:
    std::map<std::string, std::vector<Node *>> sub_roots;

    ModuleNode() : Node(NodeType::MODULE) {
        sub_roots["import_statements"] = {};
        sub_roots["classes"] = {};
        sub_roots["top_level_declarations"] = {};
        sub_roots["top_level_functions"] = {}; // Add this line
    }

    void add_import_statement(Node *import_stmt) {
        sub_roots["import_statements"].push_back(import_stmt);
    }

    void add_class(Node *class_node) {
        sub_roots["classes"].push_back(class_node);
    }

    void add_top_level_declaration(Node *declaration) {
        if (declaration->node_type == NodeType::FUNCTION_DECLARATION ||
            declaration->node_type == NodeType::VARIABLE_DECLARATION) {
            sub_roots["top_level_declarations"].push_back(declaration);
            if (declaration->node_type == NodeType::FUNCTION_DECLARATION) {
                sub_roots["top_level_functions"].push_back(declaration);
            }
        } else {
            std::cout << "Invalid top-level declaration type" << std::endl;
        }
    }
};

class ImportStatementNode : public Node {
public:
    std::vector<std::string> module_names;

    ImportStatementNode(
            std::vector<std::string> names
            ) : Node(NodeType::IMPORT_STATEMENT), module_names(names) {}
};

class ClassNode : public Node {
public:
    std::string class_name;
    AccessModifier access_modifier;
    ClassType class_type;

    std::vector<Node *> content;
//    std::vector<Node*> functions;

    ClassNode(std::string name, AccessModifier access = AccessModifier::PUBLIC, ClassType type = ClassType::REGULAR)
            : Node(NodeType::CLASS), class_name(name), access_modifier(access), class_type(type) {}

    void addContent(Node *content) {
        this->content.push_back(content);
    }
};

class VariableDeclarationNode : public Node {
public:
    std::string identifier;
    VariableType property;
    DataType dataType;
    std::any value;

    VariableDeclarationNode(
            std::string identifier,
            VariableType property,
            DataType dataType,
            std::any value
    ) :
            Node(NodeType::VARIABLE_DECLARATION),
            identifier(identifier),
            property(property),
            dataType(dataType),
            value(value) {}

    VariableDeclarationNode()
            : Node(NodeType::VARIABLE_DECLARATION), identifier(""), property(VariableType::VAR), dataType(DataType::UNKNOWN), value(nullptr) {}

};

class FunctionNode : public Node {
public:
    std::string func_name;
    std::vector<Node *> params;
    std::vector<Node *> body;

    FunctionNode(std::string name) : Node(NodeType::FUNCTION_DECLARATION), func_name(name) {}
};

#endif

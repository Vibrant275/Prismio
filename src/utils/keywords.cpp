#include <unordered_set>
#include <string>
#include "keywords.h"

const std::unordered_set<std::string> import = {
    "import"
};

const std::unordered_set<std::string> conditionals = {
    "null",

    "true", "false",
    "switch",
    "case",
    "default",

    "if",
    "else"
};

const std::unordered_set<std::string> flowControl = {
    "break",
    "continue",
    "return",
    "throw"
};

const std::unordered_set<std::string> loops = {
    "while",
    "execute",
    "for",
};

const std::unordered_set<std::string> accessSpecifier = {
    "private",
    "public",
    "protected",
    "internal",
};

const std::unordered_set<std::string> declarations = {
    "var",
    "const",

    "class",
    "interface",
    "enum",
    "data",
    "sealed",

    "fun"
};

bool isKeyword(const std::string& value)
{
    return
        import.contains(value) ||
        flowControl.contains(value) ||
        loops.contains(value) ||
        accessSpecifier.contains(value) ||
        declarations.contains(value) ||
        conditionals.contains(value);
}

bool isAccessSpecifier(const std::string& value)
{
    return accessSpecifier.contains(value);
}

bool isDeclarations(const std::string& value)
{
    return declarations.contains(value);
}

bool isLoop(const std::string& value)
{
    return loops.contains(value);
}

bool isFlowControl(const std::string& value)
{
    return flowControl.contains(value);
}

bool isConditionals(const std::string& value)
{
    return conditionals.contains(value);
}

bool isImport(const std::string& value)
{
    return import.contains(value);
}

bool isGlobalKeyword(const std::string& value)
{
    return
        accessSpecifier.contains(value) ||
        declarations.contains(value);
}

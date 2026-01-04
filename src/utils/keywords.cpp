#include <unordered_set>
#include <string>
#include "keywords.h"

const std::unordered_set<std::string> import = {
    "import"
};

const std::unordered_set<std::string> conditionals = {
    "match",

    "if",
    "else",

    "and",
    "or"
};

const std::unordered_set<std::string> boolean = {
    "true", "false"
};

const std::unordered_set<std::string> flowControl = {
    "break",
    "continue",
    "return",
    "throw"
};

const std::unordered_set<std::string> loops = {
    "while",
    "loop",
    "for",
};

const std::unordered_set<std::string> accessSpecifier = {
    "private",
    "public",
    "internal",
};

const std::unordered_set<std::string> declarations = {
    "let",

    "mut",

    "struct",
    "impl",
    "enum",
    "trait",

    "fn"
};

bool isKeyword(const std::string& value)
{
    return
        import.contains(value) ||
        flowControl.contains(value) ||
        loops.contains(value) ||
        boolean.contains(value) ||
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

bool isBoolean(const std::string& value)
{
    return boolean.contains(value);
}

bool isGlobalKeyword(const std::string& value)
{
    return
        accessSpecifier.contains(value) ||
        declarations.contains(value);
}

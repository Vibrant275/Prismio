#include <unordered_set>
#include <string>
#include "keywords.h"

using namespace std;

const std::unordered_set<std::string> globalKeywords = {
    "import"
};

const unordered_set<string> blockKeywords = {
    "null",

    "true", "false",
    "switch",
    "case",
    "default",

    "if",
    "else",

    "print",
    "println",
};

const std::unordered_set<std::string> flowControl = {
    "break",
    "continue",
    "return",
    "throw"
};

const unordered_set<string> loops = {
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
        globalKeywords.contains(value) ||
        flowControl.contains(value) ||
        loops.contains(value) ||
        accessSpecifier.contains(value) ||
        declarations.contains(value) ||
        blockKeywords.contains(value);
}

bool isAccessSpecifier(const std::string& value)
{
    return accessSpecifier.contains(value);
}

bool isDeclarations(const std::string& value)
{
    return declarations.contains(value);
}

bool isGlobalKeyword(const std::string& value)
{
    return
        globalKeywords.contains(value) ||
        accessSpecifier.contains(value) ||
        declarations.contains(value);
}

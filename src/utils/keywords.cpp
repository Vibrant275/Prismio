#include <unordered_set>
#include <string>
#include "keywords.h"

const std::unordered_set<std::string> generalKeywords = {
        "null",

        "true", "false",
        "switch",
        "case",
        "default",
        "fun",

        "import",

        // Loop
        "execute", "until",
        "while",
        "in",

        // Classes
        "class",
        "interface",
        "enum",
        "data",
        "sealed",

        // declarations
        "const",
        "var",

        // Access Specifier
        "private",
        "public",
        "protected",
        "internal",

        // Control Flow
        "if",
        "else",

        "return",

        "break",
        "continue",

        "inout"
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
};

bool isKeyword(const std::string &value) {
    return generalKeywords.find(value) != generalKeywords.end();
}
bool isAccessSpecifier(const std::string &value) {
    return accessSpecifier.find(value) != accessSpecifier.end();
}
bool isDeclarations(const std::string &value) {
    return declarations.find(value) != declarations.end();
}

bool isFunction(const std::string &value) {
    return value == "fun";
}

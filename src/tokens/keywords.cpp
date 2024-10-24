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

        "const",
        "var",

        // Access Specifier
        "",

        // Control Flow
        "if",
        "else",

        "return",

        "break",
        "continue",

        "inout", //Purpose: Indicates that a parameter passed to a function can be modified by the function. The changes to the parameter are reflected outside the function.

};


bool isKeyword(const std::string &value) {
    return generalKeywords.find(value) != generalKeywords.end();
}

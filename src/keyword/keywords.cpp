#include <unordered_set>
#include <string>
#include "keywords.h"

// Define a list of general keywords
const std::unordered_set<std::string> generalKeywords = {
        "if",
        "else",
        "while",
        "for",
        "return",
        "break",
        "continue",
        "switch",
        "case",
        "default"
};

// Function to check if a string is a general keyword
bool isKeyword(const std::string& value) {
    return generalKeywords.find(value) != generalKeywords.end();
}

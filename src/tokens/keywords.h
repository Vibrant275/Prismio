#ifndef GENERAL_KEYWORDS_H
#define GENERAL_KEYWORDS_H

#include <string>
#include <unordered_set>

// Define a list of general keywords
extern const std::unordered_set<std::string> generalKeywords;

// Function to check if a string is a general tokens
bool isKeyword(const std::string& value);

#endif // GENERAL_KEYWORDS_H

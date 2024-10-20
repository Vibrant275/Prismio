#ifndef GENERAL_KEYWORDS_H
#define GENERAL_KEYWORDS_H

#include <string>
#include <unordered_set>


extern const std::unordered_set<std::string> generalKeywords;

bool isKeyword(const std::string& value);
bool isAccessSpecifier(const std::string &value);
bool isDeclarations(const std::string &value);
bool isFunction(const std::string &value);

#endif

#ifndef GENERAL_KEYWORDS_H
#define GENERAL_KEYWORDS_H

#include <string>
#include <unordered_set>

bool isKeyword(const std::string& value);
bool isAccessSpecifier(const std::string &value);
bool isDeclarations(const std::string &value);
bool isFunction(const std::string &value);
bool isLoop(const std::string& value);
bool isFlowControl(const std::string& value);
bool isConditionals(const std::string& value);
bool isImport(const std::string& value);
bool isBoolean(const std::string& value);

#endif

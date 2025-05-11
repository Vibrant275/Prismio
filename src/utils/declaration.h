#ifndef PRISMIO_DECLARATION_H
#define PRISMIO_DECLARATION_H

#include <string>
#include <any>

#include "dataTypes.h"
#include "token.h"

using TypeSet = std::variant<int, std::string, double, bool>;

enum class VariableType {
    CONST,
    VAR
};

VariableType getVariableType(const std::string &value);
TypeSet getDefaultValue(const DataType &value);
std::string getDataTypeValue(const DataType &value);
DataType getDataTypeFromTokenType(const TokenType &type);
std::string getVariableTypeValue(const VariableType &variableType);

#endif

#ifndef PRISMIO_DECLARATION_H
#define PRISMIO_DECLARATION_H

#include <string>
#include <any>
#include "token.h"

using TypeSet = std::variant<int, std::string, double, bool>;

enum class VariableType {
    CONST,
    VAR
};

enum class DataType {
    INT,
    FLOAT,
    STRING,
    CHAR,
    BOOLEAN,
    ARRAY,
    IDENTIFIER,
    UNKNOWN
};


DataType getDataType(const std::string &value);
VariableType getVariableType(const std::string &value);
TypeSet getDefaultValue(const DataType &value);
std::string getDataTypeValue(const DataType &value);
DataType getDataTypeFromTokenType(const TokenType &type);
std::string getVariableTypeValue(const VariableType &variableType);

#endif

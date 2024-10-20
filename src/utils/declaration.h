#ifndef PRISMIO_DECLARATION_H
#define PRISMIO_DECLARATION_H

#include <string>
#include <any>
#include "token.h"

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
    CUSTOM,
    IDENTIFIER,
    UNKNOWN
};


DataType getDataType(const std::string &value);
VariableType getVariableType(const std::string &value);
std::any getDefaultValue(const DataType &value);
std::string getDataTypeValue(const DataType &value);
DataType getDataTypeFromTokenType(const TokenType &type);
#endif

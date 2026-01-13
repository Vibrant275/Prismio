#ifndef PRISMIO_DECLARATION_H
#define PRISMIO_DECLARATION_H

#include <string>
#include <variant>

#include "dataTypes.h"
#include "token.h"

using TypeSet = std::variant<int, std::string, char, bool>;

TypeSet getDefaultValue(const DataType &value);
std::string getDataTypeValue(const DataType &value);
DataType getDataTypeFromTokenType(const TokenType &type);

#endif

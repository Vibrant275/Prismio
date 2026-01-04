#include <variant>
#include "declaration.h"

#include "dataTypes.h"

std::string getDataTypeValue(const DataType &dataType) {
    switch (dataType) {
        case DataType::INT:
            return "Int";
        case DataType::STRING:
            return "String";
        case DataType::BOOLEAN:
            return "Bool";
        case DataType::CHAR:
            return "Char";
        default:
            return "Unknown";
    }
}

TypeSet getDefaultValue(const DataType& value)
{
    if (value == DataType::INT)
    {
        return 0;
    }
    if (value == DataType::CHAR)
    {
        return 78;
    }
    if (value == DataType::STRING)
    {
        return "";
    }
    if (value == DataType::BOOLEAN)
    {
        return false;
    }
    return "Wrong";
}

DataType getDataTypeFromTokenType(const TokenType& type)
{
    switch (type)
    {
    case TokenType::NUMBER_LITERAL:
        return DataType::INT;
    case TokenType::STRING_LITERAL:
        return DataType::STRING;
    case TokenType::CHAR_LITERAL:
        return DataType::CHAR;
    case TokenType::BOOL_LITERAL:
        return DataType::BOOLEAN;
    default:
        return DataType::UNKNOWN;
    }
}

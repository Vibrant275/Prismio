#include <variant>
#include "declaration.h"

VariableType getVariableType(const std::string &value) {
    {
        if (value == "const") {
            return VariableType::CONST;
        } else if (value == "var") {
            return VariableType::VAR;
        }
        return VariableType::CONST;
    }
}

std::string getVariableTypeValue(const VariableType &variableType) {
    switch (variableType) {
        case VariableType::CONST:
            return "const";
        case VariableType::VAR:
            return "var";
        default:
            return "Unknown";
    }
}

DataType getDataType(const std::string &value) {
    {
        if (value == "Int") {
            return DataType::INT;
        } else if (value == "Float") {
            return DataType::FLOAT;
        } else if (value == "String") {
            return DataType::STRING;
        } else if (value == "Bool") {
            return DataType::BOOLEAN;
        } else if (value == "Char") {
            return DataType::CHAR;
        } else if (value == "Array") {
            return DataType::ARRAY;
        } else {
            return DataType::IDENTIFIER;
        }
    }
}

std::string getDataTypeValue(const DataType &dataType) {
    switch (dataType) {
        case DataType::INT:
            return "Int";
        case DataType::FLOAT:
            return "Float";
        case DataType::STRING:
            return "String";
        case DataType::BOOLEAN:
            return "Bool";
        case DataType::CHAR:
            return "Char";
        case DataType::IDENTIFIER:
            return "Identifier";
        default:
            return "Unknown";
    }
}

TypeSet getDefaultValue(const DataType &value) {

    if (value == DataType::INT) {
        return 0;
    } else if (value == DataType::FLOAT) {
        return 0.0f;
    } else if (value == DataType::STRING) {
        return "";
    } else if (value == DataType::BOOLEAN) {
        return false;
    }
    return "Wrong";
}

DataType getDataTypeFromTokenType(const TokenType &type) {

    switch (type) {
        case TokenType::NUMBER:
            return DataType::INT;
//        case TokenType::NUMBER:
//            return DataType::FLOAT;
        case TokenType::STRING_LITERAL:
            return DataType::STRING;
        case TokenType::CHAR_LITERAL:
            return DataType::CHAR;
        default:
            return DataType::UNKNOWN;
    }
}

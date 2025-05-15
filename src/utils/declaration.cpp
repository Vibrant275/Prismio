#include <variant>
#include "declaration.h"

#include "dataTypes.h"

VariableType getVariableType(const std::string &value) {
    {
        if (value == "const") {
            return VariableType::CONST;
        }
        if (value == "var") {
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

//
//
// std::string getDataTypeValue(const DataType &dataType) {
//     switch (dataType) {
//         case DataType::INT:
//             return "Int";
//         case DataType::FLOAT:
//             return "Float";
//         case DataType::STRING:
//             return "String";
//         case DataType::BOOLEAN:
//             return "Bool";
//         case DataType::CHAR:
//             return "Char";
//         case DataType::IDENTIFIER:
//             return "Identifier";
//         default:
//             return "Unknown";
//     }
// }

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
        case TokenType::STRING:
            return DataType::STRING;
        case TokenType::CHAR:
            return DataType::CHAR;
        default:
            return DataType::UNKNOWN;
    }
}

#include "dataTypes.h"
#include <unordered_set>

const std::unordered_set<std::string> dataTypes = {
    "Int",
    "String",
    "Bool",
    "Char"
};

bool isDataType(const std::string& value){
    return dataTypes.contains(value);
}

DataType getDataType(const std::string &value) {

    if (value == "Int") {
        return DataType::INT;
    }
    if (value == "String") {
        return DataType::STRING;
    }
    if (value == "Bool") {
        return DataType::BOOLEAN;
    }
    if (value == "Char") {
        return DataType::CHAR;
    }

    return DataType::UNKNOWN;
}
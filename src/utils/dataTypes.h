#ifndef DTS_H
#define DTS_H

#include <string>

bool isDataType(const std::string& value);

enum class DataType {
    INT,
    STRING,
    CHAR,
    BOOLEAN,
    UNKNOWN
};

DataType getDataType(const std::string &value);

#endif //DTS_H

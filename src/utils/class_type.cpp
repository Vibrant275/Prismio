#include "class_type.h"

ClassType getClassType(const std::string& class_type)
{
    if (class_type == "struct")
        return ClassType::STRUCT;

    if (class_type == "enum")
        return ClassType::ENUM;

    if (class_type == "impl")
        return ClassType::IMPL;

    if (class_type == "trait")
        return ClassType::TRAIT;

    return ClassType::UNKNOWN;
}

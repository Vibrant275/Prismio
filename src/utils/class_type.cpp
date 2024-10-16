#include "class_type.h"

ClassType getClassType(const std::string& class_type) {
    if (class_type == "abstract") {
        return ClassType::ABSTRACT;
    } else if (class_type == "struct") {
        return ClassType::STRUCT;
    } else if (class_type == "object") {
        return ClassType::OBJECT;
    } else if (class_type == "enum") {
        return ClassType::ENUM;
    } else if (class_type == "interface") {
        return ClassType::INTERFACE;
    } else if (class_type == "annotation") {
        return ClassType::ANNOTATION;
    } else {
        return ClassType::REGULAR;
    }
}
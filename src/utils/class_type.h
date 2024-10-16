#ifndef PRISMIO_CLASS_TYPE_H
#define PRISMIO_CLASS_TYPE_H

#include <unordered_set>
#include <string>

enum class ClassType {
    REGULAR,
    ABSTRACT,
    STRUCT,
    OBJECT,
    ENUM,
    INTERFACE,
    ANNOTATION
};

ClassType getClassType(const std::string& class_type);

#endif

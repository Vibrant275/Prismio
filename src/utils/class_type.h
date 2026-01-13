#ifndef PRISMIO_CLASS_TYPE_H
#define PRISMIO_CLASS_TYPE_H

#include <string>

enum class ClassType {
    STRUCT,
    IMPL,
    ENUM,
    TRAIT,
    UNKNOWN
};

ClassType getClassType(const std::string& class_type);

#endif

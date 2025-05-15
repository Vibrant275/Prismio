#pragma once

#include<string>

struct LexError {
    std::string message;
    int line;
    int column;
};
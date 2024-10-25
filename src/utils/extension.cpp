#include <string>
#include <iostream>
#include <format>
#include "extension.h"
#include "constants.h"
#include "token.h"

void displayError(const std::string& error){
     std::cerr << redColor << error << resetColor << std::endl;
}

void displayError(std::string error, Token errorToken){
    std::string errorE = std::format("Error: {}", error);
    std::string errorF = std::format("Found: {} [ Line:  {}  ]", errorToken.value, errorToken.line);
    std::cerr << redColor << errorE  << "\n" << errorF << resetColor << std::endl;
}

void displaySuccess(const std::string& message){
    std::cerr << greenColor << message << resetColor << std::endl;
}
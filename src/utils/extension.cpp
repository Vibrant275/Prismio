#include <string>
#include <iostream>
#include "extension.h"
#include "constants.h"
#include "token.h"

void displayError(std::string& error){
     std::cerr << redColor << error << resetColor << std::endl;
}

void displayError(std::string error, Token errorToken){
    std::string errorE = std::format("Error: {}", error);
    std::string errorF = std::format("Found: {} [ Line:  {}  ]", errorToken.value, errorToken.line);
    std::cerr << redColor << errorE  << "\n" << errorF << resetColor << std::endl;
}
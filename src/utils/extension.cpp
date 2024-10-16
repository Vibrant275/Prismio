#include <string>
#include <iostream>
#include "extension.h"
#include "constants.h"

void displayError( std::string& error){
     std::cerr << redColor << error << resetColor << std::endl;
}
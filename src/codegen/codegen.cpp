#include "codegen.h"
#include <iostream>

CodeGenerator::CodeGenerator(const std::string& irCode) : irCode(irCode) {}

void CodeGenerator::generateCode() {
    // Generate final code from IR
    std::cout << "Generating code from IR:" << std::endl;
    std::cout << irCode << std::endl;
    std::cout << "Code generation complete." << std::endl;
}

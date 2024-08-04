#ifndef CODEGEN_H
#define CODEGEN_H

#include <string>

class CodeGenerator {
public:
    CodeGenerator(const std::string& irCode);
    void generateCode();

private:
    std::string irCode;
};

#endif // CODEGEN_H

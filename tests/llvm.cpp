#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"

int main() {
    llvm::LLVMContext context;
    llvm::Module module("MyModule", context);
    llvm::IRBuilder<> builder(context);

    // Create a function prototype (int foo())
    llvm::FunctionType *funcType = llvm::FunctionType::get(builder.getInt32Ty(), false);
    llvm::Function *fooFunc = llvm::Function::Create(
            funcType, llvm::Function::ExternalLinkage, "foo", module);

    // Create a basic block and set insertion point
    llvm::BasicBlock *block = llvm::BasicBlock::Create(context, "entry", fooFunc);
    builder.SetInsertPoint(block);

    // Simple return (return 42)
    builder.CreateRet(llvm::ConstantInt::get(context, llvm::APInt(32, 42)));

    // Verify function and print module IR
    llvm::verifyFunction(*fooFunc);
    module.print(llvm::errs(), nullptr);

    return 0;
}
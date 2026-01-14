import subprocess
import sys
import os

def run_command(cmd, description):
    print(f">> {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error in {description}:")
        print(result.stderr)
        sys.exit(1)
    return result.stdout

def main():
    # Compile the Prismio source file
    prismio_file = "test.psm"

    # Run the compiler
    output = run_command(
        ["..\\cmake-build-release\\prismio.exe", prismio_file],
        "compilation"
    )
    print(output)

    # Compile runtime library to object file
    run_command(
        ["..\\external\\LLVM\\bin\\clang", "-c", "..\\runtime\\runtime.c", "-o", "runtime.obj"],
        "runtime compilation"
    )

    # Convert LLVM IR to object file
    run_command(
        ["..\\external\\LLVM\\bin\\llvm-llc", "test.ll", "-filetype=obj", "-o", "program.obj"],
        "IR to object conversion"
    )

    # Link everything together
    run_command(
        ["..\\external\\LLVM\\bin\\clang", "program.obj", "runtime.obj", "-o", "program.exe"],
        "linking"
    )

    print("\n✓ Build successful! Running program...\n")
    print("=" * 50)

    # Run the program
    result = subprocess.run(["program.exe"], capture_output=True, text=True)
    print(result.stdout)
    if result.stderr:
        print(result.stderr)

    print("=" * 50)
    print(f"\nProgram exited with code: {result.returncode}")

if __name__ == "__main__":
    main()
import subprocess
import sys
import os
from pathlib import Path

# ANSI color codes
GREEN = '\033[92m'
RED = '\033[91m'
YELLOW = '\033[93m'
BLUE = '\033[94m'
RESET = '\033[0m'

LLVM_BIN = Path("..") / ".." / "external" / "LLVM" / "bin"
CLANG = os.environ.get("PRISMIO_CLANG", str(LLVM_BIN / "clang.exe"))
LLC = os.environ.get("PRISMIO_LLC", str(LLVM_BIN / "llvm-llc.exe"))
PRISMIO_EXE = os.environ.get("PRISMIO_COMPILER", "..\\mainc.exe")

def run_command(cmd, capture=True):
    """Run a command and return the result"""
    if capture:
        result = subprocess.run(cmd, capture_output=True, text=True)
    else:
        result = subprocess.run(cmd)
    return result

def compile_prismio_file(test_file):
    """Compile a .psm file to LLVM IR"""
    print(f"  Compiling {test_file}...")

    test_name = Path(test_file).stem
    ir_file = f"{test_name}.ll"
    cleanup_files(ir_file, "out.ll")
    result = run_command([PRISMIO_EXE, test_file, ir_file])

    if result.returncode != 0:
        print(f"{RED}[FAIL] Compilation failed{RESET}")
        print(result.stdout)
        print(result.stderr)
        return False
    
    if not os.path.exists(ir_file):
        print(f"{RED}[FAIL] Compiler did not produce {ir_file}{RESET}")
        if os.path.exists("out.ll"):
            print("  Found out.ll instead. Rebuild self/main.exe from the latest self/main.psm.")
        if result.stdout:
            print(result.stdout)
        if result.stderr:
            print(result.stderr)
        return False

    return True

def compile_runtime():
    """Compile the runtime library"""
    result = run_command([
        str(CLANG),
        "-c",
        "..\\..\\runtime\\runtime.c",
        "-o",
        "runtime.obj"
    ])
    return result.returncode == 0

def ir_to_object(ir_file, obj_file):
    """Convert LLVM IR to object file"""
    result = run_command([
        str(LLC),
        ir_file,
        "-filetype=obj",
        "-o",
        obj_file
    ])
    return result.returncode == 0

def link_program(obj_file, exe_file):
    """Link object files to create executable"""
    result = run_command([
        str(CLANG),
        obj_file,
        "runtime.obj",
        "-o",
        exe_file
    ])
    return result.returncode == 0

def run_program(exe_file):
    """Run the compiled program"""
    result = run_command([exe_file])
    if result.returncode != 0:
        print(f"  (program exited with code {result.returncode})")
    return True, result.stdout

def cleanup_files(*files):
    """Remove temporary files"""
    for file in files:
        if os.path.exists(file):
            try:
                os.remove(file)
            except:
                pass

def run_test(test_file):
    """Run a single test file"""
    test_name = Path(test_file).stem
    ir_file = test_name + ".ll"
    obj_file = test_name + ".obj"
    exe_file = test_name + ".exe"

    print(f"\n{BLUE}--- Running {test_name} ---{RESET}")

    # Step 1: Compile .psm to IR
    if not compile_prismio_file(test_file):
        return False

    # Step 2: Convert IR to object
    print(f"  Converting IR to object...")
    if not ir_to_object(ir_file, obj_file):
        print(f"{RED}[FAIL] IR to object conversion failed{RESET}")
        cleanup_files(ir_file, obj_file)
        return False

    # Step 3: Link
    print(f"  Linking...")
    if not link_program(obj_file, exe_file):
        print(f"{RED}[FAIL] Linking failed{RESET}")
        cleanup_files(ir_file, obj_file, exe_file)
        return False

    # Step 4: Run
    print(f"  Executing...")
    success, output = run_program(exe_file)

    if success:
        print(f"{GREEN}[PASS] Test passed{RESET}")
        if output:
            print(f"  Output: {output.strip()}")
    else:
        print(f"{RED}[FAIL] Execution failed{RESET}")

    # Cleanup
    cleanup_files(ir_file, obj_file, exe_file)

    return success

def main():
    print(f"{YELLOW}{'='*60}{RESET}")
    print(f"{YELLOW}Prismio Compiler Test Suite{RESET}")
    print(f"{YELLOW}{'='*60}{RESET}")

    # Find all test files
    test_files = sorted(Path('.').glob('test_*.psm'))

    if not test_files:
        print(f"{RED}[FAIL] No test files found!{RESET}")
        print("Test files should be named test_XX_*.psm")
        sys.exit(1)

    print(f"\nFound {len(test_files)} test(s)")

    # Compile runtime once
    print(f"\n{BLUE}Compiling runtime library...{RESET}")
    if not compile_runtime():
        print(f"{RED}Failed to compile runtime library{RESET}")
        sys.exit(1)
    print(f"{GREEN}Runtime compiled{RESET}")

    # Run all tests
    passed = 0
    failed = 0

    for test_file in test_files:
        if run_test(str(test_file)):
            passed += 1
        else:
            failed += 1

    # Summary
    print(f"\n{YELLOW}{'='*60}{RESET}")
    print(f"{YELLOW}Test Results{RESET}")
    print(f"{YELLOW}{'='*60}{RESET}")
    print(f"{GREEN}Passed: {passed}{RESET}")
    print(f"{RED}Failed: {failed}{RESET}")
    print(f"Total:  {passed + failed}")

    # Cleanup runtime
    cleanup_files("runtime.obj")

    if failed > 0:
        sys.exit(1)
    else:
        print(f"\n{GREEN}All tests passed!{RESET}")
        sys.exit(0)

if __name__ == "__main__":
    main()

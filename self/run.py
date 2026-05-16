import subprocess
import sys
import os
from pathlib import Path

# --------------------------------------------------
# HARDCODED PATHS (as requested)
# --------------------------------------------------
# PRISMIO_EXE = "..\\cmake-build-release\\prismio.exe"
PRISMIO_EXE = "main.exe"
CLANG = "..\\external\\LLVM\\bin\\clang.exe"
LLC   = "..\\external\\LLVM\\bin\\llvm-llc.exe"
RUNTIME_C = "..\\runtime\\runtime.c"

# --------------------------------------------------
def run(cmd):
    print(">>", " ".join(cmd))
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        print(result.stderr)
        sys.exit(result.returncode)
    return result

def cleanup_files(*files):
    """Remove temporary files"""
    for file in files:
        if os.path.exists(file):
            try:
                os.remove(file)
            except:
                pass

def main():
    tests = sorted(Path(".").glob("*.psm"))

    if not tests:
        print("No test_*.psm files found.")
        sys.exit(1)

    print("\nAvailable tests:\n")
    for i, t in enumerate(tests, 1):
        print(f"  [{i}] {t.name}")

    try:
        idx = int(input("\nSelect test to run: ")) - 1
        test = tests[idx]
    except:
        print("Invalid selection.")
        sys.exit(1)

    name = test.stem
    ir  = f"{name}.ll"
    obj = f"{name}.obj"
    exe = f"{name}.exe"

    print(f"\n=== Running {test.name} ===\n")

    # 1. Prismio: .psm → .ll
    run([PRISMIO_EXE, str(test)])

    # 2. Compile runtime (always)
    run([CLANG, "-c", RUNTIME_C, "-o", "runtime.obj"])
    
    # 2.5 Compile llvm-bridge.c
    bridge_c = str(Path("../runtime/llvm-bridge.c").resolve())
    run([CLANG, "-c", bridge_c, "-o", "bridge.obj"])

    # 3. LLVM IR → object
    run([LLC, ir, "-filetype=obj", "-o", obj])

    # 4. Link
    run([CLANG, obj, "runtime.obj", "bridge.obj", "-o", exe])

    # 5. Run
    print("\n=== Program Output ===\n")
    subprocess.run([exe])

    # Cleanup (optional)
    # Path(ir).unlink(missing_ok=True)
    # Path(obj).unlink(missing_ok=True)
    # Path(exe).unlink(missing_ok=True)
    # Path("runtime.obj").unlink(missing_ok=True)
    # Cleanup (disabled for debugging)
    # cleanup_files(ir, obj, exe)


if __name__ == "__main__":
    main()
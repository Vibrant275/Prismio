import os
import sys
import subprocess

# Paths
base_dir = os.path.abspath(os.path.dirname(__file__))
executable = os.path.join(base_dir, "..", "cmake-build-release", "Prismio.exe")
test_file = os.path.join(base_dir, "test.psm")

# Check for executable
if not os.path.isfile(executable):
    print(f"Error: Executable not found at {executable}")
    sys.exit(1)

# Check for test file
if not os.path.isfile(test_file):
    print(f"Error: Test file not found at {test_file}")
    sys.exit(1)

# Run the executable with the test file
result = subprocess.run([executable, test_file])
sys.exit(result.returncode)
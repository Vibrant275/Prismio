import platform
import urllib.request
import tarfile
import shutil
import os
import sys

# Detect architecture and system
arch = platform.machine()
system = platform.system()

def setup():
    try:
        if os.path.exists("../external/LLVM"):  # Adjusted to point to root/external
            print("LLVM is already set up. Exiting.")
            return

        print(f"Detected system: {system}, architecture: {arch}")

        if system == "Windows":
            system_id = 1
        elif system == "Linux":
            system_id = 2
        elif system == "Darwin":
            system_id = 3
        else:
            print("Unsupported OS.")
            return

        if arch in ["x86_64", "AMD64"]:
            arch_id = 1
        elif arch in ["aarch64", "arm64"]:
            arch_id = 2
        else:
            print("Unsupported architecture.")
            return

        download(system_id, arch_id)
    except Exception as e:
        print("Error during setup:", str(e))
        sys.exit(1)

def download(usystem, uarch):
    urls = {
        (1, 1): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-windows.tar.xz",
        (2, 1): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-ubuntu-24.04.tar.xz",
        (3, 1): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-macos.tar.xz",
        (1, 2): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-windows.tar.xz",
        (2, 2): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-ubuntu-24.04.tar.xz",
        (3, 2): "https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-ubuntu-24.04.tar.xz",
    }

    url = urls.get((usystem, uarch))
    if not url:
        raise Exception("No download available for this platform.")

    def progress(block_num, block_size, total_size):
        downloaded = block_num * block_size
        percent = downloaded * 100 / total_size if total_size > 0 else 0
        percent = min(100, percent)
        sys.stdout.write(f"\rDownloading LLVM... {percent:.2f}%")
        sys.stdout.flush()

    urllib.request.urlretrieve(url, "../package.tar.xz", reporthook=progress)  # Adjusted path
    print()  # Newline after progress

    print("Extracting package...")
    with tarfile.open("../package.tar.xz", "r:xz") as tar:  # Adjusted path
        root_folder = tar.getmembers()[0].name.split('/')[0]
        for member in tar.getmembers():
            member_path = member.name
            stripped_path = member_path[len(root_folder) + 1:]
            if stripped_path:
                member.name = stripped_path
                tar.extract(member, path="../configuration")  # Adjusted path

    shutil.rmtree("../external/LLVM", ignore_errors=True)  # Adjusted path
    os.makedirs("../external/LLVM", exist_ok=True)  # Adjusted path

    print("Copying headers and libraries...")

    shutil.move("../configuration/include", "../external/LLVM/include")
    shutil.move("../configuration/lib", "../external/LLVM/lib")
    shutil.move("../configuration/bin", "../external/LLVM/bin")

    print("Cleaning up...")
    os.remove("../package.tar.xz")  # Adjusted path
    shutil.rmtree("../configuration", ignore_errors=True)  # Adjusted path

    print("LLVM setup complete.")

print("Prismio configuration script\n")
setup()

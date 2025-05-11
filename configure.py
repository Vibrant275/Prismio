import platform
import sys
import urllib.request
import tarfile
import shutil
arch = platform.machine()
system = platform.system()

def setup():
    global system, arch
    print("Do you confirm downloading dependencies for: " + system + " on " + arch + "?")
    yorn = input("y/N: ")
    if yorn != 'y':
        print("Which operating system do you choose?")
        print("1. Windows")
        print("2. Linux")
        print("3. MacOS")

        usystem = input("Select, and type: 1,2,3: ")

        print("Which platform do you choose?")
        print("1. x86_64")
        print("2. AArch64")

        uarch = input("Select, and type: 1,2: ")
        download (usystem,uarch)
    else:
        if system == "Windows":
            system = 1
        elif system == "Linux":
            system = 2
        elif system == "Darwin":
            system = 3
        
        if arch == "x86_64":
            arch = 1
        elif arch in ["aarch64", "arm64"]:
            arch = 2
        
        download(system,arch)

def download(usystem, uarch):
    if usystem == 1 and uarch == 1:
        print("Downloading LLVM for Windows on x86_64.")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-windows.tar.xz", "package.tar.xz")
    elif usystem == 2 and uarch == 1:
        print("Downloading LLVM for Linux on x86_64")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-ubuntu-24.04.tar.xz", "package.tar.xz")
    elif usystem == 3 and uarch == 1:
        print("Downloading LLVM for MacOS on x86_64")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-x86_64-macos.tar.xz", "package.tar.xz")
    elif usystem == 1 and uarch == 2:
        print("Downloading LLVM for Windows on AArch64.")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-windows.tar.xz", "package.tar.xz")
    elif usystem == 2 and uarch == 2:
        print("Downloading LLVM for Linux on AArch64.")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-ubuntu-24.04.tar.xz", "package.tar.xz")
    elif usystem == 3 and uarch == 2:
        print("Downloading LLVM for Linux on AArch64.")
        urllib.request.urlretrieve("https://github.com/awakecoding/llvm-prebuilt/releases/download/v2025.2.0/clang+llvm-18.1.8-aarch64-ubuntu-24.04.tar.xz", "package.tar.xz")
    

    with tarfile.open("package.tar.xz", "r:xz") as tar:
        root_folder = tar.getmembers()[0].name.split('/')[0] 
        for member in tar.getmembers():
            member_path = member.name
            stripped_path = member_path[len(root_folder)+1:]  
            if stripped_path:  
                member.name = stripped_path
                tar.extract(member, path="configuration")

    shutil.copytree("configuration/include", "external/LLVM/include")
    shutil.copytree("configuration/lib", "external/LLVM/lib")

print("Prismio configuration script \n")


setup()

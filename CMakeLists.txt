cmake_minimum_required(VERSION 3.10)

# Use vcpkg
if(NOT DEFINED ENV{VCPKG_ROOT})
  message(FATAL_ERROR "VCPKG_ROOT environment variable is not set. Please set it to use vcpkg.")
endif()
set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake")

# Project name
project(Prismio)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Enable export of compile commands
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Detect OS and set LLVM directory relative to the project
set(LLVM_DIR "${CMAKE_SOURCE_DIR}/external/LLVM/lib/cmake/llvm")

# Find LLVM
find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
llvm_map_components_to_libnames(LLVM_LIBS core irreader support)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)

# Add source files
file(GLOB_RECURSE SOURCES "src/*.cpp" "src/*.psm")

# Add subdirectories for modularity
add_subdirectory(src/lexer)
add_subdirectory(src/parser)
add_subdirectory(src/semantic)
add_subdirectory(src/ir)
add_subdirectory(src/runtime)
add_subdirectory(src/utils)

# Add the main executable
add_executable(Prismio ${SOURCES} "src/main.cpp")
#add_executable(ums ${SOURCES} "src/ums/ums.cpp")

# Link libraries
target_link_libraries(Prismio
        lexer
        parser
        semantic
        ir
        runtime
        utils
        ${LLVM_LIBS}
)
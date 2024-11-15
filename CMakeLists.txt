cmake_minimum_required(VERSION 3.8)

# Enable Hot Reload for MSVC compilers if supported.
if (POLICY CMP0141)
  cmake_policy(SET CMP0141 NEW)
  set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT "$<IF:$<AND:$<C_COMPILER_ID:MSVC>,$<CXX_COMPILER_ID:MSVC>>,$<$<CONFIG:Debug,RelWithDebInfo>:EditAndContinue>,$<$<CONFIG:Debug,RelWithDebInfo>:ProgramDatabase>>")
endif()

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

find_package(benchmark CONFIG REQUIRED)
#find_package(LLVM CONFIG REQUIRED)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/include)

# Add source files
file(GLOB_RECURSE SOURCES "src/*.cpp" "src/*.psmi")

# Add subdirectories for modularity
add_subdirectory(src/lexer)
add_subdirectory(src/parser)
add_subdirectory(src/semantic)
add_subdirectory(src/ir)
add_subdirectory(src/codegen)
add_subdirectory(src/runtime)
add_subdirectory(src/utils)

# Add the main executable
add_executable(Prismio ${SOURCES} "src/main.cpp")

target_link_libraries(Prismio
        lexer
        parser
        semantic
        ir
        codegen
        runtime
        utils

        PRIVATE
        benchmark::benchmark
        benchmark::benchmark_main
#        llvm::llvm
)
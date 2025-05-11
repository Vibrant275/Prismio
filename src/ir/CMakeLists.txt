# Add the IR source files
file(GLOB_RECURSE IR_SOURCES "*.cpp" "*.h")

# Add the IR library
add_library(ir ${IR_SOURCES})

# Detect OS and set LLVM directory relative to the project
set(LLVM_DIR "${PROJECT_SOURCE_DIR}/external/LLVM/lib/cmake/llvm")

# Find LLVM
find_package(LLVM REQUIRED CONFIG)
llvm_map_components_to_libnames(LLVM_LIBS core irreader support)

# Include directories for IR
target_include_directories(
        ir
        PUBLIC
        ${CMAKE_SOURCE_DIR}/include
        ${LLVM_INCLUDE_DIRS}
)

add_definitions(${LLVM_DEFINITIONS})

target_link_libraries(ir
        PRIVATE

        ${LLVM_LIBS}
)

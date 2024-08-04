# Add the code generation source files
file(GLOB_RECURSE CODEGEN_SOURCES "*.cpp")

# Check if there are source files
if(NOT CODEGEN_SOURCES)
  message(FATAL_ERROR "No source files found for the codegen component.")
endif()

# Add the code generation library
add_library(codegen ${CODEGEN_SOURCES}
        codegen.h)

# Include directories for code generation
target_include_directories(codegen PUBLIC ${CMAKE_SOURCE_DIR}/include)

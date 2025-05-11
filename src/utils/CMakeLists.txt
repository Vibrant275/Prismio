# Add the semantic analysis source files
file(GLOB_RECURSE UTILS_SOURCES "*.cpp" "*.h")

# Add the semantic analysis library
add_library(utils ${UTILS_SOURCES})

# Include directories for semantic analysis
target_include_directories(utils PUBLIC ${CMAKE_SOURCE_DIR}/include)

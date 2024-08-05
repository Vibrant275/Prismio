# Add the semantic analysis source files
file(GLOB_RECURSE UTILS_SOURCES "*.cpp")

# Add the semantic analysis library
add_library(utils ${UTILS_SOURCES}
        lexer_utils.h)

# Include directories for semantic analysis
target_include_directories(utils PUBLIC ${CMAKE_SOURCE_DIR}/include)

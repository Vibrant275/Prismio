# Add the semantic analysis source files
file(GLOB_RECURSE KEYWORD_SOURCES "*.cpp")

# Add the semantic analysis library
add_library(keyword ${KEYWORD_SOURCES}
        keywords.h)

# Include directories for semantic analysis
target_include_directories(keyword PUBLIC ${CMAKE_SOURCE_DIR}/include)

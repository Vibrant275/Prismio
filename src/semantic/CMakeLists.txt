# Add the semantic analysis source files
file(GLOB_RECURSE SEMANTIC_SOURCES "*.cpp")

# Add the semantic analysis library
add_library(semantic ${SEMANTIC_SOURCES})

# Include directories for semantic analysis
target_include_directories(semantic PUBLIC ${CMAKE_SOURCE_DIR}/include)

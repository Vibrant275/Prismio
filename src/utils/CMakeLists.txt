# Add the semantic analysis source files
file(GLOB_RECURSE UTILS_SOURCES "*.cpp" "*.h")

# Explicitly include module_resolver files to ensure they're compiled
list(APPEND UTILS_SOURCES 
    "${CMAKE_CURRENT_SOURCE_DIR}/module_resolver.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/module_resolver.h"
)

# Add the semantic analysis library
add_library(utils ${UTILS_SOURCES})

# Include directories for semantic analysis
target_include_directories(utils PUBLIC ${CMAKE_SOURCE_DIR}/include)

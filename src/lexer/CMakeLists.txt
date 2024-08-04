# Add the lexer source files
file(GLOB_RECURSE LEXER_SOURCES "*.cpp")

# Add the lexer library
add_library(lexer ${LEXER_SOURCES})

# Include directories for lexer
target_include_directories(lexer PUBLIC ${CMAKE_SOURCE_DIR}/include)

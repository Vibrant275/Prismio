# Add the parser source files
file(GLOB_RECURSE PARSER_SOURCES "*.cpp")

# Add the parser library
add_library(parser ${PARSER_SOURCES})

# Include directories for parser
target_include_directories(parser PUBLIC ${CMAKE_SOURCE_DIR}/include)

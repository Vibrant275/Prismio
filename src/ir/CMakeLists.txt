# Add the IR source files
file(GLOB_RECURSE IR_SOURCES "*.cpp")

# Add the IR library
add_library(ir ${IR_SOURCES} ir.h)

# Include directories for IR
target_include_directories(ir PUBLIC ${CMAKE_SOURCE_DIR}/include)

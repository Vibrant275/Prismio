# Add the runtime source files
file(GLOB_RECURSE RUNTIME_SOURCES "*.cpp")

# Add the runtime library
add_library(runtime ${RUNTIME_SOURCES})

# Include directories for runtime
target_include_directories(runtime PUBLIC ${CMAKE_SOURCE_DIR}/include)

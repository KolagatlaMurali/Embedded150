# Specify the minimum CMake version required
cmake_minimum_required(VERSION 3.10)

# Define the project name and specify that it is a C project
project(MyApp C)

# Create an executable target named "MyApp"
# The executable will be built using the following source files:
#   - main.c (application entry point)
#   - Drivers/utils.c (driver implementation file)
add_executable(MyApp
    main.c
    Drivers/utils.c
)

# Specify additional directories where the compiler should look for header files
# PRIVATE means:
#   Only the target "MyApp" will use this include directory.
# This allows #include "utils.h" inside main.c or utils.c
target_include_directories(MyApp PRIVATE Drivers)

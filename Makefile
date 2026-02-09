# Compiler to be used
CC = gcc

# Base compiler flags:
# -Wall    : Enable common warnings
# -Wextra  : Enable extra warnings
# -g       : Enable debug information
CFLAGS = -Wall -Wextra -g

# Directory where all build output (.o and binary) will be stored
BUILD_DIR = build

# List of C source files (can be in different directories)
CFILES = \
Drivers/utils.c \
main.c

# Name of the final executable
TARGET = App

# Generate object file names in the build directory
# - Replace .c with .o
# - Remove directory paths
# - Prefix with build directory
OFILES = $(addprefix $(BUILD_DIR)/,$(notdir $(CFILES:.c=.o)))

# Tell make where to search for .c files listed in CFILES
vpath %.c $(sort $(dir $(CFILES)))

# Header include path (Drivers directory contains header files)
HFILES = -IDrivers

# Update compiler flags to include header search path
CFLAGS = -Wall -Wextra -g $(HFILES)

# Enable automatic dependency generation:
# -MMD : Generate .d files for user headers
# -MP  : Add phony targets for headers to avoid build errors
CFLAGS += -MMD -MP

# Default target: build the final executable
all: $(BUILD_DIR)/$(TARGET)

# Link all object files to create the final executable
$(BUILD_DIR)/$(TARGET): $(OFILES)
	@echo $(OFILES)
	@echo "Linking .o Files"
	$(CC) $(CFLAGS) $^ -o $@

# Pattern rule to compile .c files into .o files inside build directory
# $< : Source file
# $@ : Target object file
# | $(BUILD_DIR) ensures the directory exists but does not trigger rebuilds
$(BUILD_DIR)/%.o: %.c | $(BUILD_DIR)
	@echo "Building $<"
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to create the build directory if it does not exist
$(BUILD_DIR):
	@mkdir -p $@

# Declare clean as a phony target (not a real file)
.PHONY: clean

# Clean target to remove the entire build directory
clean:
	-rm -f -r $(BUILD_DIR)

#!/usr/bin/make -f

VERSION = 0.1.0

# Search paths
vpath %.cpp src
vpath %.h include
vpath %.hpp include

# Directories
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build
BIN_DIR = bin

# Compilation options
CFLAGS := $(shell cat compile_flags.txt | grep -Ev "^-I")
INCLUDES := $(shell cat compile_flags.txt | grep -E "^.I")
LINKS :=
CC := g++
PROGRAM := $(BIN_DIR)/main
OUTPUT_OPTION = -o $@

# Files
SOURCES = $(wildcard $(SRC_DIR)/*.cpp)
HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)
OBJECTS = $(subst src,build,$(subst .cpp,.o,$(SOURCES)))

# Targets
all: build
.PHONY: all

info:
	$(info CC       = $(CC))
	$(info CFLAGS   = $(CFLAGS))
	$(info INCLUDES = $(INCLUDES))
	$(info LINKS    = $(LINKS))
	$(info SOURCES  = $(SOURCES))
	$(info HEADERS  = $(HEADERS))
	$(info OBJECTS  = $(OBJECTS))
	$(info PROGRAM  = $(PROGRAM))
.PHONY: info

help: ## Help function
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST)  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

debug: CFLAGS += -g -DDEBUG
debug: $(PROGRAM)
.PHONY: debug

build: $(PROGRAM)
	@echo "========"
	@echo "Project built"
	@echo "Run ./$(PROGRAM) to run the program"
.PHONY: build

$(PROGRAM): $(OBJECTS)
	$(CC) $(OBJECTS) $(LINKS) $(OUTPUT_OPTION)

$(BUILD_DIR)/%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< $(OUTPUT_OPTION)

valgrind: $(PROGRAM)
	valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes ./$(PROGRAM)
.PHONY: valgrind

clean-objects:
	rm -f $(OBJECTS)
.PHONY: clean-objects

clean: ## Clean all generated files
clean: clean-objects
	rm -f $(PROGRAM)
.PHONY: clean

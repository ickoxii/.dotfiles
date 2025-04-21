CPP_COMPILER = g++
C_COMPILER = gcc
SRC_DIRS = src

INCLUDE_DIRS = -Idependencies -Iincludes
LIB_FOLDERS = -Ldependencies/lib
LINKER_OPTS = -lpthread

FLAGS = -Wall -Wextra -O2 -MP -MD $(INCLUDE_DIRS) $(LIB_FOLDERS) $(LINKERS_OPTS)
SRC_FILES = $(foreach D, $(SRC_DIRS), $(wildcard $(D)/*.c $(D)/*.cpp))
$(info $(SRC_FILES))
OBJECTS = $(patsubst %.cpp, %.o, $(patsubst %.c, %.o, $(SRC_FILES)))
$(info $(OBJECTS))
DEPENDENCIES = $(patsubst %.o, %.d, $(OBJECTS))
-include $(DEPENDENCIES)

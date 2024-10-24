SRC_DIR := src
OBJ_DIR := obj

# This will find all the files ending in .cc in the $(SRC_DIR) directory
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
# This uses 'string substitution' ($(text:pattern=replacement)) to generate 
# a list of object files 
OBJ_FILES := $(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC := clang
CPP :=
CFLAGS := -g -Wall -Wextra -O3
LDFLAGS :=

all: demo

lib: libads.a

demo: obj/demo.o libads.a
	$(CC) -o demo $(OBJ_DIR)/demo.o -L. -lads

obj/demo.o: demo.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -o $(OBJ_DIR)/demo.o -c demo.c

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) -Iinclude $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

libads.a: $(OBJ_FILES)
	ar rcs libads.a $(OBJ_FILES)

clean:
	rm -f demo *.a
	rm -rf obj
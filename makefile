SRC_DIR := src
OBJ_DIR := obj

# This will find all the files ending in .cc in the $(SRC_DIR) directory
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
# This uses 'string substitution' ($(text:pattern=replacement)) to generate 
# a list of object files 
OBJ_FILES := $(SRC_FILES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

CC := clang
CPP :=
CFLAGS := -g -Wall -Wextra -O3 -Wno-unused-parameter
LDFLAGS :=

all: test

lib: libads.a

test: obj/test.o libads.a
	$(CC) -o test $(OBJ_DIR)/test.o -L. -lads `pkg-config --libs glib-2.0`

obj/test.o: tests/test.c | $(OBJ_DIR)
	$(CC) -Iinclude `pkg-config --cflags glib-2.0` $(CFLAGS) -o $(OBJ_DIR)/test.o -c tests/test.c

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) -Iinclude $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

libads.a: $(OBJ_FILES)
	ar rcs libads.a $(OBJ_FILES)

clean:
	rm -f test *.a
	rm -rf obj
SHELL := bash

all: build

run:
	make build
	./bin/game


LIB_PATHS = -L/usr/local/lib/
LIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
CFLAGS = -no-pie -nostdlib
DIRS = src/ src/utils/
SRC = $(foreach dir,$(DIRS), $(wildcard $(dir)*.asm))
OBJ_FILES = $(foreach file,$(foreach file,$(SRC), $(notdir $(file))),bin/$(file:.asm=.o))

DEPS_DIRS = include/
DEPS_SRC = $(foreach dir,$(DEPS_DIRS), $(wildcard $(dir)*.cpp))
DEPS_OBJ_FILES = $(foreach file,$(foreach file,$(DEPS_SRC), $(notdir $(file))),bin/$(file:.cpp=.o))

build: $(SRC)
	make clean
	make build_deps

	echo $(OBJ_FILES);
	echo $(SRC);
	for file in $(SRC); do\
		name=$${file%.*}; \
		name=$${name##*/}; \
		nasm -f elf64 -g $$file -o bin/$${name}.o; \
	done

	gcc $(CFLAGS) $(LIB_PATHS) $(OBJ_FILES) $(DEPS_OBJ_FILES) $(LIBS) -o bin/game

build_deps:
	echo $(DEPS_SRC)
	for file in $(DEPS_SRC); do\
		name=$${file%.*}; \
		name=$${name##*/}; \
		gcc $(CFLAGS) $(LIB_PATHS) -c $$file $(LIBS) -o bin/$${name}.o; \
	done

test: test.cpp
	gcc $(CFLAGS) -I include/ $(LIB_PATHS) -S test.cpp $(LIBS) -o test_out.asm


TEST_DEPS_DIRS = src/utils/
TEST_DEPS_SRC = $(foreach dir,$(TEST_DEPS_DIRS), $(wildcard $(dir)*.asm))
TEST_DEPS_OBJ_FILES = $(foreach file,$(foreach file,$(TEST_DEPS_SRC), $(notdir $(file))),bin/$(file:.asm=.o))

build_test_deps:
	echo $(TEST_DEPS_SRC)
	for file in $(TEST_DEPS_SRC); do\
		name=$${file%.*}; \
		name=$${name##*/}; \
		nasm -f elf64 -g $$file -o bin/$${name}.o; \
	done

test_asm: test.asm
	make clean
	make build_test_deps

	nasm -f elf64 -g test.asm -o test.o
	gcc $(CFLAGS) $(LIB_PATHS) test.o $(TEST_DEPS_OBJ_FILES) $(LIBS) -o bin/test
	rm test.o
	./bin/test

clean:
	rm -f bin/*.o


SHELL := bash

all: build

run:
	make build
	./bin/game


LIB_PATHS = -L/usr/local/lib/
LIBS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
CFLAGS = -no-pie -nostdlib
DIRS = src/
SRC = $(foreach dir,$(DIRS), $(wildcard $(dir)*.asm))
OBJ_FILES = $(foreach file,$(foreach file,$(SRC), $(notdir $(file))),bin/$(file:.asm=.o))

build: $(SRC)
	make clean

	echo $(OBJ_FILES);
	echo $(SRC);
	for file in $(SRC); do\
		name=$${file%.*}; \
		name=$${name##*/}; \
		nasm -f elf64 -g $$file -o bin/$${name}.o; \
	done

	gcc $(CFLAGS) $(LIB_PATHS) $(OBJ_FILES) $(LIBS) -o bin/game

test: test.cpp
	gcc $(CFLAGS) $(LIB_PATHS) -S test.cpp $(LIBS) -o test.asm

clean:
	rm -f bin/*.o


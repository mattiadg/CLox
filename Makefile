BUILD_DIR := build
WARNINGS := -Wall -Wextra -pedantic 
CFLAGS := -g -std=c99 $(WARNINGS)
CC := gcc
BIN := bin

SRC = $(wildcard *.c)               # list of source files
OBJS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(SRC)) # list of object files

all: $(BIN)/main.exe

.PHONY: all clean profile

$(BIN)/main.exe: $(OBJS)
	gcc -o $(BIN)/main.exe $(OBJS)

#$(OBJS): $(SRC)                     

$(BUILD_DIR)/%.o: %.c 
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm $(BIN)/main.exe
	rm $(OBJS)

profile: $(OBJS)
	gcc -pg -o $(BIN)/prof.exe $(SRC)

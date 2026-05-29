CC := gcc
BUILD := build
TARGET := $(BUILD)/$(notdir $(CURDIR))

CFLAGS := -std=gnu11 -Wall -Wextra -Werror -Isrc
OBJCFLAGS := -x objective-c -fgnu-runtime
LDFLAGS := -lobjc

SRC := $(wildcard src/*.m)

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC) | $(BUILD)
	$(CC) $(CFLAGS) $(OBJCFLAGS) $(SRC) $(LDFLAGS) -o $(TARGET)

$(BUILD):
	mkdir -p $(BUILD)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD)
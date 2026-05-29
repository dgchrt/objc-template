CC := gcc
BUILD := build
TARGET := $(BUILD)/$(notdir $(CURDIR))

CFLAGS := -std=gnu11 -Wall -Wextra -Werror -Isrc
OBJCFLAGS := -x objective-c -fgnu-runtime
LDFLAGS := -lobjc
GCC_INCLUDE := $(shell $(CC) -print-file-name=include)

SRC := $(wildcard src/*.m)
HDR := $(wildcard src/*.h)

.PHONY: all run clean format lint

all: $(TARGET)

$(TARGET): $(SRC) | $(BUILD)
	$(CC) $(CFLAGS) $(OBJCFLAGS) $(SRC) $(LDFLAGS) -o $(TARGET)

$(BUILD):
	mkdir -p $(BUILD)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -rf $(BUILD)

format:
	@command -v clang-format >/dev/null 2>&1 || { echo "clang-format not found"; exit 1; }
	clang-format -i $(HDR) $(SRC)

lint:
	@command -v clang-tidy >/dev/null 2>&1 || { echo "clang-tidy not found"; exit 1; }
	@for file in $(SRC); do \
		echo "lint $$file"; \
		clang-tidy $$file -- -std=gnu11 -x objective-c -fgnu-runtime -Isrc -I$(GCC_INCLUDE) || exit $$?; \
	done
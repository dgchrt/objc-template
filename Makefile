CC := gcc
BUILD := build
TARGET := $(BUILD)/$(notdir $(CURDIR))

CFLAGS := -std=gnu11 -Wall -Wextra -Werror -Wno-unused-parameter -Isrc
OBJCFLAGS := -x objective-c -fgnu-runtime
LDFLAGS := -lobjc
GCC_INCLUDE := $(shell $(CC) -print-file-name=include)

SRC := $(wildcard src/*.m)
HDR := $(wildcard src/*.h)
CORE_SRC := $(filter-out src/main.m,$(SRC))
TEST_SRC := $(wildcard tests/*.m)
TEST_HDR := $(wildcard tests/*.h)
ALL_FMT := $(HDR) $(SRC) $(TEST_HDR) $(TEST_SRC)
LINT_SRC := $(SRC) $(TEST_SRC)

.PHONY: all run clean format lint test

all: $(TARGET)

$(TARGET): $(SRC) | $(BUILD)
	$(CC) $(CFLAGS) $(OBJCFLAGS) $(SRC) $(LDFLAGS) -o $(TARGET)

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)

format:
	@command -v clang-format >/dev/null 2>&1 || { echo "clang-format not found"; exit 1; }
	clang-format -i $(ALL_FMT)

lint:
	@command -v clang-tidy >/dev/null 2>&1 || { echo "clang-tidy not found"; exit 1; }
	@for file in $(LINT_SRC); do \
		echo "lint $$file"; \
		clang-tidy $$file -- -std=gnu11 -x objective-c -fgnu-runtime -Isrc -Itests -I$(GCC_INCLUDE) || exit $$?; \
	done

run: $(TARGET)
	./$(TARGET)

test: | $(BUILD)
	@for file in $(TEST_SRC); do \
		name=$$(basename $$file .m); \
		bin=$(BUILD)/test-$$name; \
		echo "build $$file"; \
		$(CC) $(CFLAGS) -Itests $(OBJCFLAGS) $(CORE_SRC) $$file $(LDFLAGS) -o $$bin || exit $$?; \
		echo "run $$bin"; \
		./$$bin || exit $$?; \
	done
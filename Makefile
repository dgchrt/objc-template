CC := gcc
TARGET := objc-sample

CFLAGS := -std=gnu11 -Wall -Wextra -Werror -Isrc
OBJCFLAGS := -x objective-c
LDFLAGS := -lobjc

SRC := src/main.m src/Parent.m src/Child.m

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(OBJCFLAGS) $(SRC) $(LDFLAGS) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)
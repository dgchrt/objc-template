// Parent.m
// This file implements the Parent class, providing definitions for its methods.

#include <stdio.h>
#include "Parent.h"

@implementation Parent

// Returns the name of the class as a C string.
- (const char *)displayName {
    return "Parent"; // Hardcoded class name.
}

// Returns a lucky number associated with the class.
- (int)luckyNumber {
    return 42; // The lucky number for the Parent class.
}

// Prints an introduction message to the console.
// The message includes the class name and its lucky number.
- (void)printIntroduction {
    printf("[%s] lucky number: %d\n", [self displayName], [self luckyNumber]);
}

@end
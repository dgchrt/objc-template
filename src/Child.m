// Child.m
// This file implements the Child class, providing definitions for its methods.

#include <stdio.h>
#include "Child.h"

@implementation Child

// Returns a lucky number associated with the class.
// Overrides the Parent class's implementation and adds 7 to the Parent's lucky number.
- (int)luckyNumber {
    return [super luckyNumber] + 7; // Calls the Parent's luckyNumber method and adds 7.
}

// Prints an introduction message to the console.
// Overrides the Parent class's implementation.
// Calls the Parent's implementation using the super keyword.
- (void)printIntroduction {
    [super printIntroduction]; // Calls the Parent's printIntroduction method.
    printf("[%s] super call complete.\n", [self className]); // Adds additional output.
}

@end
// Child.h
// This file defines the Child class, which inherits from the Parent class.
// It demonstrates method overriding and the use of the super keyword.

#ifndef CHILD_H
#define CHILD_H

#include "Parent.h"

// The Child class extends the Parent class.
// It overrides methods to provide its own implementation.
@interface Child : Parent

// Returns the name of the class as a C string.
// This method overrides the Parent class's implementation.
- (const char *)displayName;

// Returns a lucky number associated with the class.
// This method overrides the Parent class's implementation.
- (int)luckyNumber;

// Prints an introduction message to the console.
// This method overrides the Parent class's implementation and calls the super implementation.
- (void)printIntroduction;

@end

#endif
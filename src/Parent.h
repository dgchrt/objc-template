// Parent.h
// This file defines the Parent class, which serves as a root class in this example.
// It demonstrates basic Objective-C class structure and method declarations.

#ifndef PARENT_H
#define PARENT_H

#include "Root.h"

@interface Parent : Root

// Returns a lucky number associated with the class.
- (int)luckyNumber;

// Prints an introduction message to the console, including the class name and lucky number.
- (void)printIntroduction;

@end

#endif
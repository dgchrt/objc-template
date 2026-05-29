// Parent.h
// This file defines the Parent class, which serves as a root class in this example.
// It demonstrates basic Objective-C class structure and method declarations.

#ifndef PARENT_H
#define PARENT_H

// The Parent class is marked as a root class using the objc_root_class attribute.
// This means it does not inherit from any other class.
__attribute__((objc_root_class))
@interface Parent

// Returns the name of the class as a C string.
- (const char *)displayName;

// Returns a lucky number associated with the class.
- (int)luckyNumber;

// Prints an introduction message to the console, including the class name and lucky number.
- (void)printIntroduction;

@end

#endif
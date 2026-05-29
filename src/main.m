#include <objc/runtime.h>

#include "Child.h"
#include "Parent.h"

// Helper function to create an instance of a class by name.
// Uses the Objective-C runtime to dynamically allocate an object.
static id create_instance(const char *class_name) {
    Class cls = objc_getClass(class_name); // Get the class by name.
    return class_createInstance(cls, 0); // Create an instance of the class.
}

int main(void) {
    // Create an instance of the Parent class.
    Parent *parent = (Parent *)create_instance("Parent");

    // Create an instance of the Child class.
    Child *child = (Child *)create_instance("Child");

    // Call the printIntroduction method on the Parent instance.
    [parent printIntroduction];

    // Call the printIntroduction method on the Child instance.
    [child printIntroduction];

    // Dispose of the Parent instance.
    object_dispose(parent);

    // Dispose of the Child instance.
    object_dispose(child);

    return 0; // Exit the program.
}
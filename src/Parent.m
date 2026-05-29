#include <stdio.h>
#include "Parent.h"

@implementation Parent

// Returns a lucky number associated with the class.
- (int)luckyNumber {
    return 42; // The lucky number for the Parent class.
}

- (void)printIntroduction {
    printf("[%s] lucky number: %d\n", [self className], [self luckyNumber]);
}

@end
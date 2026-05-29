#include "Child.h"
#include <stdio.h>

@implementation Child

- (int)luckyNumber {
  return [super luckyNumber] + 7;
}

- (void)printIntroduction {
  [super printIntroduction]; // Calls the Parent's printIntroduction method.
  printf("[%s] super call complete.\n", [self className]);
}

@end
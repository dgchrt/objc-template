#include "Parent.h"
#include <stdio.h>

@implementation Parent

- (int)luckyNumber {
  return 42;
}

- (void)printIntroduction {
  printf("[%s] lucky number: %d\n", [self className], [self luckyNumber]);
}

@end
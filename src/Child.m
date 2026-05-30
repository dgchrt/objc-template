#include "Child.h"

@implementation Child

- (int)luckyNumber {
  return [super luckyNumber] + 7;
}

@end
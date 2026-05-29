#include "Child.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  Child *child = [[Child alloc] init];

  assert(child != 0);
  assert(strcmp([child className], "Child") == 0);
  assert([child luckyNumber] == 49);

  [child release];

  puts("Child tests passed.");
  return 0;
}
#include "Root.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  Root *root = [[Root alloc] init];

  assert(root != 0);
  assert(strcmp([root className], "Root") == 0);
  assert([root retainCount] == 1u);

  [root retain];
  assert([root retainCount] == 2u);

  [root release];
  assert([root retainCount] == 1u);

  [root release];

  puts("Root tests passed.");
  return 0;
}
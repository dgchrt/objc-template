#include "Parent.h"
#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  Parent *parent = [[Parent alloc] init];

  assert(parent != 0);
  assert(strcmp([parent className], "Parent") == 0);
  assert([parent luckyNumber] == 42);

  [parent release];

  puts("Parent tests passed.");
  return 0;
}
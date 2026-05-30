#include "Child.h"
#include "Parent.h"
#include <stdio.h>

int main(void) {
  Parent *parent = [[Parent alloc] init];
  Child *child = [[Child alloc] init];

  printf("[%s] lucky number: %d\n", [parent className], [parent luckyNumber]);
  printf("[%s] lucky number: %d\n", [child className], [child luckyNumber]);
  printf("[%s] super call complete.\n", [child className]);

  [parent release];
  [child release];

  return 0;
}

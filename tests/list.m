#include "List.h"
#include "Parent.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  List *list = [[List alloc] init];

  assert(list != 0);
  assert(strcmp([list className], "List") == 0);
  assert([list count] == 0u);
  assert([list capacity] > 0u);

  Parent *parent1 = [[Parent alloc] init];
  Parent *parent2 = [[Parent alloc] init];

  [list addObject:parent1];
  [list addObject:parent2];

  assert([list count] == 2u);
  assert([list objectAtIndex:0] == parent1);
  assert([list objectAtIndex:1] == parent2);

  [parent1 release];
  [parent2 release];

  List *small = [[List alloc] initWithCapacity:1];
  size_t initial_capacity = [small capacity];

  Parent *p3 = [[Parent alloc] init];
  Parent *p4 = [[Parent alloc] init];
  [small addObject:p3];
  [small addObject:p4];

  assert([small count] == 2u);
  assert([small capacity] >= initial_capacity);
  assert([small capacity] >= [small count]);

  List *normalized = [[List alloc] initWithCapacity:13];
  assert([normalized capacity] == 16u);

  [p3 release];
  [p4 release];

  [normalized release];
  [small release];
  [list release];

  puts("List tests passed.");
  return 0;
}

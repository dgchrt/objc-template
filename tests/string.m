#include "String.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  String *subject = [[String alloc] initWithCString:"Hello"];

  assert(subject != 0);
  assert(strcmp([subject className], "String") == 0);
  assert(strcmp(subject.cString, "Hello") == 0);
  assert(subject.length == 5u);

  assert([subject isEqualToCString:"Hello"] == true);
  assert([subject isEqualToCString:"HELLO"] == false);

  String *same = [String fromCString:"Hello"];
  String *other = [String fromCString:"World"];

  assert([subject isEqualToString:same] == true);
  assert([subject isEqualToString:other] == false);
  assert([subject isEqualToString:nil] == false);

  String *lower = [subject lowercaseString];
  assert(strcmp(lower.cString, "hello") == 0);
  assert(lower.length == 5u);
  assert(strcmp(subject.cString, "Hello") == 0);

  String *empty = [[String alloc] init];
  assert(strcmp(empty.cString, "") == 0);
  assert(empty.length == 0u);

  [empty release];
  [lower release];
  [other release];
  [same release];
  [subject release];

  puts("String tests passed.");
  return 0;
}

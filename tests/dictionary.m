#include "Dictionary.h"
#include "Parent.h"
#include "String.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  Dictionary *dictionary = [[Dictionary alloc] initWithCapacity:4];

  assert(dictionary != 0);
  assert(strcmp([dictionary className], "Dictionary") == 0);
  assert(dictionary.count == 0u);
  assert(dictionary.capacity >= 8u);

  String *player_key = [String fromCString:"player"];

  Parent *parent1 = [[Parent alloc] init];
  [dictionary setObject:parent1 forKey:player_key];
  [parent1 release];

  assert(dictionary.count == 1u);
  assert([dictionary hasKey:player_key] == true);

  Parent *actual1 = (Parent *)[dictionary objectForKey:player_key];
  assert(actual1 != nil);
  assert([actual1 luckyNumber] == 42);

  Parent *parent2 = [[Parent alloc] init];
  [dictionary setObject:parent2 forKey:player_key];
  [parent2 release];

  assert(dictionary.count == 1u);

  Parent *actual2 = (Parent *)[dictionary objectForKey:player_key];
  assert(actual2 != nil);
  assert([actual2 luckyNumber] == 42);

  for (size_t index = 0; index < 128; ++index) {
    char key[32];
    snprintf(key, sizeof(key), "key-%zu", index);

    String *string_key = [String fromCString:key];

    Parent *parent = [[Parent alloc] init];
    [dictionary setObject:parent forKey:string_key];
    [parent release];
    [string_key release];
  }

  assert(dictionary.count == 129u);

  for (size_t index = 0; index < 128; ++index) {
    char key[32];
    snprintf(key, sizeof(key), "key-%zu", index);

    String *string_key = [String fromCString:key];

    assert([dictionary hasKey:string_key] == true);

    Parent *parent = (Parent *)[dictionary objectForKey:string_key];
    assert(parent != nil);
    assert([parent luckyNumber] == 42);

    [string_key release];
  }

  String *missing_key = [String fromCString:"missing"];
  assert([dictionary hasKey:missing_key] == false);
  assert([dictionary objectForKey:missing_key] == nil);

  [missing_key release];
  [player_key release];

  [dictionary release];

  puts("Dictionary tests passed.");
  return 0;
}

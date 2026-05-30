#ifndef DICTIONARY_H
#define DICTIONARY_H

#include <stdbool.h>
#include <stddef.h>

#include "Root.h"
#include "String.h"

@interface Dictionary : Root {
@private
  String **_keys;
  id *_values;
  size_t _capacity;
  size_t _count;
}

@property (readonly) size_t count;
@property (readonly) size_t capacity;

- (id)initWithCapacity:(size_t)capacity;

- (void)setObject:(id)object forKey:(String *)key;
- (id)objectForKey:(String *)key;
- (bool)hasKey:(String *)key;

@end

#endif

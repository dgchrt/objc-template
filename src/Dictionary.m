#include "Dictionary.h"

#include <assert.h>
#include <stdint.h>
#include <stdlib.h>

static const size_t DICTIONARY_DEFAULT_CAPACITY = 8;
static const uint64_t FNV1A_64_OFFSET_BASIS = 1469598103934665603ULL;
static const uint64_t FNV1A_64_PRIME = 1099511628211ULL;

static size_t dictionary_normalize_capacity(size_t requested) {
  size_t capacity = DICTIONARY_DEFAULT_CAPACITY;

  while (capacity < requested) {
    capacity <<= 1;
  }

  return capacity;
}

static uint64_t dictionary_hash_key(String *key) {
  const unsigned char *bytes = (const unsigned char *)key.cString;
  uint64_t hash = FNV1A_64_OFFSET_BASIS;

  while (*bytes != '\0') {
    hash ^= (uint64_t)(*bytes++);
    hash *= FNV1A_64_PRIME;
  }

  return hash;
}

static size_t dictionary_find_slot(String **keys, size_t capacity, String *key, bool *found) {
  size_t mask = capacity - 1;
  size_t index = (size_t)(dictionary_hash_key(key) & (uint64_t)mask);

  for (;;) {
    if (keys[index] == NULL) {
      *found = false;
      return index;
    }

    if ([keys[index] isEqualToString:key]) {
      *found = true;
      return index;
    }

    index = (index + 1) & mask;
  }
}

@interface Dictionary ()
- (void)rehashToCapacity:(size_t)newCapacity;
@end

@implementation Dictionary

@synthesize count = _count;
@synthesize capacity = _capacity;

- (id)init {
  return [self initWithCapacity:DICTIONARY_DEFAULT_CAPACITY];
}

- (id)initWithCapacity:(size_t)capacity {
  self = [super init];

  if (self) {
    _capacity = dictionary_normalize_capacity(capacity);
    _count = 0;
    _keys = (String **)calloc(_capacity, sizeof(String *));
    _values = (id *)calloc(_capacity, sizeof(id));

    assert(_keys != NULL);
    assert(_values != NULL);
  }

  return self;
}

- (void)setObject:(id)object forKey:(String *)key {
  assert(object != nil);
  assert(key != nil);

  if (_count == _capacity) {
    [self rehashToCapacity:_capacity * 2];
  }

  bool found = false;
  size_t index = dictionary_find_slot(_keys, _capacity, key, &found);

  if (found) {
    id old_object = _values[index];

    if (old_object != object) {
      [old_object release];
      _values[index] = [object retain];
    }

    return;
  }

  _keys[index] = [key retain];
  _values[index] = [object retain];
  _count += 1;
}

- (id)objectForKey:(String *)key {
  assert(key != nil);

  bool found = false;
  size_t index = dictionary_find_slot(_keys, _capacity, key, &found);

  if (!found) {
    return nil;
  }

  return _values[index];
}

- (bool)hasKey:(String *)key {
  assert(key != nil);

  bool found = false;
  (void)dictionary_find_slot(_keys, _capacity, key, &found);
  return found;
}

- (void)rehashToCapacity:(size_t)newCapacity {
  newCapacity = dictionary_normalize_capacity(newCapacity);

  String **new_keys = (String **)calloc(newCapacity, sizeof(String *));
  id *new_values = (id *)calloc(newCapacity, sizeof(id));

  assert(new_keys != NULL);
  assert(new_values != NULL);

  for (size_t index = 0; index < _capacity; ++index) {
    if (_keys[index] == NULL) {
      continue;
    }

    String *key = _keys[index];
    id value = _values[index];

    bool found = false;
    size_t new_index = dictionary_find_slot(new_keys, newCapacity, key, &found);
    assert(found == false);

    new_keys[new_index] = key;
    new_values[new_index] = value;
  }

  free(_keys);
  free(_values);

  _keys = new_keys;
  _values = new_values;
  _capacity = newCapacity;
}

- (void)dealloc {
  for (size_t index = 0; index < _capacity; ++index) {
    if (_keys[index] == NULL) {
      continue;
    }

    [_keys[index] release];
    [_values[index] release];
  }

  free(_keys);
  free(_values);

  [super dealloc];
}

@end

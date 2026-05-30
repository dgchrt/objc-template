#include "List.h"

#include <assert.h>
#include <stdlib.h>

static const size_t LIST_DEFAULT_CAPACITY = 8;

static size_t list_normalize_capacity(size_t requested) {
  size_t capacity = LIST_DEFAULT_CAPACITY;

  while (capacity < requested) {
    capacity <<= 1;
  }

  return capacity;
}

@implementation List

@synthesize count = _count;
@synthesize capacity = _capacity;

- (id)init {
  return [self initWithCapacity:LIST_DEFAULT_CAPACITY];
}

- (id)initWithCapacity:(size_t)capacity {
  self = [super init];

  if (self) {
    _capacity = list_normalize_capacity(capacity);
    _count = 0;
    _ids = (id *)malloc(sizeof(id) * _capacity);
    assert(_ids != NULL);
  }

  return self;
}

- (id)initWithObjects:(id *)objects count:(size_t)count {
  size_t initial_capacity = count > LIST_DEFAULT_CAPACITY ? count : LIST_DEFAULT_CAPACITY;
  self = [self initWithCapacity:initial_capacity];

  if (self) {
    for (size_t index = 0; index < count; ++index) {
      assert(objects[index] != nil);
      _ids[index] = [objects[index] retain];
    }

    _count = count;
  }

  return self;
}

- (void)addObject:(id)object {
  assert(object != nil);

  if (_count == _capacity) {
    size_t new_capacity = list_normalize_capacity(_capacity + 1);
    id *new_ids = (id *)realloc(_ids, sizeof(id) * new_capacity);
    assert(new_ids != NULL);
    _ids = new_ids;
    _capacity = new_capacity;
  }

  _ids[_count] = [object retain];
  _count += 1;
}

- (id)objectAtIndex:(size_t)index {
  assert(index < _count);
  return _ids[index];
}

- (void)dealloc {
  for (size_t index = 0; index < _count; ++index) {
    [_ids[index] release];
  }

  free(_ids);
  [super dealloc];
}

@end

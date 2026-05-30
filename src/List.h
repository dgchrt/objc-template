#ifndef LIST_H
#define LIST_H

#include "Root.h"

@interface List : Root {
@private
	id * _ids;
    size_t _capacity;
    size_t _count;
}

@property (readonly) size_t count;
@property (readonly) size_t capacity;

- (id)initWithCapacity:(size_t)capacity;
- (id)initWithObjects:(id *)objects count:(size_t)count;

- (void)addObject:(id)object;
- (id)objectAtIndex:(size_t)index;

@end

#endif

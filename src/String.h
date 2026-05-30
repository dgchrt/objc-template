#ifndef STRING_H
#define STRING_H

#include <stdbool.h>
#include <stddef.h>

#include "Root.h"

@interface String : Root {
@private
  char *_cstring;
  size_t _length;
}

@property (readonly) const char *cString;
@property (readonly) size_t length;

+ (String *)fromCString:(const char *)cstring;

- (id)initWithCString:(const char *)cstring;

- (bool)isEqualToCString:(const char *)cstring;
- (bool)isEqualToString:(String *)string;

- (String *)lowercaseString;

@end

#endif

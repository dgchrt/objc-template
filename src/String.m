#include "String.h"

#include <assert.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

@implementation String

@synthesize length = _length;

- (const char *)cString {
  return _cstring;
}

+ (String *)fromCString:(const char *)cstring {
  return [[String alloc] initWithCString:cstring];
}

- (id)init {
  return [self initWithCString:""];
}

- (id)initWithCString:(const char *)cstring {
  assert(cstring != NULL);

  self = [super init];

  if (self) {
    _length = strlen(cstring);
    _cstring = strdup(cstring);
    assert(_cstring != NULL);
  }

  return self;
}

- (bool)isEqualToCString:(const char *)cstring {
  assert(cstring != NULL);
  return strcmp(self.cString, cstring) == 0;
}

- (bool)isEqualToString:(String *)string {
  if (string == nil) {
    return false;
  }

  return strcmp(self.cString, string.cString) == 0;
}

- (String *)lowercaseString {
  char *lower = strdup(self.cString);
  assert(lower != NULL);

  for (size_t index = 0; index < self.length; ++index) {
    lower[index] = (char)tolower((unsigned char)lower[index]);
  }

  String *string = [[String alloc] initWithCString:lower];
  free(lower);
  return string;
}

- (void)dealloc {
  free(_cstring);
  [super dealloc];
}

@end

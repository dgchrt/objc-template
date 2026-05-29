#include "Root.h"

@implementation Root

+ (id)alloc {
    return class_createInstance(self, 0);
}

- (const char *)className {
    return object_getClassName(self);
}

- (void)dealloc {
    object_dispose(self);
}

- (id)init {
    return self;
}

@end

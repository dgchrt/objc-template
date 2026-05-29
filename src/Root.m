#include "Root.h"

@implementation Root

+ (id)alloc {
    Root *instance = class_createInstance(self, 0);

    if (instance != 0) {
        instance->_retainCount = 1;
    }

    return instance;
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

- (void)release {
    if (_retainCount < 1) {
        return;
    }

    if (--_retainCount < 1) {
        [self dealloc];
    }
}

- (id)retain {
    ++_retainCount;
    return self;
}

- (unsigned int)retainCount {
    return _retainCount;
}

@end

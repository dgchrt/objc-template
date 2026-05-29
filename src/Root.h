#ifndef ROOT_H
#define ROOT_H

#include <objc/runtime.h>

__attribute__((objc_root_class))
@interface Root {
    Class isa;
    unsigned int _retainCount;
}

+ (id)alloc;
- (const char *)className;
- (void)dealloc;
- (id)init;
- (void)release;
- (id)retain;
- (unsigned int)retainCount;

@end

#endif

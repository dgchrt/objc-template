#ifndef ROOT_H
#define ROOT_H

#include <objc/runtime.h>

__attribute__((objc_root_class))
@interface Root

+ (id)alloc;
- (const char *)className;
- (void)dealloc;
- (id)init;

@end

#endif

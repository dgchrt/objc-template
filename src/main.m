#include "Child.h"
#include "Parent.h"

int main(void) {
    Parent *parent = [[Parent alloc] init];
    Child *child = [[Child alloc] init];

    [parent printIntroduction];
    [child printIntroduction];

    [parent dealloc];
    [child dealloc];

    return 0;
}

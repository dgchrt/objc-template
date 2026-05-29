#include "Child.h"
#include "Parent.h"

int main(void) {
    Parent *parent = [[Parent alloc] init];
    Child *child = [[Child alloc] init];

    [parent printIntroduction];
    [child printIntroduction];

    [parent release];
    [child release];

    return 0;
}

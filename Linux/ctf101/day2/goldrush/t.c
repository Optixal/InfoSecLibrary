#include <stdio.h>
#include <stdlib.h>

void main() {
    int seed, id;
    srand(seed);
    id = rand();
    printf("%d\n", id);
    srand(seed);
    id = rand();
    printf("%d\n", id);
}

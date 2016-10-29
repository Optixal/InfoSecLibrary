#include <stdio.h>

void service() {
    char name[256];
    printf("Hey there!\n");
    printf("What is your name?: ");
    scanf("%s", &name[0]);
    printf("Oh hey %s!\n", name);
}

int main() {
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
    service();
    return 0;
}

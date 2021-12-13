#include "../drivers/screen.h"
void some_function()
{
}

void main()
{
    char *video_memory = (char *)0xb8000;
    *video_memory = 'X';
    some_function();
    clear_screen();
    print("hello world!\n");
    print("oh yean!\n");
    print("practice practice practice!\n");
    print("hello world!\n");
    print("oh yean!\n");
    print("practice practice practice!\n");
    print("hello world!\n");
    print("oh yean!\n");
    print("practice practice practice!\n");
}
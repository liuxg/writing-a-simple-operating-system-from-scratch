//i386-elf-gcc -ffreestanding -m32 -c test.c -o test.o
//i386-elf-ld -o test.bin -Ttext 0x0 --oformat binary test.o
//ndisasm -b 32 test.bin > test.dis
int my_function(){
    int my_var = 0xbaba;
    return my_var;
}

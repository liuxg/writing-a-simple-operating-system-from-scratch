object=os-image
C_SOURCES=$(wildcard kernel/*.c drivers/*.c)
HEADERS=$(wildcard kernel/*.h drivers/*.h)
OBJ=${C_SOURCES:.c=.o}

$(object): boot/boot_sect.bin kernel/kernel.bin 15sector
	cat $^ > $@

kernel/kernel.bin: kernel/kernel_entry.o $(OBJ)
	i386-elf-ld -o $@ -Ttext 0x1000  $^ --oformat binary

%.o: %.c ${HEADERS}
	i386-elf-gcc -ffreestanding -m32 -c $< -o $@

%.o: %.asm
	nasm $< -f elf -o $@

%.bin: %.asm
	nasm $< -f bin -o $@

15sector:
	dd if=/dev/zero of=15sector bs=512 count=15 2> /dev/null



run:
	qemu-system-i386 -drive format=raw,file=$(object)


PHONY: clean
clean:
	-rm kernel/kernel.bin 15sector $(object) ${OBJ} boot/boot_sect.bin kernel/kernel_entry.o
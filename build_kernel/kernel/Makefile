object=kernel

$(object): boot_sect.bin $(object).bin 
	cat boot_sect.bin $(object).bin 15sector > $@

$(object).bin: kernel_entry.o $(object).o
	i386-elf-ld -o $@ -Ttext 0x1000  $^ --oformat binary

$(object).o: $(object).c
	i386-elf-gcc -ffreestanding -m32 -c $< -o $@

kernel_entry.o: kernel_entry.asm
	nasm $< -f elf -o $@

boot_sect.bin: boot_sect.asm
	nasm $< -f bin -o $@

dasm:
	ndisasm -b 32 $(object).bin > $(object).dis

clean:
	rm -f *.o *.bin *.dis

run:
	qemu-system-i386 -drive format=raw,file=$(object)

# dd if=/dev/zero of=15sector bs=512 count=15 2> /dev/null
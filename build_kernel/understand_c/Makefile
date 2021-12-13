object=pointer

$(object).bin: $(object).o
	i386-elf-ld -o $@ -Ttext 0x0 --oformat binary $<

$(object).o: $(object).c
	i386-elf-gcc -ffreestanding -m32 -c $< -o $@

dasm:
	ndisasm -b 32 $(object).bin > $(object).dis

clean:
	rm -f *.o *.bin *.dis

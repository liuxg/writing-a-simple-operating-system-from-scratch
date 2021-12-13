target=main

$(target).bin: $(target).asm
	nasm $< -f bin -o $@

run:
	qemu-system-i386 -drive format=raw,file=$(target).bin

clean:
	rm -f *.bin
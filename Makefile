all:
	nasm -f bin boot/boot.asm -o boot.bin
	nasm -f bin kernel/kernel.asm -o kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run:
	qemu-system-x86_64 -drive format=raw,file=os-image.bin

clean:
	rm -f *.bin *.o *.elf
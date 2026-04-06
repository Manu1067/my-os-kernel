all:
	nasm -f bin boot/boot.asm -o boot.bin
	gcc -ffreestanding -m32 -c kernel/kernel.c -o kernel.o
	ld -m elf_i386 -T linker.ld -o kernel.elf kernel.o
	objcopy -O binary kernel.elf kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run:
	qemu-system-x86_64 -drive format=raw,file=os-image.bin

clean:
	rm -f *.bin *.o *.elf
all:
	nasm -f bin boot/boot.asm -o boot.bin
	i686-elf-gcc -ffreestanding -c kernel/kernel.c -o kernel.o
	i686-elf-ld -T linker.ld -o kernel.bin kernel.o
	cat boot.bin kernel.bin > os-image.bin

run:
	qemu-system-x86_64 -drive format=raw,file=os-image.bin

clean:
	rm -f *.bin *.o
all:
	nasm -f bin boot/boot.asm -o boot.bin
	gcc -ffreestanding -c kernel/kernel.c -o kernel.o
	ld -T linker.ld -o kernel.bin kernel.o
	copy /b boot.bin+kernel.bin os-image.bin

run:
	qemu-system-x86_64 os-image.bin

clean:
	del /Q *.bin *.o
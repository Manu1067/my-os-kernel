all: os-image.bin

boot.bin: boot/boot.asm
	nasm -f bin boot/boot.asm -o boot.bin

kernel.bin: kernel/kernel.c linker.ld
	gcc -ffreestanding -c kernel/kernel.c -o kernel.o
	ld -T linker.ld -o kernel.bin kernel.o

os-image.bin: boot.bin kernel.bin
	# Create a 512-byte blank sector for bootloader
	fsutil file createnew blank.bin 512 >nul
	# Create kernel sector (512 bytes, pad if needed)
	fsutil file createnew blank2.bin 512 >nul
	# Concatenate: boot.bin + kernel.bin + padding to 1.44MB
	copy /b boot.bin + kernel.bin + blank.bin + blank2.bin os-image.bin >nul
	del blank.bin blank2.bin

run: os-image.bin
	qemu-system-x86_64 os-image.bin

clean:
	rm -f *.bin *.o *.elf
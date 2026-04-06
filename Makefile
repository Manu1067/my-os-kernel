all: os-image.bin

# Compile Bootloader
boot.bin: boot/boot.asm
	nasm -f bin boot/boot.asm -o boot.bin

# Compile Kernel Entry
kernel_entry.o: kernel/kernel_entry.asm
	nasm -f elf32 kernel/kernel_entry.asm -o kernel_entry.o

# Compile Kernel C code
kernel.o: kernel/kernel.c
	gcc -ffreestanding -m32 -fno-pie -c kernel/kernel.c -o kernel.o

# Link Kernel Entry and Kernel C code into a flat binary
kernel.bin: kernel_entry.o kernel.o linker.ld
	ld -m elf_i386 -T linker.ld kernel_entry.o kernel.o -o kernel.bin --oformat binary

# Combine Bootloader and Kernel
os-image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-x86_64 -drive format=raw,file=os-image.bin

clean:
	rm -rf *.bin *.o *.elf os-image.bin
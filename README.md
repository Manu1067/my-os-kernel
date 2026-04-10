Hello World Bare-Metal Operating System

Project Overview  
This project demonstrates a simple bare-metal operating system built from scratch using 16-bit Assembly language.  
It shows how a system boots without any existing operating system and directly interacts with hardware.

The OS consists of two main components:  
- Bootloader – Loaded by BIOS and responsible for initializing the system and loading the kernel  
- Kernel – Executes after the bootloader and displays output  

--------------------------------------------------

Objective  
- Understand how BIOS loads the bootloader  
- Learn how to load and execute a kernel  
- Explore low-level programming and hardware interaction  
- Demonstrate the complete booting process  

--------------------------------------------------

Technologies Used  
- Assembly (NASM) – Bootloader and kernel  
- QEMU – Emulating the OS  
- Makefile – Build automation  
- WSL (Ubuntu) – Development environment  

--------------------------------------------------

Working Principle  

1. BIOS loads the bootloader into memory at 0x7C00  
2. Bootloader executes and prints:  
   Hello from Bootloader  
3. Bootloader loads kernel into memory at 0x1000  
4. Control is transferred to the kernel  
5. Kernel executes and prints:  
   Hello from Kernel  

--------------------------------------------------

Project Structure  

my-os-kernel/  
boot/  
  boot.asm  
kernel/  
  kernel.asm  
Makefile  
os-image.bin  
README.md  

--------------------------------------------------

How to Run  

make  
make run  

--------------------------------------------------

Output  

Booting from Hard Disk...  
Hello from Bootloader  
Hello from Kernel  

--------------------------------------------------

Memory Footprint  
- Bootloader: 512 bytes  
- Kernel: approximately 38 bytes  
- Total OS size: approximately 550 bytes  

--------------------------------------------------

Performance  
- Executes in milliseconds  
- Very low CPU and memory usage  
- Lightweight system  

--------------------------------------------------

Demo Video  
Due to GitHub size limitations, the demo video is provided via external link:  

Watch Demo Video Here: PASTE_YOUR_LINK_HERE  

--------------------------------------------------

Challenges Faced  
- 16-bit and 32-bit execution mismatch  
- Kernel execution issues  
- Memory addressing errors  

--------------------------------------------------

Conclusion  
This project demonstrates the basic booting process of an operating system.  
It provides practical understanding of low-level programming, memory handling, and hardware interaction.  

--------------------------------------------------

Contributors  
- Student 1  
- Student 2  
- Student 3  

--------------------------------------------------

License  
This project is for educational purposes only.
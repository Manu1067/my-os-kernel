[org 0x7c00]
KERNEL_OFFSET equ 0x1000 

mov [BOOT_DRIVE], dl 
mov bp, 0x9000
mov sp, bp

call load_kernel
call switch_to_pm ; This switches to 32-bit mode and jumps to BEGIN_PM
jmp $

%include "disk.asm"
%include "gdt.asm"
%include "switch.asm"

[bits 32]
BEGIN_PM:
    call KERNEL_OFFSET ; Jump to the C kernel
    jmp $

BOOT_DRIVE db 0
times 510-($-$$) db 0
dw 0xaa55
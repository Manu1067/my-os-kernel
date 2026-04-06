[BITS 16]
[ORG 0x7c00]

start:
    mov si, boot_msg
    call print_string

    ; -------- LOAD KERNEL --------
    mov ah, 0x02
    mov al, 20
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x1000
    int 0x13

    cli

    ; -------- LOAD GDT --------
    lgdt [gdt_descriptor]

    ; -------- ENABLE PROTECTED MODE --------
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; -------- JUMP TO 32-BIT --------
    jmp CODE_SEG:init_pm


; ==============================
; 16-bit PRINT FUNCTION
; ==============================
print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print_string
done:
    ret


; ==============================
; 32-bit MODE
; ==============================
[BITS 32]

init_pm:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    jmp 0x1000   ; jump to kernel


; ==============================
; GDT
; ==============================
gdt_start:
    dq 0x0000000000000000
    dq 0x00cf9a000000ffff
    dq 0x00cf92000000ffff
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

CODE_SEG equ 0x08
DATA_SEG equ 0x10

boot_msg db "Hello from Bootloader", 0

times 510 - ($ - $$) db 0
dw 0xaa55
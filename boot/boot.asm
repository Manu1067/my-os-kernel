[BITS 16]
[ORG 0x7c00]

start:
    mov si, message

print:
    lodsb
    cmp al, 0
    je done
    mov ah, 0x0e
    int 0x10
    jmp print

done:
    call load_kernel
    jmp 0x0000:0x1000

; -------- LOAD KERNEL --------
load_kernel:
    mov ah, 0x02        ; read disk
    mov al, 10          ; read 10 sectors (IMPORTANT)
    mov ch, 0
    mov cl, 2           ; start from sector 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x1000      ; load address
    int 0x13
    ret

message db "HELLO FROM BOOTLOADER", 0

times 510 - ($ - $$) db 0
dw 0xaa55
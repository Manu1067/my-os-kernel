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
    jmp $

message db "HELLO FROM BOOTLOADER", 0

times 510 - ($ - $$) db 0
dw 0xaa55
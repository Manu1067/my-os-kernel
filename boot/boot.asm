[BITS 16]
[ORG 0x7c00]

start:
    mov si, message

print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print

done:
    jmp $

message db 'Booting OS...', 0

times 510 - ($ - $$) db 0
dw 0xaa55
[BITS 16]
[ORG 0x7c00]

start:
    mov si, msg1
    call print_string

    call new_line

    ; load kernel from disk (sector 2)
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x1000
    int 0x13

    ; jump to kernel
    jmp 0x0000:0x1000


; -------- PRINT FUNCTION --------
print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print_string
done:
    ret


; -------- NEW LINE --------
new_line:
    mov ah, 0x0e
    mov al, 0x0d
    int 0x10
    mov al, 0x0a
    int 0x10
    ret


msg1 db "Hello from Bootloader", 0

times 510-($-$$) db 0
dw 0xaa55
[BITS 16]
[ORG 0x1000]

start:
    mov si, msg2
    call print_string

hang:
    jmp hang


print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0e
    int 0x10
    jmp print_string
done:
    ret


msg2 db "Hello from Kernel", 0
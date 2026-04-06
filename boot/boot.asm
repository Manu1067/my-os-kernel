[BITS 16]
[ORG 0x7c00]

start:
    ; set up segments
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00

    ; print loading message
    mov si, loading_msg
    call print

    ; load kernel from disk (sector 2, head 0, cylinder 0)
    mov ah, 0x02          ; BIOS read sectors
    mov al, 1             ; number of sectors to read (increase if kernel >512 bytes)
    mov ch, 0             ; cylinder 0
    mov cl, 2             ; sector 2 (sector 1 is bootloader)
    mov dh, 0             ; head 0
    mov bx, 0x1000        ; segment
    mov es, bx
    xor bx, bx            ; offset 0 → es:bx = 0x1000:0
    int 0x13
    jc disk_error

    ; jump to loaded kernel
    jmp 0x1000:0x0000

disk_error:
    mov si, err_msg
    call print
    hlt

print:
    lodsb
    or al, al
    jz .done
    mov ah, 0x0e
    int 0x10
    jmp print
.done:
    ret

loading_msg db 'Loading kernel...', 0x0D, 0x0A, 0
err_msg     db 'Disk error!', 0

times 510 - ($ - $$) db 0
dw 0xaa55
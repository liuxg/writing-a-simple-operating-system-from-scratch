print_string:
    pusha
    mov ah, 0x0e
print_loop:
    mov al, [bx]
    int 0x10
    inc bx
    cmp al, 0x00
    jne print_loop
    popa
    ret
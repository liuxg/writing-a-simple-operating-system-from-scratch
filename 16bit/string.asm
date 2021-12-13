[org 0x7c00]

mov cx, 0
mov ah, 0x0e
print:
    mov bx, string
    add bx, cx
    mov al, [bx]
    int 0x10
    inc cx
    cmp al, 0x00
    jne print
string:
    db 'Botting OS',0

jmp $

times 510-($-$$) db 0
dw 0xaa55
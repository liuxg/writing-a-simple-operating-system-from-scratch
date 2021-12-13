[org 0x7c00]

mov bx, hello_msg
call my_print

mov bx, goodbye_msg
call my_print

jmp $

%include "my_print.asm"
hello_msg:
    db 'Hello, World!',0

goodbye_msg:
    db 'Goodbye!',0

times 510-($-$$) db 0
dw 0xaa55

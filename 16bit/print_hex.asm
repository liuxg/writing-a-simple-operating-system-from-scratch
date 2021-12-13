print_hex:
    pusha
    mov cx, 0
loop:
    cmp cx, 4
    je hex_loop_end
    mov ax, dx
    and ax, 0x000f
    add ax, '0'
    cmp ax, '0'+9
    jle step2
    add ax, 'a'-'0'-0xa
step2:
    mov bx, hex_out+5
    sub bx, cx
    mov [bx], al
    shr dx, 4
    inc cx
    jmp loop
hex_loop_end:
    mov bx, hex_out
    call my_print
    popa
    ret
hex_out:
    db '0x0000', 0
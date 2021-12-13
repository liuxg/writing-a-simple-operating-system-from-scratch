disk_load:
    pusha
    push dx
    mov ah, 0x02
    mov al, dh
    mov ch, 0x00
    mov dh, 0x00
    mov cl, 0x02
    int 0x13
    jc disk_error
    pop dx
    cmp dh, al
    jne disk_error
    popa
    ret
disk_error:
    mov bx, disk_error_msg
    call print_string
    jmp $
disk_error_msg db "Disk read error!", 0
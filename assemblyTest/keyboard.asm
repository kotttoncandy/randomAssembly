[org 0x7c00]
section .data

hello: times 16 db 0


section .text
mov bx, hello

label:
    mov ah, 0
    int 0x16

    mov ah, 0x0e
    int 0x10

    jmp buffer

buffer:
    
    mov [bx], al
    inc bx

    cmp al, 27

    je startPrint
    jmp label

startPrint:    
    mov al, ' '
    int 0x10
    mov bx, 0
    int 0x10
    jmp changePointer

changePointer:
    inc bx
    cmp bx, hello

    je print
    jmp changePointer

print:
    mov al, [bx]
    int 0x10
    cmp al, 0
    je reset     
    inc bx

    jmp print

reset:
    mov bx, hello
    jmp label

end:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa


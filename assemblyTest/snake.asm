[org 0x7c00]



mov ah, 0x0e
mov bx, worldData

print:
    mov al, [bx]
    cmp al, 0
    je end
    int 0x10
    inc bx
    jmp print



worldData: 
    times 256 db '#'
    db 0 

end:
    jmp $
    times 510-($-$$) db 0
    db 0x55, 0xaa

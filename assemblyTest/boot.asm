[org 0x7c00]
mov ax, 19 ; here select which mode you want
int 16      ; this calls EGA/VGA/VESA BIOS

loop:
    mov al, 'A'
    int 0x0e      ; this calls EGA/VGA/VESA BIOS

    jmp loop

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa



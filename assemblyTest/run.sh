nasm -f bin keyboard.asm -o boot.bin
qemu-system-x86_64 boot.bin
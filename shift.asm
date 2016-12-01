;
; file: shift.asm
;
; nasm -f elf64 shift.asm -g
; gcc -m64 -o shift shift.o
;

segment .text
    global main

main:
    ; shift left
    mov rax, 10
    shl rax, 1

    ; shift right
    mov rax, 10
    shr rax, 1
    nop

    ; syscall exit
    mov rax, 60
    mov rdi, 0
    syscall

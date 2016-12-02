; file logical_instructions.asm
;
; nasm -f elf64 logical_instructions.asm -g
; gcc -m64 -o logical_instructions logical_instructions.o
;

; external C lib
extern printf

segment .data

    format_output: db 'rax = %d', 10

segment .text
    global main

main:

    push rbp ; set up stack frame

    ;
    ; OR
    ;
    mov rax, 5
    or rax, 6
    call print_format

    ;
    ; XOR
    ;
    mov rax, 10
    xor rax, 6
    call print_format

    ;
    ; AND
    ;
    mov rax, 7
    and rax, 4
    call print_format

    ;
    ; NOT
    ;
    ; why the result is always negative?
    mov rax, 2
    not rax
    call print_format


    pop rbp ; restore stack

    ret ; exit

print_format:
    mov rdi, format_output
    mov rsi, rax
    mov al, 0
    jmp printf
    ret

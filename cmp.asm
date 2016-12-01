; file cmp.asm
;
; nasm -f elf32 cmp.asm
; gcc -m32 -o cmp cmp.o
;

segment .data

msg db 'eax e ebx tem o mesmo valor', 0xa
len equ $ - msg

;
; start
;
segment .text
        global main

main:
        mov eax, 0x1
        mov ebx, 0x1
        cmp eax, ebx
        jne skip
        call tell_me
        skip:
        mov eax, 1
        mov ebx, 0
        int 0x80

tell_me:
        mov edx, len
        mov ecx, msg
        mov eax, 4
        mov ebx, 1
        int 0x80
        ret

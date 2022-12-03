%include 'in_out.asm'
SECTION .data
msg1: DB 'Введите x: ',0
msg2: DB 'Введите a: ',0

SECTION .bss
A: RESB 80
X: RESB 80

SECTION .text
GLOBAL _start

_start:
mov eax, msg1
call sprint
mov ecx, X
mov edx, 80
call sread
mov eax, X
call atoi
mov [X], eax

mov eax, msg2
call sprint
mov ecx, A
mov edx, 80
call sread
mov eax, A
call atoi
mov [A], eax 

mov ebx, [A]
cmp ebx, 7
jge first
jmp second

first:
    mov eax,[A]
    add eax,-7
    call iprintLF 
    call quit
second:
    mov eax, [A]
    mov ebx, [X]
    mul ebx
    call iprintLF 
    call quit

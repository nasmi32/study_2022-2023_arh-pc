%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg1: DB 'Введите A: ',0
msg2: DB 'Введите B: ',0
msg3: DB 'Введите C: ',0
msg4: DB 'Минимальное число: ',0

SECTION .bss
A: RESB 80
B: RESB 80
C: RESB 80
min: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
mov eax, msg1
call sprint
mov ecx, A
mov edx, 80
call sread
mov eax, A
call atoi
mov [A], eax

mov eax, msg2
call sprint
mov ecx, B
mov edx, 80
call sread
mov eax, B
call atoi
mov [B], eax

mov eax, msg3
call sprint
mov ecx, C
mov edx, 80
call sread
mov eax, C
call atoi
mov [C], eax

mov ecx, [A]
mov [min], ecx

cmp ecx, [B]
jl check_C
mov ecx, [B]
mov [min], ecx

check_C:
cmp ecx, [C]
jl _end
mov ecx, [C]
mov [min], ecx

_end:
mov eax, msg4
call sprint

mov eax, [min]
call iprintLF

call quit ; вызов подпрограммы завершения

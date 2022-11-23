;--------------------------------
; Программа вычисления выражения
;--------------------------------
%include 'in_out.asm' ; подключение внешнего файла
SECTION .data
msg: DB 'Введите х для подсчета выражения (8х+6)*10: ',0
res: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprint

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

mov ebx, 8
mul ebx

add eax, 6

mov ebx, 10
mul ebx

mov edi, eax

mov eax, res
call sprint

mov eax, edi
call iprintLF

call quit ; вызов подпрограммы завершения

%include 'in_out.asm'
section .data
msg db "Наименьшее число: ",0h
A dd '79'
B dd '41'
C dd '83'
section .bss
min resb 10
section .text
global _start
_start:

mov ecx,[A] ; 'ecx = A'
mov [min],ecx ; 'min = A'

cmp ecx,[C] ; Сравниваем 'A' и 'С'
jg check_B ; если 'A>C', то переход на метку 'check_A',
mov ecx,[C] ; иначе 'ecx = C'
mov [min],ecx ; 'min = C'

check_B:

mov ecx,[min]
cmp ecx,[B] ; Сравниваем 'min(B,C)' и 'A'
jle fin ; если 'min(B,C)>A', то переход на 'fin',
mov ecx,[B] ; иначе 'ecx = A'
mov [min],ecx

fin:
mov eax, msg
call sprint ; Вывод сообщения 'Наибольшее число: '
mov eax,min
call sprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход

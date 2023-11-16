%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF
mov ecx, x
mov edx, 80
call sread
mov eax,x ; вызов подпрограммы преобразования
call atoi ; ASCII кода в число, `eax=x`

mov ebx,eax
mul ebx; EAX=EAX*EBX=x*x=x^2
mul ebx; EAX=EAX*EBX=(x^2)*x=x^3
mov ebx,2
div ebx; EAX=EAX/2=(x^3)/2
inc eax; EAX=EAX+1=((x^3)/2)-1

mov edi,eax
mov eax,rem
call sprint
mov eax,edi
call iprintLF
call quit

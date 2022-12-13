.386
.model flat, stdcall
option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

; Сегмент данных
;--------------------------------------------------
.data
Des dd 65
Nep dw -160
Bin1 dd 1000111011b
Bin2 dd 1011110000b
Hex dd 0AD456C4h
Text db "Good bye, America", 0
Array dw 256, 765, 89, 654, 9

.data?
Bin3 dd ?

; Сегмент кода
;--------------------------------------------------
.code
start:
; Очистка регистров eax и ebx
	mov eax, 0
	xor ebx, ebx

; Сохранение переменной Bin1 в регистр eax и умножение её на переменную Bin2
	mov eax, Bin1
	and eax, Bin2
	mov Bin3, eax

; Сохранение переменных Des и Hex в стек и замена значений переменных
	push Des
	push Hex
	pop Des
	pop Hex
	
; задержка
	push INFINITE
	call Sleep

; завершаем процесс
	push NULL
	call ExitProcess
end start
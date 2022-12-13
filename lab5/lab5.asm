.386
.model flat, stdcall
option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

; Сегмент данных
;--------------------------------------------------
.data
	a dw 1
	b dw 6
	x dw 8
	y dw 7
.data?
	n dw ?

; Сегмент кода
;--------------------------------------------------
.code
; n = a * x ^ 2 – b * y / a + x / (y + a)
start:
; a * x ^ 2
	mov ax, x
	imul ax
	imul a
	mov bx, ax
; b * y / a
	mov ax, b
	imul y
	idiv a
; a * x ^ 2 - b * y / a
	sub bx, ax
; x / (y + a)
	mov cx, y
	add cx, a
	mov ax, x
	idiv cx
; a * x ^ 2 – b * y / a + x / (y + a)
	add bx, ax
; n = a * x ^ 2 – b * y / a + x / (y + a)
	mov n, bx
	
; завершаем процесс
	push NULL
	call ExitProcess
end start
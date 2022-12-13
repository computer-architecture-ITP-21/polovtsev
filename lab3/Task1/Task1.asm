;--------------------------------------------------
; Программа на masm32 для консоли (вывод сообщения)
;--------------------------------------------------

.386
.model flat, stdcall
option casemap:none
include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
includelib C:\masm32\lib\kernel32.lib

; Сегмент данных
;--------------------------------------------------
.data
string db "Hello World!", 0Ah, 0h
sConsoleTitle db "My first project", 0

.data?
stdout dd ?
cWritten dd ?

; Сегмент кода
;--------------------------------------------------
.code
start:
; заголовок консоли
	push offset sConsoleTitle
	call SetConsoleTitle

; получаем дескриптор
	push STD_OUTPUT_HANDLE
	call GetStdHandle
	mov stdout, eax
	mov cWritten, ebx

; выводим в консоль строку
	push NULL
	push offset cWritten
	push sizeof string
	push offset string
	push stdout
	call WriteConsole

; задержка
	push INFINITE
	call Sleep

; завершаем процесс
	push NULL
	call ExitProcess
end start
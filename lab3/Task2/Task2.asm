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
	invoke SetConsoleTitle, addr sConsoleTitle

; получаем дескриптор
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov stdout, eax
	mov cWritten, ebx

; выводим в консоль строку
	invoke WriteConsole, stdout, addr string, sizeof string, addr cWritten, NULL
	call WriteConsole

; задержка
	invoke Sleep, INFINITE

; завершаем процесс
	invoke ExitProcess, NULL
end start
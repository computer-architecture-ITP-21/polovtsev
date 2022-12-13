;--------------------------------------------
; Программа на masm32 для Windows
; Исследование работы арифметического сопроцессора
; Найти первое значение аргумента функции Y = 9 * (x ^ 2 + 0,6), 
; при котором младшие целые цифры результата выполнения функции 
; будут равны 27 (x изменяется от 3 с шагом 5,5)
;--------------------------------------------
.686
.model flat, stdcall
option casemap :none 

include C:\masm32\include\windows.inc
include C:\masm32\include\kernel32.inc
include C:\masm32\include\user32.inc
include C:\masm32\include\fpu.inc
includelib C:\masm32\lib\kernel32.lib
includelib C:\masm32\lib\user32.lib
includelib C:\masm32\lib\fpu.lib

; Сегмент даных
;--------------------------------------------
.data
	MsgBoxTitle db "Operations in x87 coprocessor", 0
	MsgBoxText db "Function calculation Yn = 9 * (x ^ 2 + 0,6), where x changes in steps of 5,5", 13, 13
	res db 14 DUP(0)
	CrLf equ 0A0Dh
	y dt 0.0
	x dd 3.0
	op1 dd 9.0
	op2 dd 0.6
	step dd 5.5
	divider dd 100.0
	remainder dd 0.0
	
.const
	eleven dd 11.0
	half dd 0.5

; Cегмент кода
;--------------------------------------------
.code
start:
	mov eax, eleven
	
	cycle:
		finit ; инициализация регистров FPU
; (CWR = 037Fh, SWR = 0h, TWR = FFFFh,
; DPR = 0h, IPR = 0h)
		fld x
		fmul x ; x ^ 2
		fadd op2 ; x ^ 2 + 0,6
		fmul op1 ; 9 * (x ^ 2 + 0,6)
		fstp y
		fld divider
		fld y
		fsub half
		frndint
		fprem
		fstp remainder
		fld x
		fadd step
		fstp x
		cmp remainder, eax
	jne cycle
	
	invoke FpuFLtoA, addr y, 3, addr res, SRC1_REAL or SRC2_DIMM
	
	invoke MessageBox, NULL, addr MsgBoxText, addr MsgBoxTitle, MB_ICONINFORMATION

	invoke ExitProcess, NULL
end start
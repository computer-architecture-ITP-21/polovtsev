C:\masm32\bin\ml.exe /c /coff /Fl Task2.asm
C:\masm32\bin\link.exe /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib\ Task2.obj
pause
del Task2.obj
start Task2.exe
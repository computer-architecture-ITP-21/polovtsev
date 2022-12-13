C:\masm32\bin\ml.exe /c /coff /Fl Task1.asm
C:\masm32\bin\link.exe /SUBSYSTEM:CONSOLE /LIBPATH:C:\masm32\lib\ Task1.obj
pause
del Task1.obj
start Task1.exe
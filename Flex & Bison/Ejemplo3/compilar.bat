c:\GnuWin32\bin\flex Prueba_Lexico.l
pause
c:\GnuWin32\bin\bison -dyv TPFinal2.y
pause
c:\MinGW\bin\gcc.exe lex.yy.c y.tab.c -o TPFinal.exe
pause
pause
TPfinal.exe Prueba.txt
del lex.yy.c
del y.tab.c
del y.output
del y.tab.h
del TPFinal.exe

pause

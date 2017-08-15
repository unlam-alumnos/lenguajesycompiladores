#!/bin/bash

flex lexico.l
read -p "Léxico Generado... Continuar?"
bison -dyv sintaxis.y
read -p "Sintáxis Generada... Continuar?"
gcc lex.yy.c y.tab.c -o compilador.bin
read -p "Compilación finalizada... Continuar?"
./compilador.bin Prueba.txt
rm lex.yy.c
rm y.tab.c
rm y.output
rm y.tab.h
rm compilador.bin
read -p "Ejemplo finalizado!"

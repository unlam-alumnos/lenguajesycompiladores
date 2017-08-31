%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE *yyin;
int yylval;
%}

%option noyywrap
%option yylineno

DIGITO          [0-9]
LETRA           [a-z]

COMA            [","]
ASIGNACION      [":"]
PUNTO_COMA      [";"]

OP_COMPARACION  ["<"|"="|">"|"<="|">="|"><"]
OP_SUMA_RESTA   ["+"|"-"]
OP_MULT_DIV     ["*"|"/"]

PARENTESIS_A    ["("]
PARENTESIS_C    [")"]
LLAVE_A         ["{"]
LLAVE_C         ["}"]

ID              ({LETRA})+
TIPO_DATO       (Integer|Float)
CONSTANTE_STR   "({LETRA}|{DIGITO}|.)+"
CONSTANTE_REAL  ({DIGITO}+.{DIGITO}+)

DECVAR          ["DECVAR"]
ENDDEC          ["ENDDEC"]
WHILE           ["while"]
WRITE           ["write"]
IF              ["if"]
ELSE            ["else"]

%%
{OP_COMPARACION}	{ return OP_COMPARACION; }
{OP_SUMA_RESTA}   { return OP_SUMA_RESTA; }
{OP_MULT_DIV}     { return OP_MULT_DIV; }
{COMA}            { return COMA; }
{ASIGNACION}      { return ASIGNACION; }
{PUNTO_COMA}      { return PUNTO_COMA; }

{ID}		    { return ID;}
{DIGITO}+   { yylval = atoi( yytext ) ;return ENTERO;}

"\n"
"\t"

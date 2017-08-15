%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include "y.tab.h"
FILE  *yyin;

%}
%option noyywrap  
%option yylineno 


DIGITO			[0-9]
LETRA			[a-zA-Z]
ID			{LETRA}({LETRA}|{DIGITO}|_)*
espacio [" "]
caracter [a-z,A-Z,0-9,=,>,<,!,:,+,-,*,/]
texto "'"({caracter}+|{espacio})*"'"

%%
":="			{ return ASIG;}
"+"			{ return OP_SUMA;}
"-"			{ return OP_RESTA;}
"*"			{ return OP_MUL;}
"/"			{ return OP_DIV;}
"("			{ return P_A;}
")"			{ return P_C;}
";"			{ return PUNTO_Y_COMA;}

{ID}			{ yylval.str_val = yytext; printf( "Identificador en léxico: %s (%s)\n", yytext,yylval.str_val) ; return ID;}

{DIGITO}+		{ yylval.intval = atoi(yytext); printf( "Entero en léxico: %s (%d)\n", yytext,yylval.intval) ; return ENTERO;}

{texto}		{ yylval.str_val = yytext; printf( "String en léxico: %s (%s)\n", yytext,yylval.str_val) ; return STRING;}

{DIGITO}+"."{DIGITO}* { yylval.val = atof(yytext); printf( "Float en léxico: %s (%f)\n", yytext,yylval.val) ; return FLOAT;}

"\n"      		
"\t"		



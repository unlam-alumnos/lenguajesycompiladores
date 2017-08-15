%{
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include "y.tab.h"
FILE  *yyin;
int yylval;

%}
%option noyywrap  
%option yylineno 

DIGITO			[0-9]
LETRA			[a-zA-Z]
COMA                    [","]
CONST_STR               "({LETRA}|{DIGITO}|.)+"
COMENTARIOS             //({LETRA}|{DIGITO}|.)+//
CONST_REAL              {DIGITO}+"."{DIGITO}+
CONST_INT               {DIGITO}+
ID			{LETRA}({LETRA}|{DIGITO}|_)*
OP_COMPARACION          ["<"|"="|">"|"<="|">="|"><"]
OP_SURES                ["+"|"-"]
OP_MULTDIV              ["*"|"/"]
OP_AS   		[":="]
OP_LOG                  ["and"|"or"|"not"]
C_A                     ["["]
C_C                     ["]"]
P_A                     ["("]
P_C                     [")"]


%%
"program"		{ return PROGRAM;}
"define"		{ return DEFINE;}
"enddefine"		{ return ENDDEFINE;}
"beginp"		{ return BEGINP;}
"endp"		{ return ENDP;}
"real"		{ return REAL;}
"integer"		{ return INTEGER;}
"string"		{ return STRING;}
"if"			{ return IF;}
"then"   		{ return THEN;}
"else"   		{ return ELSE;}
"endif"	      { return ENDIF;}
"for"			{ return FOR;}
"to"		      { return TO;}
"do"	         	{ return DO;}
"endfor"		{ return ENDFOR;}
"while"	      {return WHILE;}
"in"	         	{return IN;}
"endw"  		{ return ENDW;}
"repeat"		{ return REPEAT;}
"until"		{ return UNTIL;}
":="			{ return OP_AS;}
"+"			{ return OP_SURES;}
"-"			{ return OP_SURES;}
"*"			{ return OP_MULTDIV;}
"/"			{ return OP_MULTDIV;}
"("			{ return P_A;}
")"			{ return P_C;}
">"                     { return OP_COMPARACION;}
">="                    { return OP_COMPARACION;}
"<"                     { return OP_COMPARACION;}
"<="                    { return OP_COMPARACION;}
"><"                    { return OP_COMPARACION;}
"="                     { return OP_COMPARACION;}
"and"                   { return OP_LOG;}
"or"                    { return OP_LOG;}
"not"                   { return OP_LOG;}
{ID}			{ return ID;}
{CONST_INT}		{ return CONST_INT;}
{CONST_STR}		{ return CONST_STR;}
{CONST_REAL}		{ return CONST_REAL;}
{COMA}		{ return COMA;}

"\n"      		
"\t"		




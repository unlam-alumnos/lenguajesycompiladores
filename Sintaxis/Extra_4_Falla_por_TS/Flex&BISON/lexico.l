%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE  *yyin;
%}

%option noyywrap
%option yylineno

DIGITO			      [0-9]
LETRA			        [a-zA-Z]
CTE               {DIGITO}+
ID			          {LETRA}({LETRA}|{DIGITO}|_)*
OP_AS   		      ":="
OP_SUMA           "+"
TIPO_ENTERO       "INT"

%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}           { return OP_SUMA;  }
{TIPO_ENTERO}       { return TIPO_ENTERO;  }

{ID}			{ yylval.str_val = yytext; return ID; }
{CTE}		  { yylval.intval = atoi(yytext); return CTE; }

"\n"
"\t"

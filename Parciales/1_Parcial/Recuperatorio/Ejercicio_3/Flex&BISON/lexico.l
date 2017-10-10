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
OP_MUL            "*"
OP_RES            "-"

%%
{OP_AS}			        { return OP_AS;    }
{OP_MUL}         		{ return OP_MUL;   }
{OP_RES}         	  { return OP_RES;   }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

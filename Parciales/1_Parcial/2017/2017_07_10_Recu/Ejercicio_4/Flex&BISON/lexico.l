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

OP_SUMA           "+"
OP_RESTA          "-"
OP_MULTI          "*"
OP_DIVISION       "/"

%%
{OP_SUMA}            { return OP_SUMA;     }
{OP_RESTA}           { return OP_RESTA;    }
{OP_MULTI}           { return OP_MULTI;    }
{OP_DIVISION}        { return OP_DIVISION; }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

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
OP_AS   		      "="
PYC               ";"
COMM              "//".*
MULTI_COMM        "/*".*"*/"

%%
{OP_AS}			        { return OP_AS;  }
{PYC}         			{ return PYC;    }
{COMM}              /* IGNORAR COMENTARIOS */
{MULTI_COMM}        /* IGNORAR COMENTARIOS */

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

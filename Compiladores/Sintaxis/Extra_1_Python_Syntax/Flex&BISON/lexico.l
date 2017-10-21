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
P_A               "("
P_C               ")"
PYC               ";"
PP                ":"
DEF               "def"
GLOBAL            "global"
NON_LOCAL         "nonlocal"


%%
{DEF}		            { return DEF;               }
{GLOBAL}   		      { return GLOBAL;            }
{NON_LOCAL}   		  { return NON_LOCAL;         }

{OP_AS}			        { return OP_AS;             }

{P_A}         			{ return P_A;               }
{P_C}         			{ return P_C;               }
{PYC}         			{ return PYC;               }
{PP}           			{ return PP;                }

{ID}			{ yylval.str_val = yytext; /*printf( "ID: %s\n", yylval.str_val) ;*/ return ID;}
{CTE}		  { yylval.intval = atoi(yytext); /*printf( "CTE: %d\n", yylval.intval) ;*/ return CTE;}

"\n"
"\t"

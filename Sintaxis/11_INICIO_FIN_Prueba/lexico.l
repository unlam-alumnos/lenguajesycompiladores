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
OP_MULTIPLICACION "*"
OP_DIVISION       "/"
OP_AS   		      ":="
P_A               "("
P_C               ")"
PYC               ";"
INICIO            "INICIO"
FIN               "FIN"


%%
{INICIO}		        { return INICIO;            }
{FIN}   		        { return FIN;               }

{OP_AS}			        { return OP_AS;             }
{OP_SUMA}		        { return OP_SUMA;           }
{OP_RESTA}		      { return OP_RESTA;          }
{OP_MULTIPLICACION} { return OP_MULTIPLICACION; }
{OP_DIVISION}       { return OP_DIVISION;       }

{P_A}         			{ return P_A;               }
{P_C}         			{ return P_C;               }
{PYC}         			{ return PYC;               }

{ID}			{ yylval.str_val = yytext; printf( "ID: %s\n", yylval.str_val) ; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); printf( "CTE: %d\n", yylval.intval) ; return CTE;}

"\n"
"\t"

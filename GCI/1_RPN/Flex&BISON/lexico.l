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
P_A               "("
P_C               ")"
OP_SUMA           "+"
OP_RESTA          "-"
OP_MULT           "*"
OP_DIVIS          "/"
PROM              "prom"
COMA              ","


%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}			      { return OP_SUMA;  }
{OP_MULT}			      { return OP_MULT;  }
{OP_RESTA}			    { return OP_RESTA; }
{OP_DIVIS}		      { return OP_DIVIS; }
{P_A}         			{ return P_A;      }
{P_C}         			{ return P_C;      }
{PROM}         			{ return PROM;     }
{COMA}         			{ return COMA;     }


{ID}			{ yylval.str_val = yytext; printf("insertar_en_polaca(%s)\n", yytext); return ID;}
{CTE}		  { yylval.intval = atoi(yytext); printf("insertar_en_polaca(%s)\n", yytext); return CTE;}

"\n"
"\t"

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
PYC               ";"

%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}			      { return OP_SUMA;  }
{OP_MULT}			      { return OP_MULT;  }
{OP_RESTA}			    { return OP_RESTA; }
{OP_DIVIS}		      { return OP_DIVIS; }
{P_A}         			{ return P_A;      }
{P_C}         			{ return P_C;      }
{PYC}         			{ return PYC;      }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

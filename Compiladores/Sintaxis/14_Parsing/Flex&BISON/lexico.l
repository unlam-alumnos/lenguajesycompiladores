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

ASIG    		      ":="
PYC    		        ";"
P_A    		        "("
P_C        		    ")"
OP_SUMA           "+"
OP_REST           "-"
OP_DIVI           "/"
OP_MULT           "*"

%%
{ASIG}   		      { return ASIG;    }
{PYC}   		      { return PYC;     }
{P_A}			        { return P_A;     }
{P_C}			        { return P_C;     }
{OP_SUMA}         { return OP_SUMA; }
{OP_MULT}         { return OP_MULT; }
{OP_REST}         { return OP_REST; }
{OP_DIVI}         { return OP_DIVI; }

{ID}			        { yylval.str_val = yytext; return ID;}
{CTE}		          { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

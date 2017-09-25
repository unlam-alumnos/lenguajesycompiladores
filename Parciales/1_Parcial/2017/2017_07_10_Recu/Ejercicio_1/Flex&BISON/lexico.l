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
ASIG              "=>"
INT               "Integer"
OF                "of"
ARRAY             "array"
PYC               ";"
COMA              ","
PP                ".."
DP                ":"
OTHERS            "others"

%%
{OP_AS}			        { return OP_AS;    }
{P_A}         			{ return P_A;      }
{P_C}         			{ return P_C;      }
{ASIG}         			{ return ASIG;     }
{INT}         			{ return INT;      }
{OF}         		   	{ return OF;       }
{ARRAY}         		{ return ARRAY;    }
{PYC}           		{ return PYC;      }
{COMA}           		{ return COMA;     }
{PP}           		  { return PP;       }
{DP}           		  { return DP;       }
{OTHERS}            { return OTHERS;   }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

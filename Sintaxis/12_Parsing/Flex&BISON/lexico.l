%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE  *yyin;
%}

%option noyywrap
%option yylineno

OP_AS   		      ":="
COMA    		      ","
ID                "id"
EXP               "exp"
FIN               "fin"


%%
{FIN}   		        { return FIN;               }
{COMA}   		        { return COMA;              }
{OP_AS}			        { return OP_AS;             }
{EXP}         			{ return EXP;               }
{ID}           			{ return ID;                }

"\n"
"\t"

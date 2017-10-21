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
CORCH_A    		    "["
CORCH_C    		    "]"
ID                "id"
CTE               "cte"
OP_SUM            "+"
OP_MUL            "*"


%%
{OP_AS}   		      { return OP_AS;             }
{COMA}   		        { return COMA;              }
{CORCH_A}			      { return CORCH_A;           }
{CORCH_C}			      { return CORCH_C;           }
{ID}           			{ return ID;                }
{CTE}           	  { return CTE;               }
{OP_SUM}           	{ return OP_SUM;            }
{OP_MUL}           	{ return OP_MUL;            }

"\n"
"\t"

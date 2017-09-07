%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE  *yyin;
%}

%option noyywrap
%option yylineno

OP_AS   		      ":="
ID                "id"
CTE               "cte"


%%
{OP_AS}			        { return OP_AS;             }
{CTE}         			{ return CTE;               }
{ID}           			{ return ID;                }

"\n"
"\t"

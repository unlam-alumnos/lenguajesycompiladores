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
FOR               "FOR"
FOREND            "FOREND"
OP_SUMA           "+"
OP_MULT           "*"
OP_TO             "TO"
LL_A              "{"
LL_C              "}"

%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}			      { return OP_SUMA;  }
{OP_MULT}			      { return OP_MULT;  }
{FOR}      		      { return FOR;      }
{FOREND}      		  { return FOREND;   }
{OP_TO}      		    { return OP_TO;    }
{LL_A}      		    { return LL_A;     }
{LL_C}      		    { return LL_C;     }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

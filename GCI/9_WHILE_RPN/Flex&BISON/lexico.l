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
WHILE             "WHILE"
END               "END"
OP_SUMA           "+"
OP_MULT           "*"
OP_COMP           "<="

%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}			      { return OP_SUMA;  }
{OP_MULT}			      { return OP_MULT;  }
{WHILE}      		    { return WHILE;    }
{END}      		      { return END;      }
{OP_COMP}      		  { return OP_COMP;  }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

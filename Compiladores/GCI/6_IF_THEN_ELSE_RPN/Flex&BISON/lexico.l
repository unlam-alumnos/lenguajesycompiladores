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
IF                "IF"
THEN              "THEN"
ELSE              "ELSE"
ENDIF             "ENDIF"
OP_SUMA           "+"
OP_MULT           "*"
OP_MENOR          "<"

%%
{OP_AS}			        { return OP_AS;    }
{OP_SUMA}			      { return OP_SUMA;  }
{OP_MULT}			      { return OP_MULT;  }
{OP_MENOR}			    { return OP_MENOR; }
{IF}      		      { return IF;       }
{THEN}      		    { return THEN;     }
{ELSE}      		    { return ELSE;     }
{ENDIF}      		    { return ENDIF;    }

{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"

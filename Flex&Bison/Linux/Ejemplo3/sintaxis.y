
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yystopparser=0;
FILE  *yyin;
int yylex();
int yyerror(char *);
%}

%union {
int intval;
double val;
char *str_val;
}

%token <str_val>ID
%token <int>ENTERO
%token <double>FLOAT
%token <str_val>STRING

%token OP_SUMA OP_RESTA OP_MUL OP_DIV ASIG P_A P_C PUNTO_Y_COMA

%%
programa			:			program {printf("Compilacion OK\n");}
program				:			sentencia | program sentencia;
sentencia			: 		asignacion;

asignacion : ID ASIG asignacion { printf("asignacion\n"); } | ID ASIG exp PUNTO_Y_COMA { printf("asignacion\n "); };

exp:
	term {printf("regla exp es termino\n "); }
	|exp OP_SUMA term { printf("regla exp es suma\n ");}
	| exp OP_RESTA term

	;
term:
	term OP_MUL factor
	|term OP_DIV factor
	| factor { printf("regla termino es factor\n ");}
	;
factor:
	ID {printf( "En regla factor es ID, yylval: %s\n", yylval.str_val);}
	|ENTERO {printf( "En regla factor es ENTERO, $1: %d\n", $<intval>1);}
	|FLOAT {$<val>$ = $<val>1; printf( "En regla factor es FLOAT, $$: %f\n", $<val>$);printf( "En regla factor es FLOAT, $1: %f\n", $<val>1);}
	|STRING {$<str_val>$ = $<str_val>1; printf( "En regla factor es STRING, $$: %s\n", $<val>$); printf( "En regla factor es STRING, $1: %s\n", $<str_val>1);}
	|P_A exp P_C
	;
%%

int main(int argc,char *argv[])
{
  if ((yyin = fopen(argv[1], "rt")) == NULL)
  {
	printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  }
  else
  {
	yyparse();
  }
  fclose(yyin);
  return 0;
}
int yyerror(char * err)
     {
       printf("Syntax Error\n");
	 exit (1);
     }

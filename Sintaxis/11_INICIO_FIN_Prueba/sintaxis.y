%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;
int yylex();
int yyerror(char *);
%}

%union {
int intval;
char *str_val;
}

%token <intval>CTE
%token <str_val>ID

%token INICIO
%token FIN
%token OP_AS
%token OP_SUMA
%token OP_RESTA
%token OP_MULTIPLICACION
%token OP_DIVISION
%token P_A
%token P_C
%token PYC

%start A

%%

A  : P																						;
P  :
			INICIO {printf("Inicio COMPILADOR\n");}
			B
			FIN	{printf("Fin COMPILADOR ok\n");}
			;

B  : S																						;
B  : B S																					;

S  : ID OP_AS S																		;
S  : ID OP_AS E PYC																;

E  : E OP_SUMA T | T															;
T  : T OP_MULTIPLICACION F | T OP_DIVISION F | F	;
F  : ID | CTE | P_A E P_C													;

%%

int main(int argc,char *argv[]) {
  if ((yyin = fopen(argv[1], "rt")) == NULL) {
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  } else {
		yyparse();
  }

  fclose(yyin);
  return 0;
}

int yyerror(char * err) {
	printf("\nSyntax Error. %s\n", err);
	exit(1);
}

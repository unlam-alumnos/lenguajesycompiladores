%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;

char *aux;
int limite = 0;
int cont = 0;

int yylex();
int yyerror(char *);
%}

%union {
int intval;
char *str_val;
}

%token <intval>CTE
%token <str_val>ID

%token OP_SUMA
%token OP_RESTA
%token OP_MULTI
%token OP_DIVISION

%start S

%%

S  : E;

E  : E OP_SUMA T;
E  : E OP_RESTA T;
E  : T;

T  : T OP_MULTI F;
T  : T OP_DIVISION F;
T  : F;

F  : ID;
F  : CTE;

%%

int main(int argc,char *argv[]) {
  if ((yyin = fopen(argv[1], "rt")) == NULL) {
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  } else {
    printf("\n");
		yyparse();
    printf("\n\n");
  }

  fclose(yyin);
  return 0;
}

int yyerror(char * err) {
	printf("\nSyntax Error. %s\n", err);
	exit(1);
}

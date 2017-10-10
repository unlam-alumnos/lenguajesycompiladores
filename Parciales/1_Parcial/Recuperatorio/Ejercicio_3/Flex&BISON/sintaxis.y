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

%token OP_AS
%token OP_MUL
%token OP_RES

%start S

%%

S  : A ;
A  : ID { printf("b\n"); } OP_AS E { printf("=\n"); } ;
E  : CTE OP_RES CTE { printf("res\n"); } | E OP_RES T { printf("-\n"); }| T ;
T  : CTE OP_MUL CTE { printf("15\n"); }| T OP_MUL F { printf("*\n"); }| F ;
F  : ID { printf("id\n"); } | CTE { printf("cte\n"); } ;

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

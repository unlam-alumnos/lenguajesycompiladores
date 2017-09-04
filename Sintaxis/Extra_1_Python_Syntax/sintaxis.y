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

%token DEF
%token GLOBAL
%token NON_LOCAL
%token OP_AS
%token P_A
%token P_C
%token PYC
%token PP

%start P

%%

P : C;

C : C B;
C : B;

B : A | D;

A : GLOBAL ID PYC | NON_LOCAL ID PYC;
A : ID OP_AS ID PYC | ID OP_AS CTE PYC;

D : DEF ID P_A P_C PP;

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

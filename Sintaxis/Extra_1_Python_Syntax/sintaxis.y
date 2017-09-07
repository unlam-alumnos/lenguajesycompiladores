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

%start S

%%

S : C                                     { printf("0,");} ;

C : C B                                   { printf("1,");} ;
C : B                                     { printf("2,");} ;

B : A                                     { printf("3,");} ;
B : D                                     { printf("4,");} ;

A : GLOBAL ID PYC                         { printf("5,");} ;
A : NON_LOCAL ID PYC                      { printf("6,");} ;
A : ID OP_AS ID PYC                       { printf("7,");} ;
A : ID OP_AS CTE PYC                      { printf("8,");} ;

D : DEF ID P_A P_C PP                     { printf("9,");} ;

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

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

%token ASIG
%token P_A
%token P_C
%token OP_SUMA
%token OP_REST
%token OP_MULT
%token OP_DIVI
%token PYC

%start S

%%

S : P                             { printf("0,"); } 	;
P : ID ASIG E PYC                 { printf("1,"); } 	;
E : E OP_SUMA T                   { printf("2,"); } 	;
E : E OP_REST T                   { printf("3,"); } 	;
E : T                             { printf("4,"); } 	;
T : T OP_MULT F                   { printf("5,"); } 	;
T : T OP_DIVI F                   { printf("6,"); } 	;
T : F                             { printf("7,"); } 	;
F : ID                            { printf("8,"); } 	;
F : CTE                           { printf("9,"); } 	;
F : P_A E P_C                     { printf("10,"); } 	;

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

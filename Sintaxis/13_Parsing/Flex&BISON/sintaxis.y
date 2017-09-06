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


%token CORCH_C
%token CORCH_A
%token OP_AS
%token CTE
%token ID
%token COMA
%token OP_SUM
%token OP_MUL

%start S

%%

S  : A							 	                        ;
A  : CORCH_A L CORCH_C OP_AS CTE	{ printf("1,"); } 	;
L  : L COMA E				              { printf("2,"); } 	;
L  : E							              { printf("3,"); } 	;
E  : E OP_SUM ID		              { printf("4,"); } 	;
E  : E OP_MUL ID		              { printf("5,"); } 	;
E  : ID		                        { printf("6,"); } 	;

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

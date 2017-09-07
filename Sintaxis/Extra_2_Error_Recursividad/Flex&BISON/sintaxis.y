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


%token OP_AS
%token CTE
%token ID

%start S

%%

S  : A							 	                        ;
A  : L CTE					{ printf("1,"); } 	;
L  : L ID OP_AS		  { printf("2,"); } 	;
L  : ID	OP_AS				{ printf("3,"); } 	;

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

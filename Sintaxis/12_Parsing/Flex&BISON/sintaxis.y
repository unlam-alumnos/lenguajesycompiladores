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


%token FIN
%token OP_AS
%token EXP
%token ID
%token COMA

%start S

%%

S  : P							 	                        ;
P  : L FIN					{ printf("1,"); } 	;
L  : L COMA I				{ printf("2,"); } 	;
L  : I							{ printf("3,"); } 	;
I  : ID OP_AS EXP		{ printf("4,"); } 	;

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

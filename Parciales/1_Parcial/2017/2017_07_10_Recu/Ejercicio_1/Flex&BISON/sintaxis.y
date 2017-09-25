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
%token P_A
%token P_C
%token ASIG
%token INT
%token OF
%token ARRAY
%token PYC
%token COMA
%token PP
%token DP
%token OTHERS

%start S

%%

S  :  A {printf("%d", cont);} ;

A  : ID DP ARRAY P_A CTE PP CTE { printf("%d", yylval.intval); limite = yylval.intval;} P_C OF INT OP_AS P_A X P_C PYC ;

X  : E { if (cont > limite) { printf("Se te fue de mambo.\n"); exit(1); }} ;

X  : L ;

E  : E COMA CTE { cont++; };

E  : CTE { cont++; };

L  : L COMA F ;

L  : L COMA OTHERS ASIG CTE ;

L  : F ;

F  : CTE ASIG CTE ;

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

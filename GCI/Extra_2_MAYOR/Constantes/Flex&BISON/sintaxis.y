%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;
int mayor;
int yylex();
int yyerror(char *);
%}

%union {
int intval;
char *str_val;
}

%token <intval>CTE
%token <str_val>ID

%token COMA
%token OP_AS
%token MAYOR
%token PARA
%token PARC

%start S

%%

S    : P                           ;

P    : _ID OP_AS MAYOR PARA L PARC {
                                      printf("1. insertar_en_polaca(%d)\n", mayor);
                                      printf("3. insertar_en_polaca(:=)\n");
                                   };

L    : CTE                         {
                                      mayor = yylval.intval;
                                   };

L    : L COMA CTE                  {
                                      if (yylval.intval > mayor) {
                                        mayor = yylval.intval;
                                      }
                                   };

_ID  : ID                          {
                                      printf("2. insertar_en_polaca(%s)\n", yylval.str_val);
                                   }

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

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;
int yylex();
int yyerror(char *);

int mayor;
char *aux;
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

P    : ID                          {
                                      aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                      strcpy(aux, yylval.str_val);
                                      printf("insertar_en_polaca(%s)\n", aux);
                                   }
       OP_AS MAYOR PARA L PARC     {
                                      printf("insertar_en_polaca(%d)\n", mayor);
                                      printf("insertar_en_polaca(:=)\n");
                                   };

L    : CTE                         {
                                      mayor = yylval.intval;
                                   };

L    : L COMA CTE                  {
                                      if (yylval.intval > mayor) {
                                        mayor = yylval.intval;
                                      }
                                   };

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

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;

char *aux;

int yylex();
int yyerror(char *);
%}

%union {
int intval;
char *str_val;
}

%token <intval>CTE
%token <str_val>ID

%token PYC
%token OP_SUMA
%token OP_RESTA
%token OP_MULT
%token OP_DIVIS
%token OP_AS
%token P_A
%token P_C

%start S

%%

S  : P                                    {
                                            printf("Sp = Pp\n");
                                          };
P  : _ID
     OP_AS P                              {
                                            printf("Pp = crearNodo(':=', crearHoja(%s), Pp)\n", aux);
                                          };

P  : _ID
     OP_AS E PYC                          {
                                            printf("Pp = crearNodo(':=', crearHoja(%s), Ep)\n", aux);
                                          };

E : E OP_SUMA T                           {
                                            printf("Ep = crearNodo('+', Ep, Tp)\n");
                                          }
  | E OP_RESTA T                          {
                                            printf("Ep = crearNodo('-', Ep, Tp)\n");
                                          }
  | T                                     {
                                            printf("Ep = Tp\n");
                                          };

T : T OP_MULT F                           {
                                            printf("Tp = crearNodo('*', Tp, Fp)\n");
                                          }
  | T OP_DIVIS F                          {
                                            printf("Tp = crearNodo('/', Tp, Fp)\n");
                                          }
  | F                                     {
                                            printf("Tp = Fp\n");
                                          };

F : ID                                    {
                                            aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                            strcpy(aux, yylval.str_val);
                                            printf("Fp = crearHoja(%s)\n", aux);
                                          }
  | CTE                                   {
                                            printf("Fp = crearHoja(%d)\n", yylval.intval);
                                          }
  | P_A E P_C                             {
                                            printf("Fp = Ep\n");
                                          };

_ID : ID                                  {
                                            aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                            strcpy(aux, yylval.str_val);
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

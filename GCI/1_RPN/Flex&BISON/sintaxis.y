%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;

char *aux;
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

%token PROM
%token COMA
%token OP_SUMA
%token OP_RESTA
%token OP_MULT
%token OP_DIVIS
%token OP_AS
%token P_A
%token P_C

%start S

%%

S : A                                     ;

A : ID                                    {
                                            aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                            strcpy(aux, yylval.str_val);
                                            printf("insertar_en_polaca(%s)\n", aux);
                                          }

    OP_AS P                               {
                                            printf("insertar_en_polaca(%d)\n", cont);
                                            printf("insertar_en_polaca(/)\n");
                                            printf("insertar_en_polaca(:=)\n");
                                          };

P : PROM P_A L P_C                        ;

L : L COMA E                              {
                                            cont++;
                                            printf("insertar_en_polaca(+)\n");
                                          }
  | E                                     {
                                            cont++;
                                          };

E : E OP_SUMA T                           {
                                            printf("insertar_en_polaca(+)\n");
                                          }
  | E OP_RESTA T                          {
                                            printf("insertar_en_polaca(-)\n");
                                          }
  | T                                     ;

T : T OP_MULT F                           {
                                            printf("insertar_en_polaca(*)\n");
                                          }
  | T OP_DIVIS F                          {
                                            printf("insertar_en_polaca(/)\n");
                                          }
  | F                                     ;

F : ID                                    {
                                            aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                            strcpy(aux, yylval.str_val);
                                            printf("insertar_en_polaca(%s)\n", aux);
                                          }
  | CTE                                   {
                                              printf("insertar_en_polaca(%d)\n", yylval.intval);
                                          }
  | P_A E P_C                             ;

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

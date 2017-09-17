%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;

char *aux;
char *i;

int yylex();
int yyerror(char *);
%}

%union {
int intval;
char *str_val;
}

%token <intval>CTE
%token <str_val>ID

%token OP_SUMA
%token OP_MULT
%token OP_TO
%token OP_AS
%token FOR
%token FOREND
%token LL_A
%token LL_C

%start S

%%

S  : P

P  : P Q | Q

Q  : F | A

F  : FOR I LL_A P LL_C FOREND             {
                                            printf("%s\n", i);
                                            printf("1\n");
                                            printf("+\n");
                                            printf("%s\n", i);
                                            printf(":=\n");
                                            printf("BI\n");
                                            printf("###\n");
                                          }

I  : _ID                                  {
                                            i = (char *) malloc(sizeof(char) * (strlen(aux) + 1));
                                            strcpy(i, aux);
                                            printf("%s\n", i);
                                          }
     OP_AS CTE                            {
                                            printf("%d\n", yylval.intval);
                                            printf(":=\n");
                                          }
     OP_TO CTE                            {
                                            printf("%s\n", i);
                                            printf("%d\n", yylval.intval);
                                            printf("CMP\n");
                                            printf("BGT\n");
                                            printf("###\n");
                                          }

A  : _ID                                  {
                                            printf("%s\n", aux);
                                          }
     OP_AS E                              {
                                            printf(":=\n");
                                          }

E : E OP_SUMA T                           {
                                            printf("+\n");
                                          }
  | T

T : T OP_MULT F                           {
                                            printf("*\n");
                                          }
  | F

F : _ID                                   {
                                            printf("%s\n", aux);
                                          }
  | CTE                                   {
                                            printf("%d\n", yylval.intval);
                                          }

_ID : ID                                  {
                                            aux = (char *) malloc(sizeof(char) * (strlen(yylval.str_val) + 1));
                                            strcpy(aux, yylval.str_val);
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

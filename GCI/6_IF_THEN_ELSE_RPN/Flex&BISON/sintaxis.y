%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
int yystopparser=0;
FILE *yyin;

char *aux;
int i = 1;

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
%token OP_MENOR
%token OP_AS
%token IF
%token THEN
%token ELSE
%token ENDIF

%start S

%%

S  : P

P  : P Q | Q

Q  : I | A

I  : IF C T P ENDIF
I  : IF C T P E P ENDIF

T  : THEN                                 {
                                            printf("CMP\n"); i++;
                                            printf("BGE\n"); i++;
                                            printf("### %d\n", i); i++;
                                          }

E  : ELSE                                 {
                                            printf("BI\n"); i++;
                                            printf("### %d\n", i); i++;
                                          }

C  : _ID                                  {
                                            printf("%s\n", aux); i++;
                                          }
     OP_MENOR
     CTE                                  {
                                            printf("%d\n", yylval.intval); i++;
                                          }

A  : _ID                                  {
                                            printf("%s\n", aux); i++;
                                          }
     OP_AS E                              {
                                            printf(":=\n"); i++;
                                          }

E : E OP_SUMA T                           {
                                            printf("+\n"); i++;
                                          }
  | T

T : T OP_MULT F                           {
                                            printf("*\n"); i++;
                                          }
  | F

F : _ID                                   {
                                            printf("%s\n", aux); i++;
                                          }
  | CTE                                   {
                                            printf("%d\n", yylval.intval); i++;
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

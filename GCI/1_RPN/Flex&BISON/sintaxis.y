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

/*
S : A                                     { printf("0,");} ;
A : ID OP_AS P                            { printf("1,");} ;
P : PROM P_A L P_C                        { printf("2,");} ;
L : L COMA E | E                          { printf("3,");} ;
E : E OP_SUMA T | E OP_RESTA T | T        { printf("4,");} ;
T : T OP_MULT F | T OP_DIVIS F | F        { printf("5,");} ;
F : ID | CTE | P_A E P_C                  { printf("6,");} ;
*/

/*
S : A                                     { printf("0,");} ;
A : ID OP_AS P                            { printf("1,");} ;
P : PROM P_A L P_C                        { printf("2,");} ;
L : L COMA E                              { printf("3,");} ;
L : E                                     { printf("4,");} ;
E : E OP_SUMA T                           { printf("5,");} ;
E : E OP_RESTA T                          { printf("6,");} ;
E : T                                     { printf("7,");} ;
T : T OP_MULT F                           { printf("8,");} ;
T : T OP_DIVIS F                          { printf("9,");} ;
T : F                                     { printf("10,");} ;
F : ID                                    { printf("11,");} ;
F : CTE                                   { printf("12,");} ;
F : P_A E P_C                             { printf("13,");} ;
*/
/*
S : A                                     { printf("0) \n");} ;
A : ID OP_AS P                            { printf("1) :=\n");} ;
P : PROM P_A L P_C                        { printf("2) prom\n");} ;
L : L COMA E                              { printf("3) ,\n");} ;
L : E                                     { printf("4) \n");} ;
E : E OP_SUMA T                           { printf("5) +\n");} ;
E : E OP_RESTA T                          { printf("6) -\n");} ;
E : T                                     { printf("7) \n");} ;
T : T OP_MULT F                           { printf("8) *\n");} ;
T : T OP_DIVIS F                          { printf("9) /\n");} ;
T : F                                     { printf("10) \n");} ;
F : ID                                    { printf("11) \n");} ;
F : CTE                                   { printf("12) \n");} ;
F : P_A E P_C                             { printf("13) \n");} ;
*/
S : A                                     ;
A : ID OP_AS P                            { printf("insertar_en_polaca(:=)\n");} ;
P : PROM P_A L P_C                        { printf("insertar_en_polaca(prom)\n");} ;
L : L COMA E                              { printf("insertar_en_polaca(,)\n");} ;
L : E                                     ;
E : E OP_SUMA T                           { printf("insertar_en_polaca(+)\n");} ;
E : E OP_RESTA T                          { printf("insertar_en_polaca(-)\n");} ;
E : T                                     ;
T : T OP_MULT F                           { printf("insertar_en_polaca(*)\n");} ;
T : T OP_DIVIS F                          { printf("insertar_en_polaca(/)\n");} ;
T : F                                     ;
F : ID                                    ;
F : CTE                                   ;
F : P_A E P_C                             ;
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

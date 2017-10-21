%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yylval;
int yystopparser = 0;
FILE *yyin;
char *yyltext;
char *yytext;
int yylex();
int yyerror(char *);
%}

%token ID
%token ENTERO OP_SUMA OP_RESTA OP_MUL OP_DIV ASIG P_A P_C

%%
programa   	: asignacion { printf("Compilacion OK\n"); }
;

asignacion 	: ID ASIG expresion
;

expresion		:	termino
							| expresion OP_RESTA termino { printf("Resta OK\n"); }
							| expresion OP_SUMA termino  { printf("Suma OK\n"); }
;

termino			: factor
							| termino OP_MUL factor  { printf("Multiplicacion OK\n"); }
       				| termino OP_DIV factor  { printf("Division OK\n"); }
;

factor			: ID
							| ENTERO { $1 = yylval ; printf("ENTERO es: %d\n", yylval); }
							| P_A expresion P_C
;
%%

int main(int argc,char *argv[]) {
  if ((yyin = fopen(argv[1], "rt")) == NULL) {
		printf("\nNo se puede abrir el archivo: %s\n", argv[1]);
  } else {
		yyparse();
  }
  fclose(yyin);
  return 0;
}

int yyerror(char *error) {
	printf("Syntax Error\n");
	exit (1);
}

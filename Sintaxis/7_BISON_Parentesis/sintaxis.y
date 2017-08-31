%token ID
%token CTE_ENTERA
%token ASIGNACION
%token P_A
%token P_C
%token OP_SUMA
%token OP_RESTA
%token OP_MULTIPLICACION
%token OP_DIVISION

%%

programa                  :	_programa
_programa                 :	ID ASIGNACION expresion

expresion                 : expresion OP_SUMA termino | expresion OP_RESTA termino | termino
termino                   : termino OP_MULTIPLICACION factor | termino OP_MULTIPLICACION factor | factor
factor		                :	ID | CTE_ENTERA | P_A expresion P_C

%%

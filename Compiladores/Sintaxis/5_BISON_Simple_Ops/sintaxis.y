%token ID
%token CTE_ENTERA
%token ASIGNACION
%token OP_SUMA
%token OP_RESTA
%token OP_MULTIPLICACION
%token OP_DIVISION

%%

programa 	:	_programa

_programa :	ID ASIGNACION expresion

expresion : expresion_suma | expresion_resta | expresion_multiplicacion | expresion_division

expresion_suma : factor OP_SUMA factor
expresion_resta : factor OP_RESTA factor
expresion_multiplicacion : factor OP_MULTIPLICACION factor
expresion_division : factor OP_DIVISION factor

factor		:	ID | CTE_ENTERA

%%

/*
 * Parsing Tree
 */

x := a - 5

programa
	_programa
		ID <----------------------------- x
		:= <----------------------------- :=
		expresion
			expresion_resta
				factor
					ID <----------------------- a
				- <-------------------------- -
				factor
					CTE_ENTERA <--------------- 5

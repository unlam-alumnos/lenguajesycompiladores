%token ID
%token CTE_ENTERA
%token ASIGNACION
%token OP_SUMA
%token OP_RESTA
%token OP_MULTIPLICACION
%token OP_DIVISION

%%

programa                  :	_programa
_programa                 :	ID ASIGNACION expresion

expresion                 : expresion_suma | expresion_resta

expresion_suma            : factor OP_SUMA expresion_multiplicacion
expresion_suma            : factor OP_SUMA expresion_division
expresion_suma            : expresion_multiplicacion | expresion_division

expresion_resta           : factor OP_RESTA expresion_multiplicacion
expresion_resta           : factor OP_RESTA expresion_division
expresion_resta           : expresion_multiplicacion | expresion_division

expresion_multiplicacion  : factor OP_MULTIPLICACION factor
expresion_division        : factor OP_DIVISION factor

factor		                :	ID | CTE_ENTERA

%%

/*
 * Parsing Tree - TOP - DOWN
 */

x := a + b * c

programa
  _programa
    ID <----------------------------- x
    := <----------------------------- :=
    expresion
      expresion_suma
        factor
          ID <----------------------- a
        + <-------------------------- +
        expresion_multiplicacion
          factor
            ID <--------------------- b
          * <------------------------ *
          factor
            ID <--------------------- c

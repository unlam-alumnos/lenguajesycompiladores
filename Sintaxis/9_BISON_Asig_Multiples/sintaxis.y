%token ID
%token CTE
%token ASIG
%token P_A
%token P_C
%token OP_SUMA
%token OP_REST
%token OP_MULT
%token OP_DIVI
%token PYC

%%

S  : P
P  : ID ASIG P
P  : ID ASIG E PYC

E  : E OP_SUMA T | E OP_REST T | T
T  : T OP_MULT F | T OP_DIVI F | F
F  : ID | CTE | P_A E P_C

%%

/*
 * Parsing Tree -- TOP - DOWN
 */

actual := promedio := contador := promedio/ 342 + (contador*contador);

S
P
ID = P
ID = ID = P
ID = ID = ID = E                        ;
ID = ID = ID = E        +   T           ;
ID = ID = ID = T        +   T           ;
ID = ID = ID = T  /  F  +   F           ;
ID = ID = ID = F  / CTE + (    E    )   ;
ID = ID = ID = ID / CTE + (    E    )   ;
ID = ID = ID = ID / CTE + (    T    )   ;
ID = ID = ID = ID / CTE + ( T  * F  )   ;
ID = ID = ID = ID / CTE + ( F  * F  )   ;
ID = ID = ID = ID / CTE + ( ID * ID )   ;

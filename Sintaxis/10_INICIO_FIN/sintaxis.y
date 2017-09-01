%token INICIO
%token FIN
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

A  : P
P  : INICIO B FIN

B  : S
B  : B S

S  : ID ASIG P
S  : ID ASIG E PYC

E  : E OP_SUMA T | E OP_REST T | T
T  : T OP_MULT F | T OP_DIVI F | F
F  : ID | CTE | P_A E P_C

%%

DIGITO          [0-9]
LETRA           [a-z]

COMA            [","]
ASIGNACION      [":"]
PUNTO_COMA      [";"]

OP_COMPARACION  ["<"|"="|">"|"<="|">="|"><"]
OP_SUMA_RESTA   ["+"|"-"]
OP_MULT_DIV     ["*"|"/"]

PARENTESIS_A    ["("]
PARENTESIS_C    [")"]
LLAVE_A         ["{"]
LLAVE_C         ["}"]

ID              ({LETRA})+
TIPO_DATO       (Integer|Float)
CONSTANTE_STR   "({LETRA}|{DIGITO}|.)+"
CONSTANTE_REAL  ({DIGITO}+.{DIGITO}+)

DECVAR          ["DECVAR"]
ENDDEC          ["ENDDEC"]
WHILE           ["while"]
WRITE           ["write"]
IF              ["if"]
ELSE            ["else"]

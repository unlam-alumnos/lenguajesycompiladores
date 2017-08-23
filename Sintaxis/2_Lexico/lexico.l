DIGITO          [0-9]
LETRA           [a-z]

COMA            [","]
ASIGNACION      [":"]
PUNTO_COMA      [";"]

ID              ({LETRA})+
TIPO_DATO       (Integer|Float)
CONSTANTE_STR   "({LETRA}|{DIGITO}|.)+"

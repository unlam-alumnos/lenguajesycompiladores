from peachpy import *
from peachpy.x86_64 import *

with Function("Assembly", (), int32_t) as asm_function:
    r1 = GeneralPurposeRegister32()
    aux1 = GeneralPurposeRegister32()

    MOV(r1, 3)
    ADD(r1, 4)
    MOV(aux1, r1)

    RETURN(aux1)

python_function = asm_function.finalize(abi.detect()).encode().load()
print(python_function())

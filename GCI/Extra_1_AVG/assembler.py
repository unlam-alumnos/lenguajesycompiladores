'''

10 20 + 30 + 40 + 4 / a :=

   aux1 30 + 40 + 4 / a :=

        aux2 40 + 4 / a :=

             aux3 4 / a :=

                 aux4 a :=

                      aux5

'''

def main():
    r1 = 0
    aux1 = 0
    aux2 = 0
    aux3 = 0
    aux4 = 0
    aux5 = 0

    r1 = MOV(r1, 10)
    r1 = ADD(r1, 20)
    aux1 = MOV(aux1, r1)

    r1 = MOV(r1, aux1)
    r1 = ADD(r1, 30)
    aux2 = MOV(aux2, r1)

    r1 = MOV(r1, aux2)
    r1 = ADD(r1, 40)
    aux3 = MOV(aux3, r1)

    r1 = MOV(r1, aux3)
    r1 = DIV(r1, 4)
    aux4 = MOV(aux4, r1)

    r1 = MOV(r1, aux4)
    aux5 = MOV(aux5, aux4)

    print aux5

'''
    Util functions
'''

def MOV(a,b):
    a = b
    return a

def ADD(a,b):
    a += b
    return a

def SUB(a,b):
    a -= b
    return a

def MUL(a,b):
    a *= b
    return a

def DIV(a,b):
    a /= b
    return a

main()

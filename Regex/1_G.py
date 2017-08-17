#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    Constante entera de 2 bytes.
    G) Constantes aritméticas enteras. Controlar el rango permitido.
'''

REGEX = (r'^-?('                    # Signo negativo opcional
            + '[0-9]'               #     0 -     9
            + '|[1-9][0-9]{1}'      #    10 -    99
            + '|[1-9][0-9]{2}'      #   100 -   999
            + '|[1-9][0-9]{3}'      #  1000 -  9999
            + '|[1-2][0-9]{4}'      # 10000 - 29999
            + '|3[0-1][0-9]{3}'     # 30000 - 31999
            + '|32[0-6][0-9]{2}'    # 32000 - 32699
            + '|327[0-5][0-9]'      # 32700 - 32759
            + '|3276[0-8]'          # 32760 - 32768
        + ')$');

def main():
    for i in range(-99999, -32768):
        assert RegexUtils.match(REGEX, str(i)) == False
    for i in range(-32768, 32769):
        assert RegexUtils.match(REGEX, str(i)) == True
    for i in range(32769, 99999):
        assert RegexUtils.match(REGEX, str(i)) == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

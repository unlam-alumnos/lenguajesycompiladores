#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    H) Constantes reales con formato xx.xx Controlar el rango permitido.
'''

NUMERO_ENTERO = (r''                    # Signo negativo opcional
            + '[0-9]'               #     0 -     9
            + '|[1-9][0-9]{1}'      #    10 -    99
            + '|[1-9][0-9]{2}'      #   100 -   999
            + '|[1-9][0-9]{3}'      #  1000 -  9999
            + '|[1-2][0-9]{4}'      # 10000 - 29999
            + '|3[0-1][0-9]{3}'     # 30000 - 31999
            + '|32[0-6][0-9]{2}'    # 32000 - 32699
            + '|327[0-5][0-9]'      # 32700 - 32759
            + '|3276[0-7]'          # 32760 - 32767
        + '');

ENTERO = r'(' + NUMERO_ENTERO + ')';
DECIMAL = r'[0-9]{0,2}';
RANGO_ENTEROS = r'(' + ENTERO + '.' + DECIMAL + ')';

REGEX = r'^-?(' + RANGO_ENTEROS + '|(32768.00)' + ')$';

def main():
    assert RegexUtils.match(REGEX, '-32768.01') == False
    assert RegexUtils.match(REGEX, '-32768.00') == True
    assert RegexUtils.match(REGEX, '-32767.99') == True
    assert RegexUtils.match(REGEX, '0.00') == True
    assert RegexUtils.match(REGEX, '32767.99') == True
    assert RegexUtils.match(REGEX, '32768.00') == True
    assert RegexUtils.match(REGEX, '32768.01') == False

    print "Ejercicio finalizado con exito!"


if __name__ == "__main__":
    main()

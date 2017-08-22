#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    I) Constantes string de la forma “texto “
'''

REGEX = r'^"[^"]*"$';


def main():
    assert RegexUtils.match(REGEX, '""') == True
    assert RegexUtils.match(REGEX, '" Spaces "') == True
    assert RegexUtils.match(REGEX, '" 91849174912 17823971931 "') == True
    assert RegexUtils.match(REGEX, '" A "') == True
    assert RegexUtils.match(REGEX, '" A ""') == False
    assert RegexUtils.match(REGEX, '" A """') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

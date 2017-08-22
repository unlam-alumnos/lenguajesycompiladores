#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    K) Operadores logicos y operadores aritmeticos basicos
'''

REGEX = r'^==|!=|\+|-|\*|\/|=$';


def main():
    assert RegexUtils.match(REGEX, '==') == True
    assert RegexUtils.match(REGEX, '!=') == True
    assert RegexUtils.match(REGEX, '+') == True
    assert RegexUtils.match(REGEX, '-') == True
    assert RegexUtils.match(REGEX, '*') == True
    assert RegexUtils.match(REGEX, '/') == True
    assert RegexUtils.match(REGEX, '=') == True
    assert RegexUtils.match(REGEX, ')') == False

    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

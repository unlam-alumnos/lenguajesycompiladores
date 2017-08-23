#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    J) Palabras reservadas (IF-WHILE-DECVAR-ENDDEC-INTEGER-FLOAT-WRITE)
'''

REGEX = r'^IF|WHILE|DECVAR|ENDDEC|INTEGER|FLOAT|WRITE$';


def main():
    assert RegexUtils.match(REGEX, 'IF') == True
    assert RegexUtils.match(REGEX, 'WHILE') == True
    assert RegexUtils.match(REGEX, 'DECVAR') == True
    assert RegexUtils.match(REGEX, 'ENDDEC') == True
    assert RegexUtils.match(REGEX, 'INTEGER') == True
    assert RegexUtils.match(REGEX, 'FLOAT') == True
    assert RegexUtils.match(REGEX, 'WRITE') == True
    assert RegexUtils.match(REGEX, 'DO') == False

    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

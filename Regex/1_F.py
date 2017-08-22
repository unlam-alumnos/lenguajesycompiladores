#!/usr/bin/python

from utils.RegexUtils import RegexUtils

'''
    F) Constantes en otras bases como las del lenguaje C
'''

OCTAL = r'0[0-7]*';
HEXA = r'0x[a-fA-F0-9]*';
REGEX = r'^(' + OCTAL + '|' + HEXA + ')$';

def main():
    assert RegexUtils.match(REGEX, '01') == True
    assert RegexUtils.match(REGEX, '08') == False
    assert RegexUtils.match(REGEX, '10') == False
    assert RegexUtils.match(REGEX, '0x1234567890ABCDEF') == True
    assert RegexUtils.match(REGEX, '0x1234567890ABCDEFGHIJKLMNO') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

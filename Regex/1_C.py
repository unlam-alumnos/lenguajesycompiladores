#!/usr/bin/python

from utils.RegexUtils import RegexUtils

REGEX = r'\/\*(\s*|\S*)*\*\/';

def main():
    assert RegexUtils.match(REGEX, '/**/') == True
    assert RegexUtils.match(REGEX, '/* Comentario */') == True
    assert RegexUtils.match(REGEX, '/* ********** */') == True
    assert RegexUtils.match(REGEX, '* ********** */') == False
    assert RegexUtils.match(REGEX, '/* ********** *') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

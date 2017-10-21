#!/usr/bin/python

from utils.RegexUtils import RegexUtils

REGEX = r'[1-9][0-9]{3}';

def main():
    assert RegexUtils.match(REGEX, '1245') == True
    assert RegexUtils.match(REGEX, '8212') == True
    assert RegexUtils.match(REGEX, '420') == False
    assert RegexUtils.match(REGEX, '0027') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

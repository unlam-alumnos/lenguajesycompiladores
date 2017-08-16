#!/usr/bin/python

from utils.RegexUtils import RegexUtils

REGEX = r'[A-Z]{2}[0-9]{3}[A-Z]{2}';

def main():
    assert RegexUtils.match(REGEX, 'AA000XX') == True
    assert RegexUtils.match(REGEX, 'AB212BB') == True
    assert RegexUtils.match(REGEX, 'AB921A2') == False
    assert RegexUtils.match(REGEX, 'FAP821') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

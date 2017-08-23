#!/usr/bin/python

from utils.RegexUtils import RegexUtils

REGEX = r'^([a-zA-Z]{1}|[a-zA-Z]{1}-?([a-zA-Z0-9]+-?)*[^-])$';

def main():
    assert RegexUtils.match(REGEX, 'a') == True
    assert RegexUtils.match(REGEX, 'a-2') == True
    assert RegexUtils.match(REGEX, 'a-a') == True
    assert RegexUtils.match(REGEX, 'a-a-2-3-1-3') == True
    assert RegexUtils.match(REGEX, 'A-') == False
    assert RegexUtils.match(REGEX, '-131-412') == False
    assert RegexUtils.match(REGEX, '131-aaa') == False
    assert RegexUtils.match(REGEX, '-') == False
    assert RegexUtils.match(REGEX, '') == False
    assert RegexUtils.match(REGEX, 'this-is-valid----not-') == False
    assert RegexUtils.match(REGEX, 'this-is-valid----not') == False
    assert RegexUtils.match(REGEX, 'a-a-2-3-------1-3') == False
    assert RegexUtils.match(REGEX, '.') == False
    print "Ejercicio finalizado con exito!"

if __name__ == "__main__":
    main()

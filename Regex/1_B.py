#!/usr/bin/python

import re

REGEX = r'[A-Z]{2}[0-9]{3}[A-Z]{2}';

def main():
    regex_match(REGEX, 'AA000XX');
    regex_match(REGEX, 'AB921A2');
    regex_match(REGEX, 'AB212BB');
    regex_match(REGEX, 'FAP821');

def regex_match(regex, string):
    matchObj = re.match(REGEX, string, re.M|re.I)
    if matchObj:
       print string + " -> SI!"
    else:
       print string + " -> NO!"

if __name__ == "__main__":
    main()

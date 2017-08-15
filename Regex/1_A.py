#!/usr/bin/python

import re

REGEX = r'[1-9][0-9]{3}';

def main():
    regex_match(REGEX, '1245');
    regex_match(REGEX, '8829');
    regex_match(REGEX, '124');
    regex_match(REGEX, '0027');

def regex_match(regex, string):
    matchObj = re.match(REGEX, string, re.M|re.I)
    if matchObj:
       print string + " -> SI!"
    else:
       print string + " -> NO!"

if __name__ == "__main__":
    main()

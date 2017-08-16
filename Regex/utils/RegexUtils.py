import re

class RegexUtils(object):
    @staticmethod
    def match(regex, string):
        matchObj = re.match(regex, string, re.M|re.I)
        if matchObj:
           return True;
        else:
           return False;

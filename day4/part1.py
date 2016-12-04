import re
import sys

from collections import defaultdict

def fill_dict(w, d):
    for c in w: d[c] += 1

def get_id(line):

    chunks = line.split('-')
    cnt = defaultdict(int)

    map(lambda w: fill_dict(w, cnt), chunks[:-1])

    sorted_ch = ""
    for k, v in sorted(cnt.items(), key=lambda (k,v): (-v,k)):
        sorted_ch += k

    regex = re.search('^([0-9]+)\[(.*)\]$', chunks[-1])

    room_id = int(regex.group(1))
    input_ch = regex.group(2)

    if sorted_ch.startswith(input_ch):
        return room_id

    return 0

if __name__=="__main__":
    print sum([get_id(line) for line in sys.stdin])

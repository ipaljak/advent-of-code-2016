import re
import sys

from collections import defaultdict

def fill_dict(w, d):
    for c in w: d[c] += 1

def decoy_filter(line):

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
        return True

    return False

def apply_cipher(n, word):
    return ''.join(map(lambda c: chr(ord('a') + (ord(c) - ord('a') + n) % 26), word))

def decrypt(room):
    chunks = room.split('-')
    room_id = int(re.search('^.*\-([0-9]+)\[(.*)\]$', room).group(1))
    words = map(lambda w: apply_cipher(room_id, w), chunks[:-1]) + [str(room_id)]
    return ' '.join(words)

def main():
    rooms = [line for line in sys.stdin if decoy_filter(line)]
    names = map(lambda room: decrypt(room), rooms)
    print '\n'.join(names)

if __name__=="__main__":
    main()

# -*- coding: utf-8 -*-
import re

f = open('sv.txt')
data = f.read()

# counting
words = {}
for word in list(data):
    words[word] = words.get(word, 0) + 1

# sort by count
d = [(v,k) for k,v in words.items()]
d.sort()
d.reverse()
re_hiragana = re.compile(r'[\u3041-\u3093]')
for count, word in d[:60]:
    print (count, word)

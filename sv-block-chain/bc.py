import hashlib
import json
import http.server
import socketserver
import time
from datetime import datetime
import concurrent.futures
import requests
import random

def _gen_block(arg):
  source_host, data, prev_hash = arg

  now = time.time()
  loc = datetime.fromtimestamp(now)
  timestamp = loc.timestamp()
 
  while True:
    nonce = random.randint(0, 10000000000)
    block = { \
      'timestamp':timestamp, \
      'source_host':source_host, \
      'data':data, \
      'prev_hash': prev_hash,  \
      'nonce':nonce,
    }
    next_hash = hashlib.sha256(bytes(json.dumps(block),'utf8')).hexdigest()

    size = 2
    if next_hash[:size] == '0'*size:
      break
  open('cache/{next_hash}', 'w').write( json.dumps(block, indent=2, ensure_ascii=False) ) 
  print('block:{0}'.format(block))
  print('next_hash:{0}'.format(next_hash))
  return block, next_hash

start_block, next_hash = _gen_block(('http://localhost:8080', 'GMOインターネットグループ スピリットベンチャー宣言 2017.06.06 改定', hashlib.sha256(bytes('0', 'utf8')).hexdigest()))
for line in open('sv/sv.txt'):
  line = line.strip()
  block, next_hash = _gen_block(('http://localhost:8080', line, next_hash) )

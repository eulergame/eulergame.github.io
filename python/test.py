#to support encodings
import io

import os    
from chardet import detect

# get file encoding type
def get_encoding_type(file):
    with open(file, 'rb') as f:
        rawdata = f.read()
    return detect(rawdata)['encoding']

#read input file
with io.open("d:\DeerDevLYFX\Cluster\Agent\AgentServer\AgentServer.cpp", 'r', encoding="cp1252") as file:
  lines = file.read()

print(lines)
#write output file
with io.open("d:\DeerDevLYFX\Cluster\Agent\AgentServer\AgentServer.cpp", 'w', encoding="utf8") as file:
  file.write(lines.encode('utf-8'))
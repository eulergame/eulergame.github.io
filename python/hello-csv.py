print("hello world")
import csv
import numpy
import pandas

with open('e:\eulergame\clusterbin\SceneServer\Scp\Medicament.csv', newline='', encoding='utf-8-sig') as f:
    reader = csv.reader(f)

    print(reader.line_num)
    if csv.Sniffer().has_header:
        next(reader)
    for row in reader:
        print(row[0],row[2]) 
    print(reader.line_num)
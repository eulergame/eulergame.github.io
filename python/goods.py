print("hello world")
import csv
import numpy
import pandas

def readcsv(name, index):
    books_data = pandas.read_csv(name,
                             index_col=index, 
                             skiprows=[1,2], 
                             #nrows=5
                             )
    return pandas.DataFrame(books_data);



df = readcsv('e:\eulergame\clusterbin\SceneServer\Scp\Medicament.csv', 'GoodsID')
print(df[df.GoodsName.str.contains('梅花')])

df2 = readcsv('e:\eulergame\clusterbin\SceneServer\Scp\Equipment.csv', 'ID')
print(df2[df2.GoodsName.str.contains('梅花')])

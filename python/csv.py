﻿print("hello world")
import csv
import numpy
import pandas

#with open('', newline='', encoding='utf-8-sig') as f:
    # Reading CSV file
books_data = pandas.read_csv("e:\eulergame\clusterbin\SceneServer\Scp\Medicament.csv",index_col='GoodsID', 
                             skiprows=[1,2], nrows=5)
 
print("\n\t\tDataframe Using CSV Files \n")
print('---------------------------------------------------------')
 
# Pass books_data as an argument
df = pandas.DataFrame(books_data)
 
print(df)
print(df['GoodsName'])
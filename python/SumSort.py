print("hello world")
import csv
import numpy
import pandas

books_data = pandas.read_csv('d:\\temp\\shit.csv',
                                 low_memory=False,
                                 na_values=['#N/A','#REF!'],
                                 encoding='utf-8'
                                 ) 
df = pandas.DataFrame(books_data)
print(df['余额支付'].sum())

new_df = df.groupby('实例名称')['余额支付'].sum().nlargest(100);
print(new_df)


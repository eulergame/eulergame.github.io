import pyodbc 
import pandas
import sqlalchemy

engine = sqlalchemy.create_engine("mssql+pymssql://sa:Love2019@172.16.1.26:38066/GameMaster")
#cnxn = pyodbc.connect("Driver={ODBC Driver 13 for SQL Server};Server=172.16.1.26,38066;Database=GameMaster;UID=sa;PWD=Love2019;")

def ReadGameCSV(filename, index):
    books_data = pandas.read_csv(filename,
                             index_col=index, 
                             skiprows=[1,2], 
                             ) 
    return pandas.DataFrame(books_data);

df = ReadGameCSV("e:\DeerDev\Bin\Cluster\SceneServer\Scp\Medicament.csv",'GoodsID')

df.to_sql("Medicament", engine) 
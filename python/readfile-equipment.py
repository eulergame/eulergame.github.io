import pyodbc 
import pandas
import sqlalchemy

engine = sqlalchemy.create_engine("mssql+pymssql://sa:Love2019@172.16.1.26:38066/GameMaster")

def ReadGameCSV(filename, index, gameid):
    books_data = pandas.read_csv(filename,
                             index_col=index, 
                             skiprows=[1,2], 
                             low_memory=False
                             ) 
    df = pandas.DataFrame(books_data);
    df["GameID"]=gameid
    return df;

folder = "e:\DeerDev\Bin\Cluster\SceneServer\Scp\\"
gameid=0

csvFile = "Medicament"
df = ReadGameCSV(folder + csvFile + ".csv",'GoodsID',gameid)
df.to_sql(csvFile, engine,if_exists='replace')
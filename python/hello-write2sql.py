import pyodbc 
import pandas
import sqlalchemy

engine = sqlalchemy.create_engine("mssql+pymssql://sa:Love2019@172.16.1.26:38066/GameMaster")
#cnxn = pyodbc.connect("Driver={ODBC Driver 13 for SQL Server};Server=172.16.1.26,38066;Database=GameMaster;UID=sa;PWD=Love2019;")

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
#ReadGameCSV(folder + csvFile + ".csv",'GoodsID',gameid).to_sql(csvFile, engine,if_exists='replace') 

csvFile = "Equipment"
#ReadGameCSV(folder + csvFile + ".csv",'ID',gameid).to_sql(csvFile, engine,if_exists='replace') 

csvFile = "PrizeTable"

df = ReadGameCSV(folder + csvFile + ".csv",'ID',gameid)

for i in range(1,6):
    x = str(i)
    s = df['Goods'+x].str.split('+', expand=True)
    k=0
    df['GoodsID'+x] = s[k];k+=1;
    df['GoodsNum'+x] = s[k];k+=1;
    df['GoodsProbabilityMin'+x] = s[k];k+=1;
    df['GoodsProbabilityMax'+x] = s[k];k+=1;
    df['GoodsVocation'+x] = s[k];k+=1;
    df['GoodsBind'+x] = s[k];k+=1;
    df['GoodsActivityID'+x] = s[k];k+=1;

df.to_sql(csvFile, engine,if_exists='replace')
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

    df['GoodsID'+x] = 0 if s[0].empty else s[0]
    df['GoodsNum'+x] = 0 if s[1].empty else s[1]
    df['GoodsProbabilityMin'+x] = 0 if s[2].empty else s[2]
    df['GoodsProbabilityMax'+x] = 0 if s[3].empty else s[3]
    df['GoodsVocation'+x] = 0 if s[4].empty else s[4]
    df['GoodsBind'+x] = 0 if s[5].empty else s[5]
    df['GoodsActivityID'+x] = 0 if s[6].empty else s[6]

df.to_sql(csvFile, engine,if_exists='replace')
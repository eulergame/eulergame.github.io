import pyodbc 
import pandas
import sqlalchemy
import matplotlib
import numpy
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

csvFile = "PlayerBaseProp"
df = ReadGameCSV(folder + csvFile + ".csv",'Level',gameid)
#df["PowerInc"] = df["HP"] + 20.0*df["PhysicsAttack"] + 20*df["MagicAttack"] + 20*df["PhysicsDefense"]/SUM(LevelExp)
basic = df[['HP','PhysicsAttack','MagicAttack','PhysicsDefense']]
#print(basic)
diff = basic.diff()
#print(diff)
df['PowerInc'] = diff["HP"] + 20*diff["PhysicsAttack"] + 20*diff["MagicAttack"] + 20*diff["PhysicsDefense"]
#print(df['PowerInc'])
#df.to_sql(csvFile, engine,if_exists='replace')
PowerPerExp = df['PowerInc']/df['LevelExp']
print(PowerPerExp)
PowerPerExp.plot()
matplotlib.pyplot.show()
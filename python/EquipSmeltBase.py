import pyodbc 
import pandas
import sqlalchemy
from game import Game

engine = sqlalchemy.create_engine(Game.DB)

folder = "e:\DeerDev\Bin\Cluster\SceneServer\Scp\\"
gameid=0
#装备强化，(ID, SmeltLevel)
#消耗材料 GoodID1, 数量 GoodNumber1
#EquipSmelt.lua
csvFile = "EquipSmeltBase"
df = Game.ReadGameCSV(folder + csvFile + ".csv",'ID',gameid)
df.to_sql(csvFile, engine,if_exists='replace')
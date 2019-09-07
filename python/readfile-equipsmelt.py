import pyodbc 
import pandas
import sqlalchemy
from game import Game

engine = sqlalchemy.create_engine(Game.DB)


folder = "e:\DeerDev\Bin\Cluster\SceneServer\Scp\\"
gameid=0
#装备升星，共四类，生命，攻击，物防，法防
#客户端显示星数：10*[Quality] + [StarNum]
#Quality[0, 20]
#StarNum[0, 10]
#EquipForge.lua
csvFile = "EquipSmelt"
df = Game.ReadGameCSV(folder + csvFile + ".csv",'ID',gameid)
df.to_sql(csvFile, engine,if_exists='replace')
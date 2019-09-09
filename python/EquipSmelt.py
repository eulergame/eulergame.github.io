import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game

#装备升星，共四类，生命，攻击，物防，法防
#客户端显示星数：10*[Quality] + [StarNum]
#Quality[0, 20]
#StarNum[0, 10]
#EquipForge.lua
#升星消耗物品和数量 GoodsID GoodsNum
class EquipSmelt:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "EquipSmelt"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'ID',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace')

    def PowerDiff(self):
        basic = self.df[['HP','Attack', 'PhysicsDefense','MagicDefense']]
        basic = basic.diff()
        self.df['PowerInc'] = Game.POWER_COEF_HP * basic["HP"] + Game.POWER_COEF_ATK * basic["Attack"] + Game.POWER_COEF_PDEF * basic["PhysicsDefense"] + Game.POWER_COEF_MDEF * basic["MagicDefense"] 
        print(self.df)
        #self.df['PowerPerExp'] = self.df['PowerInc']/(self.df['GoodsNum']+1)
        #print(self.df['PowerPerExp'].max())
        #self.df.to_sql(self.csvFile, self.engine,if_exists='replace')
        #PowerPerExp.plot()
        #self.df['PowerPerExp'].plot()
        #matplotlib.pyplot.show()





instance = EquipSmelt()

instance.PowerDiff()
#instance.SaveDB()    
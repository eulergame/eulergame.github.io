﻿import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
#翅膀
class GoodsValue:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "GoodsValue"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'GoodsID',Game.gameid)    

    def SaveDB(self):
        self.df=self.df.drop(self.df.columns[3:5], axis =1)
        print(self.df)
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace')

GoodsValue().SaveDB()   
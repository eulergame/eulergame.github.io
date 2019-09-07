import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game

class EquipQuality:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "EquipQuality"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'EquipQuality',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace')

    
instance = EquipQuality()
instance.SaveDB()    
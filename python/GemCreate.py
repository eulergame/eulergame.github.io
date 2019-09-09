import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
#
class GemCreate:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "GemCreate"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'ID',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace')

    
GemCreate().SaveDB()    
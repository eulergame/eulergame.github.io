import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
#
class Medicament:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "Medicament"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'GoodsID',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace',index=False)
        pk='GoodsID'
        self.engine.execute(f'ALTER TABLE {self.csvFile} alter column {pk} int NOT NULL;')
        self.engine.execute(f'ALTER TABLE {self.csvFile} ADD PRIMARY KEY ({pk})')

    
Medicament().SaveDB()    
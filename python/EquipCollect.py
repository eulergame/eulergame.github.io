﻿import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
#采集 美人 
class EquipCollect:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "EquipCollect"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'ID',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace',index=False)
        pk='ID'
        self.engine.execute(f'ALTER TABLE {self.csvFile} alter column {pk} int NOT NULL;')
        self.engine.execute(f'ALTER TABLE {self.csvFile} ADD PRIMARY KEY ({pk})')

    
EquipCollect().SaveDB()    
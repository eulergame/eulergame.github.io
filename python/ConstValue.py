import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
#洗练
class ConstValue:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "ConstValue"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'Key',Game.gameid)    

    def SaveDB(self):
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace',index=False)
        pk='Key'
        self.engine.execute(f'ALTER TABLE {self.csvFile} alter column [{pk}] int NOT NULL;')
        self.engine.execute(f'ALTER TABLE {self.csvFile} ADD PRIMARY KEY ([{pk}])')

    
ConstValue().SaveDB()    
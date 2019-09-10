import pyodbc 
import pandas
import sqlalchemy
import matplotlib
from game import Game
'''
  UPDATE dbo.GoodsValue
  SET GoodsValue=(SELECT GoodsValue = dbo.Title.Power/6.0 
	FROM dbo.Title 
	LEFT JOIN dbo.Medicament ON Medicament.UseParam1 = Title.ID
	WHERE dbo.Medicament.GoodsID = dbo.GoodsValue.GoodsID
  )
    WHERE GroupID=176  
'''
#称号
class Title:
    engine = sqlalchemy.create_engine(Game.DB)
    csvFile = "Title"
    def __init__(self):
        self.df = Game.ReadGameCSV(Game.folder + self.csvFile + ".csv",'ID',Game.gameid)    

    def SaveDB(self):
        self.df['Power'] = Game.POWER_COEF_HP * self.df["HP"] + Game.POWER_COEF_PATK * self.df["PhysicsAttack"] + Game.POWER_COEF_MATK * self.df["MagicAttack"] + Game.POWER_COEF_PDEF * self.df["PhysicsDefense"] + Game.POWER_COEF_MDEF * self.df["MagicDefense"]
        self.df.to_sql(self.csvFile, self.engine,if_exists='replace',index=False)
        pk='ID'
        self.engine.execute(f'ALTER TABLE {self.csvFile} alter column {pk} int NOT NULL;')
        self.engine.execute(f'ALTER TABLE {self.csvFile} ADD PRIMARY KEY ({pk})')

Title().SaveDB()   
import pyodbc 
import pandas
import sqlalchemy

'''
5星=3级宝石，6星=4级宝石，7星=5级宝石，以此类推
4星=2级宝石
3星=1级宝石
2星=？
1星=？
韦发剑  10:28:39
一二三星没有对应关系不用管

  INSERT INTO [dbo].[GoodsValue]([GoodsID],[GroupID],[GoodsName],[GoodsValue],[GameID])
SELECT GoodsID=ID,dbo.Equipment.GroupID, dbo.Equipment.GoodsName,GoodsValue.GoodsValue,GameID=0 
FROM dbo.Equipment
LEFT JOIN dbo.Medicament ON dbo.equipment.ID -310000 = dbo.Medicament.GoodsID -5000 +2
LEFT JOIN dbo.GoodsValue ON dbo.Medicament.GoodsID=GoodsValue.GoodsID
WHERE ID BETWEEN 310000 AND 310119
AND GoodsValue > 0
'''
engine = sqlalchemy.create_engine("mssql+pymssql://sa:Love2019@172.16.1.26:38066/GameMaster")

def ReadGameCSV(filename, index, gameid):
    books_data = pandas.read_csv(filename,
                             index_col=index, 
                             skiprows=[1,2], 
                             low_memory=False
                             ) 
    df = pandas.DataFrame(books_data);
    df["GameID"]=gameid
    return df;

folder = "e:\DeerDev\Bin\Cluster\SceneServer\Scp\\"
gameid=0
# SubType字段，标识装备类型，如下
# 1头盔 2战甲 3战靴 4护腕
# 5戒指 6项链 10武器 11腰带   
# 8时装
# 20坐骑
# 25仙器
# 27翅膀

#装备属性
#Quality StarNum SmeltLevel SmletExp

# MeltingGoods 提品之后的装备ID
# 提品所需消耗物品ID MeltGoodsID 
# 提品所需消耗物品数量 MeltGoodsNum
# (SmeltID, Quality, StarNum)索引升星表 EquipSmelt

# (SmeltBase, SmeltLevel)索引强化表 EquipSmeltBase

#一个装备，六个空，均可镶嵌钻石
csvFile = "Medicament"
df = ReadGameCSV(folder + csvFile + ".csv",'GoodsID',gameid)
df.to_sql(csvFile, engine,if_exists='replace')
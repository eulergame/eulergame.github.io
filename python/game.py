import pandas

class Game:
    POWER_COEF_HP = 5/5				# 每点生命上限增加战斗力
    POWER_COEF_ATK = 100/5              # 每点攻击增加战斗力
    POWER_COEF_DEF = 200/5				# 每点防御增加战斗力
    POWER_COEF_PATK = 100/5				# 每点物理攻击增加战斗力
    POWER_COEF_MATK = 100/5				# 每点魔法攻击增加战斗力
    POWER_COEF_PDEF = 100/5				# 每点物理防御增加战斗力
    POWER_COEF_MDEF = 100/5				# 每点魔法防御增加战斗力
    POWER_COEF_CRITICAL_STRIKE = 1000/5				# 每点暴击增加战斗力
    POWER_COEF_ANTI_CRITICAL_STRIKE = 1000/5				# 每点防暴增加战斗力
    POWER_COEF_PARRY = 1000/5				# 每点格挡增加战斗力
    POWER_COEF_ANTI_PARRY = 1000/5				# 每点穿透增加战斗力
    POWER_COEF_DODGE = 1000/5				# 每点闪避增加战斗力
    POWER_COEF_HIT = 1000/5				# 每点命中增加战斗力
    POWER_COEF_ARMOR = 0/5				# 每点护甲增加战斗力
    POWER_COEF_ANTI_ARMOR = 0/5				# 每点破甲增加战斗力
    POWER_COEF_DAMAGE_REDUCTION = 100/5				# 每点减伤增加战斗力
    POWER_COEF_DAMAGE_ADD = 100/5				# 每点伤害加深增加战斗力
    POWER_COEF_SPD = 0/5				# 每点移动速度增加战斗力
    POWER_COEF_ATK_DEF = 300/5				# 每点全攻全防增加战斗力

    gameid=0
    folder = "e:\DeerDev\Bin\Cluster\SceneServer\Scp\\"
    DB = "mssql+pymssql://sa:Love2019@172.16.1.26:38066/GameMaster"

    def ReadGameCSV(filename, index, gameid):
        books_data = pandas.read_csv(filename,
                                 #index_col=index, 
                                 skiprows=[1,2], 
                                 low_memory=False,
                                 na_values=['#N/A','#REF!']
                                 ) 
        df = pandas.DataFrame(books_data);
        df["GameID"]=gameid
        return df;

    def ReadGameXlsx(filename, index, gameid):
        books_data = pandas.read_excel(filename,
                                 index_col=index, 
                                 skiprows=[1,2], 
                                 low_memory=False,
                                 na_values=['#N/A','#REF!']
                                 ) 
        df = pandas.DataFrame(books_data);
        df["GameID"]=gameid
        return df;
	DECLARE @MinID nvarchar(50) = 1;
	DECLARE @MaxID nvarchar(50) = 105*70;
	
	INSERT INTO dbo.[GameActor] SELECT * FROM  moky.[DS].dbo.[GameActor] WHERE ActorID BETWEEN @MinID AND @MaxID
	
	INSERT INTO dbo.[GameActor2] SELECT * FROM moky.[DS].dbo.[GameActor2] WHERE ActorID BETWEEN @MinID AND @MaxID
	
	--Identity Column是不能直接复制的，由数据库自动生成
	INSERT INTO dbo.[GameGoods] (UserID,ActorID,IDCard,GoodsID,GoodsQty,Flags,SkepID,Place,ValidTime,Quality,StarNum,SmeltExp,EnchLevel,SoulLevel,SoulExp,Custom,SkillLevel,GoodsType,GemID,EffectID,SmeltLevel,BaseEffectID,AddEffectID,SpecialSkill,GoodsUID,RowStatus,IsOnGround,MdyTime,ModuleID,MasterID,CrtTime) SELECT UserID,ActorID,IDCard,GoodsID,GoodsQty,Flags,SkepID,Place,ValidTime,Quality,StarNum,SmeltExp,EnchLevel,SoulLevel,SoulExp,Custom,SkillLevel,GoodsType,GemID,EffectID,SmeltLevel,BaseEffectID,AddEffectID,SpecialSkill,GoodsUID,RowStatus,IsOnGround,MdyTime,ModuleID,MasterID,CrtTime FROM moky.[DS].dbo.[GameGoods] WHERE ActorID BETWEEN @MinID AND @MaxID
	
	INSERT  INTO dbo.[ActorTitle] (ActorID,TitleID,IsTaken,TitleGetTime,CrtTime,MdyTime) SELECT ActorID,TitleID,IsTaken,TitleGetTime,CrtTime,MdyTime FROM moky.[DS].dbo.[ActorTitle] WHERE ActorID BETWEEN @MinID AND @MaxID 
	
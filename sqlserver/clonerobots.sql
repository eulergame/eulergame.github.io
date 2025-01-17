DECLARE @MinID nvarchar(50) = 1;
DECLARE @MaxID nvarchar(50) = 1;--05*70;

DECLARE @LSName sysname = 'moky';
DECLARE @ServerSrc nvarchar(256) = '111.230.174.50,38065';
DECLARE @ServerDst nvarchar(256) = 'localhost,38065';

DECLARE @cmd nvarchar(4000);
DECLARE @sql nvarchar(max);
DECLARE @TableFullName sysname;
DECLARE @Cols nvarchar(max);

DECLARE @Tables dbo.List_String;
INSERT @Tables
		  SELECT 'dbo.GameActor'		
UNION ALL SELECT 'dbo.GameActor2'	
UNION ALL SELECT 'dbo.GameGoods'		
UNION ALL SELECT 'dbo.ActorTitle'

DECLARE @cs CURSOR;
SET @cs = CURSOR FOR
SELECT * FROM @Tables;

OPEN @cs;
WHILE(1=1)
BEGIN
	FETCH NEXT FROM @cs INTO @TableFullName;
	IF(@@FETCH_STATUS <> 0) BREAK;

	--
	DECLARE @objID nvarchar(50);
	SET @sql='SELECT @objID=objID FROM OPENQUERY('+@LSName+',''SELECT objID=object_id('''''+@TableFullName+''''')'') t';
	EXEC sp_executesql @sql, N'@objID nvarchar(50) out', @objID=@objID OUT;
	SET @sql='SET @Cols=stuff((SELECT '',''+name FROM '+quotename(@LSName)+'.DS.sys.columns WHERE object_id='+@objID+'
		--AND is_computed = 0 AND is_identity = 0
	 FOR XML PATH('''')),1,1,'''')'
	EXEC sp_executesql @sql, N'@Cols nvarchar(max) out', @Cols=@Cols OUT;

	-- bcp out
	SET @cmd='bcp "SELECT '+@Cols+' FROM '+@TableFullName+' WHERE ActorID BETWEEN '+@MinID+' AND '+@MaxID
		+'" queryout "D:\ActorClone.txt" -q -c -t\t -r\n -T -U"sa" -P"DeerGame2017" -S"'+@ServerSrc+'"';
	EXEC xp_cmdshell @cmd;

	-- bcp in
	SET @cmd='bcp "'+@TableFullName+'" in "D:\ActorClone.txt" -q -c -t\t -r\n -U"sa" -P"Love2016" -S"'+@ServerDst+'"';
	--EXEC xp_cmdshell @cmd;

	-- 
	SELECT @cmd = 'del "D:\ActorClone.txt" /f /q';
	--EXEC xp_cmdshell @cmd;
END
CLOSE @cs;

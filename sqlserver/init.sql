
-- 数据库内部设置 <====================================================================================
EXEC sys.sp_configure N'show advanced options', N'1'
RECONFIGURE

-- 代理日志行数上限
-- 2005以上
EXEC sys.sp_configure N'Agent XPs', 1	-- 启用 Agent 的扩展存储过程
RECONFIGURE
EXEC msdb.dbo.sp_set_sqlagent_properties @jobhistory_max_rows=999999, 
		@jobhistory_max_rows_per_job=10000

-- 允许远程使用管理员专用连接
EXEC sys.sp_configure N'remote admin connections', 1
RECONFIGURE

-- 命令行
EXEC sys.sp_configure N'xp_cmdshell', 1
RECONFIGURE

-- OAP
EXEC sys.sp_configure N'Ole Automation Procedures', 1
RECONFIGURE

-- 分布式查询,启用后以允许使用OPENROWSET和OPENDATASOURCE
EXEC sys.sp_configure N'Ad Hoc Distributed Queries', 1
RECONFIGURE

-- 程序集
EXEC sys.sp_configure N'clr enabled', 1
RECONFIGURE

-- SQL邮件
EXEC sys.sp_configure N'Database mail XPs', 1
RECONFIGURE


EXEC sys.sp_configure N'backup compression default', N'1'	-- 压缩备份
RECONFIGURE

--设置可用内存(3--(可用内存-1)G)
--EXEC sys.sp_configure N'min server memory', 3072-- 可不用设置
EXEC sys.sp_configure N'max server memory', 5120
RECONFIGURE


--修改tempdb库大小和增长方式
ALTER DATABASE tempdb MODIFY FILE (NAME='tempdev',SIZE=2000MB,FILEGROWTH=200MB)
ALTER DATABASE tempdb MODIFY FILE (NAME='templog',SIZE=1000MB,FILEGROWTH=200MB)
-- 数据库内部设置 ====================================================================================>
GO

-- 建立Self链接服务器用于解决INSERT EXEC嵌套等问题 <======================================================
DECLARE @InstanceName nvarchar(128) = ISNULL(Convert(nvarchar,SERVERPROPERTY('InstanceName')), 'DEERGAME');
DECLARE @LSName nvarchar(256) = N'Self'
	,@LSDataSrc nvarchar(256) = N'127.0.0.1\'+@InstanceName
	;

IF(EXISTS(SELECT TOP 1 1 FROM master.sys.servers WHERE NAME = @LSName))
BEGIN
	EXEC sp_dropserver @server = @LSName, @droplogins = 'droplogins';
END

IF(NOT EXISTS(SELECT TOP 1 1 FROM master.sys.servers WHERE NAME = @LSName) AND Len(@LSDataSrc) > 1)
BEGIN
	EXEC sp_addlinkedserver @server = @LSName, @srvproduct=N'SQLNCLI', @provider=N'SQLNCLI', @datasrc=@LSDataSrc;
END

IF(EXISTS(SELECT TOP 1 1 FROM master.sys.servers WHERE NAME = @LSName))
BEGIN
	-- 打开RPC
	EXEC sp_serveroption @server=@LSName, @optname=N'rpc', @optvalue=N'true';
	EXEC sp_serveroption @server=@LSName, @optname=N'rpc out', @optvalue=N'true';
END
-- 建立Self链接服务器用于解决INSERT EXEC嵌套问题 ========================================================>
GO
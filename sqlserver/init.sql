
-- ���ݿ��ڲ����� <====================================================================================
EXEC sys.sp_configure N'show advanced options', N'1'
RECONFIGURE

-- ������־��������
-- 2005����
EXEC sys.sp_configure N'Agent XPs', 1	-- ���� Agent ����չ�洢����
RECONFIGURE
EXEC msdb.dbo.sp_set_sqlagent_properties @jobhistory_max_rows=999999, 
		@jobhistory_max_rows_per_job=10000

-- ����Զ��ʹ�ù���Աר������
EXEC sys.sp_configure N'remote admin connections', 1
RECONFIGURE

-- ������
EXEC sys.sp_configure N'xp_cmdshell', 1
RECONFIGURE

-- OAP
EXEC sys.sp_configure N'Ole Automation Procedures', 1
RECONFIGURE

-- �ֲ�ʽ��ѯ,���ú�������ʹ��OPENROWSET��OPENDATASOURCE
EXEC sys.sp_configure N'Ad Hoc Distributed Queries', 1
RECONFIGURE

-- ����
EXEC sys.sp_configure N'clr enabled', 1
RECONFIGURE

-- SQL�ʼ�
EXEC sys.sp_configure N'Database mail XPs', 1
RECONFIGURE


EXEC sys.sp_configure N'backup compression default', N'1'	-- ѹ������
RECONFIGURE

--���ÿ����ڴ�(3--(�����ڴ�-1)G)
--EXEC sys.sp_configure N'min server memory', 3072-- �ɲ�������
EXEC sys.sp_configure N'max server memory', 5120
RECONFIGURE


--�޸�tempdb���С��������ʽ
ALTER DATABASE tempdb MODIFY FILE (NAME='tempdev',SIZE=2000MB,FILEGROWTH=200MB)
ALTER DATABASE tempdb MODIFY FILE (NAME='templog',SIZE=1000MB,FILEGROWTH=200MB)
-- ���ݿ��ڲ����� ====================================================================================>
GO

-- ����Self���ӷ��������ڽ��INSERT EXECǶ�׵����� <======================================================
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
	-- ��RPC
	EXEC sp_serveroption @server=@LSName, @optname=N'rpc', @optvalue=N'true';
	EXEC sp_serveroption @server=@LSName, @optname=N'rpc out', @optvalue=N'true';
END
-- ����Self���ӷ��������ڽ��INSERT EXECǶ������ ========================================================>
GO
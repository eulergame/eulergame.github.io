USE [master]
GO

/****** Object:  LinkedServer [moky669]    Script Date: 2019/7/2 9:58:33 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'moky669', @srvproduct=N'SQLNCLI', @provider=N'SQLNCLI', @datasrc=N'111.230.213.219,38065'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'moky669',@useself=N'False',@locallogin=NULL,@rmtuser=N'sa',@rmtpassword='Love2016'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'collation name', @optvalue=NULL
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'moky669', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO



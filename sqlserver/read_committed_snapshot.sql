--讀取
SELECT name, is_read_committed_snapshot_on,snapshot_isolation_state
FROM sys.databases

--修改
ALTER DATABASE DS SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE; -- 更改已提交读隔离级别默认使用行版本(对于SELECT,类似于NOLOCK)
ALTER DATABASE DS SET ALLOW_SNAPSHOT_ISOLATION ON;	-- 允许快照隔离级别

ALTER DATABASE DSLog SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE; -- 更改已提交读隔离级别默认使用行版本(对于SELECT,类似于NOLOCK)
ALTER DATABASE DSLog SET ALLOW_SNAPSHOT_ISOLATION ON;	-- 允许快照隔离级别

ALTER DATABASE DSUser SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE; -- 更改已提交读隔离级别默认使用行版本(对于SELECT,类似于NOLOCK)
ALTER DATABASE DSUser SET ALLOW_SNAPSHOT_ISOLATION ON;	-- 允许快照隔离级别

ALTER DATABASE Apq_DBA SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE; -- 更改已提交读隔离级别默认使用行版本(对于SELECT,类似于NOLOCK)
ALTER DATABASE Apq_DBA SET ALLOW_SNAPSHOT_ISOLATION ON;	-- 允许快照隔离级别

DBCC Useroptions
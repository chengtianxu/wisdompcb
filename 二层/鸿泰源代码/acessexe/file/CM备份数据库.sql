备份数据库
------------------
--网络备份数据库
--需要创建映象
exec master..xp_cmdshell 'net use z: \\192.168.1.2\财务 "" /user:192.168.1.2\administrator'

--备份；with init覆盖|noinit添加
backup database 库名 to disk='E:\H_BACKUP.bak' with init

--COPY
exec master..xp_cmdshell 'copy E:\H_BACKUP.bak z:'
--完成后删除映射
exec master..xp_cmdshell 'net use z: /delete'
--删除文件
--exec master..xp_cmdshell 'del e:\dict20131014*.bak'

---------------------
EXEC XP_BackupDatabase 'dict'




USE [dict]
GO
/****** Object:  StoredProcedure [dbo].[XP_BackupDatabase]    Script Date: 10/15/2013 11:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[XP_BackupDatabase]    
@databaseName sysname    
AS    
BEGIN    
SET NOCOUNT ON;    
DECLARE @sqlCommand NVARCHAR(1000)    
DECLARE @dateTime NVARCHAR(20)    
SELECT @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') +    
REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')    
exec master..xp_cmdshell 'net use  \\192.168.8.8\exec\aa   "koimy1234" /user:192.168.8.8\koimy' 
SET @sqlCommand = 'BACKUP DATABASE ' + @databaseName +    
' TO DISK = ''\\192.168.8.8\exec\aa\' + @databaseName + @dateTime + '.BAK'''    
EXECUTE sp_executesql @sqlCommand    
SELECT @sqlCommand 
END


-------------------------------
DECLARE @dateTime NVARCHAR(20) 

SELECT @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') +    
REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','') 

DECLARE @databaseName sysname  
SET @databaseName='dict'


exec master..xp_cmdshell 'net use z: \\192.168.1.101\share "" /user:192.168.1.101\administrator'

DECLARE @diskpath VARCHAR(100)
set @diskpath='E:\'+@databaseName+@dateTime+'.bak'

--备份；with init覆盖|noinit添加
backup database dict to disk=@diskpath with init

--COPY
DECLARE  @sqlCommand VARCHAR(100)
SET @sqlCommand='copy '+@diskpath+' z:'
exec master..xp_cmdshell  @sqlCommand
--SELECT @sqlCommand
--完成后删除映射
exec master..xp_cmdshell 'net use z: /delete'
----------------------
declare @sql varchar(500)

select @sql='\\192.168.42.100\xsl\chisbz'+'.bak'

exec master..xp_cmdshell 'net use \\192.168.42.100\xsl 123456/user:sghis\new'

backup database chisbz to disk=@sql

http://bbs.csdn.net/topics/100039432
------------------------------------
--小蔡
USE [sj_v20_live]
GO
/****** Object:  StoredProcedure [dbo].[XP_BackupDatabase]    Script Date: 10/14/2013 17:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[XP_BackupDatabase]    
@databaseName sysname    
AS    
BEGIN    
SET NOCOUNT ON;    
DECLARE @sqlCommand NVARCHAR(1000)    
DECLARE @dateTime NVARCHAR(20)    
SELECT @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),111),'/','') +    
REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')    
SET @sqlCommand = 'BACKUP DATABASE ' + @databaseName +    
' TO DISK = ''D:\database\' + @databaseName + @dateTime + '.BAK'''    
EXECUTE sp_executesql @sqlCommand    
END
----------------------------------------------------------------------------
小余(84783658)  16:56:50
USE [msdb]
GO

/****** Object:  Job [auto_backup_database]    Script Date: 2013-10-14 16:54:42 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]]    Script Date: 2013-10-14 16:54:43 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'auto_backup_database', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'auto_backup_database', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [backup]    Script Date: 2013-10-14 16:54:44 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'backup', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'exec sp_configure ''show advanced options'',1
go
reconfigure;
exec sp_configure ''xp_cmdshell'',1
go
reconfigure;
go

DECLARE @strPath NVARCHAR(200) 
Declare @cmd varchar(200)
select @strPath = convert(NVARCHAR(2),DATEPART(weekday, GetDate() - 1),120) 
--set @strPath = REPLACE(@strPath, ''-'' , '''') 
set @strPath = ''D:\km-db-bak\'' + ''SJ_V20_LIVE_WEEK''+@strPath + ''.bak''
set @cmd=''del ''+@strPath
exec master..xp_cmdshell @cmd

BACKUP DATABASE [SJ_V20_LIVE] TO DISK = @strPath WITH INIT,CHECKSUM,FORMAT,
COMPRESSION, BUFFERCOUNT = 50

exec sp_configure ''xp_cmdshell'',0
go
reconfigure;
go
exec sp_configure ''show advanced options'',0
go
reconfigure;
go', 
		@database_name=N'sj_v20_live', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'schedule every day', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20130409, 
		@active_end_date=99991231, 
		@active_start_time=10100, 
		@active_end_time=235959, 
		@schedule_uid=N'adf15c9a-ca93-447f-b984-ceca28481ca4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO






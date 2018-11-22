if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Data0373]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[Data0373](
	[RKEY] [int] IDENTITY(1,1) NOT NULL,
	[USER_FULL_NAME] [varchar](30) COLLATE Chinese_PRC_CI_AS NULL,
	[USER_LOGIN_NAME] [varchar](15) COLLATE Chinese_PRC_CI_AS NULL,
	[EMPLOYEE_PTR] [int] NULL,
	[NETWORK_ID] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[COMPUTER] [varchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	[ttype] varchar(10) null,
	[LOGIN_TIME] [smalldatetime] NULL
) ON [PRIMARY]

GO

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'EP000_data0073_1' 
	   AND 	  type = 'TR')
    DROP TRIGGER EP000_data0073_1
GO


create TRIGGER [EP000_data0073_1] ON [dbo].[data0073] 
WITH ENCRYPTION
FOR update
AS
set nocount on--Ôö¼Ó¾ä1
if update(computer)
begin
	declare @vpc varchar(100)
	select @vpc=computer from inserted
	if isnull(@vpc,'')<>''
	INSERT INTO [Data0373]
			   ([USER_FULL_NAME]
			   ,[USER_LOGIN_NAME]
			   ,[EMPLOYEE_PTR]
			   ,[NETWORK_ID]
			   ,[COMPUTER]
			   ,[TTYPE]
			   ,[LOGIN_TIME])
	select [USER_FULL_NAME]
			   ,[USER_LOGIN_NAME]
			   ,[EMPLOYEE_PTR]
			   ,[NETWORK_ID]
			   ,[COMPUTER],'In'
			   ,[LOGIN_IN_TIME] 
	FROM inserted

	if isnull(@vpc,'')=''
	INSERT INTO [Data0373]
			   ([USER_FULL_NAME]
			   ,[USER_LOGIN_NAME]
			   ,[EMPLOYEE_PTR]
			   ,[NETWORK_ID]
			   ,[COMPUTER]
			   ,[TTYPE]
			   ,[LOGIN_TIME])
	select [USER_FULL_NAME]
			   ,[USER_LOGIN_NAME]
			   ,[EMPLOYEE_PTR]
			   ,[NETWORK_ID]
			   ,[COMPUTER],'Out'
			   ,getdate() 
	FROM deleted
end
set nocount off
go

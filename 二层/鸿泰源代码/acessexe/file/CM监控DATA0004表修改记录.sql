IF  not EXISTS  (SELECT id   FROM sysobjects    WHERE name = 'Data0004_LOG') 
CREATE TABLE [dbo].[Data0004_LOG](
	[rkey] [int] IDENTITY(1,1) NOT NULL,
	[SEED_MEAN] [varchar](20) NULL,
	[OLD_SEED_VALUE] [varchar](20) NULL,
	[NEW_SEED_VALUE] [varchar](20) NULL,
	[D73RKEY] [int] NULL,
	[SYSTIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[rkey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'HOST_NAME') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'Data0004_LOG'))) 
begin
alter table Data0004_LOG  add  [HOST_NAME] VARCHAR(20) ,[HOST_IP] VARCHAR(20)
end
go  

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'tr_data0004' 
	   AND 	  type = 'TR')
    DROP TRIGGER tr_data0004
GO
CREATE TRIGGER tr_data0004
ON data0004
FOR  UPDATE
AS
BEGIN
	IF 
	    UPDATE (SEED_VALUE) 
	
	BEGIN
		DECLARE @HOSTNAME VARCHAR(10);
		DECLARE @IP_Address VARCHAR(255); 
		DECLARE @OLD_SEED_VALUE VARCHAR(20);
		DECLARE @NEW_SEED_VALUE VARCHAR(20);
		DECLARE @SEED_MEAN VARCHAR(20) ;
		
		SET @HOSTNAME = HOST_NAME()
		SELECT @IP_Address = client_net_address
		FROM   sys.dm_exec_connections
		WHERE  Session_id = @@SPID; 
		
		SELECT @SEED_MEAN = SEED_MEAN,
		       @NEW_SEED_VALUE = SEED_VALUE
		FROM   INSERTED ;
		SELECT @OLD_SEED_VALUE = SEED_VALUE
		FROM   DELETED ;
		
	IF (@NEW_SEED_VALUE<> @OLD_SEED_VALUE) AND  (@SEED_MEAN = '成品入仓单码') 
	BEGIN	
		INSERT INTO [dbo].[Data0004_LOG]
		  (
		    [SEED_MEAN],
		    [OLD_SEED_VALUE],
		    [NEW_SEED_VALUE],
		    [HOST_NAME],
		    [HOST_IP]
		  )
		VALUES
		  (
		    @SEED_MEAN,
		    @OLD_SEED_VALUE,
		    @NEW_SEED_VALUE,
		    @HOSTNAME,
		    @IP_Address
		  )
		  END 
	END
END 



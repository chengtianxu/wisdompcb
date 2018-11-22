--EP215工程报表改为多个报表的
IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'prodflag') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0278'))) 
begin
alter table data0278 add prodflag tinyint default(1) not null
end
go

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'whse_ptr') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0278'))) 
begin
alter table data0278 add whse_ptr int null
end
go

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'whse_ptr') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0007'))) 
begin
alter table data0007 add whse_ptr int null
end
go


if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Data0211]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[DATA0211](
	[RKEY] [int] IDENTITY(1,1) NOT NULL,
	[TTYPE] [tinyint] NULL,
	[BASE_FLAG] [tinyint] NOT NULL DEFAULT ((0)),
	[RPTFMT_NO] [varchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RPTFMT_DESC] [varchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[RPTFMT_FILENAME] [varchar](50) COLLATE Chinese_PRC_CI_AS NULL,
	[LAST_MODIFIED_DATE] [datetime] NULL,
	[LAST_MODIFIED_PTR] [int] NULL,
	[REMARK] [varchar](100) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY]
GO

if not exists(select 1 from sysobjects where name='PK_Data0211')
ALTER TABLE [dbo].[Data0211] WITH NOCHECK ADD 
	CONSTRAINT [PK_Data0211] PRIMARY KEY  CLUSTERED 
	(
		[RKEY]
	)  ON [PRIMARY] 
GO

IF not EXISTS (
SELECT name FROM syscolumns
WHERE (name = 'whse_ptr') AND (id IN
          (SELECT id FROM sysobjects WHERE name = 'data0211'))) 
begin
alter table data0211 add whse_ptr int null
end
go


declare @vnum int
select @vnum=count(*) from data0211 where TTYPE=3
if @vnum=0 
begin
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (3,0,1001,'标准格式','EngReport7.rtm',getdate(),null,'标准格式')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (4,0,1002,'备用格式1','EngReport7_bk1.rtm',getdate(),null,'备用格式1')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (4,0,1003,'备用格式2','EngReport7_bk2.rtm',getdate(),null,'备用格式2')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (5,0,2001,'BOM清单','Engbomlist.rtm',getdate(),null,'BOM清单')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (6,0,1001,'合并格式1','EngReport_7.rtm',getdate(),null,'合并格式1')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (7,0,1002,'作业单(LOT)标准格式','woreport.rtm',getdate(),null,'作业单(LOT)标准格式')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (8,0,1003,'作业单(LOT)备用格式1','woreport2.rtm',getdate(),null,'作业单(LOT)备用格式1')
insert into data0211
           ([TTYPE],[BASE_FLAG] ,[RPTFMT_NO],[RPTFMT_DESC],[RPTFMT_FILENAME],[LAST_MODIFIED_DATE],[LAST_MODIFIED_PTR],[REMARK])
     VALUES (8,0,2001,'作业单(LOT)备用格式2','woreport3.rtm',getdate(),null,'作业单(LOT)备用格式2')
end
     


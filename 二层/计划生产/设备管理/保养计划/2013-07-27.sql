/*if not exists(select t1.name from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='data0831' and t2.name='Main_Empl_ptr')
begin
	ALTER  TABLE data0831 ADD [Main_Empl_ptr] int null--保养用户指针
END 
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保养雇员指针' , @level0type=N'SCHEMA',
@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'data0831', @level2type=N'COLUMN',@level2name=N'Main_Empl_ptr'
GO*/
go
if not Exists   (select * from sysobjects where name= 'Data0848' and type= 'U') -- drop table Data0849 drop table Data0848
  begin
	CREATE TABLE [dbo].[Data0848](
		[rkey] [int] IDENTITY(1,1) NOT NULL,
		[Work_ptr] [int] NOT NULL,
		[WorkDate] [smalldatetime] NOT NULL,
		[BeginTime] [smalldatetime] NOT NULL,
		[EndTime] [smalldatetime] NULL,
		[TimeRest] [decimal](8, 2) NULL,
		[Empl_ptr] [int] NOT NULL,
		[Status] [int] NOT NULL,
		[WorkTime] [decimal](5, 2) NULL,
		[Remark] [varchar](200) NULL,
	 CONSTRAINT [PK_Data0848] PRIMARY KEY CLUSTERED([rkey]),
	 CONSTRAINT [FK_Data0848_data0005Rkey] FOREIGN KEY([Empl_ptr])REFERENCES [dbo].[Data0005] ([RKEY]),
	 CONSTRAINT [FK_Data0848_data0831Rkey] FOREIGN KEY(Work_ptr)REFERENCES [dbo].[DATA0831] ([RKEY])
	) 
 end
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作记录指针' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'Work_ptr'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'WorkDate'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'BeginTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'EndTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中途休息时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'TimeRest'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'雇员指针' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'Empl_ptr'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'Status'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实际工作时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'WorkTime'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848', @level2type=N'COLUMN',@level2name=N'Remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'保养参与人员记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Data0848'
GO
if not Exists   (select * from sysobjects where name= 'Data0849' and type= 'U')
  begin
	CREATE TABLE [dbo].[DATA0849](
		[Rkey] [int] IDENTITY(1,1) NOT NULL,
		[Work_ptr] [int] NOT NULL,
		[stop_begin_date] [smalldatetime] NOT NULL,
		[stop_end_date] [smalldatetime] NULL,
		[remark] [nvarchar](50) NULL,
	 CONSTRAINT [PK_DATA0849] PRIMARY KEY CLUSTERED ([Rkey]),
	 CONSTRAINT [FK_DATA0849_data0848Rkey] FOREIGN KEY([Work_ptr])REFERENCES [dbo].[Data0848] ([rkey])
	)
 end	
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'参与人员记录表指针' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DATA0849', @level2type=N'COLUMN',@level2name=N'Work_ptr'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始暂停时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DATA0849', @level2type=N'COLUMN',@level2name=N'stop_begin_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂停结束时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DATA0849', @level2type=N'COLUMN',@level2name=N'stop_end_date'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DATA0849', @level2type=N'COLUMN',@level2name=N'remark'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作单暂停记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DATA0849'
GO




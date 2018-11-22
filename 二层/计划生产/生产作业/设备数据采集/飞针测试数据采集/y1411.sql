USE [wisdompcb]
GO

/****** Object:  Table [dbo].[Y1411]    Script Date: 04/27/2016 15:44:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Y1411](
	[rkey] [int] IDENTITY(1,1) NOT NULL,
	[MANU_NUMBER] [varchar](20) NOT NULL,
	[time_strart] [datetime] NOT NULL,
	[mac_id] [int] NOT NULL,
	[point_sum] [int] NOT NULL,
	[net_sum] [int] NOT NULL,
	[net_neighbor] [int] NOT NULL,
	[test_id] [int] NOT NULL,
	[pcs_sum] [int] NOT NULL,
	[test_method] [varchar](10) NOT NULL,
	[time_cost] [int] NOT NULL,
	[pcs_ok] [int] NOT NULL,
	[pcs_ng] [int] NOT NULL,
	[pcs_abr] [int] NOT NULL,
	[pcs_open] [int] NOT NULL,
	[pcs_short] [int] NOT NULL,
	[time_end] [datetime] NOT NULL,
	[hash] [char](32) NOT NULL,
 CONSTRAINT [PK_ceshi] PRIMARY KEY CLUSTERED 
(
	[rkey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本厂编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'MANU_NUMBER'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'time_strart'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'机台号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'mac_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试点数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'point_sum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'网络数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'net_sum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相邻网络数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'net_neighbor'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'test_id'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试PCS数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'pcs_sum'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试方法' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'test_method'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试耗时' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'time_cost'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试OK数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'pcs_ok'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试不良数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'pcs_ng'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试开路数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'pcs_open'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'测试短路数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Y1411', @level2type=N'COLUMN',@level2name=N'pcs_short'
GO


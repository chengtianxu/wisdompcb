if not exists(select * from data0419 where description='设备维修数据分析')
insert into data0419(SEQ_NO,DESCRIPTION,PREV_TP,PROGRAME,VerNo,manu_ptr)
select SEQ_NO+1,'设备维修数据分析',PREV_TP,'WZPR846.exe','1.1.1.1',manu_ptr from data0419 where description='故障类别定义'
 
 if not Exists   (select * from sysobjects where name= 'data0849' and type= 'U') --drop table data0849
  begin --select *from data0849  delete data0849  where rkey in(540,541)
    CREATE TABLE [dbo].[data0849](	
		[Rkey]			int identity not   null, --自动编号（主键）
		[D419_ptr]      int          not   null, --程序指针（外键）
		[D073_ptr]	    int          not   null, --用户指针（外键）
		[FormName]	    [varchar](50)not   null, --窗体名 
		[GridName]	    [varchar](50)not   null, --表格名 
		[FieldName]	    [varchar](50)not   null, --字段名 
		[FieldCaption]	[varchar](100)not  null, --字段名 		
		[FieldOrder]    int                null, --字段顺序
		[FieldWidth]    int                null, --字段宽度
		[IsDisplay]     bit                null, --是否显示
       CONSTRAINT [PK_data0849] PRIMARY KEY CLUSTERED ([Rkey])ON [PRIMARY],
       CONSTRAINT [FK_data0849_Data0419_rkey]FOREIGN KEY ([D419_ptr]) REFERENCES [data0419]([rkey]),
       CONSTRAINT [FK_data0849_Data0073_rkey]FOREIGN KEY ([D073_ptr]) REFERENCES [data0073]([rkey]),             
)
end
--字段添加说明 
EXEC sp_addextendedproperty 'MS_Description', '程序指针', 'user', dbo, 'table', data0849, 'column', [D419_ptr]
EXEC sp_addextendedproperty 'MS_Description', '用户指针', 'user', dbo, 'table', data0849, 'column', [D073_ptr]
EXEC sp_addextendedproperty 'MS_Description', '窗体名'  , 'user', dbo, 'table', data0849, 'column', [FormName]
EXEC sp_addextendedproperty 'MS_Description', '表格名'  , 'user', dbo, 'table', data0849, 'column', [GridName]
EXEC sp_addextendedproperty 'MS_Description', '字段名'  , 'user', dbo, 'table', data0849, 'column', [FieldName]
EXEC sp_addextendedproperty 'MS_Description', '字段名'  , 'user', dbo, 'table', data0849, 'column', [FieldCaption]
EXEC sp_addextendedproperty 'MS_Description', '字段顺序', 'user', dbo, 'table', data0849, 'column', [FieldOrder]
EXEC sp_addextendedproperty 'MS_Description', '字段宽度', 'user', dbo, 'table', data0849, 'column', [FieldWidth]
EXEC sp_addextendedproperty 'MS_Description', '是否显示', 'user', dbo, 'table', data0849, 'column', [IsDisplay]
--添加表描述   
EXEC sp_addextendedproperty  'MS_Description', '用户字段自定义表','user',dbo,'table', [data0849]


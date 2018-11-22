设备目标值查询
declare @SD datetime,@ED datetime
set @SD=@P1
set @ED=dateadd(Month,1,@SD)
--,系统当前日期>结束日期+2天,执行下面的查询。
if getdate()>DateAdd(day,2,@ED)
if getdate()>DateAdd(day,2,@ED)
begin
    select *from 
    (select data0417.warehouse_ptr as WHOUSE_PTR,data0015.rkey as d15rkey,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,
	(select sum(T1.maintain_house )
	from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey 
	JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey 
	and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 
	and T1.failure_degree=''生产停顿''
	WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey
	)as TD,	
	(select sum(T1.maintain_house )
	from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey 
	JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey 
	and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 
	and T1.failure_degree in (''生产停顿'',''影响生产'',''仍可生产'')
	WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey
	)as YX	,
	(select sum(data0831.TimeCons)
	from data0417 as D831_417  
	join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE
	and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED 
	and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=data0015.rkey) SBBY,
	(select sum(data0831.StdTimeCons)
	from data0417 as D831_417  
	join data0831 on data0831.DeviNumb=D831_417.FASSET_CODE
	and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED 
	and D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=data0015.rkey) StdTimeCons
	,(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 
	from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey 
	JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey 
	and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 
	and T1.failure_degree=''生产停顿''
	WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey
	)as TJGZ
	,(select sum(datediff(ss,T1.ent_date,T1.complete_date) )/3600 
	from data0567 as T1 join data0417  on  T1.FASSET_PTR=dbo.DATA0417.rkey 
	JOIN data0840 as D40 on data0417.D840_ptr=D40.rkey 
	and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 
	and T1.failure_degree in (''生产停顿'',''影响生产'',''仍可生产'')
	WHERE D40.rkey=data0840.rkey and t1.WHOUSE_PTR=Data0015.rkey
	)as FTJGZ
	from data0840
	join  data0417 on data0417.D840_ptr=data0840.rkey
	join Data0015 on data0417.warehouse_ptr=Data0015.rkey
	group by data0417.warehouse_ptr,data0015.rkey,data0015.Abbr_Name,data0840.rkey,data0840.Location)
        as t4
		join 
		(SELECT D17.warehouse_ptr,D17.D840_ptr,COUNT(D17.RKEY) TS
		from data0417 AS D17 WHERE  d17.EquiType=1 and D17.active_flag IN (2,3)
                               and d17.confi_date<@ED
		group by D17.warehouse_ptr,D17.D840_ptr
		)as t3  
        on T3.warehouse_ptr=t4.WHOUSE_PTR and T3.D840_ptr=t4.rkey	
end
else
select Null

ALTER table data0853 alter column  [Scrapped]             [decimal](12, 5) NULL--故障总报废
ALTER table data0854 alter column  [Scrapped]             [decimal](12, 5) NULL--故障总报废
--由原来的4位小数改为5位小数

ALTER table data0853 add  [mainStanTime]         [decimal](12, 1) NULL
DROP TABLE [Data0853]
SELECT * FROM data0853
--[Shutdown] [decimal](12, 2) NULL,--故障总停机率
--[Service] [decimal](12, 2) NULL,--故障总维修率
--[Plan] [decimal](12, 2) NULL,--保养计划完成率
CREATE TABLE [dbo].[Data0853](
	[Rkey]                 [int] IDENTITY(1,1) NOT NULL,
	[D015_ptr]             [int] NOT NULL,--data0015指针
	[D851_ptr]             [int] NOT NULL,--data0851指针
	[D840_ptr]             [int] NOT NULL,--data0840指针
	[H]                    [int] NULL,--小时
	[D]                    [int] NULL,--天数
	[TS]                   [int] NULL,--设备台数
    [Downtime_D]           [decimal](12, 5) NULL,--停机故障耗时
    [DowntimeTarget]       [decimal](12, 5) NULL,--停机故障目标	
	[Shutdown_D]           [decimal](12, 1) NULL,--停机维修时间	
	[ShutdownTarget]       [decimal](12, 5) NULL,--停机维修率目标
    [NotDowntime_D]        [decimal](12, 5) NULL,--未停机故障耗时
    [NotDowntimeTarget]    [decimal](12, 5) NULL,--未停机故障目标	
	[Service_D]            [decimal](12, 1) NULL,--未停机维修时间	
	[ServiceTarget]        [decimal](12, 5) NULL,--未停机维修率目标
    [Scrapped]             [decimal](12, 5) NULL,--故障总报废
    [ScrappedTarget]       [decimal](12, 5) NULL,--故障总报废率目标
    [Plan_D]               [decimal](12, 1) NULL,--保养计划时间  
    [mainStanTime]         [decimal](12, 1) NULL,--保养标准消耗时间  
    [PlanTarget]           [decimal](12, 5) NULL,--保养计划完成率目标
    [Outflow]              [decimal](12, 4) NULL,--成员总流失率
    [OutflowTarget]        [decimal](12, 5) NULL,--成员总流失率目标	
 CONSTRAINT [PK_Data0853] PRIMARY KEY CLUSTERED ([Rkey]),
 CONSTRAINT [FK_Data0853_Data0015]     FOREIGN KEY ([D015_ptr]) REFERENCES [data0015]([RKEY]),
 CONSTRAINT [FK_Data0853_Data0851]     FOREIGN KEY ([D851_ptr]) REFERENCES [data0851]([RKEY]),
 CONSTRAINT [FK_Data0853_Data0840]     FOREIGN KEY ([D840_ptr]) REFERENCES [data0840]([RKEY])
 )
 --字段添加说明 
--EXEC sp_addextendedproperty 'MS_Description', '描述', 'user', dbo, 'table', DATA0853, 'column', [remark]
EXEC sp_addextendedproperty 'MS_Description', 'data0015指针', 'user', dbo, 'table', DATA0853, 'column', [D015_ptr]
EXEC sp_addextendedproperty 'MS_Description', 'data0851指针', 'user', dbo, 'table', DATA0853, 'column', [D851_ptr]
EXEC sp_addextendedproperty 'MS_Description', 'data0840指针', 'user', dbo, 'table', DATA0853, 'column', [D840_ptr]
EXEC sp_addextendedproperty 'MS_Description', '小时', 'user', dbo, 'table', DATA0853, 'column', [H]
EXEC sp_addextendedproperty 'MS_Description', '天数', 'user', dbo, 'table', DATA0853, 'column', [D]
EXEC sp_addextendedproperty 'MS_Description', '设备台数', 'user', dbo, 'table', DATA0853, 'column', [TS]
EXEC sp_addextendedproperty 'MS_Description', '故障总停机时间', 'user', dbo, 'table', DATA0853, 'column', [Shutdown_D]
EXEC sp_addextendedproperty 'MS_Description', '故障总停机率目标', 'user', dbo, 'table', DATA0853, 'column', [ShutdownTarget]
EXEC sp_addextendedproperty 'MS_Description', '故障总维时间', 'user', dbo, 'table', DATA0853, 'column', [Service_D]
EXEC sp_addextendedproperty 'MS_Description', '故障总维修率目标', 'user', dbo, 'table', DATA0853, 'column', [ServiceTarget]
EXEC sp_addextendedproperty 'MS_Description', '故障总报废', 'user', dbo, 'table', DATA0853, 'column', [Scrapped]
EXEC sp_addextendedproperty 'MS_Description', '故障总报废率目标', 'user', dbo, 'table', DATA0853, 'column', [ScrappedTarget]
EXEC sp_addextendedproperty 'MS_Description', '保养计划完成率', 'user', dbo, 'table', DATA0853, 'column', [Plan_D]
EXEC sp_addextendedproperty 'MS_Description', '保养计划完成率目标', 'user', dbo, 'table', DATA0853, 'column', [PlanTarget]
EXEC sp_addextendedproperty 'MS_Description', '成员总流失率', 'user', dbo, 'table', DATA0853, 'column', [Outflow]
EXEC sp_addextendedproperty 'MS_Description', '成员总流失率目标', 'user', dbo, 'table', DATA0853, 'column', [OutflowTarget]
EXEC sp_addextendedproperty 'MS_Description', '停机故障耗时', 'user', dbo, 'table', DATA0853, 'column', [Downtime_D]
EXEC sp_addextendedproperty 'MS_Description', '停机故障目标', 'user', dbo, 'table', DATA0853, 'column',[DowntimeTarget] 
EXEC sp_addextendedproperty 'MS_Description', '未停机故障耗时', 'user', dbo, 'table', DATA0853, 'column', [NotDowntime_D]
EXEC sp_addextendedproperty 'MS_Description', '未停机故障目标', 'user', dbo, 'table', DATA0853, 'column', [NotDowntimeTarget]
--添加表描述   
EXEC sp_addextendedproperty  'MS_Description', '设备目标值设置','user',dbo,'table', DATA0853
DROP TABLE [Data0854]
CREATE TABLE [dbo].[Data0854](
	[Rkey]                 [int] IDENTITY(1,1) NOT NULL,
	[D015_ptr]             [int] NOT NULL,--data0015指针
	[D851_ptr]             [int] NOT NULL,--data0851指针
	[D840_ptr]             [int] NOT NULL,--data0840指针
	[H]                    [int] NULL,--小时
	[D]                    [int] NULL,--天数
	[TS]                   [int] NULL,--设备台数
    [Downtime_D]           [decimal](12, 5) NULL,--停机故障耗时
    [DowntimeTarget]       [decimal](12, 5) NULL,--停机故障目标	
	[Shutdown_D]           [decimal](12, 1) NULL,--停机维修时间	
	[ShutdownTarget]       [decimal](12, 5) NULL,--停机维修率目标
    [NotDowntime_D]        [decimal](12, 5) NULL,--未停机故障耗时
    [NotDowntimeTarget]    [decimal](12, 5) NULL,--未停机故障目标	
	[Service_D]            [decimal](12, 1) NULL,--未停机维修时间	
	[ServiceTarget]        [decimal](12, 5) NULL,--未停机维修率目标
    [Scrapped]             [decimal](12, 4) NULL,--故障总报废
    [ScrappedTarget]       [decimal](12, 5) NULL,--故障总报废率目标
    [Plan_D]               [decimal](12, 1) NULL,--保养计划时间  
    [mainStanTime]         [decimal](12, 1) NULL,--保养标准消耗时间  
    [PlanTarget]           [decimal](12, 5) NULL,--保养计划完成率目标
    [Outflow]              [decimal](12, 4) NULL,--成员总流失率
    [OutflowTarget]        [decimal](12, 5) NULL,--成员总流失率目标	
 CONSTRAINT [PK_DATA0854] PRIMARY KEY CLUSTERED ([Rkey]),
 CONSTRAINT [FK_Data0854_Data0015]     FOREIGN KEY ([D015_ptr]) REFERENCES [data0015]([RKEY]),
 CONSTRAINT [FK_Data0854_Data0851]     FOREIGN KEY ([D851_ptr]) REFERENCES [data0851]([RKEY]),
 CONSTRAINT [FK_Data0854_Data0840]     FOREIGN KEY ([D840_ptr]) REFERENCES [data0840]([RKEY])
 )
 --字段添加说明 
--EXEC sp_addextendedproperty 'MS_Description', '描述', 'user', dbo, 'table', DATA0853, 'column', [remark]
EXEC sp_addextendedproperty 'MS_Description', 'data0015指针', 'user', dbo, 'table', DATA0854, 'column', [D015_ptr]
EXEC sp_addextendedproperty 'MS_Description', 'data0851指针', 'user', dbo, 'table', DATA0854, 'column', [D851_ptr]
EXEC sp_addextendedproperty 'MS_Description', 'data0840指针', 'user', dbo, 'table', DATA0854, 'column', [D840_ptr]
EXEC sp_addextendedproperty 'MS_Description', '小时', 'user', dbo, 'table', DATA0854, 'column', [H]
EXEC sp_addextendedproperty 'MS_Description', '天数', 'user', dbo, 'table', DATA0854, 'column', [D]
EXEC sp_addextendedproperty 'MS_Description', '设备台数', 'user', dbo, 'table', DATA0854, 'column', [TS]
EXEC sp_addextendedproperty 'MS_Description', '故障总停机时间', 'user', dbo, 'table', DATA0854, 'column', [Shutdown_D]
EXEC sp_addextendedproperty 'MS_Description', '故障总停机率目标', 'user', dbo, 'table', DATA0854, 'column', [ShutdownTarget]
EXEC sp_addextendedproperty 'MS_Description', '故障总维时间', 'user', dbo, 'table', DATA0854, 'column', [Service_D]
EXEC sp_addextendedproperty 'MS_Description', '故障总维修率目标', 'user', dbo, 'table', DATA0854, 'column', [ServiceTarget]
EXEC sp_addextendedproperty 'MS_Description', '故障总报废', 'user', dbo, 'table', DATA0854, 'column', [Scrapped]
EXEC sp_addextendedproperty 'MS_Description', '故障总报废率目标', 'user', dbo, 'table', DATA0854, 'column', [ScrappedTarget]
EXEC sp_addextendedproperty 'MS_Description', '保养计划完成率', 'user', dbo, 'table', DATA0854, 'column', [Plan_D]
EXEC sp_addextendedproperty 'MS_Description', '保养计划完成率目标', 'user', dbo, 'table', DATA0854, 'column', [PlanTarget]
EXEC sp_addextendedproperty 'MS_Description', '成员总流失率', 'user', dbo, 'table', DATA0854, 'column', [Outflow]
EXEC sp_addextendedproperty 'MS_Description', '成员总流失率目标', 'user', dbo, 'table', DATA0854, 'column', [OutflowTarget]
EXEC sp_addextendedproperty 'MS_Description', '停机故障耗时', 'user', dbo, 'table', DATA0854, 'column', [Downtime_D]
EXEC sp_addextendedproperty 'MS_Description', '停机故障目标', 'user', dbo, 'table', DATA0854, 'column',[DowntimeTarget] 
EXEC sp_addextendedproperty 'MS_Description', '未停机故障耗时', 'user', dbo, 'table', DATA0854, 'column', [NotDowntime_D]
EXEC sp_addextendedproperty 'MS_Description', '未停机故障目标', 'user', dbo, 'table', DATA0854, 'column', [NotDowntimeTarget]
--添加表描述   
EXEC sp_addextendedproperty  'MS_Description', '关键设备目标值设置','user',dbo,'table', DATA0854

select data0840.Location,data0015. ABBR_NAME,Data0853.*
  from Data0853
  join data0840 on Data0853.[D840_ptr]=data0840.rkey
  join data0015 on Data0853.[D015_ptr]=data0015.rkey
  where [D851_ptr]=:vD851_ptr
  order by data0015. ABBR_NAME,data0840.Location
  
--alter table [Data0852]drop FK_Data0852_Data0015_rkey--删除外键
alter table [Data0852]alter  column [D015_ptr] [int]  NULL
alter table [Data0853]alter  column [D015_ptr] [int]  NULL
alter table [Data0854]alter  column [D015_ptr] [int]  NULL

CREATE TABLE [dbo].[Data0852](--drop table [Data0852]
	[Rkey] [int] IDENTITY(1,1) NOT NULL,
	[D015_ptr] [int] NOT NULL,
	[D851_ptr] [int] NOT NULL,
	[D840_ptr] [int] NOT NULL,
	[sumA] [decimal](12, 2) NULL,
	[Target] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Data0852] PRIMARY KEY CLUSTERED ([Rkey]))

insert into
declare @sql varchar(8000),@SD datetime,@ED datetime
set @SD='2013-8-1'  set @ED='2013-10-1'
select @sql=isnull(@sql+',','')+Location from data0840 where data0840.[Location]not in ('施工队','空调事业部')
print @sql

select [工厂],[设备责任小组],isnull(维修成本,0)维修成本,isnull(维护成本,0)维护成本,isnull(工程成本,0)工程成本,isnull(公用成本,0)公用成本,
(isnull(维修成本,0)+isnull(维护成本,0)+isnull(工程成本,0)+isnull(公用成本,0))as [汇总成本] from 
(select [工厂],[设备责任小组],[类型],sum(isnull([金额(本币含税)],0))[金额(本币含税)] from 
(select data0840.[Location] [设备责任小组],data0015.ABBR_NAME [工厂],
case dbo.DATA0268.ttype when 2 then '维修成本' when 3 then '维护成本' when 4 then '工程成本' when 5 then '公用成本' end as [类型],
[金额(本币含税)]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))       
from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR 
JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  Data0207.D0468_ptr=Data0468.rkey 
and data0207.tdate>=:SD and data0207.tdate<:ED)
FROM dbo.DATA0268 
join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey 
join Data0468 on DATA0268.rkey=Data0468.FLOW_NO
join data0015 on data0268.warehouse_ptr=data0015.rkey
where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5))as t1
group by [工厂],[设备责任小组],[类型] 
)as t2
pivot (sum([金额(本币含税)]) for [类型] in (维修成本,维护成本,工程成本,公用成本))a
where [工厂]='深圳五株'


select*,(isnull(维修成本,0)+isnull(维护成本,0)+isnull(工程成本,0)+isnull(公用成本,0))as [汇总成本] from 
(select [设备责任小组],[类型],sum(isnull([金额(本币含税)],0))[金额(本币含税)] from 
(select data0840.[Location]   [设备责任小组]      ,
case dbo.DATA0268.ttype when 2 then '维修成本' when 3 then '维护成本' when 4 then '工程成本' when 5 then '公用成本' end as [类型],
[金额(本币含税)]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))       
from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR 
JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  Data0207.D0468_ptr=Data0468.rkey
and Data0207.tdate>='2013-1-1'  and Data0207.tdate<'2013-10-1')
FROM dbo.DATA0268 
join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey 
join Data0468 on DATA0268.rkey=Data0468.FLOW_NO
--join data0456 on D0468_ptr=Data0468.rkey
where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5)and data0840.[Location]not in ('施工队','空调事业部'))as t1
group by [设备责任小组],[类型] 
)as t2
pivot (sum([金额(本币含税)]) for [类型] in (维修成本,维护成本,工程成本,公用成本))a


declare @sql varchar(8000),@SD datetime,@ED datetime,@WHOUSE_PTR int
set @SD='2013-8-1'  set @ED='2013-10-1'  set @WHOUSE_PTR=1
select @sql=isnull(@sql+',','')+EMPLOYEE_NAME from V_0842_0848 
where V_0842_0848.WorkDate>=@SD and V_0842_0848.WorkDate<=@ED and V_0842_0848.WHOUSE_PTR= @WHOUSE_PTR
group by EMPLOYEE_NAME         
set @sql='select * from V_0842_0848 '
+' pivot (sum(WorkTime) for EMPLOYEE_NAME in ('+@sql+'))a'
+' where WorkDate>='
+''''+CONVERT(varchar(100), @SD, 23)+''''+' and  WorkDate<='+''''
+ CONVERT(varchar(100), @ED, 23)+''''+' and WHOUSE_PTR='+ Cast(@WHOUSE_PTR as varchar(10))
select (@sql)

declare @sql varchar(8000),@SD datetime,@ED datetime
set @SD=:SD set @ED=:ED
select @sql=isnull(@sql+',','')+EMPLOYEE_NAME from V_0842_0848 
where V_0842_0848.WorkDate>=@SD and V_0842_0848.WorkDate<=@ED
group by EMPLOYEE_NAME         
set @sql='select * from V_0842_0848 '
+' pivot (sum(WorkTime) for EMPLOYEE_NAME in ('+@sql+'))a'
+' where WorkDate>='
+''''+CONVERT(varchar(100), @SD, 23)+''''+' and  WorkDate<='+''''+ CONVERT(varchar(100), @ED, 23)+''''
exec(@sql)

if not exists(select t1.name from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='data0840' and t2.name='grup')
begin
	ALTER  TABLE data0840 ADD grup int null
END 
update data0840
set grup=1
where Location=''
select * from 
(select*,(isnull(维修成本,0)+isnull(维护成本,0)+isnull(工程成本,0)+isnull(公用成本,0))as [汇总成本] from 
(select [设备责任小组],[类型],sum(isnull([金额(本币含税)],0))[金额(本币含税)] from 
(select data0840.[Location]   [设备责任小组]      ,
case dbo.DATA0268.ttype when 2 then '维修成本' when 3 then '维护成本' when 4 then '工程成本' when 5 then '公用成本' end as [类型],
[金额(本币含税)]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))       
from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR 
JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  Data0207.D0468_ptr=Data0468.rkey)
FROM dbo.DATA0268 
join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey 
join Data0468 on DATA0268.rkey=Data0468.FLOW_NO
--join data0456 on D0468_ptr=Data0468.rkey
where  data0268.status =4 and dbo.DATA0268.ttype in (2,3,4,5)and data0840.[Location]not in ('施工队','空调事业部'))as t1
group by [设备责任小组],[类型] 
)as t2
pivot (sum([金额(本币含税)]) for [类型] in (维修成本,维护成本,工程成本,公用成本))a)as t3
compute  sum(维修成本),sum(维护成本),sum(工程成本),sum(公用成本),sum([汇总成本])


---------------------------
设备管理重要信息分析 开发备份
---------------------------
select * from V_0842_0848  pivot (sum(WorkTime) for EMPLOYEE_NAME in (李玉红,彭华))a 
where WorkDate>='2013-11-01' and  WorkDate<='2013-11-30'
---------------------------
OK   
---------------------------

select * from data0268 
select Data0468.* from data0468 
join Data0207  on data0468.rkey=Data0207.D0468_ptr
select top 1000 * from  Data0207 on 
Data0207:发料记录
Data0022:材接收一缆表
Data0456:材料入库单

select * from (select f1.*,data0034.DEPT_NAME [设备所在部门] from(
SELECT dbo.DATA0268.number [申领单号],         dbo.DATA0268.[DATE]           [申请日期], 
dbo.DATA0268.auth_date     [审核日期],          dbo.DATA0268.reference        [备注], 
dbo.Data0034.DEPT_CODE     [使用部门],         dbo.Data0034.DEPT_NAME        [部门名称],
dbo.Data0005.EMPL_CODE     [申领人代码],       dbo.Data0005.EMPLOYEE_NAME AS [申领员工名称],
Data0005_1.EMPL_CODE AS    [审核员工代码],     Data0005_1.EMPLOYEE_NAME AS   [审核员工名称], 
dbo.Data0094.PURCHASE_APPROV_DESC [审批流程],  dbo.Data0015.ABBR_NAME AS     [工厂],  
CASE WHEN data0268.status = 0 THEN '待提交' WHEN data0268.status = 1 THEN '待审核'  
WHEN data0268.status = 2 THEN '已审核' WHEN data0268.status  = 3 THEN '被退回'  
WHEN data0268.status = 4 THEN '已发料' END AS 审核状态,dbo.Data0094.CODE [审批流程代码],
CASE WHEN data0268.allow_submit = 0 THEN '不确认' WHEN data0268.allow_submit = 1 THEN '待确认'  
WHEN data0268.allow_submit = 2 THEN '已确认'END AS [确认状态],
case dbo.DATA0268.ttype when 2 then '维修' when 3 then '维护' when 4 then '工程' when 5 then '公用' end as [类型],
dbo.DATA0268.Prted          [打印否],        dbo.data0835.WorkOrder    [空调事业部工作单号],
dbo.data0567.NUMBER as      [维修单单号],    dbo.data0831.PlanMainDate [保养日期],    
dbo.data0831.MainCycl       [保养周期],
Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_CODE) 
     when dbo.DATA0268.TTYPE=3 then(data0831.DeviNumb) end as [设备编号], 
Case when dbo.DATA0268.TTYPE=2 then(d17_2.FASSET_NAME) 
     when dbo.DATA0268.TTYPE=3 then(d17_1.FASSET_NAME) end as [设备名称],   
Case when dbo.DATA0268.TTYPE=2 then(d17_2.DEPT_PTR) 
     when dbo.DATA0268.TTYPE=3 then(d17_1.DEPT_PTR) end as DEPT_PTR,           
data0840.[Location]         [设备责任小组],   data0830.[DeptName]         [工作部门],
Data0836.[WorkName]         [工作任务名称],   data0835.[WorkExpl]         [工作任务说明],
dbo.Data0468.QUAN_BOM       [申领数量],       dbo.Data0468.QUAN_ISSUED    [已发放数量],
dbo.Data0468.VENDOR         [供应商],         dbo.Data0017.INV_PART_NUMBER[材料编码],
Data0017.INV_PART_DESCRIPTION [材料名称/规格],data0002.unit_name          [单位],
case dbo.Data0468.PRINTIT when 'Y'then '普通库存' when 'N' then 'VMI库存' END AS 是否VMI,
[金额(本币含税)]=(select sum(ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate, 4))       
from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR 
JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Data0468.rkey),
[金额(本币不含税)]=(select sum(ROUND((dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) / (1 + dbo.Data0022.TAX_2 * 0.01), 4)) 
from data0207 join data0022 on data0022.rkey=data0207.D0022_PTR  
JOIN Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY where  D0468_ptr=Data0468.rkey)
FROM dbo.DATA0268 INNER JOIN dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034.RKEY
and dbo.DATA0268.ttype in (2,3,4,5) /*2维修;3维护;4工程;5公用*/
INNER JOIN dbo.Data0005 ON dbo.DATA0268.EMPL_PTR = dbo.Data0005.RKEY 
LEFT JOIN dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplptr = Data0005_1.RKEY
INNER JOIN dbo.Data0094 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY 
INNER JOIN dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY 
left join dbo.data0831 on DATA0268.[d831_ptr]=dbo.data0831.rkey 
left join data0417 d17_1 on d17_1.FASSET_CODE=data0831.DeviNumb 
left join dbo.data0567 on DATA0268.[d567_ptr]=dbo.data0567.rkey
left join data0417 d17_2 on d17_2.rkey=data0567.FASSET_PTR  
left join dbo.data0835 on DATA0268.[d835_ptr]=dbo.data0835.rkey 
left join data0840 on  DATA0268.[d840_ptr]=dbo.data0840.rkey 
left join dbo.data0830 on data0835.[Dept_ptr]=data0830.rkey  
left join dbo.Data0836 on data0835.[Work_ptr]=data0836.rkey 
join Data0468 on DATA0268.rkey=Data0468.FLOW_NO
join dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY
join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey 
where data0268.status =4)as f1 
left join data0034 on data0034.rkey=f1.DEPT_PTR)as f2
where 1=2


declare @SD datetime,@ED datetime
set @SD='2013-11-1'
set @ED=dateadd(Month,1,@SD)
--,系统当前日期>结束日期+2天,执行下面的查询。
if getdate()>DateAdd(day,2,@ED)
begin
	select T1.WHOUSE_PTR,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,
	sum(T1.maintain_house )TD,sum(T2.maintain_house )YX	,sum(data0831.TimeCons) SBBY,
	TS	
	from data0840
	join  data0417 on data0417.D840_ptr=data0840.rkey
	left join data0567 as T1 ON  T1.FASSET_PTR=dbo.DATA0417.rkey
	--and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 and T1.failure_degree='生产停顿'
	join data0015 on T1.WHOUSE_PTR=data0015.rkey 
	left join data0567 as T2 ON  T2.FASSET_PTR=dbo.DATA0417.rkey
	--and T2.complete_date>=@SD and T2.complete_date<@ED
	and data0417.EquiType=1 and T2.failure_degree in ('生产停顿','影响生产','仍可生产')
	and  T2.WHOUSE_PTR=data0015.rkey 
	left join data0417 as D831_417 ON D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=data0015.rkey
	left join data0831 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE
	left join (SELECT data0417.warehouse_ptr,data0417.D840_ptr,COUNT(data0417.RKEY) TS
 from data0417 join data0840 on data0417.d840_ptr=data0840.rkey  
group by data0417.warehouse_ptr,data0417.D840_ptr)as t3  
on T3.warehouse_ptr=data0417.warehouse_ptr and T3.D840_ptr=data0840.rkey
	and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED
	group by T1.WHOUSE_PTR,data0015.Abbr_Name,data0840.rkey,data0840.Location,TS	
end	

SELECT data0417.warehouse_ptr,data0417.D840_ptr,data0840.Location,COUNT(data0417.RKEY) 台数
 from data0417 join data0840 on data0417.d840_ptr=data0840.rkey 
--where data0840.Location='nn'
group by data0417.warehouse_ptr,data0417.D840_ptr,data0840.Location

declare @SD datetime,@ED datetime
set @SD='2013-8-1'
set @ED=dateadd(Month,1,@SD)
	select T1.WHOUSE_PTR,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,
	sum(T1.maintain_house )TD,sum(T2.maintain_house )YX	,sum(data0831.TimeCons) SBBY	
	from data0840
	join  data0417 on data0417.D840_ptr=data0840.rkey
	left join data0567 as T1 ON  T1.FASSET_PTR=dbo.DATA0417.rkey
	--and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 and T1.failure_degree='生产停顿'
	join data0015 on T1.WHOUSE_PTR=data0015.rkey 
	left join data0567 as T2 ON  T2.FASSET_PTR=dbo.DATA0417.rkey
	--and T2.complete_date>=@SD and T2.complete_date<@ED
	and data0417.EquiType=1 and T2.failure_degree in ('生产停顿','影响生产','仍可生产')
	and  T2.WHOUSE_PTR=data0015.rkey 
	left join data0417 as D831_417 ON D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=data0015.rkey
	left join data0831 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE
	group by T1.WHOUSE_PTR,data0015.Abbr_Name,data0840.rkey,data0840.Location
	
	
	declare @SD datetime,@ED datetime
set @SD='2013-08-01 08:00:00'
set @ED=dateadd(Month,1,@SD)
--,系统当前日期>结束日期+2天,执行下面的查询。
if getdate()>DateAdd(day,2,@ED)
begin
    select *from 
    (select T1.WHOUSE_PTR,data0015.Abbr_Name ,data0840.rkey,data0840.Location ,
	sum(T1.maintain_house )TD,sum(T2.maintain_house )YX	,sum(data0831.TimeCons) SBBY
	from data0840
	join  data0417 on data0417.D840_ptr=data0840.rkey
	left join data0567 as T1 ON  T1.FASSET_PTR=dbo.DATA0417.rkey
	and T1.complete_date>=@SD and T1.complete_date<@ED
	and data0417.EquiType=1 and T1.failure_degree='生产停顿'
	join data0015 on T1.WHOUSE_PTR=data0015.rkey 
	left join data0567 as T2 ON  T2.FASSET_PTR=dbo.DATA0417.rkey
	and T2.complete_date>=@SD and T2.complete_date<@ED
	and data0417.EquiType=1 and T2.failure_degree in ('生产停顿','影响生产','仍可生产')
	and  T2.WHOUSE_PTR=data0015.rkey 
	left join data0417 as D831_417 ON D831_417.D840_ptr=data0840.rkey and D831_417.warehouse_ptr=data0015.rkey
	left join data0831 on data0831.DeviNumb=dbo.DATA0417.FASSET_CODE
	and data0831.ActuCompTime>=@SD and data0831.ActuCompTime<@ED
	
	group by T1.WHOUSE_PTR,data0015.Abbr_Name,data0840.rkey,data0840.Location
	)as t4
		join 
		(SELECT D17.warehouse_ptr,D17.D840_ptr,COUNT(D17.RKEY) TS
		from data0417 AS D17 WHERE D17.active_flag IN (2,3)
		group by D17.warehouse_ptr,D17.D840_ptr
		)as t3  
        on T3.warehouse_ptr=t4.WHOUSE_PTR and T3.D840_ptr=t4.rkey		
end	
--投产出来数据
--so_style=2退货订单不能投产
--exec EP052;19 '0',2,0,0,2,'2013-05-05','2013-06-04',0,0,1

--CREATE PROCEDURE EP052;19
declare
@vwhse_ptr varchar(10)='0',
@vtype tinyint=2,
@ontime tinyint=0,  --是否到期
@onhold tinyint=0, -- 是否MI OK
@datetype tinyint=2,  --日期类型
@date1 varchar(20)='2013-05-05',  --日期1
@date2 varchar(20)='2013-05-05',  -- 日期2
@vtp int=0,
@vso_tp int=0,
@order tinyint=1  --排序
--with encryption
--AS
declare @flag int
select @flag=isnull(ppc_control13,0) from data0192 --1

declare @cond varchar(4000)
set @cond = '
declare @vflag int
select @vflag=isnull(ppc_control13,0) from data0192
SELECT data0050.layers,data0060.so_style,data0050.etest_tp,data0050.cnc_tp,data0010.cust_code,data0010.abbr_name,data0050.rkey,data0060.ent_date,data0050.cp_rev1,data0050.cp_rev2,data0060.ttype,
data0050.customer_part_number,data0050.cp_rev,data0050.onhold_planning_flag,data0060.conf_date,data0060.cust_part_ptr,
data0059.customer_part_desc,data0059.customer_matl_desc,data0060.sales_order,data0060.parts_ordered,data0060.sales_dept_list,data0060.fob,
data0060.PROD_REL,data0060.rkey as d060_RKEY,data0097.po_number,data0060.PUTHMAT_DESC,data0059.onhold_sales_flag,data0060.whse_ptr,data0060.so_tp,
case when data0050.usheet>0 then data0060.parts_ordered*data0050.psheet/data0050.usheet else 0 end as pnls_ordered,
data0060.qty_plannned,data0060.to_be_planned as orig_to_be_planned,cast(case when @vflag=0 then data0060.to_be_planned else data0060.to_be_planned+data0060.qty_sure-data0060.parts_ordered end as int) as to_be_planned,data0060.orig_sched_ship_date,data0060.sch_date,data0060.quote_price,data0050.eq_appl_date,data0050.eq_close_date,
data0060.sch_date-data0050.shelf_life as planned_date,data0060.reput_qty,data0060.so_oldnew,data0050.audited_date,DATA0050.bom_status,DATA0050.tstatus,
data0010.rkey as rkey10,data0060.parts_shipped+data0060.returned_ship as total_ship,data0060.qty_socx_plan,data0050.eq_status,
data0060.parts_returned,data0060.parts_ordered + data0060.parts_returned -data0060.parts_shipped - data0060.returned_ship as total_rq,
case when data0060.ttype=0 then ''量产'' else ''样板'' end as prod_type,data0060.ppc_remark,
case when data0060.status=2 then ''暂缓'' else ''有效'' end as sostatus, data0060.qty_cancel_plan,data0060.qty_reput,data0060.reference_number,data0008.product_name,
case when data0050.onhold_planning_flag=0 then ''Yes'' end as MI,replace(replace(convert( varchar(500),data0011.memo_text),char(10),''''),char(13),'''') as so_notebook,data0060.parts_ordered*data0050.unit_sq as so_sq,data0050.risk_info
FROM dbo.Data0060(nolock) INNER JOIN
      dbo.Data0010(nolock) ON 
      dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN
      dbo.Data0097(nolock) ON 
      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN
      dbo.Data0050(nolock) ON 
      dbo.Data0060.CUST_PART_PTR = dbo.Data0050.RKEY LEFT OUTER JOIN
      dbo.Data0011(nolock) ON 
      dbo.Data0060.RKEY = dbo.Data0011.FILE_POINTER and data0011.source_type=60 left OUTER JOIN
      dbo.data0059(nolock) ON 
      dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY LEFT OUTER JOIN
	data0025(nolock) on data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
	left join data0008 on data0025.prod_code_ptr=data0008.rkey 
WHERE '
if @vtp <>1 
  set @cond=@cond+'
 (data0060.to_be_planned>0 or data0060.reput_qty>0 )  and data0060.so_style <> 2   
and (data0060.status<=2 or (data0060.status=4 and data0060.so_style=3)) and data0059.customer_ptr=data0060.customer_ptr'
if @vtp =1 
  set @cond=@cond+'
 data0060.qty_cancel_plan>0 and data0060.so_style <> 2   
and (data0060.status<=2 or (data0060.status=4 and data0060.so_style=3)) and data0059.customer_ptr=data0060.customer_ptr'

if @ontime =1 
  set @cond=@cond+'
and data0060.sch_date-data0050.shelf_life <='''+convert(varchar(10),getdate(),102)+''''

if @vso_tp=0
  set @cond=@cond+'
and data0060.so_tp in (0,2)'
if @vso_tp=1
  set @cond=@cond+'
and data0060.so_tp = 0'
if @vso_tp=2
  set @cond=@cond+'
and data0060.so_tp = 2'
if @vso_tp=3
  set @cond=@cond+'
and data0060.so_tp = 1'

if @onhold =1 
  set @cond=@cond+'
and data0060.quote_price<>0 and data0060.quote_price<>2 and onhold_planning_flag = 0 and data0060.status=1 and data0060.sch_date is not null '
if @onhold =1 
if @flag=1  set @cond=@cond+' and data0060.prod_rel in (2,3) '

if @datetype =0 
  set @cond=@cond+'
and ent_date>='''+@date1+''' and ent_date<='''+ @date2+' 23:59:59'''

if @datetype =1
  set @cond=@cond+'
and data0060.sch_date>='''+@date1+''' and data0060.sch_date<='''+ @date2+' 23:59:59'''

if @vtype =0
 set @cond=@cond+' and data0060.ttype=0'
if @vtype =1
 set @cond=@cond+' and data0060.ttype=1'

if @vwhse_ptr<>'0'
  set @cond=@cond+'
and data0060.whse_ptr='+@vwhse_ptr+' '

if @order = 0   
set @cond=@cond+'
order by 
data0060.sch_date-data0050.shelf_life-data0050.mfg_lead_time  ,
data0050.customer_part_number
'
if @order = 1   
set @cond=@cond+'
order by 
data0060.sch_date ,
data0050.customer_part_number'
print @cond
exec (@cond)
go


--投产出来数据
declare @vflag int
select @vflag=isnull(ppc_control13,0) from data0192
SELECT data0050.layers,data0060.so_style,data0050.etest_tp,data0050.cnc_tp,data0010.cust_code,data0010.abbr_name,data0050.rkey,data0060.ent_date,data0050.cp_rev1,data0050.cp_rev2,data0060.ttype,
data0050.customer_part_number,data0050.cp_rev,data0050.onhold_planning_flag,data0060.conf_date,data0060.cust_part_ptr,
data0059.customer_part_desc,data0059.customer_matl_desc,data0060.sales_order,data0060.parts_ordered,data0060.sales_dept_list,data0060.fob,
data0060.PROD_REL,data0060.rkey as d060_RKEY,data0097.po_number,data0060.PUTHMAT_DESC,data0059.onhold_sales_flag,data0060.whse_ptr,data0060.so_tp,
case when data0050.usheet>0 then data0060.parts_ordered*data0050.psheet/data0050.usheet else 0 end as pnls_ordered,
data0060.qty_plannned,data0060.to_be_planned as orig_to_be_planned,cast(case when @vflag=0 then data0060.to_be_planned else data0060.to_be_planned+data0060.qty_sure-data0060.parts_ordered end as int) as to_be_planned,data0060.orig_sched_ship_date,data0060.sch_date,data0060.quote_price,data0050.eq_appl_date,data0050.eq_close_date,
data0060.sch_date-data0050.shelf_life as planned_date,data0060.reput_qty,data0060.so_oldnew,data0050.audited_date,DATA0050.bom_status,DATA0050.tstatus,
data0010.rkey as rkey10,data0060.parts_shipped+data0060.returned_ship as total_ship,data0060.qty_socx_plan,data0050.eq_status,
data0060.parts_returned,data0060.parts_ordered + data0060.parts_returned -data0060.parts_shipped - data0060.returned_ship as total_rq,
case when data0060.ttype=0 then '量产' else '样板' end as prod_type,data0060.ppc_remark,
case when data0060.status=2 then '暂缓' else '有效' end as sostatus, data0060.qty_cancel_plan,data0060.qty_reput,data0060.reference_number,data0008.product_name,
case when data0050.onhold_planning_flag=0 then 'Yes' end as MI,replace(replace(convert( varchar(500),data0011.memo_text),char(10),''),char(13),'') as so_notebook,data0060.parts_ordered*data0050.unit_sq as so_sq,data0050.risk_info
FROM dbo.Data0060(nolock) 
INNER JOIN    dbo.Data0010(nolock) ON       dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY 
LEFT OUTER JOIN dbo.Data0097(nolock) ON    dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY
 INNER JOIN   dbo.Data0050(nolock) ON       dbo.Data0060.CUST_PART_PTR = dbo.Data0050.RKEY 
 LEFT OUTER JOIN       dbo.Data0011(nolock) ON       dbo.Data0060.RKEY = dbo.Data0011.FILE_POINTER and data0011.source_type=60 
 left OUTER JOIN      dbo.data0059(nolock) ON       dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY 
 LEFT OUTER JOIN	data0025(nolock) on data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
	left join data0008 on data0025.prod_code_ptr=data0008.rkey 
WHERE 
 (data0060.to_be_planned>0 or data0060.reput_qty>0 ) --待计划和补投 
 and data0060.so_style <> 2   
and (data0060.status<=2 or (data0060.status=4 and data0060.so_style=3)) and data0059.customer_ptr=data0060.customer_ptr
and data0060.so_tp in (0,2) and SALES_ORDER like '13040149-01'
order by 
data0060.sch_date ,
data0050.customer_part_number

--取消投产列表
exec sp_executesql N'select * from data0360 where so_ptr=@P1
',N'@P1 int',6096


--投产提前检视
--在制及半成品

exec EP052;29 7698

exec EP052;5 'P2H171247','A'--未完成订单总数
exec EP052;6 'P2H171247','A'--在制品总数
exec EP052;7 'P2H171247','A'--成口没分配库存



--订单的历史信息
exec EP052;8 '2013-03-06 00:09:01','2013-10-03 00:09:02','037-FX2-0121','A'

exec EP052;25 7698 --库存信息汇总



--工艺
exec sp_executesql N'declare @vptr int
set @vptr=@P1
SELECT distinct data0038.flow_no,data0025.rkey as rkey_25
from data0038,data0025
where
data0038.source_ptr=data0025.rkey
and data0025.ancestor_ptr=@vptr
and data0025.parent_ptr=0
order by data0038.flow_no


',N'@P1 int',7698

--待计划列表

exec sp_executesql N'SELECT data0060.*,data0050.customer_part_number,data0050.cp_rev
 FROM DATA0060 ,data0050
WHERE data0060.cust_part_ptr in
(7698)
and (data0060.to_be_planned>0 or data0060.reput_qty >0)
and (data0060.status=1 or (data0060.status=4 and data0060.so_style=3)) and sch_date is not null
and data0060.cust_part_ptr=data0050.rkey   and so_tp<>1
and data0050.onhold_planning_flag=0
and quote_price<>0
and quote_price<>2
and prod_rel<>@P1

order by data0060.sch_date
 
',N'@P1 varchar(16)','0'

--仁创艺
exec sp_executesql N'SELECT data0060.*,data0050.customer_part_number,data0050.cp_rev,data0360.sch_date AS PPC_DATE,
data0360.rkey as rkey360,
data0360.quantity-isnull(data0360.cancel_qty,0) as quantity,
data0360.planned_qty,
data0360.REMARK

FROM data0050,DATA0060 left join data0360 on data0360.so_ptr=Data0060.RKEY and data0360.planned_qty<data0360.quantity
WHERE data0060.cust_part_ptr in
(12158)
and (data0060.to_be_planned>0 or data0060.reput_qty >0)
and (data0060.status=1 or (data0060.status=4 and data0060.so_style=3)) and data0060.sch_date is not null
and data0060.cust_part_ptr=data0050.rkey   and so_tp<>1
and data0050.onhold_planning_flag=0
and quote_price<>0
and quote_price<>2
and prod_rel<>@P1

order by data0060.sch_date,data0360.sch_date
',N'@P1 varchar(16)','1'



--计划内部交期列表
exec sp_executesql N'select a.so_ptr,a.quantity,a.sch_date,a.cancel_qty,
a.planned_qty,b.sales_order
from data0360 a inner join data0060 b
on a.so_ptr=b.rkey
where so_ptr=@P1
',N'@P1 int',6096

select * from data0360 where so_ptr =6096

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0195" SET "ep052_type"=@P1,"ep052_min_lot_pnl"=@P2 WHERE "rkey"=@P3 AND "ep052_type"=@P4 AND "ep052_min_lot_pnl"=@P5',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int',0,30,1,0,30

Select ppc_control6,ppc_control7,ppc_control8,ppc_control10,PPC_CTL_PNL_1,PPC_CTL_PNL_2,PPC_CTL_PNL_3,
PPC_CTL_SEED_1,PPC_CTL_SEED_2,PPC_CTL_SEED_3,PPC_CTL_SEED_4,ppc_control22,
ppc_control26,ppc_control32,ppc_control24,ppc_control31,data0195.so_lot_lmt_1,data0195.EP052_WITHOUT_MATL_FLAG,
data0195.so_lot_lmt_2,data0195.so_lot_lmt_3,data0195.so_lot_lmt_4,data0195.ppc_reput_flag,
data0195.so_pct_lmt_1,data0195.so_pct_lmt_2,data0195.so_pct_lmt_3,data0195.so_pct_lmt_4,data0195.so_pct_lmt_5
from data0192,data0195


exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0006" ("WORK_ORDER_NUMBER","CUT_NO","PANEL_A_B","WHOUSE_PTR","BOM_PTR","PRIORITY_CODE","PROD_STATUS","QUAN_SCH","PANELS","ENT_DATETIME","SCH_COMPL_DATE","PARTS_PER_PANEL","FLOW_NO","put_type","pnl_size","SETS_QTY","parts_per_set") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(15),@P2 varchar(20),@P3 int,@P4 int,@P5 int,@P6 tinyint,@P7 smallint,@P8 float,@P9 int,@P10 datetime,@P11 datetime,@P12 float,@P13 smallint,@P14 tinyint,@P15 varchar(17),@P16 int,@P17 int','130605001-0-2-1','130605001-0         ',0,2,9277,0,2,216,72,'2013-06-05 00:29:18','2013-05-25 00:00:00',3,0,1,'609.6mm X 406.4mm',216,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0006" ("WORK_ORDER_NUMBER","CUT_NO","PANEL_A_B","WHOUSE_PTR","BOM_PTR","PRIORITY_CODE","PROD_STATUS","QUAN_SCH","PANELS","ENT_DATETIME","SCH_COMPL_DATE","PARTS_PER_PANEL","FLOW_NO","put_type","pnl_size","SETS_QTY","parts_per_set") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(15),@P2 varchar(20),@P3 int,@P4 int,@P5 int,@P6 tinyint,@P7 smallint,@P8 float,@P9 int,@P10 datetime,@P11 datetime,@P12 float,@P13 smallint,@P14 tinyint,@P15 varchar(17),@P16 int,@P17 int','130605001-0-2-2','130605001-0         ',0,2,9277,0,2,96,32,'2013-06-05 00:29:18','2013-05-25 00:00:00',3,0,1,'609.6mm X 406.4mm',96,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0468" ("CUT_NO","SO_NO","FLOW_NO","STEP","DEPT_PTR","INVENT_PTR","QUAN_BOM","PRINTIT","VENDOR","Invent_or","remark","length","width","thickness","uset","sys","std_qty_bom","location","reference_number","key_flag") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(20),@P2 varchar(12),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 float,@P8 varchar(1),@P9 varchar(1),@P10 smallint,@P11 varchar(33),@P12 float,@P13 float,@P14 float,@P15 float,@P16 float,@P17 float,@P18 varchar(1),@P19 varchar(1),@P20 varchar(1)','130605001-0         ','13040149-01 ',0,1,665,472,20.800000000000001,'Y','',0,';仓存:369;已分配:1223.42141428571',NULL,NULL,NULL,NULL,NULL,NULL,'','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0468" ("CUT_NO","SO_NO","FLOW_NO","STEP","DEPT_PTR","INVENT_PTR","QUAN_BOM","PRINTIT","VENDOR","Invent_or","remark","length","width","thickness","uset","sys","std_qty_bom","location","reference_number","key_flag") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(20),@P2 varchar(12),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 float,@P8 varchar(1),@P9 varchar(1),@P10 smallint,@P11 varchar(31),@P12 float,@P13 float,@P14 float,@P15 float,@P16 float,@P17 float,@P18 varchar(1),@P19 varchar(1),@P20 varchar(1)','130605001-0         ','13040149-01 ',0,4,554,443,0.29999999999999999,'Y','',0,';仓存:0;已分配:48.8109624937688',NULL,NULL,NULL,NULL,NULL,NULL,'','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0468" ("CUT_NO","SO_NO","FLOW_NO","STEP","DEPT_PTR","INVENT_PTR","QUAN_BOM","PRINTIT","VENDOR","Invent_or","remark","length","width","thickness","uset","sys","std_qty_bom","location","reference_number","key_flag") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(20),@P2 varchar(12),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 float,@P8 varchar(1),@P9 varchar(1),@P10 smallint,@P11 varchar(31),@P12 float,@P13 float,@P14 float,@P15 float,@P16 float,@P17 float,@P18 varchar(1),@P19 varchar(1),@P20 varchar(1)','130605001-0         ','13040149-01 ',0,8,423,966,4.2653999999999996,'Y','',0,';仓存:0;已分配:2337099.86690701',NULL,NULL,NULL,NULL,NULL,NULL,'','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0468" ("CUT_NO","SO_NO","FLOW_NO","STEP","DEPT_PTR","INVENT_PTR","QUAN_BOM","PRINTIT","VENDOR","Invent_or","remark","length","width","thickness","uset","sys","std_qty_bom","location","reference_number","key_flag") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(20),@P2 varchar(12),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 float,@P8 varchar(1),@P9 varchar(1),@P10 smallint,@P11 varchar(30),@P12 float,@P13 float,@P14 float,@P15 float,@P16 float,@P17 float,@P18 varchar(1),@P19 varchar(1),@P20 varchar(1)','130605001-0         ','13040149-01 ',0,9,445,979,0.0693,'Y','',0,';仓存:0;已分配:5273.3667116841',NULL,NULL,NULL,NULL,NULL,NULL,'','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0491" ("MO_PTR","APP_QUAN","remark") VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(4)',15698,311,'test'
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."DATA0060" SET "PROD_REL"=@P1,"TO_BE_PLANNED"=@P2,"QTY_PLANNNED"=@P3,"REPUT_QTY"=@P4,"ppc_trans_qty"=@P5 WHERE "RKEY"=@P6 AND "PROD_REL"=@P7 AND "TO_BE_PLANNED"=@P8 AND "QTY_PLANNNED"=@P9 AND "REPUT_QTY"=@P10 AND "ppc_trans_qty"=@P11',N'@P1 varchar(1),@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 varchar(1),@P8 int,@P9 int,@P10 int,@P11 float','3',0,400,0,0,15562,'3',0,100,300,0
go
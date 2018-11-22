--EP003存储过程1修改  --有15万多数据改为临时表
--exec EP003;1 1,1,'2','7',4,2,3,0,4,2,'%',0,'%','3',NULL,NULL,0,2,NULL,NULL

DROP TABLE #TMP_TB
select distinct isnull(so_ptr,0) SO_PTR
INTO #TMP_TB
from data0006 where rkey in (select wo_ptr from data0056)
drop table #setcustpart 

Select data0056.rkey,data0050.customer_part_number
into #setcustpart 
From Data0056(nolock) inner join
     Data0006(nolock) on Data0056.wo_ptr=Data0006.Rkey inner join
     Data0025(nolock) on Data0006.sets_bom_ptr=Data0025.Rkey inner join
     Data0050(nolock) on Data0025.ancestor_ptr=Data0050.rkey
where data0006.sets_bom_ptr>0
--select * from #setcustpart 

select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,DATA0059.CUSTOMER_PART_DESC,DATA0050.ENG_TP,DATA0050.ETEST_TP,DATA0050.CNC_TP,
       SUM(DATA0056.PANELS) AS PANELS,#TEST00.SALES_ORDER,#TEST00.p_code,#TEST00.FOB,DATA0097.PO_NUMBER,#TEST00.SCH_DATE,#TEST00.ENT_DATE,#TEST00.STATUS,#TEST00.QTY_TRAN,DATA0047.PARAMETER_VALUE,
       B.PARAMETER_VALUE AS UNIT2,#TEST00.PARTS_ORDERED,ROUND(#TEST00.PART_PRICE/#TEST00.EXCH_RATE,6) AS PRICE,
	#TEST00.PARTS_SHIPPED,#TEST00.part_ovsh,#TEST00.quan_to_re_delivery,#TEST00.returned_ship,DATA0492.ISSUE_DATE,
       DATA0025.MANU_PART_NUMBER,DATA0492.CUT_NO,isnull(DATA0492.PROD_REMARK,'')+isnull(#TEST00.ppc_remark,'')+(case when #TEST00.qty_cancel_plan>0 then '取消投产'+ltrim(str(#TEST00.qty_cancel_plan)) else null end) as prod_remark,
		DATA0492.TTYPE AS TTP,DATA0492.ISSUED_QTY,DATA0010.CUST_CODE,DATA0050.ANALYSIS_CODE_4,
       DATA0010.ABBR_NAME,DATA0008.PROD_CODE+'.'+DATA0008.PRODUCT_NAME AS PROD_CODE,DATA0492.PANEL_1_QTY,DATA0492.UPANEL1,DATA0492.PANEL_2_QTY,DATA0492.UPANEL2,DATA0492.PANEL_3_QTY,DATA0492.UPANEL3,
       DATA0492.PANEL_4_QTY,DATA0492.UPANEL4,DATA0025.PARENT_PTR,DATA0025.RKEY,DATA0050.ANALYSIS_CODE_2,DATA0050.ANALYSIS_CODE_3,SUM( DATA0056.QTY_BACKLOG+DATA0056.TO_BE_STOCKED) AS QTY_BACKLOG,
       DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,#TEST00.SO_OLDNEW,DATA0492.ISSUE_DATE+DATA0008.LEAD_TIME2 AS ORIG_SCHED_SHIP_DATE,DATA0492.PNL1_SIZE,
       DATA0492.PNL2_SIZE,DATA0492.PNL3_SIZE,DATA0492.PNL4_SIZE,MAX(DATA0006_1.PROD_STATUS) AS PROD_STATUS,DATA0050.ANALYSIS_CODE_5,
       CAST(DATA0025.RKEY AS VARCHAR(10))+RTRIM(ISNULL(DATA0492.CUT_NO,''))+RTRIM(CP_REV) AS CUT_NO_CP_REV,#TEST00.ppc_remark,
       (CASE DATA0492.CON_FLAG 
			WHEN 0 THEN '待发料' 
			WHEN 1 THEN '结束'  
		ELSE '' END) AS CON_FLAG,
#setcustpart.customer_part_number as set_customer_part_number

from data0056(nolock) 
inner join   (select * from data0006(nolock) where rkey in (select wo_ptr from data0056)) as data0006_1 on data0056.wo_ptr=data0006_1.RKEY
left join   data0025(nolock) on data0006_1.bom_ptr=data0025.rkey 
     left join   #setcustpart(nolock) on #setcustpart.rkey=data0056.rkey 
     left join  data0047(nolock) on data0025.rkey=data0047.source_pointer and data0047.parameter_ptr=2
      left join  data0047 b(nolock)on data0025.rkey=b.source_pointer and b.parameter_ptr=7 
      left join   data0008(nolock) on data0025.prod_code_ptr=data0008.rkey 
      left join   data0050(nolock) on data0025.ancestor_ptr=data0050.rkey 
      left join   data0492(nolock) on data0006_1.cut_no=data0492.cut_no and  data0006_1.prod_status<200 and data0006_1.prod_status<>9 
      left join  (select data0060.* from data0060(nolock)  where data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,103)) ) as #test00 on #test00.sales_order=data0492.so_no 
      left join  data0010(nolock) on data0492.customer_ptr=data0010.rkey 
     left join   data0059(nolock) on data0050.rkey=data0059.cust_part_ptr and data0492.customer_ptr=data0059.customer_ptr 
     left join  data0097(nolock) on #test00.purchase_order_ptr=data0097.rkey  where data0056.unit_ptr=0 and data0056.unit_ptr=0  and  #test00.status<=2
group by
	data0050.CATALOG_NUMBER,data0050.rkey,data0050.ttype,#test00.sch_date,#test00.ent_date,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0050.eng_tp,
    data0050.etest_tp,data0050.cnc_tp,#test00.sales_order,data0097.po_number,#test00.status,#test00.fob,data0047.parameter_value,data0025.manu_part_number,#TEST00.ppc_remark,#TEST00.qty_cancel_plan,
    b.parameter_value,#test00.parts_ordered,#TEST00.p_code,#test00.part_price,#test00.exch_rate,#test00.parts_shipped,#TEST00.part_ovsh,quan_to_re_delivery,#TEST00.returned_ship,data0492.issue_date,data0492.cut_no,
    cast(data0025.rkey as varchar(10))+rtrim(isnull(data0492.cut_no,''))+rtrim(cp_rev),data0050.analysis_code_4,data0050.cp_rev,data0492.prod_remark,data0492.ttype,
    data0492.issued_qty,data0010.cust_code,data0010.abbr_name,data0008.prod_code+'.'+data0008.product_name,data0492.Panel_1_qty,data0050.analysis_code_5,
    data0492.upanel1,data0492.Panel_2_qty,data0492.upanel2,data0492.Panel_3_qty,data0492.upanel3,data0492.Panel_4_qty,data0492.upanel4,data0025.parent_ptr,data0025.rkey,
    data0050.set_x_qty*data0050.set_y_qty,data0050.layers,#test00.so_oldnew,data0008.lead_time2,data0492.pnl1_size,data0492.pnl2_size,data0492.pnl3_size,
    data0050.analysis_code_2,data0492.pnl4_size,#test00.qty_tran,data0492.Con_Flag,data0050.analysis_code_3,#setcustpart.customer_part_number
	union all 
	select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,DATA0059.CUSTOMER_PART_DESC,DATA0050.ENG_TP,DATA0050.ETEST_TP,DATA0050.CNC_TP,
		   0 AS PANELS,data0060.SALES_ORDER,data0060.p_code,data0060.FOB,DATA0097.PO_NUMBER,data0060.SCH_DATE,data0060.ENT_DATE,data0060.STATUS,data0060.QTY_TRAN,DATA0047.PARAMETER_VALUE,
		   B.PARAMETER_VALUE AS UNIT2,data0060.PARTS_ORDERED,ROUND(data0060.PART_PRICE/data0060.EXCH_RATE,6) AS PRICE,
	data0060.PARTS_SHIPPED,DATA0060.part_ovsh,data0060.quan_to_re_delivery,data0060.returned_ship,null as ISSUE_DATE,
		   null as MANU_PART_NUMBER,null as CUT_NO,isnull(data0060.ppc_remark,'')+(case when data0060.qty_cancel_plan>0 then '取消投产'+ltrim(str(data0060.qty_cancel_plan)) else null end) as prod_remark,
			null as TTP,null as  ISSUED_QTY,DATA0010.CUST_CODE,DATA0050.ANALYSIS_CODE_4,
		   DATA0010.ABBR_NAME,DATA0008.PROD_CODE+'.'+DATA0008.PRODUCT_NAME AS PROD_CODE,null as PANEL_1_QTY,null as UPANEL1,null as PANEL_2_QTY,null as UPANEL2,null as PANEL_3_QTY,null as UPANEL3,
		   null as PANEL_4_QTY,null as UPANEL4,null as PARENT_PTR,null as RKEY,DATA0050.ANALYSIS_CODE_2,DATA0050.ANALYSIS_CODE_3,null AS QTY_BACKLOG,
		   DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,data0060.SO_OLDNEW,null AS ORIG_SCHED_SHIP_DATE,null as PNL1_SIZE,
		   null as PNL2_SIZE,null as PNL3_SIZE,null as PNL4_SIZE,null AS PROD_STATUS,DATA0050.ANALYSIS_CODE_5,
		   CAST(DATA0025.RKEY AS VARCHAR(10))+'so' AS CUT_NO_CP_REV,data0060.ppc_remark,
       (CASE DATA0050.TSTATUS	
			WHEN 0 THEN 'MI制作中-'+convert(varchar(10),data0060.ORIG_SCHED_SHIP_DATE-data0050.shelf_life-data0050.MFG_LEAD_TIME,12)
			WHEN 1 THEN 'MI待1审'
			WHEN 2 THEN 'MI待2审'
			WHEN 3 THEN 'MI待3审'
			WHEN 4 THEN 'MI待4审'
			WHEN 5 THEN 'MI审核退'
			WHEN 6 THEN 'MI审核退'
			WHEN 7 THEN 'MI审核退'
			WHEN 8 THEN 'MI审核退'
			WHEN 9 THEN 'MI已OK'
		 ELSE '' END) AS CON_FLAG,null
	from data0060(nolock)
	JOIN data0050(nolock) ON data0060.cust_part_ptr=data0050.rkey
	JOIN data0010(nolock) ON data0060.customer_ptr=data0010.rkey
	JOIN data0059(nolock) ON Data0059.cust_part_ptr=data0060.cust_part_ptr AND data0059.customer_ptr=data0060.customer_ptr 
	JOIN Data0025 ON data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
	JOIN data0008(nolock) ON data0025.prod_code_ptr=data0008.rkey
	LEFT JOIN data0097(nolock) ON data0060.purchase_order_ptr=data0097.rkey 
	 left join 	 data0047(nolock) on data0025.rkey=data0047.source_pointer and data0047.parameter_ptr=2 
	 left join  data0047 b(nolock)on data0025.rkey=b.source_pointer and b.parameter_ptr=7
	where data0060.status=1 
	and (data0060.qty_plannned=0 
	or data0060.rkey not in (SELECT SO_PTR FROM #TMP_TB)
	)
	and data0060.ent_date>getdate()-180
		and data0025.prod_code_ptr=data0008.rkey and  data0060.status<=2 
		order by data0050.ttype DESC,sch_date,data0050.customer_part_number,customer_part_desc
		
		
		
--------------------------------------改过的存储过程
alter PROCEDURE EP003;1
@vsotp int,-- 是否显示未订单 0:不显示，1：显示
@vtp int,-- 不显示已经交货但尚有WIP的订单 0:显示，1：不显示
@vptr1 varchar(12),  -- 明细单位
@vptr2 varchar(12),  -- 汇总单位
@vindex int,  -- 排序顺序1
@vindex3 int,  -- 排序顺序2
@vindex4 int,  -- 排序顺序3
@vindex2 int,  --产品范围(与@vproj配合使用) 0：全部，1：本厂编号，2：客户型号
@vindex5 int,  --返工与否 0：正常，1：返工，2：全部
@vindex6 int,  -- 0：正常，1：暂缓，2：全部
@vproj varchar(20),--与@vindex2配合使用
@vcust_flag tinyint ,--客户
@vcust varchar(10),--客户范围
@vttype varchar(1)='2',--产品类型 0:量产，1：样板，2：全部
@BDate varchar(10)='2000-01-01',--客户交期开始时间
@EDate varchar(10)='2049-01-01',--客户交期结束时间
@Whse_ptr int,--工厂指针
@SalCon int,--订单那完工情况
@BDate1 varchar(10)='2000-01-01',--回复交期开始时间
@EDate1 varchar(10)='2049-01-01'--回复交期结束时间
with encryption
AS

declare @cond varchar(8000)
declare @cond1 varchar(8000)

SET @cond1 = '' ; 
Select distinct Data0279.Source_ptr,Data0278.Parameter_desc,
       --Parameter_Value=convert(decimal(18,5),'0'+Ltrim(Rtrim(Data0279.Parameter_Value)))
       Parameter_Value=case when ISNUMERIC(Parameter_Value)=1 then CAST(Data0279.Parameter_Value AS FLOAT) else  0 end
       ,Data0278.SPEC_RKEY
into #Parameter_Value 
From Data0056(nolock) inner join
     Data0006(nolock) on Data0056.wo_ptr=Data0006.Rkey inner join
     Data0025(nolock) on Data0006.bom_ptr=Data0025.Rkey inner join
     Data0279(nolock) on Data0025.Rkey=Data0279.SOURCE_PTR and Data0279.Parameter_Value<>''  inner join
     Data0278(nolock) on Data0279.Parameter_ptr=Data0278.Rkey
             and Data0278.SPEC_RKEY in ('6','7')
             and ISNUMERIC(Parameter_Value)=1

Select data0056.rkey,data0050.customer_part_number
into #setcustpart 
From Data0056(nolock) inner join
     Data0006(nolock) on Data0056.wo_ptr=Data0006.Rkey inner join
     Data0025(nolock) on Data0006.sets_bom_ptr=Data0025.Rkey inner join
     Data0050(nolock) on Data0025.ancestor_ptr=Data0050.rkey
where data0006.sets_bom_ptr>0

select @cond='
select distinct isnull(so_ptr,0) SO_PTR
INTO #TMP_TB
from data0006 where rkey in (select wo_ptr from data0056)

select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,DATA0059.CUSTOMER_PART_DESC,DATA0050.ENG_TP,DATA0050.ETEST_TP,DATA0050.CNC_TP,
       SUM(DATA0056.PANELS) AS PANELS,#TEST00.SALES_ORDER,#TEST00.p_code,#TEST00.FOB,DATA0097.PO_NUMBER,#TEST00.SCH_DATE,#TEST00.ENT_DATE,#TEST00.STATUS,#TEST00.QTY_TRAN,DATA0047.PARAMETER_VALUE,
       B.PARAMETER_VALUE AS UNIT2,#TEST00.PARTS_ORDERED,ROUND(#TEST00.PART_PRICE/#TEST00.EXCH_RATE,6) AS PRICE,
	#TEST00.PARTS_SHIPPED,#TEST00.part_ovsh,#TEST00.quan_to_re_delivery,#TEST00.returned_ship,DATA0492.ISSUE_DATE,
       DATA0025.MANU_PART_NUMBER,DATA0492.CUT_NO,isnull(DATA0492.PROD_REMARK,'''')+isnull(#TEST00.ppc_remark,'''')+(case when #TEST00.qty_cancel_plan>0 then ''取消投产''+ltrim(str(#TEST00.qty_cancel_plan)) else null end) as prod_remark,
		DATA0492.TTYPE AS TTP,DATA0492.ISSUED_QTY,DATA0010.CUST_CODE,DATA0050.ANALYSIS_CODE_4,
       DATA0010.ABBR_NAME,DATA0008.PROD_CODE+''.''+DATA0008.PRODUCT_NAME AS PROD_CODE,DATA0492.PANEL_1_QTY,DATA0492.UPANEL1,DATA0492.PANEL_2_QTY,DATA0492.UPANEL2,DATA0492.PANEL_3_QTY,DATA0492.UPANEL3,
       DATA0492.PANEL_4_QTY,DATA0492.UPANEL4,DATA0025.PARENT_PTR,DATA0025.RKEY,DATA0050.ANALYSIS_CODE_2,DATA0050.ANALYSIS_CODE_3,SUM( DATA0056.QTY_BACKLOG+DATA0056.TO_BE_STOCKED) AS QTY_BACKLOG,
       DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,#TEST00.SO_OLDNEW,DATA0492.ISSUE_DATE+DATA0008.LEAD_TIME2 AS ORIG_SCHED_SHIP_DATE,DATA0492.PNL1_SIZE,
       DATA0492.PNL2_SIZE,DATA0492.PNL3_SIZE,DATA0492.PNL4_SIZE,MAX(DATA0006_1.PROD_STATUS) AS PROD_STATUS,DATA0050.ANALYSIS_CODE_5,
       CAST(DATA0025.RKEY AS VARCHAR(10))+RTRIM(ISNULL(DATA0492.CUT_NO,''''))+RTRIM(CP_REV) AS CUT_NO_CP_REV,#TEST00.ppc_remark,
       (CASE DATA0492.CON_FLAG 
			WHEN 0 THEN ''待发料'' 
			WHEN 1 THEN ''结束''  
		ELSE '''' END) AS CON_FLAG,
#setcustpart.customer_part_number as set_customer_part_number
from data0056(nolock) inner join
     (select * from data0006(nolock) where rkey in (select wo_ptr from data0056)) as data0006_1 on data0056.wo_ptr=data0006_1.RKEY left join 
     data0025(nolock) on data0006_1.bom_ptr=data0025.rkey left join 
     #setcustpart(nolock) on #setcustpart.rkey=data0056.rkey left join 
     data0047(nolock) on data0025.rkey=data0047.source_pointer and data0047.parameter_ptr='+@vptr1+' left join 
     data0047 b(nolock)on data0025.rkey=b.source_pointer and b.parameter_ptr='+@vptr2+' left join 
     data0008(nolock) on data0025.prod_code_ptr=data0008.rkey left join 
     data0050(nolock) on data0025.ancestor_ptr=data0050.rkey left join 
     data0492(nolock) on data0006_1.cut_no=data0492.cut_no and  data0006_1.prod_status<200 and data0006_1.prod_status<>9 left join 
    (select data0060.* from data0060(nolock)  where data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,103))'
IF not @BDate IS NULL
select @cond=@cond+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''1999-01-01'')>='''+@BDate+''''
IF not @EDate IS NULL
select @cond=@cond+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''2039-01-01'')<='''+@EDate+''''
--回复交期过滤
IF not @BDate1 IS NULL
select @cond=@cond+' and IsNull(Data0060.SCH_DATE,''1999-01-01'')>='''+@BDate1+''''
IF not @EDate1 IS NULL
select @cond=@cond+' and IsNull(Data0060.SCH_DATE,''2039-01-01'')<='''+@EDate1+''''
--if (@vtp=1)
--select @cond=@cond+' and  data0060.status<=2'
select @cond=@cond+' ) as #test00 on #test00.sales_order=data0492.so_no left join
     data0010(nolock) on data0492.customer_ptr=data0010.rkey left join 
     data0059(nolock) on data0050.rkey=data0059.cust_part_ptr and data0492.customer_ptr=data0059.customer_ptr left join 
     data0097(nolock) on #test00.purchase_order_ptr=data0097.rkey '
select @cond=@cond+' where data0056.unit_ptr=0'

IF @vindex2=1
select @cond=@cond+' and DATA0050.CUSTOMER_PART_NUMBER LIKE '''+@VPROJ+''''
else IF @vindex2=2
select @cond=@cond+' and data0059.customer_part_desc LIKE '''+@VPROJ+''''
else IF @vindex2=3
select @cond=@cond+' and data0050.CATALOG_NUMBER LIKE '''+@VPROJ+''''

if @Vcust<>'%'
if @vcust_flag=0 
	select @cond=@cond+' and ISNULL(Data0010.cust_code,'''') LIKE '''+@Vcust+''''
else
	select @cond=@cond+' and ISNULL(Data0010.cust_code,'''') not LIKE '''+@Vcust+''''

if @Whse_ptr>0
select @cond=@cond+' and data0006_1.whouse_ptr='+convert(varchar(10),@Whse_ptr)

if @vindex5=0
  select @cond=@cond+' and  data0056.wtype=0 and data0056.unit_ptr=0 '

if @vindex5=1
  select @cond=@cond+' and  data0056.wtype=1 and data0056.unit_ptr=0 '
else
if @vindex5=2
  select @cond=@cond+' and  data0056.wtype=2 and data0056.unit_ptr=0 '
else
if @vindex5=3
  select @cond=@cond+' and data0056.wtype in (0,2) and data0056.unit_ptr=0 '
else
  select @cond=@cond+' and data0056.unit_ptr=0 '

--客户交期过滤
IF not @BDate IS NULL
select @cond=@cond+' and IsNull(#test00.ORIG_SCHED_SHIP_DATE,''1999-01-01'')>='''+@BDate+''''
IF not @EDate IS NULL
select @cond=@cond+' and IsNull(#test00.ORIG_SCHED_SHIP_DATE,''2039-01-01'')<='''+@EDate+''''
--回复交期过滤
IF not @BDate1 IS NULL
select @cond=@cond+' and IsNull(#test00.SCH_DATE,''1999-01-01'')>='''+@BDate1+''''
IF not @EDate1 IS NULL
select @cond=@cond+' and IsNull(#test00.SCH_DATE,''2039-01-01'')<='''+@EDate1+''''

if (@vtp=1)
select @cond=@cond+' and  #test00.status<=2'

if @vindex6=0
  select @cond=@cond+' and data0006_1.prod_status < 9 '
if @vindex6=1
  select @cond=@cond+' and data0006_1.prod_status in (101,102,103) '

if  (@vttype<>'3')
select @cond=@cond+' and  data0050.ttype='+@vttype

select @cond=@cond+'
group by
	data0050.CATALOG_NUMBER,data0050.rkey,data0050.ttype,#test00.sch_date,#test00.ent_date,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0050.eng_tp,
    data0050.etest_tp,data0050.cnc_tp,#test00.sales_order,data0097.po_number,#test00.status,#test00.fob,data0047.parameter_value,data0025.manu_part_number,#TEST00.ppc_remark,#TEST00.qty_cancel_plan,
    b.parameter_value,#test00.parts_ordered,#TEST00.p_code,#test00.part_price,#test00.exch_rate,#test00.parts_shipped,#TEST00.part_ovsh,quan_to_re_delivery,#TEST00.returned_ship,data0492.issue_date,data0492.cut_no,
    cast(data0025.rkey as varchar(10))+rtrim(isnull(data0492.cut_no,''''))+rtrim(cp_rev),data0050.analysis_code_4,data0050.cp_rev,data0492.prod_remark,data0492.ttype,
    data0492.issued_qty,data0010.cust_code,data0010.abbr_name,data0008.prod_code+''.''+data0008.product_name,data0492.Panel_1_qty,data0050.analysis_code_5,
    data0492.upanel1,data0492.Panel_2_qty,data0492.upanel2,data0492.Panel_3_qty,data0492.upanel3,data0492.Panel_4_qty,data0492.upanel4,data0025.parent_ptr,data0025.rkey,
    data0050.set_x_qty*data0050.set_y_qty,data0050.layers,#test00.so_oldnew,data0008.lead_time2,data0492.pnl1_size,data0492.pnl2_size,data0492.pnl3_size,
    data0050.analysis_code_2,data0492.pnl4_size,#test00.qty_tran,data0492.Con_Flag,data0050.analysis_code_3,#setcustpart.customer_part_number'
if @SalCon=0 
select @cond=@cond+' having (sum(data0006_1.quan_prod)>=#test00.parts_ordered or IsNull(#test00.qty_tran,0)>=#test00.parts_ordered)'
if @SalCon=1 
select @cond=@cond+' having (sum(data0006_1.quan_prod)<#test00.parts_ordered and IsNull(#test00.qty_tran,0)<#test00.parts_ordered)'

if (@vsotp=1) 
begin
	select @cond1=@cond1+'
	union all 
	select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,DATA0059.CUSTOMER_PART_DESC,DATA0050.ENG_TP,DATA0050.ETEST_TP,DATA0050.CNC_TP,
		   0 AS PANELS,data0060.SALES_ORDER,data0060.p_code,data0060.FOB,DATA0097.PO_NUMBER,data0060.SCH_DATE,data0060.ENT_DATE,data0060.STATUS,data0060.QTY_TRAN,DATA0047.PARAMETER_VALUE,
		   B.PARAMETER_VALUE AS UNIT2,data0060.PARTS_ORDERED,ROUND(data0060.PART_PRICE/data0060.EXCH_RATE,6) AS PRICE,
	data0060.PARTS_SHIPPED,DATA0060.part_ovsh,data0060.quan_to_re_delivery,data0060.returned_ship,null as ISSUE_DATE,
		   null as MANU_PART_NUMBER,null as CUT_NO,isnull(data0060.ppc_remark,'''')+(case when data0060.qty_cancel_plan>0 then ''取消投产''+ltrim(str(data0060.qty_cancel_plan)) else null end) as prod_remark,
			null as TTP,null as  ISSUED_QTY,DATA0010.CUST_CODE,DATA0050.ANALYSIS_CODE_4,
		   DATA0010.ABBR_NAME,DATA0008.PROD_CODE+''.''+DATA0008.PRODUCT_NAME AS PROD_CODE,null as PANEL_1_QTY,null as UPANEL1,null as PANEL_2_QTY,null as UPANEL2,null as PANEL_3_QTY,null as UPANEL3,
		   null as PANEL_4_QTY,null as UPANEL4,null as PARENT_PTR,null as RKEY,DATA0050.ANALYSIS_CODE_2,DATA0050.ANALYSIS_CODE_3,null AS QTY_BACKLOG,
		   DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,data0060.SO_OLDNEW,null AS ORIG_SCHED_SHIP_DATE,null as PNL1_SIZE,
		   null as PNL2_SIZE,null as PNL3_SIZE,null as PNL4_SIZE,null AS PROD_STATUS,DATA0050.ANALYSIS_CODE_5,
		   CAST(DATA0025.RKEY AS VARCHAR(10))+''so'' AS CUT_NO_CP_REV,data0060.ppc_remark,
       (CASE DATA0050.TSTATUS	
			WHEN 0 THEN ''MI制作中-''+convert(varchar(10),data0060.ORIG_SCHED_SHIP_DATE-data0050.shelf_life-data0050.MFG_LEAD_TIME,12)
			WHEN 1 THEN ''MI待1审''
			WHEN 2 THEN ''MI待2审''
			WHEN 3 THEN ''MI待3审''
			WHEN 4 THEN ''MI待4审''
			WHEN 5 THEN ''MI审核退''
			WHEN 6 THEN ''MI审核退''
			WHEN 7 THEN ''MI审核退''
			WHEN 8 THEN ''MI审核退''
			WHEN 9 THEN ''MI已OK''
		 ELSE '''' END) AS CON_FLAG,null
	from data0060(nolock)
	
	JOIN data0050(nolock) ON data0060.cust_part_ptr=data0050.rkey
	JOIN data0010(nolock) ON data0060.customer_ptr=data0010.rkey
	JOIN data0059(nolock) ON Data0059.cust_part_ptr=data0060.cust_part_ptr AND data0059.customer_ptr=data0060.customer_ptr 
	JOIN Data0025 ON data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
	JOIN data0008(nolock) ON data0025.prod_code_ptr=data0008.rkey
	LEFT JOIN data0097(nolock) ON data0060.purchase_order_ptr=data0097.rkey 

	
	 left join
		 data0047(nolock) on data0025.rkey=data0047.source_pointer and data0047.parameter_ptr='+@vptr1+' left join 
		 data0047 b(nolock)on data0025.rkey=b.source_pointer and b.parameter_ptr='+@vptr2+'
	where data0060.status=1 and (data0060.qty_plannned=0 or data0060.rkey not in (SELECT SO_PTR FROM #TMP_TB))
	and data0060.ent_date>getdate()-180'


	IF not @BDate IS NULL
	select @cond1=@cond1+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''1999-01-01'')>='''+@BDate+''''
	IF not @EDate IS NULL
	select @cond1=@cond1+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''2039-01-01'')<='''+@EDate+''''
	--回复交期过滤
	IF not @BDate1 IS NULL
	select @cond1=@cond1+' and IsNull(Data0060.SCH_DATE,''1999-01-01'')>='''+@BDate1+''''
	IF not @EDate1 IS NULL
	select @cond1=@cond1+' and IsNull(Data0060.SCH_DATE,''2039-01-01'')<='''+@EDate1+''''
	if (@vtp=1)
	select @cond1=@cond1+' and  data0060.status<=2'

	IF @vindex2=1
	select @cond1=@cond1+' and DATA0050.CUSTOMER_PART_NUMBER LIKE '''+@VPROJ+''''
	else
	IF @vindex2=2
	select @cond1=@cond1+' and data0059.customer_part_desc LIKE '''+@VPROJ+''''
	else
	IF @vindex2=3
	select @cond1=@cond1+' and data0050.CATALOG_NUMBER LIKE '''+@VPROJ+''''

	if @Vcust<>'%'
	if @vcust_flag=0 
		select @cond1=@cond1+' and ISNULL(Data0010.cust_code,'''') LIKE '''+@Vcust+''''
	else
		select @cond1=@cond1+' and ISNULL(Data0010.cust_code,'''') not LIKE '''+@Vcust+''''

	if  (@vttype<>'3')
	select @cond1=@cond1+' and  data0050.ttype='+@vttype
end

if (@vindex=0) 
select @cond1=@cond1+' order by data0050.ttype DESC,data0050.layers'

if (@vindex=1) 
select @cond1=@cond1+' order by data0050.ttype DESC,prod_code '

if (@vindex=2) 
select @cond1=@cond1+' order by data0050.ttype DESC,DATA0050.customer_part_number'

if (@vindex=3) 
select @cond1=@cond1+' order by data0050.ttype DESC,customer_part_desc'

if (@vindex=4) 
select @cond1=@cond1+' order by data0050.ttype DESC,sch_date'

if (@vindex=5) 
select @cond1=@cond1+' order by data0050.ttype DESC,cust_code'

if (@vindex=6) 
select @cond1=@cond1+' order by data0050.ttype DESC,sales_order'

if (@vindex=7) 
select @cond1=@cond1+' order by data0050.ttype DESC,fob'

if (@vindex=8) 
select @cond1=@cond1+' order by data0050.ttype DESC,cp_rev'

if (@vindex=9) 
select @cond1=@cond1+' order by data0050.ttype DESC,data0492.cut_no'

if (@vindex=10) 
select @cond1=@cond1+' order by data0050.ttype DESC,data0050.CATALOG_NUMBER'

if (@vindex3=0) 
select @cond1=@cond1+',data0050.layers'

if (@vindex3=1) 
select @cond1=@cond1+',prod_code'

if (@vindex3=2) 
select @cond1=@cond1+',data0050.customer_part_number'

if (@vindex3=3) 
select @cond1=@cond1+',customer_part_desc'

if (@vindex3=4) 
select @cond1=@cond1+',sch_date'

if (@vindex3=5) 
select @cond1=@cond1+',cust_code'

if (@vindex3=6) 
select @cond1=@cond1+',sales_order'

if (@vindex3=7) 
select @cond1=@cond1+',fob'

if (@vindex3=8) 
select @cond1=@cond1+',cp_rev'

if (@vindex3=9) 
select @cond1=@cond1+',data0492.cut_no'

if (@vindex3=10) 
select @cond1=@cond1+',data0050.CATALOG_NUMBER'

if (@vindex4=0) 
select @cond1=@cond1+',data0050.layers'

if (@vindex4=1) 
select @cond1=@cond1+',prod_code'

if (@vindex4=2) 
select @cond1=@cond1+',DATA0050.customer_part_number'

if (@vindex4=3) 
select @cond1=@cond1+',customer_part_desc'

if (@vindex4=4) 
select @cond1=@cond1+',sch_date'

if (@vindex4=5) 
select @cond1=@cond1+',cust_code'

if (@vindex4=6) 
select @cond1=@cond1+',sales_order'

if (@vindex4=7) 
select @cond1=@cond1+',fob'

if (@vindex4=8) 
select @cond1=@cond1+',cp_rev'

if (@vindex4=9) 
select @cond1=@cond1+',data0492.cut_no'

if (@vindex4=10) 
select @cond1=@cond1+',data0050.CATALOG_NUMBER'

--select @cond1 as vtt into testx03
exec (@cond +  @cond1)
go
		

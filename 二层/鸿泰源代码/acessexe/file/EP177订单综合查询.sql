--exec EP177;1 2,0,3,6,2,'001','','2013-09-01','2013-10-10 23:59:59',0,1,3,5,0,2,0,'B5C3F935x7BD3x443DxAD2FxE21771AA6FB8'
--Create PROCEDURE EP177;1  --明细列表数据
declare
@tp int,			--业务员类别:0业务员，1主管，2高级
@ptr int,			--业务员指针
@tp0 int,			--订单批样类别0量产1样板2其它3全部
@vtp int,			--搜索范围0订单1采购2本厂3客户型号4工程型号5合同号
@vptr int,			--订单类别2未完成4全部
@cust1 varchar(32),		--客户代码
--@cust2 varchar(5),		--客户代码2
@so1 varchar(32),		--搜索条件
--@so2 VARCHAR(10),		--搜索条件2
@vdate1 varchar(18),		--日期1
@vdate2 varchar(18),		--日期2
@prod int,			--工艺类别
@v278 int,			--统计单位指针
@vso_tp int,			--加工形式
@vso_style int,         --订单类型
@date_type tinyint,		--日期类别0下单日期1市场计划2客户交货期
@planstate tinyint,		--投产状态过滤，0：待投产，1：已投产，2：全部。
@whse_ptr  int ,          --工厂指针
@sql_table varchar(36) --output 

--AS
SELECT @tp=2,@ptr=0,@tp0=3,@vtp=6,@vptr=2,@cust1='001',@so1='',@vdate1='2013-09-01',@vdate2='2013-10-10 23:59:59',
@prod=0,@v278=1,@vso_tp=3,@vso_style=5,@date_type=0,@planstate=2,@whse_ptr=0,@sql_table='B5C3F935x7BD3x443DxAD2FxE21771AA6FB8'

declare @cond varchar(8000),@cond2 varchar(8000),@cond3 varchar(8000),@repempl_rkey int,@tempsql  varchar(8000)

declare @rand_table varchar(36),@flag int 

select @rand_table = replace(cast(newid() as varchar(36)),'-','x')
print (@rand_table)

set @sql_table =@rand_table

select @repempl_rkey=employee_ptr from data0009
where rkey=@ptr

select barcode_ptr,max(mfg_date) as date 
into #temp1
from Data0053 where REFERENCE_NUMBER='中转仓转入' group by barcode_ptr

--按动态计算单位取值20120630LLL
/*
select @flag=Search_Unit_flag from Data0195 --开关为0时 (L)净面积单位为平方米，开关为1时(K)净面积单位为平方尺20120630LLL


set @tempsql='
select source_pointer,parameter_ptr,parameter_value,parameter_name 
into #temp2   
from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey '

if @flag = 0  --L)净面积单位为平方米
begin
set @tempsql=@tempsql + ' where upper(spec_rkey)=''L'' '
end
else
begin --(K)净面积单位为平方尺 
set @tempsql=@tempsql + ' where upper(spec_rkey)=''K'' '
end

*/


select data0006.so_ptr,sum(data0056.qty_backlog) as qty_backlog 
into #temp3
from Data0006 inner join Data0056 on data0056.wo_ptr=data0006.rkey 
group by data0006.so_ptr

select so_ptr,sum(quan_Sch) as quan_Sch,sum(quan_prod) as quan_prod,sum(quan_rej) as quan_rej
into #temp4 
from Data0006 left join Data0025 on Data0006.bom_ptr=data0025.rkey 
where data0025.parent_ptr=0 and Data0006.wtype <> 1 and Data0006.wtype <> 2
group by so_ptr


--#temp5 取data0058表里的报废数量总计 LLL20120428 
select data0006.so_ptr as so_ptr_06  , isnull(sum(D58.QTY_REJECT),0) as sum_QTY_REJECT 
into #temp5
from data0006 inner join  
(select WO_PTR,isnull(sum(isnull(QTY_REJECT,0)),0)  as QTY_REJECT 
from data0058 group by  WO_PTR ) D58  on  data0006.RKEY=D58.WO_PTR 
inner join data0025 on data0006.BOM_PTR=data0025.rkey and data0025.PARENT_PTR=0  --只计算外层板报废20121123 LLL 
group by data0006.so_ptr 

--#temp6 取data0439表里的最后一次审核后的装运日期 20121023 LLL 
select  data0060.rkey,max(data0439.date_sailing) as last_date_sailing  
into #temp6  
from data0060  
left join data0064 on data0064.SO_PTR=data0060.rkey  
left join data0439 on data0064.packing_list_ptr=data0439.rkey 
where data0439.use_stauts=9 --已审核 
group by data0060.sales_order,data0060.rkey 


--#temp7 取data0138表中修改的回复交期 20121031 LLL 
select  a.sales_order_ptr, case a.from_string when '1899-12-30' then to_string else from_string end as first_SCH_DATE,TRANS_DATE,Update_sch_date_cause    
into #temp7
from data0318 a  left join data0060 on   a.sales_order_ptr=data0060.rkey  where a.TRANS_TYPE=4 and a.TRANS_DESCRIPTION='更改销售订单回复交期'  
order by a.sales_order_ptr,a.TRANS_DATE


--#temp8 取data0138表中最小的修改的回复交期 20121031 LLL 
select sales_order_ptr,min(TRANS_DATE) as TRANS_DATE  into #temp8  from #temp7  group by sales_order_ptr

--取原始回复交期
select #temp7.* into #temp9 from   #temp8  left join #temp7 on #temp7.sales_order_ptr=#temp8.sales_order_ptr and #temp7.TRANS_DATE=#temp8.TRANS_DATE  

 
--#Maxtemp01 取data0138表中最大的修改的回复交期,主要取最后变更原因 20121031 LLL 
select sales_order_ptr,max(TRANS_DATE) as TRANS_DATE  into #Maxtemp01  from #temp7  group by sales_order_ptr 
select #temp7.* into #Maxtemp02 from   #Maxtemp01  left join #temp7 on #temp7.sales_order_ptr=#Maxtemp01.sales_order_ptr and #temp7.TRANS_DATE=#Maxtemp01.TRANS_DATE  

--so_alloc_stock_qty
set @cond='select data0010.cust_code,data0010.abbr_name as customer_name,data0015.abbr_name as whse_name,Data0060.ONHOLD_SHIPPING,
	data0050.rkey,data0050.customer_part_number,data0060.ttype as py_type,data0060.reference_number,data0060.so_audit_date,
	data0050.layers,data0060.prod_rel,data0060.quote_price,data0060.so_style,data0060.so_oldnew,#temp1.date,data0010.TELEX,
	data0047.parameter_value,data0050.cp_rev,Data0050.mat_thick,data0059.customer_part_desc,data0059.customer_matl_desc,
	data0008.prod_code,data0008.product_name,data0050.unit_sq,Data0060.ANALYSIS_CODE_1,Data0060.ANALYSIS_CODE_2,Data0060.ANALYSIS_CODE_3,Data0060.ANALYSIS_CODE_4,Data0060.ANALYSIS_CODE_5,
    Data0050.ANALYSIS_CODE_1 as Data0050ANALYSIS_CODE_1,Data0060.SHIPPING_METHOD,Data0050.ANALYSIS_CODE_2 as Data0050ANALYSIS_CODE_2,Data0050.ANALYSIS_CODE_3  as Data0050ANALYSIS_CODE_3,Data0050.ANALYSIS_CODE_4  as Data0050ANALYSIS_CODE_4,Data0050.ANALYSIS_CODE_5  as Data0050ANALYSIS_CODE_5,
	data0060.sales_order,data0097.rkey as rkey97,data0097.po_number,data0060.orig_request_date,data0060.sch_date,data0060.orig_sched_ship_date,
	data0060.status,data0060.rkey as d60rkey,data0060.ent_date,data0060.modf_date,data0060.conf_date,DATA0060.set_price,
	data0060.part_price as unit_price,data0060.part_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)  as unit_price_base,Data0050.fg_thick,
	data0060.total_add_l_price as addl_price,ROUND(data0050.unit_sq * data0060.parts_ordered,4) as ordered_CKsqmt,--订单参考面积50表 保留四位数
	ROUND(data0050.unit_sq*data0060.parts_ordered*data0050.layers,4) as layers_CKsqmt,--订单总层数面积50表20130108 LLL
    (case WHEN data0060.tax_in_price=''N'' AND data0060.STATE_TOOL_TAX_FLAG = ''Y'' then  data0060.total_add_l_price *(1+data0189.state_tax/100.00)  WHEN data0060.tax_in_price=''Y'' AND data0060.STATE_TOOL_TAX_FLAG = ''Y'' then data0060.total_add_l_price /(1+data0189.state_tax/100.00)   WHEN data0060.tax_in_price=''Y'' AND data0060.STATE_TOOL_TAX_FLAG = ''N'' then  data0060.total_add_l_price /(1+data0189.state_tax/100.00) else  data0060.total_add_l_price end)
	  /dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date) as addl_price_base,--额外费用(不含税,本币) 
     (case WHEN data0060.tax_in_price=''Y'' AND data0060.STATE_TOOL_TAX_FLAG = ''N'' then  data0060.total_add_l_price /(1+data0189.state_tax/100.00)  WHEN data0060.tax_in_price=''N'' AND data0060.STATE_TOOL_TAX_FLAG = ''N'' then data0060.total_add_l_price   WHEN data0060.tax_in_price=''N'' AND data0060.STATE_TOOL_TAX_FLAG = ''Y'' then  data0060.total_add_l_price *(1+data0189.state_tax/100.00)  else  data0060.total_add_l_price end)
	  /dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date) as Yaddl_price_base,--额外费用(含税,本币)20120801
	  DATA0060.total_add_l_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)  as total_add_l_price_base,--额外费用本币
	data0060.tax_in_price,data0189.state_tax,convert(dec(18,4),1/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)) as exch_rate,data0001.curr_code, 
	data0060.part_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)*data0060.parts_ordered as so_total_amount_base,--订货金额本币
        ROUND(((case data0060.tax_in_price when ''N'' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0060.parts_ordered
         ) / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),2) AS notax_amount_base,--无税订单金额本币
           ROUND(((case data0060.tax_in_price when ''Y'' then data0060.part_price else data0060.part_price*(1+data0189.state_tax/100.00) end)*Data0060.parts_ordered
         ) / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),2) AS tax_amount_base,--含税订单金额本币20120801
	data0060.parts_ordered,data0060.set_ordered,data0060.parts_shipped,data0060.parts_returned,data0060.quan_to_re_delivery,
	data0060.returned_ship,data0060.parts_invoiced,data0060.to_be_planned,data0060.qty_tran,data0060.parts_Spare,--备品
	rtrim(data0023.abbr_name) as abbr_name,data0005.employee_name as conf_empl_name, 
	''(''+rtrim(data0023.code)+'')''+rtrim(data0023.supplier_name) as supp_desc,#temp3.qty_backlog,
    ISSUED_QTY = (case   isnull(Data0060.parent_so_ptr,'''')  when '''' then  Data0060.ISSUED_QTY else (case Data0060.prod_rel when 3 then Data0060.ISSUED_QTY else null end )  end ) --如果已投产的订单也要取Data0060.ISSUED_QTY LLL 20121017
    ,Data0060.PARTS_PROD as qty_prod,#temp5.sum_QTY_REJECT as qty_rej,--改成取58表的
	case when (data0060.parts_ordered>0) then round(100 * isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,2) else 0 end as ratio1,
    case when (isnull(Data0060.ISSUED_QTY,0) > 0) then round(100* isnull(#temp5.sum_QTY_REJECT,0)/Data0060.ISSUED_QTY,2) else 0 end as ratio2,
	Data0060.parts_alloc as so_alloc_stock_qty,data0050.set_x_qty*data0050.set_y_qty as set_qty,
	--parts_ordered*(case isnull(data0047.parameter_value,0) when 0 then unit_sq else isnull(data0047.parameter_value,0) end) as parts_ordered_sqmt,--动态计算总数 如未做MI就取50表的值
   Data0060.parts_ordered*(case isnull(data0047.parameter_value,0) when 0 then 0 else isnull(data0047.parameter_value,0) end) as parts_ordered_sqmt,--动态计算总数改成data0047.parameter_value 20120702 LLL
    ltrim(str(data0050.set_lngth,18,2))+''mm*''+ltrim(str(data0050.set_width,18,2))+''mm''
	    +''(/''+ltrim(str(data0050.set_x_qty*data0050.set_y_qty,8,0))+'')'' as ship_size,
      ltrim(str(data0050.set_lngth,18,2))+''mm'' as set_lngth ,--20130419 LLL 
      ltrim(str(data0050.set_width,18,2))+''mm'' as set_width, 
	  ltrim(str(data0050.set_x_qty*data0050.set_y_qty,8,0)) as set_chu,
	data0060.so_tp,data0050.analysis_code_2 as spec_info_1,data0050.sample_nr,data0012.location,
	data0060.state_prod_tax_flag,data0060.state_tool_tax_flag,data0060.fob,data0060.PUTHMAT_DESC,isnull(data0060.parts_stocked,0) as parts_stocked,data0060.RETURNED_stocked,
    data0060.qty_reput,Data0012.SHIP_TO_ADDRESS_1 ,
   (Data0060.PARTS_ORDERED * Data0060.PART_PRICE  *(1-Data0060.Discount/100)
      / Data0060.EXCH_RATE+Data0060.total_add_l_price/ Data0060.EXCH_RATE) AS rep_commission,
     case data0050.SALES_ORDER_UNIT_PTR when 1 then ''Strip''  else ''Pcs'' end as sales_order_unit_ptr,
	 case data0050.SALES_ORDER_UNIT_PTR when 1 then data0060.set_price  else data0060.PART_PRICE end as sales_order_unit_price,
	 case data0050.SALES_ORDER_UNIT_PTR when 1 then data0060.set_ordered  else data0060.PARTS_ORDERED end as sales_order_unit_quantity,
	 data0050.CATALOG_NUMBER,data0060.part_ovsh,data0050.etest_tp,data0050.cnc_tp,data0050.mat_tp,data0050.mat_color, data0050.mat_oz,
     data64.QUAN_SHIPPED,data64.Spare_shippe,data64.ovsh_qty1,
     case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else   
     round((data0060.parts_ordered*data0060.part_price/data0060.exch_rate)/(data0060.PARTS_ORDERED*data0050.unit_sq),4) end  as Bavg_money  --进价/m2 RMB(本币)=订单数量*单价（本位币）/下单面积 LLL 20120820 
    ,data0098.RMA_NUMBER,d60.sales_order as RMA_sales_order 
    ,round(Data0060.PARTS_ORDERED * Data0060.PART_PRICE,4) as Amount_OriCur  --订货金额原币
    ,round(Data0060.PARTS_ORDERED * Data0060.PART_PRICE+data0060.total_add_l_price,4) as addl_Amount_OriCur   --原币总金额（金额+额外费用）20120924 LLL 
    ,round((Data0060.PARTS_ORDERED * Data0060.PART_PRICE+data0060.total_add_l_price)/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),4) as addl_Amount_base --本币总金额（金额+额外费用）20121109 LLL 
    ,data0059.fin_customer_name,data0060.SHIPPING_CONTACT as SHIP_TO_CONTACT 
    ,#temp6.last_date_sailing,#Maxtemp02.Update_sch_date_cause 
    ,case #temp9.first_SCH_DATE when '''' then data0060.SCH_DATE else #temp9.first_SCH_DATE end as first_SCH_DATE 
    ,case Data0060.COMMISION_ON_TOOLING when 0 then ''内销'' when 1 then ''保税'' when 3 then ''外销'' end  as COMMISION_ON_TOOLING     
    into '+ '##'+@rand_table 
	
set @cond3='  
    FROM data0060 inner join data0050 on data0060.cust_part_ptr=data0050.rkey 
    left join data0025 on (data0060.cust_part_ptr=data0025.ancestor_ptr and data0025.parent_ptr=0)
	inner join data0010 on data0060.customer_ptr=data0010.rkey
	inner join data0097 on data0060.purchase_order_ptr=data0097.rkey  
    inner join data0001 on data0060.currency_ptr=data0001.rkey
    left join Data0492 on Data0492.SO_NO = Data0060.sales_order
   left join data0005 on data0060.conf_by_empl_ptr=data0005.rkey 
   left join data0059 on data0060.customer_ptr=data0059.customer_ptr and data0060.cust_part_ptr=data0059.cust_part_ptr  
   Left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey 
   left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
   left join  #temp5  on data0060.RKEY=#temp5.so_ptr_06  --取58表的报废数量  
  left join #temp1 on #temp1.barcode_ptr=Data0060.rkey  
  left join  --增加64表中已交备品，溢装数,及已交货数量 20120505LLL
  (select sum(isnull(QUAN_SHIPPED,0))as QUAN_SHIPPED,sum(isnull(Spare_shipped,0))as Spare_shippe,sum(isnull(ovsh_qty1,0))as ovsh_qty1,SO_PTR
    from DATA0064 group by  SO_PTR ) data64 on data0060.RKEY=data64.SO_PTR   
  left join data0098  on data0060.RMA_PTR=data0098.rkey   --关联退货表98表  LLL 20120915
  left join  data0060 d60 on data0098.so_ptr=d60.rkey  
	left outer join data0023 on (data0060.supplier_ptr=data0023.rkey )
	left join data0008 on data0025.prod_code_ptr=data0008.rkey
	left  join data0047 on (data0025.rkey=data0047.source_pointer and data0047.parameter_ptr='+cast(@v278 as varchar(5))+')
	left join data0015 on data0060.whse_ptr=data0015.rkey
	left outer join #temp3 on data0060.rkey=#temp3.so_ptr    
    left join #temp6 on data0060.RKEY=#temp6.rkey --#temp6 取data0439表里的最后一次审核后的装运日期 20121023 LLL  
    left join #temp9  on data0060.RKEY=#temp9.sales_order_ptr --原始回复交期 20121031
    left join #Maxtemp02 on data0060.RKEY=#Maxtemp02.sales_order_ptr --最后回复交期变更原因 20121106
	where '

if @date_type=0 
begin
  set @cond3=@cond3+'
   data0060.ent_date>='''+@vdate1+''' and data0060.ent_date<'''+@vdate2+''''
end
if @date_type=1 
begin
  set @cond3=@cond3+'
   data0060.orig_sched_ship_date>='''+@vdate1+''' and data0060.orig_sched_ship_date<'''+@vdate2+''''
end
if @date_type=2 
begin
  set @cond3=@cond3+'
   data0060.orig_request_date>='''+@vdate1+''' and data0060.orig_request_date<'''+@vdate2+''''
end
if @date_type=3 
begin
  set @cond3=@cond3+'
   data0060.conf_date>='''+@vdate1+''' and data0060.conf_date<'''+@vdate2+''''
end
if @date_type=4 
begin
  set @cond3=@cond3+'
   data0060.sch_date>='''+@vdate1+''' and data0060.sch_date<'''+@vdate2+''''
end
if @date_type=5 
begin
  set @cond3=@cond3+'
   data0060.so_audit_date>='''+@vdate1+''' and data0060.so_audit_date<'''+@vdate2+''''
end

--销售佣金表

 set @cond3=@cond3+'
     and data0012.rkey = ( select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR b.srep_ptr_5=Data0009.rkey )
     and b.rkey=data0060.cust_ship_addr_ptr ' 
   if @tp=0
        set @cond3=@cond3+'and data0009.rkey= '+cast(@ptr as varchar(5))
   if @tp=1
       set @cond3=@cond3+'and (Data0009.supervisor_ptr ='+cast(@ptr as varchar(5))+' or data0009.rkey='+cast(@ptr as varchar(5))+')'
    set @cond3=@cond3+')'

--销售佣金表

if @planstate=0 
begin
  set @cond3=@cond3+'
   and (data0060.to_be_planned>0 and data0060.status=1) '
end 
else if @planstate=1 
begin
  set @cond3=@cond3+'
   and (data0060.to_be_planned<=0 or data0060.status<>0) '
end

if @prod>0
 set @cond3=@cond3+'
	and data0008.rkey='+cast(@prod as varchar(5))

if @vso_tp<3
set @cond3=@cond3+'and data0060.so_tp='+cast(@vso_tp as varchar(2))

if @vso_style<5
set @cond3=@cond3+'and data0060.so_style='+cast(@vso_style as varchar(2))

if @cust1<>''
set @cond3=@cond3+'and data0010.cust_code like '''+ @cust1+'%'''

/* if @vptr=0  --未完成
set @cond3=@cond3+'and data0060.status<=2'

if @vptr=1  --已完成
set @cond3=@cond3+'and data0060.status>=3'
*/

if @vptr=0  --未完成  20130719 lll 
set @cond3=@cond3+'and data0060.status in (1,2,6) '

if @vptr=1  --已完成
set @cond3=@cond3+'and data0060.status  in (3,4,5) '

if @tp0<3
  set @cond3=@cond3+'and data0060.ttype='+cast(@tp0 as varchar(2))

if @vtp=0 and @so1<>''
set @cond3=@cond3+'and data0060.sales_order like ''%'+ @so1+'%'''

if @vtp=1 and @so1<>''
set @cond3=@cond3+'and data0097.po_number like ''%'+ @so1+'%'''

if @vtp=2 and @so1<>''
set @cond3=@cond3+'and data0050.customer_part_number like ''%'+ @so1+'%'''

if @vtp=3 and @so1<>''
set @cond3=@cond3+'and data0059.customer_part_desc like ''%'+ @so1+'%'''

if @vtp=4 and @so1<>''
set @cond3=@cond3+'and data0050.catalog_number like ''%'+ @so1+'%'''

if @vtp=5 and @so1<>''
  set @cond3=@cond3+'and data0060.fob like ''%'+ @so1+'%'''
if @whse_ptr>0 
  set @cond3=@cond3+'and data0015.rkey='+cast(@whse_ptr as varchar(5))   


set @cond2= '
group by  
	data0010.cust_code,data0015.abbr_name,data0050.rkey,data0050.customer_part_number,Data0060.ONHOLD_SHIPPING,
	data0050.cp_rev,Data0050.mat_thick,data0059.customer_part_desc,data0059.customer_matl_desc,
	data0050.layers,data0060.ttype,data0005.employee_name,data0060.prod_rel,data0060.quote_price,
	data0060.so_style,data0060.so_oldnew,data0060.reference_number,#temp1.date,Data0050.fg_thick,data0060.TOTAL_ADD_L_PRICE,
	data0060.sales_order,data0097.rkey,data0097.po_number,data0060.modf_date,data0060.orig_request_date,
	data0060.sch_date,data0060.orig_sched_ship_date,data0060.status,data0060.ent_date,data0060.conf_date,
	data0060.so_audit_date,data0001.CURR_CODE,data0060.tax_in_price,data0189.state_tax,DATA0060.set_price,data0060.PART_PRICE,
	data0060.rkey,data0010.abbr_name,data0060.returned_ship,data0060.parts_invoiced,data0060.parts_ordered,
	data0060.set_ordered,data0060.to_be_planned,data0060.qty_tran,data0060.parts_shipped,data0060.parts_returned,
	data0060.quan_to_re_delivery,data0047.parameter_value,data0023.abbr_name,data0023.code,data0023.supplier_name,
	data0008.prod_code,data0008.product_name,data0050.unit_sq,set_lngth,set_width,set_x_qty,
	set_y_qty,Data0060.SHIPPING_METHOD,data0060.so_tp,data0050.analysis_code_2,data0050.sample_nr,data0012.location,
	Data0060.ANALYSIS_CODE_1,data0060.state_prod_tax_flag,data0060.state_tool_tax_flag,data0060.fob,data0060.PUTHMAT_DESC,Data0050.ANALYSIS_CODE_1 ,Data0050.ANALYSIS_CODE_2,Data0050.ANALYSIS_CODE_3,Data0050.ANALYSIS_CODE_4,Data0050.ANALYSIS_CODE_5,
	data0060.qty_reput,Data0060.parts_alloc,data0060.parts_stocked,data0060.part_ovsh,data0060.RETURNED_stocked,
    #temp3.qty_backlog,Data0060.ISSUED_QTY,Data0060.PARTS_PROD,#temp5.sum_QTY_REJECT
    ,DATA0060.currency_ptr,Data0012.SHIP_TO_ADDRESS_1 ,Data0060.ANALYSIS_CODE_2,Data0060.ANALYSIS_CODE_3,Data0060.ANALYSIS_CODE_4,Data0060.ANALYSIS_CODE_5 ,
    data0060.parent_so_ptr,Data0060.discount,data0060.EXCH_RATE,data0050.SALES_ORDER_UNIT_PTR,data0050.CATALOG_NUMBER
     ,data0050.etest_tp,data0050.cnc_tp,data0050.mat_tp,data0050.mat_color,data0050.mat_oz
    ,data64.QUAN_SHIPPED,data64.Spare_shippe,data64.ovsh_qty1  --增加64表中已交备品，溢装数,及已交货数量
    ,data0098.RMA_NUMBER,d60.sales_order,data0059.fin_customer_name,data0060.SHIPPING_CONTACT,#temp6.last_date_sailing 
    ,#temp9.first_SCH_DATE,#Maxtemp02.Update_sch_date_cause,data0060.parts_Spare,data0010.TELEX,Data0060.COMMISION_ON_TOOLING      
    order by  
	data0010.cust_code,data0008.prod_code,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,
	data0060.sales_order,data0097.po_number,data0060.orig_request_date '
print (@cond)
print (@cond3)
print (@cond2)

-- select @cond as vtt into testxyy01
--set @sql_text = @cond

exec (@cond+@cond3+@cond2)--增加@cond3 以免SQL太长20120505
--##Tempp1

 

 exec('select A.*,isnull(B.memo_text,'''') as memo_text,dbo.GetSOFees2(A.d60rkey)  as SOFees,data0060.SALES_PO_PATH  as PO_PATH,data0050.eng_tp '+ 
',case data0060.Conf_audit_status when 1 then ''已确认待审核''  when 2 then ''已确认已审核''  else ''未确认未审核'' end  as Conf_audit_status_desc, D05.EMPLOYEE_NAME   as  Conf_audit_name, data0050.QTY_ON_HAND  as QTY_ON_HAND_50 '+
',case a.prod_rel when 1 then ''未确认''  when 2 then ''已确认未投产''  when 3 then  ''已确认已投产'' when 4 then  ''确认中取消'' else '''' end  as prod_rel_desc   '+
' from '+'##'+@rand_table+' A left join data0011 B on A.d60rkey=B.file_pointer and B.source_type=60  left join data0060  on a.d60rkey=data0060.rkey'+
' left join Data0005 D05  ON D05.RKEY=Data0060.Conf_audit_Empl_Ptr  left join data0050 on A.rkey=data0050.rkey ' ) 





drop table #temp1,#temp3,#temp4,#temp5,#temp6,#temp7,#temp8 ,#temp9 ,#Maxtemp01,#Maxtemp02

go



-------------------------------------------------------
CREATE   function   [dbo].[GetSOFees2](@d60rkey integer) 
returns   varchar(8000) 
as 
begin 
	declare   @str   varchar(8000) 
	set   @str   =   ' ' 
	
		select   @str   =   @str   +   ', '   + Data0061.CATEGORY + ':' +  cast((Data0062.AMOUNT - Data0062.FREE_AMOUNT)   as   varchar)--+ ' '+data0062.addl_remark   
		from   data0062 INNER JOIN Data0061 ON Data0062.ADDL_CAT_PTR = Data0061.RKEY   where  (Data0062.SO_PTR = @d60rkey )
	    
		if len(@str)>1 set   @str   =   right(@str   ,   len(@str)   -   2) 
	
	return(@str) 

End  


-----------------------------------------------------------
下面跟踪出来的语句 ，
Data0060.ISSUED_QTY太大会出现expression 转换为数据类型int 时出现算术溢出错误
case when (data0060.parts_ordered>0) then round(100 * isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,2) else 0 end as ratio1,
改为
case when (data0060.parts_ordered>0) then round(isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,4)*100 else 0 end as ratio1,
----------------------------------------------------------------

select barcode_ptr,max(mfg_date) as date 
into #temp1
from Data0053 where REFERENCE_NUMBER='中转仓转入' group by barcode_ptr

--按动态计算单位取值20120630LLL
/*
select @flag=Search_Unit_flag from Data0195 --开关为0时 (L)净面积单位为平方米，开关为1时(K)净面积单位为平方尺20120630LLL


set @tempsql='
select source_pointer,parameter_ptr,parameter_value,parameter_name 
into #temp2   
from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey '

if @flag = 0  --L)净面积单位为平方米
begin
set @tempsql=@tempsql + ' where upper(spec_rkey)=''L'' '
end
else
begin --(K)净面积单位为平方尺 
set @tempsql=@tempsql + ' where upper(spec_rkey)=''K'' '
end

*/


select data0006.so_ptr,sum(data0056.qty_backlog) as qty_backlog 
into #temp3
from Data0006 inner join Data0056 on data0056.wo_ptr=data0006.rkey 
group by data0006.so_ptr

select so_ptr,sum(quan_Sch) as quan_Sch,sum(quan_prod) as quan_prod,sum(quan_rej) as quan_rej
into #temp4 
from Data0006 left join Data0025 on Data0006.bom_ptr=data0025.rkey 
where data0025.parent_ptr=0 and Data0006.wtype <> 1 and Data0006.wtype <> 2
group by so_ptr


--#temp5 取data0058表里的报废数量总计 LLL20120428 
select data0006.so_ptr as so_ptr_06  , isnull(sum(D58.QTY_REJECT),0) as sum_QTY_REJECT 
into #temp5
from data0006 inner join  
(select WO_PTR,isnull(sum(isnull(QTY_REJECT,0)),0)  as QTY_REJECT 
from data0058 group by  WO_PTR ) D58  on  data0006.RKEY=D58.WO_PTR 
inner join data0025 on data0006.BOM_PTR=data0025.rkey and data0025.PARENT_PTR=0  --只计算外层板报废20121123 LLL 
group by data0006.so_ptr 

--#temp6 取data0439表里的最后一次审核后的装运日期 20121023 LLL 
select  data0060.rkey,max(data0439.date_sailing) as last_date_sailing  
into #temp6  
from data0060  
left join data0064 on data0064.SO_PTR=data0060.rkey  
left join data0439 on data0064.packing_list_ptr=data0439.rkey 
where data0439.use_stauts=9 --已审核 
group by data0060.sales_order,data0060.rkey 


--#temp7 取data0138表中修改的回复交期 20121031 LLL 
select  a.sales_order_ptr, case a.from_string when '1899-12-30' then to_string else from_string end as first_SCH_DATE,TRANS_DATE,Update_sch_date_cause    
into #temp7
from data0318 a  left join data0060 on   a.sales_order_ptr=data0060.rkey  where a.TRANS_TYPE=4 and a.TRANS_DESCRIPTION='更改销售订单回复交期'  
order by a.sales_order_ptr,a.TRANS_DATE


--#temp8 取data0138表中最小的修改的回复交期 20121031 LLL 
select sales_order_ptr,min(TRANS_DATE) as TRANS_DATE  into #temp8  from #temp7  group by sales_order_ptr

--取原始回复交期
select #temp7.* into #temp9 from   #temp8  left join #temp7 on #temp7.sales_order_ptr=#temp8.sales_order_ptr and #temp7.TRANS_DATE=#temp8.TRANS_DATE  

 
--#Maxtemp01 取data0138表中最大的修改的回复交期,主要取最后变更原因 20121031 LLL 
select sales_order_ptr,max(TRANS_DATE) as TRANS_DATE  into #Maxtemp01  from #temp7  group by sales_order_ptr 
select #temp7.* into #Maxtemp02 from   #Maxtemp01  left join #temp7 on #temp7.sales_order_ptr=#Maxtemp01.sales_order_ptr and #temp7.TRANS_DATE=#Maxtemp01.TRANS_DATE  



select --data0060.rkey,Data0060.ISSUED_QTY,data0060.parts_ordered
   data0010.cust_code,data0010.abbr_name as customer_name,data0015.abbr_name as whse_name,Data0060.ONHOLD_SHIPPING,
	data0050.rkey,data0050.customer_part_number,data0060.ttype as py_type,data0060.reference_number,data0060.so_audit_date,
	data0050.layers,data0060.prod_rel,data0060.quote_price,data0060.so_style,data0060.so_oldnew,#temp1.date,data0010.TELEX,
	data0047.parameter_value,data0050.cp_rev,Data0050.mat_thick,data0059.customer_part_desc,data0059.customer_matl_desc,
	data0008.prod_code,data0008.product_name,data0050.unit_sq,Data0060.ANALYSIS_CODE_1,Data0060.ANALYSIS_CODE_2,Data0060.ANALYSIS_CODE_3,Data0060.ANALYSIS_CODE_4,Data0060.ANALYSIS_CODE_5,
    Data0050.ANALYSIS_CODE_1 as Data0050ANALYSIS_CODE_1,Data0060.SHIPPING_METHOD,Data0050.ANALYSIS_CODE_2 as Data0050ANALYSIS_CODE_2,Data0050.ANALYSIS_CODE_3  as Data0050ANALYSIS_CODE_3,Data0050.ANALYSIS_CODE_4  as Data0050ANALYSIS_CODE_4,Data0050.ANALYSIS_CODE_5  as Data0050ANALYSIS_CODE_5,
	data0060.sales_order,data0097.rkey as rkey97,data0097.po_number,data0060.orig_request_date,data0060.sch_date,data0060.orig_sched_ship_date,
	data0060.status,data0060.rkey as d60rkey,data0060.ent_date,data0060.modf_date,data0060.conf_date,DATA0060.set_price,
	data0060.part_price as unit_price,data0060.part_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)  as unit_price_base,Data0050.fg_thick,
	data0060.total_add_l_price as addl_price,ROUND(data0050.unit_sq * data0060.parts_ordered,4) as ordered_CKsqmt,--订单参考面积50表 保留四位数
	ROUND(data0050.unit_sq*data0060.parts_ordered*data0050.layers,4) as layers_CKsqmt,--订单总层数面积50表20130108 LLL
    (case WHEN data0060.tax_in_price='N' AND data0060.STATE_TOOL_TAX_FLAG = 'Y' then  data0060.total_add_l_price *(1+data0189.state_tax/100.00)  WHEN data0060.tax_in_price='Y' AND data0060.STATE_TOOL_TAX_FLAG = 'Y' then data0060.total_add_l_price /(1+data0189.state_tax/100.00)   WHEN data0060.tax_in_price='Y' AND data0060.STATE_TOOL_TAX_FLAG = 'N' then  data0060.total_add_l_price /(1+data0189.state_tax/100.00) else  data0060.total_add_l_price end)
	  /dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date) as addl_price_base,--额外费用(不含税,本币) 
     (case WHEN data0060.tax_in_price='Y' AND data0060.STATE_TOOL_TAX_FLAG = 'N' then  data0060.total_add_l_price /(1+data0189.state_tax/100.00)  WHEN data0060.tax_in_price='N' AND data0060.STATE_TOOL_TAX_FLAG = 'N' then data0060.total_add_l_price   WHEN data0060.tax_in_price='N' AND data0060.STATE_TOOL_TAX_FLAG = 'Y' then  data0060.total_add_l_price *(1+data0189.state_tax/100.00)  else  data0060.total_add_l_price end)
	  /dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date) as Yaddl_price_base,--额外费用(含税,本币)20120801
	  DATA0060.total_add_l_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)  as total_add_l_price_base,--额外费用本币
	data0060.tax_in_price,data0189.state_tax,convert(dec(18,4),1/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)) as exch_rate,data0001.curr_code, 
	data0060.part_price/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date)*data0060.parts_ordered as so_total_amount_base,--订货金额本币
        ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0060.parts_ordered
         ) / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),2) AS notax_amount_base,--无税订单金额本币
           ROUND(((case data0060.tax_in_price when 'Y' then data0060.part_price else data0060.part_price*(1+data0189.state_tax/100.00) end)*Data0060.parts_ordered
         ) / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),2) AS tax_amount_base,--含税订单金额本币20120801
	data0060.parts_ordered,data0060.set_ordered,data0060.parts_shipped,data0060.parts_returned,data0060.quan_to_re_delivery,
	data0060.returned_ship,data0060.parts_invoiced,data0060.to_be_planned,data0060.qty_tran,data0060.parts_Spare,--备品
	rtrim(data0023.abbr_name) as abbr_name,data0005.employee_name as conf_empl_name, 
	'('+rtrim(data0023.code)+')'+rtrim(data0023.supplier_name) as supp_desc,#temp3.qty_backlog,
    ISSUED_QTY = (case   isnull(Data0060.parent_so_ptr,'')  when '' then  Data0060.ISSUED_QTY else (case Data0060.prod_rel when 3 then Data0060.ISSUED_QTY else null end )  end ) --如果已投产的订单也要取Data0060.ISSUED_QTY LLL 20121017
    ,Data0060.PARTS_PROD as qty_prod,#temp5.sum_QTY_REJECT as qty_rej,--改成取58表的
	case when (data0060.parts_ordered>0) then round(100 * isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,2) else 0 end as ratio1,
    case when (isnull(Data0060.ISSUED_QTY,0) > 0) then round(100* isnull(#temp5.sum_QTY_REJECT,0)/Data0060.ISSUED_QTY,2) else 0 end as ratio2,
	Data0060.parts_alloc as so_alloc_stock_qty,data0050.set_x_qty*data0050.set_y_qty as set_qty,
	--parts_ordered*(case isnull(data0047.parameter_value,0) when 0 then unit_sq else isnull(data0047.parameter_value,0) end) as parts_ordered_sqmt,--动态计算总数 如未做MI就取50表的值
   Data0060.parts_ordered*(case isnull(data0047.parameter_value,0) when 0 then 0 else isnull(data0047.parameter_value,0) end) as parts_ordered_sqmt,--动态计算总数改成data0047.parameter_value 20120702 LLL
    ltrim(str(data0050.set_lngth,18,2))+'mm*'+ltrim(str(data0050.set_width,18,2))+'mm'
	    +'(/'+ltrim(str(data0050.set_x_qty*data0050.set_y_qty,8,0))+')' as ship_size,
      ltrim(str(data0050.set_lngth,18,2))+'mm' as set_lngth ,--20130419 LLL 
      ltrim(str(data0050.set_width,18,2))+'mm' as set_width, 
	  ltrim(str(data0050.set_x_qty*data0050.set_y_qty,8,0)) as set_chu,
	data0060.so_tp,data0050.analysis_code_2 as spec_info_1,data0050.sample_nr,data0012.location,
	data0060.state_prod_tax_flag,data0060.state_tool_tax_flag,data0060.fob,data0060.PUTHMAT_DESC,isnull(data0060.parts_stocked,0) as parts_stocked,data0060.RETURNED_stocked,
    data0060.qty_reput,Data0012.SHIP_TO_ADDRESS_1 ,
   (Data0060.PARTS_ORDERED * Data0060.PART_PRICE  *(1-Data0060.Discount/100)
      / Data0060.EXCH_RATE+Data0060.total_add_l_price/ Data0060.EXCH_RATE) AS rep_commission,
     case data0050.SALES_ORDER_UNIT_PTR when 1 then 'Strip'  else 'Pcs' end as sales_order_unit_ptr,
	 case data0050.SALES_ORDER_UNIT_PTR when 1 then data0060.set_price  else data0060.PART_PRICE end as sales_order_unit_price,
	 case data0050.SALES_ORDER_UNIT_PTR when 1 then data0060.set_ordered  else data0060.PARTS_ORDERED end as sales_order_unit_quantity,
	 data0050.CATALOG_NUMBER,data0060.part_ovsh,data0050.etest_tp,data0050.cnc_tp,data0050.mat_tp,data0050.mat_color, data0050.mat_oz,
     data64.QUAN_SHIPPED,data64.Spare_shippe,data64.ovsh_qty1,
     case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else   
     round((data0060.parts_ordered*data0060.part_price/data0060.exch_rate)/(data0060.PARTS_ORDERED*data0050.unit_sq),4) end  as Bavg_money  --进价/m2 RMB(本币)=订单数量*单价（本位币）/下单面积 LLL 20120820 
    ,data0098.RMA_NUMBER,d60.sales_order as RMA_sales_order 
    ,round(Data0060.PARTS_ORDERED * Data0060.PART_PRICE,4) as Amount_OriCur  --订货金额原币
    ,round(Data0060.PARTS_ORDERED * Data0060.PART_PRICE+data0060.total_add_l_price,4) as addl_Amount_OriCur   --原币总金额（金额+额外费用）20120924 LLL 
    ,round((Data0060.PARTS_ORDERED * Data0060.PART_PRICE+data0060.total_add_l_price)/dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0060.ent_date),4) as addl_Amount_base --本币总金额（金额+额外费用）20121109 LLL 
    ,data0059.fin_customer_name,data0060.SHIPPING_CONTACT as SHIP_TO_CONTACT 
    ,#temp6.last_date_sailing,#Maxtemp02.Update_sch_date_cause 
    ,case #temp9.first_SCH_DATE when '' then data0060.SCH_DATE else #temp9.first_SCH_DATE end as first_SCH_DATE 
    ,case Data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 3 then '外销' end  as COMMISION_ON_TOOLING     
   
 
    FROM data0060 inner join data0050 on data0060.cust_part_ptr=data0050.rkey 
    left join data0025 on (data0060.cust_part_ptr=data0025.ancestor_ptr and data0025.parent_ptr=0)
	inner join data0010 on data0060.customer_ptr=data0010.rkey
	inner join data0097 on data0060.purchase_order_ptr=data0097.rkey  
    inner join data0001 on data0060.currency_ptr=data0001.rkey
    left join Data0492 on Data0492.SO_NO = Data0060.sales_order
   left join data0005 on data0060.conf_by_empl_ptr=data0005.rkey 
   left join data0059 on data0060.customer_ptr=data0059.customer_ptr and data0060.cust_part_ptr=data0059.cust_part_ptr  
   Left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey 
   left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
   left join  #temp5  on data0060.RKEY=#temp5.so_ptr_06  --取58表的报废数量  
  left join #temp1 on #temp1.barcode_ptr=Data0060.rkey  
  left join  --增加64表中已交备品，溢装数,及已交货数量 20120505LLL
  (select sum(isnull(QUAN_SHIPPED,0))as QUAN_SHIPPED,sum(isnull(Spare_shipped,0))as Spare_shippe,sum(isnull(ovsh_qty1,0))as ovsh_qty1,SO_PTR
    from DATA0064 group by  SO_PTR ) data64 on data0060.RKEY=data64.SO_PTR   
  left join data0098  on data0060.RMA_PTR=data0098.rkey   --关联退货表98表  LLL 20120915
  left join  data0060 d60 on data0098.so_ptr=d60.rkey  
	left outer join data0023 on (data0060.supplier_ptr=data0023.rkey )
	left join data0008 on data0025.prod_code_ptr=data0008.rkey
	left  join data0047 on (data0025.rkey=data0047.source_pointer and data0047.parameter_ptr=1)
	left join data0015 on data0060.whse_ptr=data0015.rkey
	left outer join #temp3 on data0060.rkey=#temp3.so_ptr    
    left join #temp6 on data0060.RKEY=#temp6.rkey --#temp6 取data0439表里的最后一次审核后的装运日期 20121023 LLL  
    left join #temp9  on data0060.RKEY=#temp9.sales_order_ptr --原始回复交期 20121031
    left join #Maxtemp02 on data0060.RKEY=#Maxtemp02.sales_order_ptr --最后回复交期变更原因 20121106
	where 
   data0060.ent_date>='2013-11-02' and data0060.ent_date<'2013-11-02 23:59:5'
     and data0012.rkey = ( select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR b.srep_ptr_5=Data0009.rkey )
     and b.rkey=data0060.cust_ship_addr_ptr )

group by  
	data0010.cust_code,data0015.abbr_name,data0050.rkey,data0050.customer_part_number,Data0060.ONHOLD_SHIPPING,
	data0050.cp_rev,Data0050.mat_thick,data0059.customer_part_desc,data0059.customer_matl_desc,
	data0050.layers,data0060.ttype,data0005.employee_name,data0060.prod_rel,data0060.quote_price,
	data0060.so_style,data0060.so_oldnew,data0060.reference_number,#temp1.date,Data0050.fg_thick,data0060.TOTAL_ADD_L_PRICE,
	data0060.sales_order,data0097.rkey,data0097.po_number,data0060.modf_date,data0060.orig_request_date,
	data0060.sch_date,data0060.orig_sched_ship_date,data0060.status,data0060.ent_date,data0060.conf_date,
	data0060.so_audit_date,data0001.CURR_CODE,data0060.tax_in_price,data0189.state_tax,DATA0060.set_price,data0060.PART_PRICE,
	data0060.rkey,data0010.abbr_name,data0060.returned_ship,data0060.parts_invoiced,data0060.parts_ordered,
	data0060.set_ordered,data0060.to_be_planned,data0060.qty_tran,data0060.parts_shipped,data0060.parts_returned,
	data0060.quan_to_re_delivery,data0047.parameter_value,data0023.abbr_name,data0023.code,data0023.supplier_name,
	data0008.prod_code,data0008.product_name,data0050.unit_sq,set_lngth,set_width,set_x_qty,
	set_y_qty,Data0060.SHIPPING_METHOD,data0060.so_tp,data0050.analysis_code_2,data0050.sample_nr,data0012.location,
	Data0060.ANALYSIS_CODE_1,data0060.state_prod_tax_flag,data0060.state_tool_tax_flag,data0060.fob,data0060.PUTHMAT_DESC,Data0050.ANALYSIS_CODE_1 ,Data0050.ANALYSIS_CODE_2,Data0050.ANALYSIS_CODE_3,Data0050.ANALYSIS_CODE_4,Data0050.ANALYSIS_CODE_5,
	data0060.qty_reput,Data0060.parts_alloc,data0060.parts_stocked,data0060.part_ovsh,data0060.RETURNED_stocked,
    #temp3.qty_backlog,Data0060.ISSUED_QTY,Data0060.PARTS_PROD,#temp5.sum_QTY_REJECT
    ,DATA0060.currency_ptr,Data0012.SHIP_TO_ADDRESS_1 ,Data0060.ANALYSIS_CODE_2,Data0060.ANALYSIS_CODE_3,Data0060.ANALYSIS_CODE_4,Data0060.ANALYSIS_CODE_5 ,
    data0060.parent_so_ptr,Data0060.discount,data0060.EXCH_RATE,data0050.SALES_ORDER_UNIT_PTR,data0050.CATALOG_NUMBER
     ,data0050.etest_tp,data0050.cnc_tp,data0050.mat_tp,data0050.mat_color,data0050.mat_oz
    ,data64.QUAN_SHIPPED,data64.Spare_shippe,data64.ovsh_qty1  --增加64表中已交备品，溢装数,及已交货数量
    ,data0098.RMA_NUMBER,d60.sales_order,data0059.fin_customer_name,data0060.SHIPPING_CONTACT,#temp6.last_date_sailing 
    ,#temp9.first_SCH_DATE,#Maxtemp02.Update_sch_date_cause,data0060.parts_Spare,data0010.TELEX,Data0060.COMMISION_ON_TOOLING      
    order by  
	data0010.cust_code,data0008.prod_code,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,
	data0060.sales_order,data0097.po_number,data0060.orig_request_date 
	
	
	drop table #temp1,#temp3,#temp4,#temp5,#temp6,#temp7,#temp8 ,#temp9 ,#Maxtemp01,#Maxtemp02



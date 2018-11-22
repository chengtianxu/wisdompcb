create proc EP169;4  --待审核
@dtpk1 datetime,
@dtpk2 datetime,
@rkey34_1 int,
@sysuserptr int,
@repemplptr int,
@review_flag int
as
declare @strsql varchar(8000)
declare @strsql2 varchar(8000)

declare @vptrx int  --20131022 LLL 成本率
set  @vptrx=(select COST_SQ_PARA_PTR FROM DATA0195)  


select data0060.rkey,dbo.GetSOAuthMinSeqno(data0060.rkey) as seq,Data0090.whse_ptr_90 
into #temp1  
from Data0060 INNER JOIN data0090 ON Data0060.RKEY = data0090.pact_ptr
  left join Data0073 on Data0090.sysuser_ptr=data0073.rkey
  left join data0009 on data0090.rep_ptr=data0009.rkey
  left join Data0005 on data0009.employee_ptr=data0005.rkey  
  --left join Data0073 D73 on data0009.employee_ptr = D73.rkey
  
where  
  data0060.ent_date >= @dtpk1 and  data0060.ent_date <= @dtpk2
   and (data0060.status=1)  and  (data0090.auth_date is null)
   and (data0060.quote_price in (0,4)) and   
  ((data0090.dept_ptr = @rkey34_1 ) or (data0073.rpl_so_ptr=@sysuserptr) or (data0073.rkey=@sysuserptr) --20131211
     or (Data0005.rkey=@repemplptr)) 
 and (Data0060.whse_ptr=Data0090.whse_ptr_90  or Data0090.whse_ptr_90 is null )--加工厂指针判断，如没指定工厂则不需要判断工厂，所有资料都可见20120401LLL 

set @strsql =' 
SELECT Data0097.PO_NUMBER,data0060.PURCHASE_ORDER_PTR as rkey97,data0090.rkey as rkey90,data0060.qte_ptr,data0060.ENTERED_BY_EMPL_PTR,data0050.rkey as rkey_50,
       data0090.auth_date,data0090.user_ptr,Data0005.EMPLOYEE_NAME,d05.employee_name as sales_name,data0050.analysis_code_2,MI_D05.EMPLOYEE_NAME as MI_NAME,
       Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,data0060.ent_date,data0060.csi_user_ptr,Data0060.so_prepay_amount,Data0060.CUSTOMER_PTR as rkey10,
       data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,data0060.ttype,Data0060.REFERENCE_NUMBER,Data0090.credit_flag,
       data0090.if_puthdate,data0090.if_puthwfsupp,data0090.if_puthmat,data0090.puth_info,data0060.cust_part_ptr,data0090.IF_Param,       
       Data0060.PARTS_ORDERED,Data0060.PART_PRICE, parts_ordered*part_price as so_amount,round(parts_ordered*part_price/nullif(data0060.exch_rate,0),4) as so_amount_base,
       round((parts_ordered*part_price+total_add_l_price)/nullif(data0060.exch_rate,0),4) as so_amount_base_1,Data0060.SHIPPING_METHOD,
       data0001.curr_code,data0060.exch_rate,data0060.quote_price, Data0060.RMA_PTR,Data0060.MFG_ORDER_DATE,data0097.po_date,so_payment,so_netpay,
       data0060.rush_charge_pct_used,Data0060.DUE_DATE,data0060.sch_date,Data0060.SALES_ORDER,data0060.rkey as rkey60,
       data0010.customer_name,data0010.cust_code,Data0010.ABBR_NAME,  data0008.prod_code,data0008.product_name,
       data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE,data0050.unit_sq,data0060.printed_by_ptr,
       case isnull(data0060.printed_by_ptr,0) when 0 then '''' else ''已打印'' end as printed_desc,data0060.parts_Spare,data0060.SET_Spare,
       ltrim(str(set_lngth,18,2))+''*''+ltrim(str(set_width,18,2))+''(/''+ltrim(str(set_x_qty*set_y_qty,10,0))+'')'' as shipsize,
       ALLOW_EDIT_FLAG,data0059.ONHOLD_SALES_FLAG,ONHOLD_RELEASE_FLAG,ONHOLD_PLANNING_FLAG,isnull(Data0050.whse_ptr,0) as whse_ptr_50,
       data0060.PARTS_ORDERED*data0050.unit_sq as parts_mianji,so_oldnew, so_tp,data0015.abbr_name as whse_name,
       data0060.set_ordered,data0060.PUTHMAT_DESC,data0060.whse_ptr,supplier_ptr,data0060.ANALYSIS_CODE_1 as D60ANALYSIS_CODE1,data0060.ANALYSIS_CODE_2 as D60ANALYSIS_CODE2,
       data0060.ANALYSIS_CODE_3 as D60ANALYSIS_CODE3,data0060.ANALYSIS_CODE_4 as D60ANALYSIS_CODE4,data0060.ANALYSIS_CODE_5 as D60ANALYSIS_CODE5,data0060.ANALYSIS_CODE_6 as D60ANALYSIS_CODE6,
       rtrim(data0023.code)+''/''+rtrim(data0023.abbr_name)+''[''+rtrim(data0023.supplier_name)+'']'' as wfsupp_desc,
    dbo.GetSOAuthMinSeqno(data0060.rkey) as minseqno,DATA0060.FOB,data0060.tax_rate,data0060.parts_ordered*isnull(dd47.PARAMETER_VALUE,1)  as sqmt_order,
      case data0050.sales_order_unit_ptr when 1 then ''Strip'' else ''PCS'' End as sales_order_unit_ptr,data0060.set_price,
      data0060.PARTS_ORDERED/nullif(data0050.set_y_qty,0)/nullif(data0050.set_x_qty,0) as Strips_order, --郭总说统一取50表的20130525 LLL 
      data0060.parts_ordered/nullif(d47.PARAMETER_VALUE,0) as PNL_order,--如MI资料未做，47表为0值，则赋为NULL 20120803  
      case Data0060.DateAnalysis_flag when 0 then ''未分析''  when 1 then ''未通过'' when 2 then ''通过'' end as DateAnalysis_result,
      data0050.eng_tp,data0050.set_lngth,data0050.set_width,data0050.catalog_number,data0050.mat_tp,data0050.mat_oz,data0050.mat_fact,
      data0050.inner_oz,data0050.outer_oz,data0050.mat_color,data0050.layers,data0050.fg_thick,data0050.sm_color,
      data0050.sm_type,data0050.cm_color,data0050.cnc_tp,data0050.etest_tp,data0050.analysis_code_3,data0050.analysis_code_4,data0050.analysis_code_5,
      data0050.mat_thick,data0060.to_be_planned,data0050.set_x_qty * data0050.set_y_qty as set_qty,Data0050.min_ord_qty,
      data0060.PARTS_SHIPPED,data0060.quan_to_re_delivery,Data0060.returned_ship,data0060.SALES_PO_PATH,
      case Data0050.BOM_STATUS when 1 then ''待审核'' when 2 then ''通过'' when 3 then ''退回'' else '''' end as BOM_STATUS,
      convert(varchar(300),data0011.memo_text) memo_text,  --加订单记事本20120503 
      data0060.ADD_PRICE1,data0060.QTY_SOCX_PLAN,data0060.QTY_SOCX_USED --冲销数
     , case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else    --增加面积单价20120712LLL
    round((data0060.PARTS_ORDERED*data0060.part_price)/(data0060.PARTS_ORDERED*data0050.unit_sq),6) end  as MianJi_price,
      case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else   
     round((parts_ordered*part_price/nullif(data0060.exch_rate,0))/(data0060.PARTS_ORDERED*data0050.unit_sq),4) end  as Bavg_money,--本币平均费用(面积)=订单评审界面的本位币/下单面积 LLL 20120820 
     round(parts_ordered*part_price+TOTAL_ADD_L_PRICE,4) as SO_Sum_money, --订单总费用=订单金额+额外费用 LLL 20120820 
    data0059.fin_customer_name,data0050.set_accbad_qty,data0050.green_desc,data0050.spec_info,data0050.ANALYSIS_CODE_6,data0050.ANALYSIS_CODE_7
    ,data0060.so_notype_list1,case data0050.tstatus when 1 then ''待1审'' when 2 then ''待2审'' when 3 then ''待3审''  
		when 4 then ''待4审'' when 5 then ''1审退'' when 6 then ''2审退'' 
		when 7 then ''3审退'' when 8 then ''4审退'' when 9 then ''通过'' else ''修订中'' end as MI_tstatus  --MI状态 
    ,case data0060.so_style when 0 then ''正式订单'' when  1  then ''免费订单'' when  2  then ''退货订单'' 
    when 3 then ''备料订单'' when  4  then ''外包订单'' when  5  then ''预付费订单'' 
    when  6  then ''内部订单'' else  ''临时订单'' end as So_type --加销售订单类型 LLL 20120927  
    ,data0012.location,data0012.ship_to_address_1,data0097.PO_PATH,(data0008.Prod_code+''(''+data0008.product_name+'')'') as prod_type 
    ,cast(0 as bit) as choose_flag,case data0060.prod_rel when 1 then ''未确认''  when 2 then ''已确认''  when 3 then ''已投产''  when 4 then ''已取消'' else '''' end as prod_reldesc,data0060.material_sch_date   
    ,round(Data0050.STANDARD_COST*Dcb47.PARAMETER_VALUE,6) AS COST_PER_PCS --单PCS成本20131022 
    ,(case data0060.tax_in_price when ''Y'' then part_price/(1+isnull(data0189.state_tax,0)/100.00)
	else part_price end)/nullif(data0060.exch_rate,0) as notax_price_base  --销售价格（不含税，本币）  20131022
   ,round(((Data0050.STANDARD_COST*Dcb47.PARAMETER_VALUE)/((case data0060.tax_in_price when ''Y''  then nullif(data0060.part_price,0)/(1+isnull(data0189.state_tax,0)/100.00)
	else nullif(data0060.part_price,0) end)/nullif(data0060.exch_rate,0)))*100,3)  as cost_rate  --成本率20131022 
    ,data0059.fin_customer_part_desc  --终端客户型号   20131029 LLL 
    into  ##temp2   
    FROM Data0060 INNER JOIN Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
    INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
    left  join data0005 MI_D05  on data0050.first_modified_by_ptr =MI_D05.rkey --20140318 LLL
    inner join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0
    inner join data0008 on data0025.prod_code_ptr=data0008.rkey
    INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY
    INNER JOIN data0090 ON Data0060.RKEY = data0090.pact_ptr
    INNER JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND  Data0060.CUST_PART_PTR = data0059.cust_part_ptr '
    set @strsql2 = ' inner join data0005 d05 on data0060.ENTERED_BY_EMPL_PTR=d05.rkey
    inner join #temp1 So on so.rkey = data0060.rkey
    LEFT JOIN Data0005 ON data0090.user_ptr = Data0005.RKEY
    left join data0009 on data0090.rep_ptr=data0009.rkey
    left join Data0005 D05_1 on data0009.employee_ptr=D05_1.rkey
    --left join Data0073 D73 on data0009.employee_ptr = D73.rkey
    left join data0023 on data0060.supplier_ptr=data0023.rkey
    left join data0015 on data0060.whse_ptr=data0015.rkey
    left join data0001 on data0060.currency_ptr=data0001.rkey
    left join data0047 on data0047.SOURCE_POINTER=data0025.rkey and data0047.PARAMETER_PTR=3
    left join data0047 d47 on d47.SOURCE_POINTER=data0025.rkey and d47.PARAMETER_PTR=2
    left join data0047 dd47 on dd47.SOURCE_POINTER=data0025.rkey and dd47.PARAMETER_PTR=(select top 1 rkey from Data0278 where spec_rkey=''D'') 
    LEFT JOIN Data0047 Dcb47  ON Dcb47.SOURCE_POINTER=Data0025.RKEY AND Dcb47.PARAMETER_PTR='''+ convert(varchar(20),@vptrx)+''''    --成本率 20131022 LLL
    set @strsql2 = @strsql2 +'  left join Data0073 on Data0090.sysuser_ptr=data0073.rkey
    left join data0011 on data0011.file_pointer=data0060.rkey and data0011.source_type=60   --加订单记事本20120503
    left join data0012 on data0060.CUST_SHIP_ADDR_PTR=data0012.rkey 
    left join data0189 on data0012.SHIP_CTAX_PTR=data0189.rkey 
WHERE '
set @strsql2 = @strsql2 + ' (data0060.ent_date >= '''+CONVERT(varchar(19),@dtpk1,121)+''''
set @strsql2 = @strsql2 + ' ) and (data0060.ent_date <= '''+CONVERT(varchar(19),@dtpk2,121)+''')'
set @strsql2 = @strsql2 + ' and (data0060.status=1)  and  (data0090.auth_date is null)'
set @strsql2 = @strsql2 + ' and (data0060.quote_price in (0,4)) and'   
set @strsql2 = @strsql2 + ' ((data0090.dept_ptr = '+ convert(char(4),@rkey34_1) +')'
--set @strsql = @strsql + ' or (data0090.sysuser_ptr= '+ convert(char(4),@sysuserptr) +')'
set @strsql2 = @strsql2 + ' or (data0073.rpl_so_ptr= '+ convert(char(4),@sysuserptr) +')'

set @strsql2 = @strsql2 + ' or (data0073.rkey= '+ convert(char(4),@sysuserptr) +')'  --加本人指针 20131214  
--set @strsql = @strsql + ' or (data0009.employee_ptr= '+ convert(char(4),@repemplptr) +'))'
set @strsql2 = @strsql2 + ' or (D05_1.rkey= '+ convert(char(4),@repemplptr) +'))'
if @review_flag = 0 
  set @strsql2 = @strsql2 + ' and ( so.seq = data0090.seq_no)'
     
set @strsql2 = @strsql2 + ' ORDER BY Data0060.SALES_ORDER,data0090.seq_no,data0090.rkey'


if exists(select * from dbo.sysobjects where id = object_id(N'[dbo].[dbo.##temp2]')) --20130930 lll
begin
drop table ##temp2  
end

exec(@strsql+@strsql2)

print(@strsql)
print(@strsql2)

select * from ##temp2  --20130715 LLL 
drop table ##temp2  
drop table #temp1
go 

---------------------------------------------------------------------------------------
全部 EP169;5
create proc EP169;5  --全部
@dtpk1 datetime,
@dtpk2 datetime,
@rkey34_1 int,
@sysuserptr int,
@repemplptr int,
@review_flag int
as
declare @strsql varchar(8000)
set @strsql ='
SELECT Data0097.PO_NUMBER,data0060.PURCHASE_ORDER_PTR as rkey97,data0090.rkey as rkey90,data0060.qte_ptr,data0060.ENTERED_BY_EMPL_PTR,data0050.rkey as rkey_50,
       data0090.auth_date,data0090.user_ptr,Data0005.EMPLOYEE_NAME,d05.employee_name as sales_name,data0050.analysis_code_2,
       Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,data0060.ent_date,data0060.csi_user_ptr,Data0060.so_prepay_amount,Data0060.CUSTOMER_PTR as rkey10,
       data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,data0060.ttype,Data0060.REFERENCE_NUMBER,Data0090.credit_flag,
       data0090.if_puthdate,data0090.if_puthwfsupp,data0090.if_puthmat,data0090.puth_info,data0060.cust_part_ptr,data0090.IF_Param,       
       Data0060.PARTS_ORDERED,Data0060.PART_PRICE, parts_ordered*part_price as so_amount,round(parts_ordered*part_price/data0060.exch_rate,4) as so_amount_base,
       round((parts_ordered*part_price+total_add_l_price)/data0060.exch_rate,4) as so_amount_base_1,Data0060.SHIPPING_METHOD,
       data0001.curr_code,data0060.exch_rate,data0060.quote_price, Data0060.RMA_PTR,Data0060.MFG_ORDER_DATE,data0097.po_date,so_payment,so_netpay,
       data0060.rush_charge_pct_used,Data0060.DUE_DATE,data0060.sch_date,Data0060.SALES_ORDER,data0060.rkey as rkey60,
       data0010.customer_name,data0010.cust_code,Data0010.ABBR_NAME,  data0008.prod_code,data0008.product_name,
       data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE,data0050.unit_sq,data0060.printed_by_ptr,
       case isnull(data0060.printed_by_ptr,0) when 0 then '''' else ''已打印'' end as printed_desc,data0060.parts_Spare,data0060.SET_Spare,
       ltrim(str(set_lngth,18,2))+''*''+ltrim(str(set_width,18,2))+''(/''+ltrim(str(set_x_qty*set_y_qty,10,0))+'')'' as shipsize,
       ALLOW_EDIT_FLAG,data0059.ONHOLD_SALES_FLAG,ONHOLD_RELEASE_FLAG,ONHOLD_PLANNING_FLAG,isnull(Data0050.whse_ptr,0) as whse_ptr_50,
       data0060.PARTS_ORDERED*data0050.unit_sq as parts_mianji,so_oldnew, so_tp,data0015.abbr_name as whse_name,
       data0060.set_ordered,data0060.PUTHMAT_DESC,data0060.whse_ptr,supplier_ptr,data0060.ANALYSIS_CODE_1 as D60ANALYSIS_CODE1,data0060.ANALYSIS_CODE_2 as D60ANALYSIS_CODE2,data0060.ANALYSIS_CODE_6 as D60ANALYSIS_CODE6,
       data0060.ANALYSIS_CODE_3 as D60ANALYSIS_CODE3,data0060.ANALYSIS_CODE_4 as D60ANALYSIS_CODE4,data0060.ANALYSIS_CODE_5 as D60ANALYSIS_CODE5,
       rtrim(data0023.code)+''/''+rtrim(data0023.abbr_name)+''[''+rtrim(data0023.supplier_name)+'']'' as wfsupp_desc,
    dbo.GetSOAuthMinSeqno(data0060.rkey) as minseqno,DATA0060.FOB,data0060.tax_rate,data0060.parts_ordered*isnull(dd47.PARAMETER_VALUE,1)  as sqmt_order,
      case data0050.sales_order_unit_ptr when 1 then ''Strip'' else ''PCS'' End as sales_order_unit_ptr,data0060.set_price,
      --data0060.parts_ordered/(Case When isnull(data0047.PARAMETER_VALUE,1)=0 then 1 Else isnull(data0047.PARAMETER_VALUE,1) End)  as strips_order,
      data0060.PARTS_ORDERED/nullif(data0050.set_y_qty,0)/nullif(data0050.set_x_qty,0) as Strips_order, --郭总说统一取50表的20130525 LLL 
      data0060.parts_ordered/nullif(d47.PARAMETER_VALUE,0) as PNL_order,--如MI资料未做，47表为0值，则赋为NULL 20120803  
      case Data0060.DateAnalysis_flag when 0 then ''未分析''  when 1 then ''未通过'' when 2 then ''通过'' end as DateAnalysis_result,
      data0050.eng_tp,data0050.set_lngth,data0050.set_width,data0050.catalog_number,data0050.mat_tp,data0050.mat_oz,data0050.mat_fact,
      data0050.inner_oz,data0050.outer_oz,data0050.mat_color,data0050.layers,data0050.fg_thick,data0050.sm_color,
      data0050.sm_type,data0050.cm_color,data0050.cnc_tp,data0050.etest_tp,data0050.analysis_code_3,data0050.analysis_code_4,data0050.analysis_code_5,
      data0050.mat_thick,data0060.to_be_planned,data0050.set_x_qty * data0050.set_y_qty as set_qty,Data0050.min_ord_qty,
      data0060.PARTS_SHIPPED,data0060.quan_to_re_delivery,Data0060.returned_ship,data0060.SALES_PO_PATH,
      case Data0050.BOM_STATUS when 1 then ''待审核'' when 2 then ''通过'' when 3 then ''退回'' else '''' end as BOM_STATUS,
      convert(varchar(300),data0011.memo_text) memo_text  --加订单记事本20120503 
      ,data0060.ADD_PRICE1,data0060.QTY_SOCX_PLAN,data0060.QTY_SOCX_USED --已被冲销数 冲销已用数
     ,case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else    --增加面积单价20120712LLL
    round((data0060.PARTS_ORDERED*data0060.part_price)/(data0060.PARTS_ORDERED*data0050.unit_sq),6) end  as MianJi_price
     ,data0059.fin_customer_name,data0050.set_accbad_qty,data0050.green_desc,data0050.spec_info,data0050.ANALYSIS_CODE_6,data0050.ANALYSIS_CODE_7 ,
     case isnull((data0060.PARTS_ORDERED*data0050.unit_sq),0.0000) when 0.0000 then 0 else   
     round((parts_ordered*part_price/data0060.exch_rate)/(data0060.PARTS_ORDERED*data0050.unit_sq),4) end  as Bavg_money,--本币平均费用(面积)=订单评审界面的本位币/下单面积 LLL 20120820 
     round(parts_ordered*part_price+TOTAL_ADD_L_PRICE,4) as SO_Sum_money  --订单总费用=订单金额+额外费用 LLL 20120820
      ,data0060.so_notype_list1, case data0050.tstatus when 1 then ''待1审'' when 2 then ''待2审'' when 3 then ''待3审''  
		when 4 then ''待4审'' when 5 then ''1审退'' when 6 then ''2审退'' 
		when 7 then ''3审退'' when 8 then ''4审退'' when 9 then ''通过'' else ''修订中'' end as MI_tstatus   --MI状态  
      ,case data0060.so_style when 0 then ''正式订单'' when  1  then ''免费订单'' when  2  then ''退货订单'' 
    when 3 then ''备料订单'' when  4  then ''外包订单'' when  5  then ''预付费订单'' 
    when  6  then ''内部订单'' else  ''临时订单'' end as So_type --加销售订单类型 LLL 20120927 
    ,data0012.location,data0012.ship_to_address_1,data0097.PO_PATH,(data0008.Prod_code+''(''+data0008.product_name+'')'') as prod_type   
    ,cast(0 as bit) as choose_flag, case data0060.prod_rel when 1 then ''未确认''  when 2 then ''已确认''  when 3 then ''已投产''  when 4 then ''已取消'' else '''' end as prod_reldesc,data0060.material_sch_date    
    into  ##temp3            
FROM Data0060 INNER JOIN Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
    INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
    inner join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0
    inner join data0008 on data0025.prod_code_ptr=data0008.rkey
    INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY
    INNER JOIN data0090 ON Data0060.RKEY = data0090.pact_ptr
    INNER JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND  Data0060.CUST_PART_PTR = data0059.cust_part_ptr
    inner join data0005 d05 on data0060.ENTERED_BY_EMPL_PTR=d05.rkey
    LEFT JOIN Data0005 ON data0090.user_ptr = Data0005.RKEY
    left join Data0073 on Data0073.employee_ptr=data0005.rkey 
    left join data0009 on data0090.rep_ptr=data0009.rkey  
    -- left join Data0073 on Data0090.sysuser_ptr=data0073.rkey   --错误，取消 20120912 LLL 
    left join data0023 on data0060.supplier_ptr=data0023.rkey
    left join data0015 on data0060.whse_ptr=data0015.rkey
    left join data0001 on data0060.currency_ptr=data0001.rkey
    left join data0047 on data0047.SOURCE_POINTER=data0025.rkey and data0047.PARAMETER_PTR=3
    left join data0047 d47 on d47.SOURCE_POINTER=data0025.rkey and d47.PARAMETER_PTR=2
    left join data0047 dd47 on dd47.SOURCE_POINTER=data0025.rkey and dd47.PARAMETER_PTR=(select top 1 rkey from Data0278 where spec_rkey=''D'')
    left join data0011 on data0011.file_pointer=data0060.rkey and data0011.source_type=60   --加订单记事本20120503 
    left join data0012 on data0060.CUST_SHIP_ADDR_PTR=data0012.rkey  
WHERE '
set @strsql = @strsql + ' (data0060.ent_date >= '''+CONVERT(varchar(19),@dtpk1,121)+''''
set @strsql = @strsql + ' ) and (data0060.ent_date <= '''+CONVERT(varchar(19),@dtpk2,121)+''')'
--set @strsql = @strsql + ' and data0073.rpl_so_ptr  = '+ convert(char(4),@sysuserptr)  
set @strsql = @strsql + ' and data0073.rkey  = '+ convert(char(4),@sysuserptr) --改回rkey 20120912 LLL  
set @strsql = @strsql + ' ORDER BY Data0060.SALES_ORDER,data0090.seq_no,data0090.rkey'
print(@strsql)
exec(@strsql)

select * from ##temp3  --20130715 LLL 
 drop table ##temp3  
go 


exec Ep0888 252,0,'2013-03-26 00:00:00','2013-04-25 00:00:00','239' --customer_part_desc

Create Procedure Ep0888
@Rkey int=0,
@datetype int=0,
@vDateFm Datetime='2011-06-01',
@vDateTo Datetime='2011-12-01',
@vCUST_CODE varchar(20)='A006-NWING'
As
Select @vDateTo=DATEADD(Day,1,@vDateTo)

Declare @Checked bit, @Qnty Decimal(18,6),@vToolCount int
Select @Checked=0,@Qnty=0

Select Checked=@Checked,
  CheckQnty=@Qnty,CheckToolCost=@Qnty,
  IsNull(Data0064.APCheckFlag,0) oldCheckFlag,
data0439.delivery_no,GRN_NUMBER='销售出仓',
data0439.date_sailing,
Data0060.SALES_ORDER,
Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,data0050.LAYERS,
Data0097.PO_NUMBER,data0060.FOB,DATA0060.REFERENCE_NUMBER,data0060.ANALYSIS_CODE_1,data0060.ANALYSIS_CODE_2,data0001.curr_code,
exch_rate=Convert(Decimal(18,6),1/dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)),Data0189.state_tax,isnull(Data0060.STATE_TOOL_TAX_FLAG,'N') AS STATE_TOOL_TAX_FLAG ,
case when Data0050.sales_order_unit_ptr=0 then 'PCS' else 'SET' end as salesorder_unit,
QUANTITY=Data0064.QUAN_SHIPPED+Data0064.ovsh_qty,
Data0064.QUAN_SHIPPED,Data0064.ovsh_qty,
(case data0060.tax_in_price when 'N' then data0060.part_price * (1+Data0189.state_tax/100.00)  else data0060.part_price end) as part_tax_price, 
case when Data0050.sales_order_unit_ptr=0 then  ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price * (1+Data0189.state_tax/100.00)
    else data0060.part_price end) *Data0064.QUAN_SHIPPED + (case data0060.tax_in_price when 'N' then data0060.part_price *
  (1+Data0189.state_tax/100.00) else data0060.part_price end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price * (1+Data0189.state_tax/100.00)
    else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
  + (case data0060.tax_in_price when 'N' then data0060.set_price * (1+Data0189.state_tax/100.00) else data0060.set_price end)*
  (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end AS yestax_amount,
CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else 0 end as TOTAL_ADD_L_PRICE,
CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE_free else 0 end as TOTAL_ADD_L_PRICE_free,
 Data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,
 Data0064.RKEY,APCheckQnty=ISNULL(Data0064.APCheckQnty,0),type=1,
 Over_tax_price=(case data0060.tax_in_price when 'N' then data0060.part_price*(1+Data0189.state_tax/100.00)*(100-Data0064.ovsh_discount)*0.01  else data0060.part_price*(100-Data0064.ovsh_discount)*0.01 end),
 Tool_cost=ISNULL(Data0064.Tool_cost,0),HFormal_qnty=@Qnty,HOvsh_qnty=@Qnty,data0001.curr_name
Into #tmp
FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY and Data0010.CUST_CODE= @vCUST_CODE
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
    left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
      Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  left join Data0001 on data0060.currency_ptr=data0001.rkey
WHERE (Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0
and data0439.date_sailing>=@vDateFm and data0439.date_sailing<@vDateTo

Insert Into #tmp
Select Checked=@Checked,
  CheckQnty=@Qnty,CheckToolCost=@Qnty,
  IsNull(DATA0098.APCheckFlag,0) oldCheckFlag,
DATA0098.RMA_NUMBER,GRN_NUMBER='退货扣款',
DATA0098.rma_date,
sales_order=IsNull(data0060.sales_order,''),
Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,data0050.layers,
PO_NUMBER=IsNull(Data0097.PO_NUMBER,''),data0060.FOB,DATA0060.REFERENCE_NUMBER,data0060.ANALYSIS_CODE_1,data0060.ANALYSIS_CODE_2, data0001.curr_code,
Convert(Decimal(18,6),1/data0098.exch_rate),state_tax=CASE WHEN IsNull(DATA0098.SO_PTR,-1)>0 THEN ISNULL(Data0189.state_tax,0) Else ISNULL(ttb.state_tax,0) End,isnull(Data0060.STATE_TOOL_TAX_FLAG,'N') AS STATE_TOOL_TAX_FLAG ,
case when Data0050.sales_order_unit_ptr=0 then 'PCS' else 'SET' end as salesorder_unit,
QUANTITY=data0098.qty_auth*-1,
QUAN_SHIPPED=data0098.qty_auth*-1,vsh_qty=0,
data0098.co_price,
data0098.qty_auth*IsNull(data0098.co_price,0)*-1 as tax_yesAmount, 
-1*data0098.required_amount as TOTAL_ADD_L_PRICE,TOTAL_ADD_L_PRICE_free=0,
Data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,
data0098.RKEY,APCheckQnty=ISNULL(data0098.APCheckQnty,0),type=2,Over_tax_price=0,Tool_cost=0,HFormal_qnty=0,HOvsh_qnty=0,data0001.curr_name
 from data0098  
  INNER join data0010 on data0098.customer_ptr=data0010.rkey  and Data0010.CUST_CODE= @vCUST_CODE  
  left join data0060 on data0098.so_ptr=data0060.rkey  
  left join data0050 on data0050.rkey=data0098.customer_part_ptr
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY  
  left join Data0001 on data0098.curr_ptr=data0001.rkey  
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
    left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left JOIN data0059 ON Data0098.CUSTOMER_PTR = data0059.customer_ptr AND  
      Data0098.CUSTOMER_PART_PTR = data0059.cust_part_ptr
  left join (select tb10.rkey,max(tb189.state_tax) state_tax,tb10.edi_flag_for_invoice,tb10.edi_flag_for_invoice fax_flag from data0010 tb10  
              left join data0012 tb12 on tb12.customer_ptr=tb10.rkey  
              left join data0189 tb189 on tb12.ship_ctax_ptr=tb189.rkey  
                 Group by tb10.rkey,tb10.edi_flag_for_invoice) ttb on ttb.rkey=data0010.rkey  
 where data0098.RMA_STATUS>1
 and data0098.rma_date>=@vDateFm and data0098.rma_date<@vDateTo
 
Insert Into #tmp
Select Checked=@Checked,
  CheckQnty=@Qnty,CheckToolCost=@Qnty,
  IsNull(data0116.APCheckFlag,0) oldCheckFlag,
data0116.MEMO_NUMBER,   
GRN_NUMBER=Case Memo_TP
    When 1 then '预收帐款'
    else '其他扣款' END,
data0116.MEMO_DATE,
sales_order='',
CUSTOMER_PART_NUMBER='', CP_REV='','' as layers,
PO_NUMBER='', FOB='',REFERENCE_NUMBER='',ANALYSIS_CODE_1='',ANALYSIS_CODE_2='',data0001.curr_code,
Convert(Decimal(18,6),1/data0116.ex_rate),state_tax=0,STATE_TOOL_TAX_FLAG='N',
sales_order_unit='',
QUANTITY=0,
QUAN_SHIPPED=0,vsh_qty=0,
co_price=Round(data0116.amount,4),
tax_yesAmount=-1*Round(data0116.amount,4), 
TOTAL_ADD_L_PRICE=0,TOTAL_ADD_L_PRICE_free=0,
CUSTOMER_PART_DESC='',customer_matl_desc='',
data0116.RKEY,APCheckQnty=0,type=3,Over_tax_price=0,Tool_cost=0,HFormal_qnty=0,HOvsh_qnty=0,data0001.curr_name
from data0116  
 INNER join data0010 on data0116.cust_ptr=data0010.rkey and Data0010.CUST_CODE= @vCUST_CODE 
 left join data0001 on data0001.rkey=data0116.currency_ptr  
where data0116.memo_tp in (1,2,3) and IsNull(data0116.avl_amt,0)<>0  
   and data0116.memo_date>=@vDateFm and data0116.memo_date<@vDateTo
   
Select rkey_ptr,type,HFormal_qnty=SUM(ISNULL(Formal_qnty,0)),HOvsh_qnty=SUM(ISNULL(Ovsh_qnty,0))
Into #tmpHCheck
From Data0889(nolock)
Where Rkey888<>@Rkey
Group by rkey_ptr,type

update t1
Set t1.HFormal_qnty=t2.HFormal_qnty,
t1.HOvsh_qnty=t2.HOvsh_qnty
from #tmp t1, #tmpHCheck t2
Where t1.RKEY=t2.rkey_ptr
and t1.type=t2.type

update t1
Set t1.Checked=1,t1.CheckQnty=t2.qnty,CheckToolCost=t2.tool_cost,
t1.APCheckQnty=t1.APCheckQnty-t2.qnty
from #tmp t1, Data0889 t2
Where t1.RKEY=t2.rkey_ptr
and t1.type=t2.type
and t2.Rkey888=@Rkey


/*以下为增加将订单额外费用横向显示在程序中*/

--新增订单额外费用横向显示
select data0060.sales_order,data0439.delivery_no
into #so_first_deli 
 from data0064
  left join data0060 on data0064.so_ptr=data0060.rkey
  left join data0439 on data0064.packing_list_ptr=data0439.rkey
  INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY  
 where data0064.SHIPMENT_NO=1 and Data0010.CUST_CODE= @vCUST_CODE and data0060.total_add_l_price>0
   and data0439.date_sailing>=@vDateFm and data0439.date_sailing<@vDateTo
 
--判断出货订单的第一次出货单号，用于显示额外费用（额外费用必须要在第一次出货显示）


select @vToolCount=count(*) 
 from data0064
  left join data0060 on data0064.so_ptr=data0060.rkey
  left join data0439 on data0064.packing_list_ptr=data0439.rkey
  INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY  
 where data0064.SHIPMENT_NO=1 and Data0010.CUST_CODE= @vCUST_CODE and data0060.total_add_l_price>0
   and data0439.date_sailing>=@vDateFm and data0439.date_sailing<@vDateTo

create table #temp(category varchar(30) null,so_ptr int null,sales_order varchar(20) null,amount float null)

if IsNull(@vToolCount,0)=0 
  insert into #temp 
   Select category,0 so_ptr,'' sales_order,0 amount from data0061
else
  insert into #temp 
   select data0061.category,data0062.so_ptr,data0060.sales_order,
      sum(case when  data0061.rkey=data0062.addl_cat_ptr then data0062.amount else 0 end) amount 
    from data0061
     cross join data0062 --where so_ptr=4
     left join data0060 on data0060.rkey=data0062.so_ptr
     left join data0010 on data0010.rkey=data0060.customer_ptr
     where data0010.cust_code= @vCUST_CODE and data0060.total_add_l_price>0
         and data0060.sales_order = (select sales_order from #so_first_deli where data0060.sales_order=#so_first_deli.sales_order )
      group by data0061.category,data0062.so_ptr,data0060.sales_order,data0061.rkey--,data0061.rkey,data0062.addl_cat_ptr
     order by data0062.so_ptr,data0061.rkey



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[temp1]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table temp1

declare @sql varchar(8000)
set @sql = 'select sales_order'
select @sql = @sql + ' ,max(case category when ''' + category + ''' then amount else 0 end) [' + category + ']'
from (select distinct category from #temp) as a
set @sql = @sql + ' into temp1 from #temp group by sales_order'
exec(@sql)

select temp1.*,#so_first_deli.delivery_no into #other_amount_list from temp1
  inner join #so_first_deli on #so_first_deli.sales_order=temp1.sales_order

drop table temp1
 
Select *,
TotalAount=yestax_amount+TOTAL_ADD_L_PRICE,
part_notax_price=Convert(Decimal(18,6),part_tax_price/(1+state_tax/100.00)),
t3.set_lngth,t3.set_width,t3.set_x_qty,t3.set_y_qty,t3.layers,t3.unit_sq,round((#tmp.CheckQnty+ovsh_qty)*t3.unit_sq,4) Shipping_SQ,STATE_TOOL_TAX_FLAG,
t3.ENG_TP,t3.CNC_TP,t3.FG_THICK,t3.CM_COLOR,t3.SM_COLOR,t3.OUTER_OZ,t3.INNER_OZ,#tmp.CheckQnty*#tmp.part_tax_price+#tmp.total_add_l_price CheckAmount
 from #tmp
  left join #other_amount_list on #other_amount_list.delivery_no=#tmp.delivery_no and #other_amount_list.sales_order=#tmp.sales_order
  left join data0050 t3 on t3.customer_part_number=#tmp.customer_part_number and t3.CP_REV=#tmp.CP_REV
Order by date_sailing



drop table #temp
drop table #so_first_deli
drop table #other_amount_list


Go
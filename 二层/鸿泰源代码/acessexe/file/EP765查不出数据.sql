--EP765查不出数据
--因为工厂简称没录
--exec EP765 '2013-11-01 00:00:00','2013-11-28 23:59:59'


--CREATE PROCEDURE [dbo].[ep765] --销售概况-工厂
declare
@Vdate1 datetime,
@Vdate2 datetime
select @Vdate1='2013-11-01 00:00:00',@Vdate2='2013-11-29 00:00:00'


create table #temp(
WAREHOUSE_CODE varchar(20) )
insert into #temp
select case when data0060.so_tp=0 then Data0015.abbr_name when data0060.so_tp=1 
     then Data0015.abbr_name+'外发'  end as WAREHOUSE_CODE
from Data0015 ,data0060 where data0060.so_tp<>2
group by Data0015.abbr_name,data0060.so_tp
order by Data0015.abbr_name,data0060.so_tp

select * from #temp

--订单
select case when data0060.so_tp=0 then Data0015.abbr_name when data0060.so_tp=1 then Data0015.abbr_name+'外发'  end as WAREHOUSE_CODE,
     Data0060.SALES_ORDER,
     cast((ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0060.parts_ordered
         ) / Data0060.EXCH_RATE,2)+
     (case data0060.tax_in_price when 'N' then data0060.total_add_l_price else data0060.total_add_l_price/(1+data0189.state_tax/100.00) end)/data0060.exch_rate) as float)
	         AS PO_amount_money,
	 
	cast(parts_ordered*(case isnull(d0047_t1.parameter_value,0) when 0 then unit_sq
	else isnull(d0047_t1.parameter_value,0) end) as float) as PO_amount_sq
	into #temp1
FROM data0060 inner join data0050 on data0060.cust_part_ptr=data0050.rkey
	left join data0025 on (data0060.cust_part_ptr=data0025.ancestor_ptr and data0025.parent_ptr=0)
	inner join data0010 on data0060.customer_ptr=data0010.rkey
	inner join data0097 on data0060.purchase_order_ptr=data0097.rkey
	inner join data0001 on data0060.currency_ptr=data0001.rkey
	left join
		(select source_pointer,parameter_ptr,parameter_value,parameter_name 
		from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
		where upper(spec_rkey)='L') as d0047_t1 on d0047_t1.source_pointer=data0025.rkey
	left join data0005 on data0060.conf_by_empl_ptr=data0005.rkey
	left join data0059 on data0060.customer_ptr=data0059.customer_ptr and data0060.cust_part_ptr=data0059.cust_part_ptr
	left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey = ( select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR b.srep_ptr_5=Data0009.rkey )
     and b.rkey=data0060.cust_ship_addr_ptr)
	left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
	left outer join data0023 on (data0060.supplier_ptr=data0023.rkey )
	left join data0008 on data0025.prod_code_ptr=data0008.rkey
	left  join data0047 on data0025.rkey=data0047.source_pointer and data0047.parameter_ptr=1
	left  join data0492 on data0060.sales_order=data0492.so_no
		and data0492.bom_ptr=data0025.rkey
	left join data0015 on data0060.whse_ptr=data0015.rkey
	left outer join data0006 A on (data0492.cut_no=A.cut_no and A.prod_status<200 )
	left outer join data0006 B on (A.RKEY=B.RKEY and B.prod_status<>9 and b.prod_status<200 )
	
where data0060.ENT_DATE>=@vDate1 and data0060.ENT_DATE<=@vDate2 and 
data0060.so_style<>2 and data0060.status<>5  
group by Data0060.SALES_ORDER,Data0015.abbr_name,
data0060.part_price,data0060.tax_in_price,data0189.state_tax,Data0060.parts_ordered,
Data0060.EXCH_RATE,d0047_t1.parameter_value,unit_sq,data0060.so_tp,data0060.total_add_l_price

select * from #temp1
	
select WAREHOUSE_CODE,Round(sum(PO_amount_money),2) as PO_amount_money,Round(sum(PO_amount_sq),2) as PO_amount_sq,
cast(Round((CASE when sum(PO_amount_sq)=0 then '0' else sum(PO_amount_money)/sum(PO_amount_sq) end),2) as float) as PO_avg_price
into #temp2
from #temp1 
group by WAREHOUSE_CODE
order by WAREHOUSE_CODE

--销售
select case when data0060.so_tp=0 then Data0015.abbr_name when data0060.so_tp=1 then Data0015.abbr_name+'外发'  end as WAREHOUSE_CODE,
cast(ROUND(sum(((case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
    +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01) 
  / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)),2) as float) AS sales_amount_money,
cast(ROUND(sum((Data0064.QUAN_SHIPPED + Data0064.ovsh_qty) * Data0050.unit_sq), 2) as float) AS sales_amount_sq,
cast(round(sum(((case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
    +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey))/
sum((Data0064.QUAN_SHIPPED + Data0064.ovsh_qty) * Data0050.unit_sq),2) as float) as sales_avg_price

into #temp3	
FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0
  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
  left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
      Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  left join Data0001 on data0060.currency_ptr=data0001.rkey
  left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left join data0015 on data0060.whse_ptr=data0015.rkey
where data0439.date_sailing>=@Vdate1 and data0439.date_sailing<=@vdate2  and 
data0060.so_style<>2 and data0060.status<>5 
group by
	Data0015.abbr_name,data0060.so_tp
order by Data0015.abbr_name,data0060.so_tp

select * from #temp3

--output
SELECT  Data0053.QUANTITY ,data0097.po_number,
        case when data0060.so_tp=0 then Data0015.abbr_name when data0060.so_tp=1 then Data0015.abbr_name+'外发'  end as WAREHOUSE_CODE,
        cast(Data0053.QUANTITY*(case isnull(d0047_t1.parameter_value,0) when 0 then isnull(Data0050.unit_sq,0)
	             else isnull(d0047_t1.parameter_value,0) end) as float) as in_mianqi,
        cast(case when  isnull(data0060.rkey,0)>0 then
          (case when Data0060.PART_PRICE>0 then
                 (case Data0060.tax_in_price
                        when 'Y' then ROUND(Data0053.QUANTITY *Data0060.PART_PRICE/(1+Data0189.STATE_TAX/100)  / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0053.MFG_DATE) ,4)
                        when 'N' then ROUND(Data0053.QUANTITY *Data0060.PART_PRICE / dbo.SF_GET_MONTH_EXCHRATE(DATA0060.currency_ptr,DATA0053.MFG_DATE) , 4)
                 end )
              end)
           else  round( Data0050.LATEST_PRICE * Data0053.QUANTITY/(1+IsNull(Data0189.STATE_TAX,0)/100) ,4)
         end as float) AS amount_base
into #temp4
FROM Data0053 INNER JOIN Data0050 ON Data0053.CUST_PART_PTR=Data0050.RKEY
    INNER JOIN Data0025 ON Data0050.RKEY=Data0025.ANCESTOR_PTR and Data0025.PARENT_PTR=0
    left JOIN Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER
              and Data0047.PARAMETER_PTR =7
    INNER JOIN Data0015 ON Data0053.WHSE_PTR = Data0015.RKEY
    INNER JOIN Data0016 ON Data0053.LOC_PTR = Data0016.RKEY
    left JOIN Data0008 ON Data0025.PROD_CODE_PTR=Data0008.RKEY
    left join data0007 on data0008.pr_grp_pointer=data0007.rkey
      LEFT JOIN Data0010 ON Data0053.customer_ptr = Data0010.RKEY
      LEFT JOIN data0059 ON Data0053.CUST_PART_PTR=data0059.cust_part_ptr
              AND Data0053.customer_ptr=Data0059.customer_ptr
      inner JOIN data0416 ON Data0053.NPAD_PTR=data0416.rkey
      LEFT JOIN Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY
      LEFT JOIN data0492 ON Data0006.CUT_NO=data0492.CUT_NO
      left join Data0060 on Data0492.SO_NO=Data0060.SALES_ORDER
      LEFT JOIN Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY
      left join Data0189 ON Data0012.SHIP_CTAX_PTR = Data0189.RKEY
      left join data0097 on data0060.purchase_order_ptr=data0097.rkey
      LEFT JOIN DATA0098 on data0416.rma_ptr=data0098.rkey
      left join
		(select source_pointer,parameter_ptr,parameter_value,parameter_name 
		from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
		where upper(spec_rkey)='L') as d0047_t1 on d0047_t1.source_pointer=data0025.rkey
where Data0053.MFG_DATE>=@vDate1 and Data0053.MFG_DATE<=@vDate2 and 
    Data0053.QUANTITY>0 and Data0416.tstatus=2 and data0060.so_style<>2 and data0060.status<>5  --and data0060.so_tp=0
select * from #temp4

select WAREHOUSE_CODE,
Round(sum(in_mianqi),2) as Output_sq,Round(sum(amount_base),2) as Output_money
into #temp5
from #temp4
group by WAREHOUSE_CODE
order by WAREHOUSE_CODE

  
select #temp.WAREHOUSE_CODE ,#temp2.PO_amount_money,#temp2.PO_amount_sq,#temp2.PO_avg_price,     
#temp3.sales_amount_money,#temp3.sales_amount_sq,#temp3.sales_avg_price,#temp5.Output_sq,#temp5.Output_money
into #temp6
from  #temp left join #temp2 on #temp.WAREHOUSE_CODE=#temp2.WAREHOUSE_CODE 
      left join #temp3 on #temp.WAREHOUSE_CODE=#temp3.WAREHOUSE_CODE 
      left join #temp5 on #temp.WAREHOUSE_CODE=#temp5.WAREHOUSE_CODE 

declare @sql varchar(8000)
set @sql=''
set @sql='select * from #temp6 where  isnull(PO_amount_money,0)<>0 or isnull(PO_amount_sq,0)<>0 
or isnull(sales_amount_money,0)<>0 or isnull(sales_amount_sq,0)<>0 or isnull(Output_money,0)<>0 
or isnull(Output_sq,0)<>0 order by WAREHOUSE_CODE '
exec(@Sql)
drop table #temp
drop table #temp1
drop table #temp2
drop table #temp3
drop table #temp4
drop table #temp5

drop table #temp6

GO
------------------------------
select 
case when data0060.so_tp=0 then   Data0015.abbr_name 
when data0060.so_tp=1  then Data0015.abbr_name+'外发'  end as WAREHOUSE_CODE
from Data0015 ,data0060 
where data0060.so_tp<>2
group by Data0015.abbr_name,data0060.so_tp
order by Data0015.abbr_name,data0060.so_tp

select abbr_name ,* from data0015
select so_tp,* from data0060 order by 1 desc
--update data0015 set abbr_name='bk'
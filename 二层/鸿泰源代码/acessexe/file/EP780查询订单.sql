--EP780查询订单
exec ep780 '2013-01-04 00:00:00','2013-09-03 00:00:00',2,341,NULL
create PROCEDURE ep780  --查找销售订单数据 
@dtpk1 datetime,
@dtpk2 datetime,
@so_type int,
@rkey10 int,
@439rkey int 

with encryption
AS

declare  @notallowout_flag int -- 未确认的订单不允许装运指派时,0可装运，1不可装运20120820 LLL


set @notallowout_flag=(select notallowout from data0195)  



if @439rkey is null --新增时20120417 lll
begin
  SELECT cast(0 as bit) as choose_flag,
    Data0060.RKEY ,Data0060.customer_ptr,Data0060.SALES_ORDER,data0060.cust_part_ptr,data0060.rma_ptr,
    data0060.so_oldnew,data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,
    data0060.to_be_planned,data0060.due_date,data0060.sch_date,data0060.part_price,
    data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.ONHOLD_SHIPPING,
    Data0060.qty_sure,data0060.parts_Spare,data0060.part_ovsh,data0060.ovsh_qty1,
    data0060.fob,data0060.REFERENCE_NUMBER,data0060.quan_to_re_delivery,data0060.orig_sched_ship_date,
    data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked,
    Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,data0050.rkey as rkey50,Data0050.REPORT_UNIT_VALUE1,
    data0050.ANALYSIS_CODE_1,data0050.CATALOG_NUMBER,data0059.customer_part_desc,
    data0059.customer_matl_desc as ANALYSIS_CODE_2,isnull(set_x_qty,1) as set_x_qty,isnull(set_y_qty,1) as set_y_qty,
    data0010.abbr_name,Data0010.cust_code,data0010.customer_name,
    Data0097.PO_NUMBER,RmaNO =data0098.rma_number,Rkey98=0,Qty_Ship=0,qty_shipd=0, 
    data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
    data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
    case data0050.sales_order_unit_ptr when 1 then 'Strip出货' else 'Pcs出货' end as sales_order_unit_ptr, 
    isnull(c.SumQUAn_plan,0) as SumQUAn_plan,isnull(c.SumSpare_plan,0) as SumSpare_plan,
    case @notallowout_flag when 1 then 
    isnull(Data0060.qty_sure,0)-isnull(c.SumQUAn_plan,0) --未做出货计划数=订单确认数-data0881表中已做计划数,当开关,未确认的订单不允许装运指派时 20120820 LLL
    else
    isnull(Data0060.PARTS_ORDERED,0)-isnull(c.SumQUAn_plan,0) --未做出货计划数=订单确认数-data0881表中已做计划数,当开关,未确认的订单不允许装运指派时,不勾选时 ,即可装运时20120820 LLL 
    end 
     as WeijhSales_orderQty, 
    isnull(Data0060.parts_Spare,0)-isnull(c.SumSpare_plan,0) as WeijhSpare_plan
    ,case data0060.quote_price when 0 then '未评审'  when 1 then '已评审' when 2 then '被退回' when 3  then '不评审' end as quote_auth
    ,data0012.LOCATION,Data0060.CUST_SHIP_ADDR_PTR  
into  #temp
FROM Data0060 INNER JOIN  
      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
 
      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 on Data0060.rma_ptr=data0098.Rkey  left join
      (select SO_PTR,sum(isnull(QUAN_plan,0)) as SumQUAn_plan,sum(isnull(Spare_plan,0)) as SumSpare_plan  from data0881   group by SO_PTR ) c 
       on c.SO_PTR=Data0060.Rkey  
      INNER JOIN Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY 
      
   where data0060.ent_date >= @dtpk1+' 00:00:00' 
  and data0060.ent_date <= @dtpk2 +' 23:59:59' 
  and Data0060.STATUS = 1 and Data0050.ttype <> 3
   and (IsNull(data0060.so_style,0) not in (3,6,7)) 
   and Data0010.rkey = @rkey10
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )
     OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@notallowout_flag=0  and data0060.quote_price in(1,3)) or     --未确认的订单允许装运指派时,0可装运，必须是已审核的单,20120924 LLL
         @notallowout_flag=1) --未确认的订单不允许装运指派时
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

select * from #temp
drop table #temp
end  --如为修改时

else
begin
  SELECT cast(0 as bit) as choose_flag,
    Data0060.RKEY ,Data0060.customer_ptr,Data0060.SALES_ORDER,data0060.cust_part_ptr,data0060.rma_ptr,
    data0060.so_oldnew,data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,
    data0060.to_be_planned,data0060.due_date,data0060.sch_date,data0060.part_price,
    data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.ONHOLD_SHIPPING,
    Data0060.qty_sure,data0060.parts_Spare,data0060.part_ovsh,data0060.ovsh_qty1,
    data0060.fob,data0060.REFERENCE_NUMBER,data0060.quan_to_re_delivery,data0060.orig_sched_ship_date,
    data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked,
    Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,data0050.rkey as rkey50,Data0050.REPORT_UNIT_VALUE1,
    data0050.ANALYSIS_CODE_1,data0050.CATALOG_NUMBER,data0059.customer_part_desc,
    data0059.customer_matl_desc as ANALYSIS_CODE_2,isnull(set_x_qty,1) as set_x_qty,isnull(set_y_qty,1) as set_y_qty,
    data0010.abbr_name,Data0010.cust_code,data0010.customer_name,
    Data0097.PO_NUMBER,RmaNO =data0098.rma_number,Rkey98=0,Qty_Ship=0,qty_shipd=0, 
    data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
    data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
    case data0050.sales_order_unit_ptr when 1 then 'Strip出货' else 'Pcs出货' end as sales_order_unit_ptr, 
    isnull(c.SumQUAn_plan,0) as SumQUAn_plan,isnull(c.SumSpare_plan,0) as SumSpare_plan,
      case @notallowout_flag when 1 then 
    isnull(Data0060.qty_sure,0)-isnull(c.SumQUAn_plan,0) --未做出货计划数=订单确认数-data0881表中已做计划数,当开关,未确认的订单不允许装运指派时 20120820 LLL
    else
    isnull(Data0060.PARTS_ORDERED,0)-isnull(c.SumQUAn_plan,0) --未做出货计划数=订单确认数-data0881表中已做计划数,当开关,未确认的订单不允许装运指派时,不勾选时 ,即可装运时20120820 LLL 
    end 
     as WeijhSales_orderQty, 
     --isnull(Data0060.qty_sure,0)-isnull(c.SumQUAn_plan,0) as WeijhSales_orderQty,  
     isnull(Data0060.parts_Spare,0)-isnull(c.SumSpare_plan,0) as WeijhSpare_plan
     ,case data0060.quote_price when 0 then '未评审'  when 1 then '已评审' when 2 then '被退回' when 3  then '不评审' end as quote_auth  
      ,data0012.LOCATION,Data0060.CUST_SHIP_ADDR_PTR     
into  #temp1 
FROM Data0060 INNER JOIN  
      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 on Data0060.rma_ptr=data0098.Rkey  left join
      (select SO_PTR,sum(isnull(QUAN_plan,0)) as SumQUAn_plan,sum(isnull(Spare_plan,0)) as SumSpare_plan  from data0881 where data0881.D439_PTR<>@439rkey  group by SO_PTR ) c --如为修改时去掉当前数据的数量
       on c.SO_PTR=Data0060.Rkey 
      INNER JOIN Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY  
where data0060.ent_date >= @dtpk1+' 00:00:00' 
  and data0060.ent_date <= @dtpk2 +' 23:59:59' 
  and Data0060.STATUS = 1 and Data0050.ttype <> 3
   and (IsNull(data0060.so_style,0) not in (3,6,7)) 
   and Data0010.rkey = @rkey10
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )
     OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
 and ((@notallowout_flag=0  and data0060.quote_price in(1,3)) or     --未确认的订单允许装运指派时,0可装运，必须是已审核的单,20120924 LLL
         @notallowout_flag=1) --未确认的订单不允许装运指派时
 
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

select * from #temp1
drop table #temp1

end 


go




----主窗口查询
 exec sp_executesql N'SELECT	data0439.*,data0010.cust_code,data0010.parentcust_ptr,data0010.abbr_name,d05.employee_name as Planer,
  data0010.customer_name,data0001.curr_code ,data0012.location,data0012.SHIP_TO_CONTACT,
  data0005.employee_name,data0012.SHIP_TO_FAX,data0012.do_rptfmt_ptr,Data0012.SHIP_TO_ADDRESS_1,
  data0002.unit_code,data0002.unit_name,data0189.state_tax  
from data0439 inner join data0010 on data0439.customer_ptr=data0010.rkey  
  inner join data0012 on data0439.ship_addr_ptr=data0012.rkey  
  inner join data0005 on data0439.employee_ptr=data0005.rkey 
  inner join Data0005 d05 on Data0439.Planer_ptr=d05.rkey 
  left join data0001 on data0439.currency_ptr=data0001.rkey  
  left join Data0002 on Data0439.unit_ptr=Data0002.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
where (data0439.Plan_date >=@P1) and (data0439.Plan_date <=@P2) 
    and   IS_Plan_881=1 
 and 1=1
 and isnull(data0439.invoice_ptr,0) = 0 and data0439.tstatus=0  and data0439.Plan_status = 0 
 order by delivery_no 
',N'@P1 datetime,@P2 datetime','2013-09-04 00:00:00','2013-09-05 23:59:59'

exec sp_executesql N'select data0881.*,data0060.sales_order,data0060.PARTS_ORDERED,data0050.customer_part_number,
  data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,data0097.po_number,
  case Assign_status when 0 then ''待指派'' when 1 then ''已指派'' end  as order_Assign_status,
   data0012.LOCATION 
from Data0881 inner join Data0060 on Data0881.so_ptr=Data0060.rkey
  inner join Data0050 on Data0060.CUST_PART_PTR=data0050.rkey
  left join Data0059 on Data0060.CUSTOMER_PTR=data0059.customer_ptr
    and Data0060.CUST_PART_PTR = Data0059.cust_part_ptr
  left join Data0097 on data0060.PURCHASE_ORDER_PTR=data0097.rkey 
  INNER JOIN Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY  
where data0881.D439_PTR=@P1 
',N'@P1 int',3556
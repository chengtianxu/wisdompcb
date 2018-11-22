EP781出货指派
--主表
exec sp_executesql N'SELECT	data0439.*,data0010.cust_code,data0010.parentcust_ptr,data0010.abbr_name,d05.employee_name as Planer,
  data0010.customer_name,data0001.curr_code ,data0012.location,data0012.SHIP_TO_CONTACT,
  data0005.employee_name,data0012.SHIP_TO_PHONE,data0012.SHIP_TO_FAX,data0012.do_rptfmt_ptr,Data0012.SHIP_TO_ADDRESS_1,
  data0002.unit_code,data0002.unit_name,data0189.state_tax  
from data0439 inner join data0010 on data0439.customer_ptr=data0010.rkey  
  inner join data0012 on data0439.ship_addr_ptr=data0012.rkey  
  inner join data0005 on data0439.employee_ptr=data0005.rkey 
  inner join Data0005 d05 on Data0439.Planer_ptr=d05.rkey 
  left join data0001 on data0439.currency_ptr=data0001.rkey  
  left join Data0002 on Data0439.unit_ptr=Data0002.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
where ((data0439.date_sailing >=@P1) and (data0439.date_sailing <@P2))  
     and   IS_Plan_881=1  
 and 1=1
 and isnull(data0439.invoice_ptr,0) = 0 and data0439.tstatus=0  and data0439.Plan_status = 1 
 order by delivery_no 
',N'@P1 datetime,@P2 datetime','2013-09-19 00:00:00','2013-09-27 23:59:59'
子表
exec sp_executesql N'select data0881.*,data0060.sales_order,data0060.PARTS_ORDERED,data0097.PO_NUMBER,
   data0050.customer_part_number,data0059.customer_matl_desc,
    isnull(Data0050.set_x_qty,0) as set_x_qty,isnull(Data0050.set_y_qty,0) as set_y_qty,
  data0050.cp_rev,Data0050.cp_rev1,data0059.customer_part_desc,Data0064.rkey as rkey64,Data0050.rkey as rkey50,
  convert(varchar(3),Data0050.set_x_qty)+''X''+convert(varchar(3),Data0050.set_y_qty) as set_xy,
--isnull( (Data0050.set_x_qty*Data0050.set_y_qty)-convert(int,Data0881.QUAN_plan+Data0881.Spare_plan)%(Data0050.set_x_qty*Data0050.set_y_qty),0) as ovsh,--指派后订单数与备品数取余，补充为整SET数
case   convert(int,Data0881.QUAN_plan+Data0881.Spare_plan)%(Data0050.set_x_qty*Data0050.set_y_qty) when 0 then 0  else  
 isnull( (Data0050.set_x_qty*Data0050.set_y_qty)-convert(int,Data0881.QUAN_plan+Data0881.Spare_plan)%(Data0050.set_x_qty*Data0050.set_y_qty),0) end  as ovsh,--指派后订单数与备品数取余，补充为整SET数 
 
ceiling((case when data0012.overship_flag = 0 then
    (case when (data0012.ORDER_QTY_RANGE_1 = 0 and data0012.ORDER_QTY_RANGE_2 = 0) then data0012.OVERSHIP_BY_QTY_1 
       when (data0012.ORDER_QTY_RANGE_1 > 0 and data0012.ORDER_QTY_RANGE_2 = 0) then 
        (case when (data0060.parts_ordered >= 0 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_1) then data0012.OVERSHIP_BY_QTY_1
           when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_1) then Data0012.OVERSHIP_BY_QTY_2 end)
       when (data0012.ORDER_QTY_RANGE_1 > 0 and data0012.ORDER_QTY_RANGE_2 > 0) then
        (case when (data0060.parts_ordered >= 0 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_1) then data0012.OVERSHIP_BY_QTY_1
           when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_1 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_2) then data0012.OVERSHIP_BY_QTY_2
           when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_2) then data0012.OVERSHIP_BY_QTY_3 end) end)
  else
    (case when (data0012.ORDER_QTY_RANGE_1 = 0 and data0012.ORDER_QTY_RANGE_2 = 0) then data0060.parts_ordered*data0012.OVERSHIP_BY_QTY_1*0.01
          when (data0012.ORDER_QTY_RANGE_1 > 0 and data0012.ORDER_QTY_RANGE_2 = 0) then
           (case when (data0060.parts_ordered >= 0 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_1) then data0060.parts_ordered*data0012.OVERSHIP_BY_QTY_1*0.01
              when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_1) then data0060.parts_ordered*Data0012.OVERSHIP_BY_QTY_2*0.01 end)
          when (data0012.ORDER_QTY_RANGE_1 > 0 and data0012.ORDER_QTY_RANGE_2 > 0) then
           (case when (data0060.parts_ordered >= 0 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_1) then data0060.parts_ordered*data0012.OVERSHIP_BY_QTY_1*0.01
              when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_1 and data0060.parts_ordered <= data0012.ORDER_QTY_RANGE_2) then data0060.parts_ordered*data0012.OVERSHIP_BY_QTY_2*0.01
              when (data0060.parts_ordered > data0012.ORDER_QTY_RANGE_2) then data0060.parts_ordered*data0012.OVERSHIP_BY_QTY_3*0.01 end) end) end))
  --/(isnull(Data0050.set_x_qty,0)* isnull(data0050.set_y_qty,0)))
  -- *(isnull(Data0050.set_x_qty,0)* isnull(data0050.set_y_qty,0))
    as ovsh_qty,
   (select  isnull(sum(ovsh_qty1),0) from Data0064 where so_ptr=data0060.rkey) as ovsh_ship,
    data0010.rkey as rkey10,data0064.ovsh_discount,case Assign_status when 0 then ''待指派'' when 1 then ''已指派'' end  as order_Assign_status   
  ,Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh as parts_margin2  
from Data0881 inner join Data0060 on Data0881.so_ptr=Data0060.rkey
   INNER JOIN     Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY
  inner join Data0050 on Data0060.CUST_PART_PTR=data0050.rkey
  inner join Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY
  left join Data0059 on Data0060.CUSTOMER_PTR=data0059.customer_ptr
    and Data0060.CUST_PART_PTR = Data0059.cust_part_ptr
  left join Data0064 on Data0064.packing_list_ptr = Data0881.D439_PTR  and Data0064.SO_PTR = Data0881.SO_PTR
  left join Data0097 on Data0060.PURCHASE_ORDER_PTR=Data0097.RKEY
 where data0881.D439_PTR=@P1
 
 
',N'@P1 int',16
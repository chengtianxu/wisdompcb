--EP780出货计划订单查询
SELECT * FROM data0050 WHERE CUSTOMER_PART_NUMBER LIKE 'TU97C63-1'
SELECT * FROM data0060 WHERE SALES_ORDER LIKE '13012047-01'
SELECT * FROM data0053 WHERE CUST_PART_PTR=383 AND QTY_ON_HAND>0

(Data0053.QTY_ON_HAND-Data0053.QTY_ALLOC- data0053.qty_allocated)> 0--
(data0416.type<>4 OR IsNull(data0416.type,'''')='''')--退货特殊入仓(EP124)


exec ep780 '2013-07-19 00:00:00','2013-09-18 00:00:00',2,12,NULL


--create PROCEDURE ep780  --查找销售订单数据 
DECLARE 
@dtpk1 datetime ,
@dtpk2 datetime,
@so_type int,
@rkey10 int,
@439rkey int 
SELECT @dtpk1='2013-07-19 00:00:00',@dtpk2='2013-09-18 00:00:00',@so_type=2,@rkey10=12,@439rkey=NULL
--with encryption
--AS

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

库存
exec sp_executesql N'SELECT c.ABBR_NAME,c.CUST_CODE,e.LOCATION,d.SALES_ORDER,
   a.CUST_PART_PTR,
   sum(a.QTY_ON_HAND) QTY_ON_HAND  FROM Data0053 A 
  left JOIN Data0006 B ON A.WORK_ORDER_PTR=B.RKEY
  left join Data0010 c on a.customer_ptr=c.RKEY
  left join Data0060 d on B.so_ptr=d.RKEY
  left join data0016 e on a.LOC_PTR=e.RKEY
  --left join Data0050 f on a.CUST_PART_PTR=f.RKEY 
  where a.QTY_ON_HAND>0   
      and a.CUST_PART_PTR=@P1
 group by  c.ABBR_NAME,c.CUST_CODE,e.LOCATION,d.SALES_ORDER,a.CUST_PART_PTR
 order by e.LOCATION

',N'@P1 int',383

WIP数
exec sp_executesql N'SELECT d.SALES_ORDER,a.STEP,b.so_ptr,c.DEPT_NAME,sum(a.QTY_BACKLOG+a.TO_BE_STOCKED) QTY_BACKLOG FROM Data0056 A 
  INNER JOIN Data0006 B ON A.WO_PTR=B.RKEY
  inner join Data0034 c on a.DEPT_PTR=c.RKEY
  inner join Data0060 d on b.so_ptr=d.RKEY
where  d.CUST_PART_PTR=@P1
GROUP by d.SALES_ORDER,b.so_ptr,a.STEP,c.DEPT_NAME
 order by a.STEP,d.SALES_ORDER
',N'@P1 int',383
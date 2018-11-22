if exists (select * from sysobjects where id = object_id(N'A_EP216') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop PROCEDURE A_EP216
GO


CREATE PROCEDURE A_EP216;1
@vindex int,   
@vdate1 varchar(16),  
@vdate2 varchar(16),
@vprod_rel int  
--with encryption
AS
declare @cond varchar(3000) 
/*select @cond='
Select data0060.rkey,data0060.sales_order,data0010.cust_code,data0010.abbr_name,
data0050.customer_part_number,data0050.cp_rev,data0060.orig_request_date,data0060.orig_sched_ship_date,data0060.sch_date,
data0060.parts_ordered,data0060.parts_shipped,data0060.parts_returned,
data0060.returned_ship,
data0001.curr_code,data0060.part_price,data0060.exch_rate,
data0060.issued_qty,data0060.cust_part_ptr,data0050.customer_part_desc,
data0097.po_number,data0492.cut_no,data0050.qty_on_hand,data0025.manu_part_number,
data0025.parent_ptr,data0047.parameter_value,data0060.status,
sum(data0006.quan_sch-data0006.quan_rej-quan_prod) as wip_qty
from data0010,data0050,data0097 right outer join data0060
on data0060.purchase_order_ptr=data0097.rkey
left join data0001 on data0060.currency_ptr=data0001.rkey
 left outer join data0492
on data0060.sales_order=data0492.so_no left outer join data0006
on data0492.cut_no=data0006.cut_no 
and data0006.quan_sch-data0006.quan_rej-quan_prod>0
and data0006.prod_status<=3
left outer join data0025 
on data0025.rkey=data0492.bom_ptr left outer join data0047
on data0047.source_pointer=data0025.rkey
and data0047.parameter_ptr=2
where data0060.customer_ptr=data0010.rkey
and data0060.cust_part_ptr=data0050.rkey
and data0060.orig_sched_ship_date>='''+@vdate1+''''
*/
select @cond='
SELECT Data0060.RKEY, Data0060.SALES_ORDER, Data0010.CUST_CODE, 
      Data0010.ABBR_NAME, 
      Data0025.MANU_PART_NUMBER AS customer_part_number, 
      Data0060.ORIG_REQUEST_DATE, Data0060.ORIG_SCHED_SHIP_DATE, 
      Data0060.SCH_DATE, Data0060.PARTS_ORDERED, 
      Data0060.PARTS_SHIPPED, Data0060.PARTS_RETURNED, 
      Data0060.RETURNED_SHIP, Data0001.CURR_CODE, 
      Data0060.PART_PRICE, Data0060.EXCH_RATE, Data0060.ISSUED_QTY, 
      Data0060.CUST_PART_PTR, 
      Data0025.MANU_PART_DESC AS customer_part_desc, 
      Data0097.PO_NUMBER, data0492.CUT_NO, Data0025.QTY_ON_HAND, 
      Data0025.MANU_PART_NUMBER, Data0025.PARENT_PTR, 
      Data0060.STATUS,SUM(Data0006.QUAN_SCH - Data0006.QUAN_REJ - Data0006.QUAN_PROD)
       AS wip_qty, Data0025.unit_sq AS PARAMETER_VALUE
FROM Data0006 RIGHT OUTER JOIN
      Data0010 INNER JOIN
      Data0060 ON 
      Data0010.RKEY = Data0060.CUSTOMER_PTR LEFT OUTER JOIN
      Data0097 ON 
      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY LEFT OUTER JOIN
      Data0001 ON 
      Data0060.CURRENCY_PTR = Data0001.RKEY LEFT OUTER JOIN
      data0492 ON Data0060.SALES_ORDER = data0492.SO_NO ON 
      Data0006.CUT_NO = data0492.CUT_NO LEFT OUTER JOIN
      Data0025 ON data0492.BOM_PTR = Data0025.RKEY
where data0060.orig_sched_ship_date>='''+@vdate1+''''

select @cond=@cond+' 
 and data0060.orig_sched_ship_date<='''+@vdate2+'''' 

if @vprod_rel=0
  select @cond=@cond+' and data0060.prod_rel<>1  and data0060.prod_rel<>4 '
if @vprod_rel=1
  select @cond=@cond+' and data0060.prod_rel<>4 '

/*select @cond=@cond+'
group by
data0060.rkey,data0060.sales_order,data0010.cust_code,data0010.abbr_name,
data0050.customer_part_number,data0050.cp_rev,data0060.orig_request_date,data0060.orig_sched_ship_date,data0060.sch_date,
data0060.parts_ordered,data0060.parts_shipped,data0060.parts_returned,
data0060.issued_qty,data0060.cust_part_ptr,data0050.customer_part_desc,
data0097.po_number,data0492.cut_no,data0050.qty_on_hand,data0025.manu_part_number,
data0025.parent_ptr,data0047.parameter_value,data0060.status,
data0001.curr_code,data0060.part_price,data0060.exch_rate,data0060.returned_ship'
*/
select @cond=@cond+'
GROUP BY Data0060.RKEY, Data0060.SALES_ORDER, 
      Data0010.CUST_CODE, Data0010.ABBR_NAME, 
      Data0025.MANU_PART_NUMBER, Data0060.ORIG_REQUEST_DATE, 
      Data0060.ORIG_SCHED_SHIP_DATE, Data0060.SCH_DATE, 
      Data0060.PARTS_ORDERED, Data0060.PARTS_SHIPPED, 
      Data0060.PARTS_RETURNED, Data0060.ISSUED_QTY, 
      Data0060.CUST_PART_PTR, Data0025.MANU_PART_DESC, 
      Data0097.PO_NUMBER, data0492.CUT_NO, Data0025.QTY_ON_HAND, 
      Data0025.MANU_PART_NUMBER, Data0025.PARENT_PTR, 
      Data0060.STATUS, Data0001.CURR_CODE, Data0060.PART_PRICE, 
      Data0060.EXCH_RATE, Data0060.RETURNED_SHIP, Data0025.unit_sq'

if @vindex=0
  select @cond=@cond+' order by data0010.cust_code,data0025.MANU_PART_NUMBER'
if @vindex=1
  --select @cond=@cond+' order by data0050.customer_part_number,data0050.cp_rev'
    select @cond=@cond+' order by data0025.MANU_PART_NUMBER'

if @vindex=2
  select @cond=@cond+' order by data0060.sales_order'
if @vindex=3
  select @cond=@cond+' order by data0060.orig_sched_ship_date'
if @vindex=4
  select @cond=@cond+' order by data0060.orig_sched_ship_date'

exec (@cond)

GO
CREATE PROCEDURE A_EP216;2
--with encryption
AS
select cust_part_ptr,sum( data0053.qty_on_hand) as qty_fg
FROM data0053
where data0053.qty_on_hand>0
group by cust_part_ptr
GO
CREATE PROCEDURE A_EP216;3
@vdate1 varchar(16),
@vdate2 varchar(16),
@vprod_rel int
--with encryption
AS
declare @cond varchar(1000)
/*
select @cond='
select  distinct a.rkey,a.dept_code,a.seq_nr
from data0056,data0034,data0034 a,data0060 left outer join data0492
on data0060.sales_order=data0492.so_no left outer join data0006
on data0492.cut_no=data0006.cut_no 
where data0056.wo_ptr=data0006.rkey
and data0056.dept_ptr=data0034.rkey 
and data0034.dept_ptr=a.rkey
and data0060.orig_sched_ship_date>='''+@vdate1+''''
*/
select @cond='
select  distinct a.rkey,a.dept_code,a.seq_nr
FROM Data0060 LEFT OUTER JOIN
      data0492 ON 
      Data0060.SALES_ORDER = data0492.SO_NO LEFT OUTER JOIN
      Data0056 INNER JOIN
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 a ON Data0056.DEPT_PTR = a.RKEY ON 
      data0492.CUT_NO = Data0006.CUT_NO
where (Data0056.RKEY IS NOT NULL) and data0060.orig_sched_ship_date>='''+@vdate1+''''

select @cond=@cond+' 
 and data0060.orig_sched_ship_date<='''+@vdate2 +''''

if @vprod_rel=0
  select @cond=@cond+' and data0060.prod_rel<>1  and data0060.prod_rel<>4 '
if @vprod_rel=1
  select @cond=@cond+' and data0060.prod_rel<>4 '

select @cond=@cond+' ORDER BY a.seq_nr'

exec (@cond)

GO
CREATE PROCEDURE A_EP216;4
@vdate1 varchar(16),
@vdate2 varchar(16),
@vprod_rel int
--with encryption
AS
declare @cond varchar(1000)
/*select @cond='
Select data0492.cut_no,a.rkey as d0034_rkey,sum(data0056.qty_backlog+data0056.to_be_stocked) as qty
from data0060 left outer join data0492
on data0060.sales_order=data0492.so_no left outer join data0006
on data0492.cut_no=data0006.cut_no left outer join data0056
on data0056.wo_ptr=data0006.rkey left outer join data0034 on
data0056.dept_ptr=data0034.rkey left outer join data0034 a
on data0034.dept_ptr=a.rkey
where 
data0060.orig_sched_ship_date>='''+@vdate1+''''
*/
select @cond='
Select data0492.cut_no,a.rkey as d0034_rkey,sum(data0056.qty_backlog+data0056.to_be_stocked) as qty
FROM Data0034 a RIGHT OUTER JOIN
      Data0056 ON a.RKEY = Data0056.DEPT_PTR RIGHT OUTER JOIN
      Data0060 LEFT OUTER JOIN
      data0492 ON 
      Data0060.SALES_ORDER = data0492.SO_NO LEFT OUTER JOIN
      Data0006 ON data0492.CUT_NO = Data0006.CUT_NO ON 
      Data0056.WO_PTR = Data0006.RKEY
where 
data0060.orig_sched_ship_date>='''+@vdate1+''''

select @cond=@cond+' 
 and data0060.orig_sched_ship_date<='''+@vdate2 +''''

if @vprod_rel=0
  select @cond=@cond+' and data0060.prod_rel<>1  and data0060.prod_rel<>4 '
if @vprod_rel=1
  select @cond=@cond+' and data0060.prod_rel<>4 '

select @cond=@cond+' 
group by
data0492.cut_no,a.rkey
order by data0492.cut_no'

exec (@cond)
GO

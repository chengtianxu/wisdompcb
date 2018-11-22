EP164产成品分配

exec sp_executesql N'declare @vflag int
set @vflag=@P1
if @vflag=0 --要求有效订单
select data0050.rkey,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,
data0050.qty_on_hand,data0050.last_fg_indate,data0010.cust_code,data0050.qty_alloc,data0050.unit_sq
from data0050,data0059,data0010
WHERE data0050.rkey = data0059.cust_part_ptr
and data0059.customer_ptr=data0010.rkey
and data0050.qty_on_hand>0
and data0050.rkey in (select cust_part_ptr from data0060 where status=1)
order by data0050.customer_part_number,data0050.cp_rev
if @vflag=1   --不要求有效订单
select data0050.rkey,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,
data0050.qty_on_hand,data0050.last_fg_indate,data0010.cust_code,data0050.qty_alloc,data0050.unit_sq
from data0050,data0059,data0010
WHERE data0050.rkey = data0059.cust_part_ptr
and data0059.customer_ptr=data0010.rkey
and data0050.qty_on_hand>0
order by data0050.customer_part_number,data0050.cp_rev




 
',N'@P1 int',0
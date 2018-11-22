if exists (select * from sysobjects where id = object_id(N'A_EP178') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop PROCEDURE A_EP178
GO


create procedure A_EP178;1
@tot tinyint,
@data1 varchar(10),
@data2 varchar(10),
@cust1 varchar(10),
@cust2 varchar(10),
@ody varchar(1),
@salesby varchar(3),
@salestyp tinyint
as 

declare @cond varchar(5000)

if @tot=0 
begin
select @cond='
select data0010.cust_code,data0010.customer_name,
round((
select --count(a.rkey)
sum(data0060.parts_ordered*data0060.part_price/data0060.exch_rate) 
from   data0060 '
if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'
where data0060.orig_sched_ship_date>='''+@data1+''' 
 and data0060.orig_sched_ship_date<='''+@data2+''' 
 group by data0060.customer_ptr
having data0060.customer_ptr=data0010.rkey
),6)as amt_all, 
round((
select --count(a.rkey)
sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr'
if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'
where data0060.orig_sched_ship_date>='''+@data1+''' 
 and data0060.orig_sched_ship_date<='''+@data2+''' 
 group by data0060.customer_ptr
having data0060.customer_ptr=data0010.rkey
),6)as amt, 
round((
select --count(a.rkey)
sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and data0060.orig_sched_ship_date>=a.date_shipped
and (not a.date_shipped is null)'
if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'

where data0060.orig_sched_ship_date>='''+@data1+''' 
 and data0060.orig_sched_ship_date<='''+@data2+''' 
 group by data0060.customer_ptr
having data0060.customer_ptr=data0010.rkey
),6)as amt_1 
from data0010
where data0010.cust_code >= '''+@cust1+''' and data0010.cust_code <='''+@cust2+'''
order by data0010.cust_code'

exec(@cond)

end

if @tot=1 
begin

/*
select @cond='
select distinct data0010.cust_code,data0010.customer_name,
data0050.customer_part_number,data0050.customer_part_desc,data0050.cp_rev,
b.sales_order,b.parts_ordered,b.orig_sched_ship_date,
(b.parts_ordered*b.part_price/b.exch_rate) as amt,
(
--延期交货次数
select count(a.rkey)
--,sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and (data0060.orig_sched_ship_date<a.date_shipped
or a.date_shipped is null)'
*/
select @cond='
select distinct data0010.cust_code,data0010.customer_name,
data0025.MANU_PART_NUMBER as customer_part_number,data0025.MANU_PART_DESC as customer_part_desc,
b.sales_order,b.parts_ordered,b.orig_sched_ship_date,
(b.parts_ordered*b.part_price/b.exch_rate) as amt,
(
--延期交货次数
select count(a.rkey)
--,sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and (data0060.orig_sched_ship_date<a.date_shipped
or a.date_shipped is null)'


if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'
-- where data0060.orig_sched_ship_date>='''+@data1+'''
-- and data0060.orig_sched_ship_date<='''+@data2+'''
 group by data0060.rkey
having data0060.rkey=b.rkey) as cnt_1,
round((
--延期交货amount
select sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and (data0060.orig_sched_ship_date<a.date_shipped
or a.date_shipped is null)'
if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'
--where data0060.orig_sched_ship_date>='''+@data1+'''
-- and data0060.orig_sched_ship_date<='''+@data2+'''
 group by data0060.rkey
having data0060.rkey=b.rkey),6) as amt_1,
(
--准期交货次数
select count(a.rkey)
--,sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and data0060.orig_sched_ship_date>=a.date_shipped
and not a.date_shipped is null'
if @salesby>0
begin 
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr=' + @salesby + ' or data0009.rkey=' + @salesby + ')'
end
 select @cond=@cond + '
--where data0060.orig_sched_ship_date>=''' + @data1 + '''
-- and data0060.orig_sched_ship_date<=''' + @data2 + '''
 group by data0060.rkey
having data0060.rkey=b.rkey) as cnt_2,
round((
--准期交货amount
select sum(a.quan_shipped*data0060.part_price/data0060.exch_rate) 
from  data0064 a right join data0060 
on data0060.rkey=a.so_ptr
and data0060.orig_sched_ship_date>=a.date_shipped
and not a.date_shipped is null'
if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond + ' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR=' + @salesby
if @salestyp=1
 select @cond=@cond + ' inner join data0102 on data0060.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr=' + @salesby + ' or data0009.rkey=' + @salesby + ')'
end
/* 
select @cond=@cond+'
--where data0060.orig_sched_ship_date>='''+@data1+'''
--and data0060.orig_sched_ship_date<='''+@data2+'''
group by data0060.rkey
having data0060.rkey=b.rkey),6) as amt_2

from data0060 b inner join data0050
on b.cust_part_ptr=data0050.rkey inner join data0010
on b.customer_ptr=data0010.rkey'
*/
 select @cond=@cond+'
--where data0060.orig_sched_ship_date>='''+@data1+'''
--and data0060.orig_sched_ship_date<='''+@data2+'''
group by data0060.rkey
having data0060.rkey=b.rkey),6) as amt_2

from data0060 b inner join data0025
on b.cust_part_ptr=data0025.rkey inner join data0010
on b.customer_ptr=data0010.rkey'


if @salesby>0 
begin
if @salestyp=0 
 select @cond=@cond+' inner join data0102 on b.rkey=data0102.SALES_ORDER_PTR 
and  data0102.SALES_REP_PTR='+@salesby
if @salestyp=1
 select @cond=@cond+' inner join data0102 on b.rkey=data0102.SALES_ORDER_PTR 
inner join data0009 on data0102.SALES_REP_PTR=data0009.rkey and 
(data0009.supervisor_ptr='+@salesby+' or data0009.rkey='+@salesby+')'
end
 select @cond=@cond+'
where b.orig_sched_ship_date>='''+@data1+'''
and b.orig_sched_ship_date<='''+@data2+'''
and data0010.cust_code >= '''+@cust1+''' and data0010.cust_code <='''+@cust2+''''

if @ody=0 
  select @cond=@cond+' order by b.sales_order'  
if @ody=1 
  --select @cond=@cond+' order by data0050.customer_part_number'  
select @cond=@cond+' order by data0025.MANU_PART_NUMBER'  
if @ody=2 
  --select @cond=@cond+' order by data0010.cust_code,data0050.customer_part_number'  
  select @cond=@cond+' order by data0010.cust_code,data0025.MANU_PART_NUMBER'  



exec (@cond)
--print @cond
end
--print @cond
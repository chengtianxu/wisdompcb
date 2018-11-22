--EP305版本升级出来可选的版本和编号
exec sp_executesql N'select  distinct   data0050.rkey,data0050.ttype,customer_part_number,data0059.customer_part_desc,
       cp_rev,data0059.customer_ptr,Data0010.abbr_name,Data0059.ONHOLD_SALES_FLAG,
       data0010.cust_code,data0010.customer_name,
       data0010.credit_rating,data0010.credit_limit,
	isnull(data0310.proi_code,'''') as proi_code,isnull(data0310.remark,''无法接单'') as proi_remark,
	isnull(data0310.ttype,4) as credit_rating_type,
	case data0050.tstatus when 1 then ''OK'' else '''' end MIOK
from  data0050  inner join data0059 on data0050.rkey=data0059.cust_part_ptr
	inner join data0010 on data0059.customer_ptr=data0010.rkey
	left join data0310 on data0010.credit_rating=data0310.seq_no
where (data0059.customer_ptr=@P1)--1客户代码一样
       and ((data0059.customer_part_desc=@P2)--2客户料号一样
     or (data0050.customer_part_number=@P3) --2本厂编号号一样
or (  data0050.rkey in--3在ECN里更改过的
(
select data0050.rkey
from data0273,data0025 a,data0050 left join data0025
on data0050.rkey=data0025.ancestor_ptr
where 
data0273.copyfromcust_ptr=a.ancestor_ptr and a.rkey=@P4
and data0273.customer_part_ptr=data0050.rkey
and data0025.parent_ptr=0
 )
   )
     )
order by customer_part_number,cp_rev desc 
',N'@P1 int,@P2 varchar(200),@P3 varchar(20),@P4 int',129,'SL M/B FR-4 245*165*2.0mm 2OZ JSK3350-05','P1W059171',1970
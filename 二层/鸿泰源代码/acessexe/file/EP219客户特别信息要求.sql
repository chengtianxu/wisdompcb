--EP219客户特别信息要求
exec sp_executesql N'UPDATE "SJ_V20_live".."data0010" 
SET "general_req"=@P1,"x_req"=@P2,"pack_req"=@P3,"Oqcrpt_req"=@P4,"other_req"=@P5 
WHERE "rkey"=@P6',N'@P1 text,@P2 text,@P3 text,@P4 text,@P5 text,@P6 int',
'111','222','333','444','555',61
--客户特别要求附件表
select * from Data0010 where  CUST_CODE like '001'

select data0010.rkey,data0010.cust_code,general_req,x_req,pack_req,Oqcrpt_req,other_req
from data0010 
order by data0010.cust_code
select data0050.rkey,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.risk_info,
case when Data0050.TTYPE=0 then '量产' else '样板' end as ctype
from Data0050,data0059
where Data0050.RKEY=data0059.cust_part_ptr
order by Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV

exec sp_executesql N'select cust_code,abbr_name,data0010.risk_info
 from data0059,data0010
 where data0059.cust_part_ptr=@P1
and data0059.customer_ptr=data0010.rkey
',N'@P1 int',5498
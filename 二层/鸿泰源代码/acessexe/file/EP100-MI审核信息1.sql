select  data0025.RKEY from data0050
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY and data0025.PARENT_PTR=0
where data0050.CUSTOMER_PART_NUMBER like 'P4B122150%'--²úÆ·±àºÅ
   
select data0005.employee_name,data0150.tdatetime
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and  
 data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=8962)  
and data0150.ps_rej=1  
order by tdatetime

exec user_defined_sp_ep100_12 12570
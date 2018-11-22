
 declare @sh1 varchar(50),   
         @sh2 varchar(50), 
         @sh3 varchar(50),  
         @shtime1 datetime,  
         @shtime2 datetime  ,
         @shtime3 datetime,  
         @vptr int 

select  @vptr=data0025.RKEY from data0050
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY and data0025.PARENT_PTR=0
where data0050.CUSTOMER_PART_NUMBER like 'HS%'--²úÆ·±àºÅ
   
select top 1 @sh3=data0005.employee_name,@shtime3=data0150.tdatetime  
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and  
 data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
order by tdatetime desc   
  
 select top 2 @sh2=data0005.employee_name,@shtime2=data0150.tdatetime  
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and  
 data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
and data0150.rkey not in( select top 1 data0150.rkey  
from data0150,data0005 where data0150.empl_ptr=data0005.rkey  
 and data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
order by tdatetime desc   
 )  
order by tdatetime desc   
  
 select top 3 @sh1=data0005.employee_name,@shtime1=data0150.tdatetime  
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and  
 data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
and data0150.rkey not in( select top 2 data0150.rkey  
from data0150,data0005 where data0150.empl_ptr=data0005.rkey  
 and data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
order by tdatetime desc   
 )  
order by tdatetime desc 
  
select @sh1 as sh1,@shtime1 as shtime1,@sh2 as sh2,@shtime2 as shtime2 ,@sh3 as sh3,@shtime3 as shtime3  
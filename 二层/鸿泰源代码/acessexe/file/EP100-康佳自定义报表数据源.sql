IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'user_defined_sp_ep100_2'
	   AND 	  type = 'P')
   DROP PROCEDURE user_defined_sp_ep100_2
go
/*MI报表自定义数据源用途*/  
CREATE PROCEDURE user_defined_sp_ep100_2   
@vptr int --data0025.rkey指针  
AS  
 declare @sh1 varchar(50),   
         @sh2 varchar(50), 
         @sh3 varchar(50),  
         @sh varchar(50), 
         @shtime1 datetime,  
         @shtime2 datetime  ,
         @shtime3 datetime  ,
         @shtime datetime  
   
/*select top 1 @sh3=data0005.employee_name,@shtime3=data0150.tdatetime  
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
order by tdatetime desc */

declare myCursor1 cursor for
select data0005.employee_name,data0150.tdatetime
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and  
 data0150.cust_part_ptr=(select ancestor_ptr from data0025 where rkey=@vptr)  
and data0150.ps_rej=1  
order by tdatetime

open mycursor1
fetch next from mycursor1 into @sh,@shtime

if @@fetch_status=0
begin
  select @sh1=@sh,@shtime1 =@shtime
  fetch next from mycursor1 into @sh,@shtime
end
if @@fetch_status=0
begin
  select @sh2=@sh,@shtime2 =@shtime
  fetch next from mycursor1 into @sh,@shtime
end

if @@fetch_status=0
begin
  select @sh3=@sh,@shtime3 =@shtime
  fetch next from mycursor1 into @sh,@shtime
end

close mycursor1
deallocate mycursor1
  
select @sh1 as sh1,@shtime1 as shtime1,@sh2 as sh2,@shtime2 as shtime2 ,@sh3 as sh3,@shtime3 as shtime3  
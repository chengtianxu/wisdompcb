select distinct data0028.EMPLOYEE_PTR from data0028 left join data0073 on data0073.rkey =data0028.employee_ptr

where data0073.rkey is null 


select * from data0028 where EMPLOYEE_PTR in (23,29,15)

select * from data0025

select * from data0050

where rkey in (

select cust_part_ptr from data0059 
group by  cust_part_ptr
having count(cust_part_ptr)>3) and ONHOLD_SALES_FLAG<>1
and TSTATUS=9

select  QTY_BOM,* from data0025 where QTY_BOM>1

where cust_part_ptr in (


select * from data0050 where rkey =1000


select* from data0047 
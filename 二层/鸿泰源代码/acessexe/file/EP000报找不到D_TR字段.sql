EP000报找不到D_TR字段

这个报错通常都是在计划编排中间对基础工序设置进行了修订
郭总  09:14:48
计划编排中间是不能修订工序设置的，如果修订了就需要重新生成计划
你知会客户注意下

reate table #test00 (schno int null,
ppc_dept_ptr int null,upanel int ,uset int,dept_name varchar(50),unit_name varchar(10),
d_sy decimal(6,2)
,d_on decimal(16,3)
,d_tr decimal(16,3) 
,d_sc decimal(16,3) 
,d_no varchar(10),d_prod decimal(16,3))

select * from #test00
drop table #test00
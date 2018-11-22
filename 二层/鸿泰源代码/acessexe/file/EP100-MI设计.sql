--查询窗口
exec EP '0','0','0','2013-12-13','2013-12-17','order by customer_part_number','',0

--以第一道工序查产品
select  data0050.CUSTOMER_PART_NUMBER,data0050.CP_REV,data0034.DEPT_code,data0034.DEPT_NAME  --data0059.CUSTOMER_PART_desc,
from Data0038 
left outer join Data0034 on data0038.DEPT_PTR=data0034.RKEY
left outer join Data0025 on data0038.SOURCE_PTR=data0025.RKEY and data0025.PARENT_PTR=0
join Data0050 on data0025.ANCESTOR_PTR=data0050.rkey
where STEP_NUMBER=1 --and data0034.DEPT_code='BC' --工序代码



select * from Data0050 where CUSTOMER_PART_NUMBER like 'HS%'
select data0025.*,data0050.* from Data0050 --where CUSTOMER_PART_NUMBER like 'HS%'
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY --and data0025.PARENT_PTR=0--外层
where data0050.RKEY=15

--某种产品有多少道工序及排列序号data0038
--exec EP100;30 23
select  data0038.* from data0038 
where SOURCE_PTR  in
(select data0025.RKEY from data0050
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY and data0025.PARENT_PTR=0
where data0050.CUSTOMER_PART_NUMBER like 'HS%' )--本厂编号

--某种产品有多少全局变量及值 data0279
select data0278.PARAMETER_NAME,data0278.PARAMETER_DESC,data0279.* 
from Data0279 
join data0278 on data0278.RKEY=data0279.PARAMETER_PTR 
where source_ptr      --- =23--data25.rkey
in (select data0025.RKEY from data0050
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY and data0025.PARENT_PTR=0
where data0050.CUSTOMER_PART_NUMBER like 'HS%' )--本厂编号

--工序参数
select * from data0494 where SOURCE_PTR=23 ---data25.rkey

--工序
select data0034.DEPT_NAME, data0038.* from data0038 
join Data0034 on data0034.RKEY =data0038.DEPT_PTR
where SOURCE_PTR =23
order by STEP_NUMBER 
select * from Data0034 where TTYPE =1

--工序参数
select data0038.SOURCE_PTR,data0038.DEPT_PTR,data0034.DEPT_NAME--data0038.FLOW_NO
,data0038.step_number,data0278.PARAMETER_NAME,data0278.PARAMETER_DESC,data0494.PARAMETER_VALUE,data0494.*
 from data0494 
join Data0278 on data0494.PARAMETER_PTR=data0278.rkey 
join Data0038 on data0038.RKEY=data0494.ROUTE_STEP_PTR
join Data0034 on data0038.DEPT_PTR=data0034.RKEY
where data0038.SOURCE_PTR  in
(select data0025.RKEY from data0050
join Data0025 on data0025.ANCESTOR_PTR=data0050.RKEY and data0025.PARENT_PTR=0
where data0050.CUSTOMER_PART_NUMBER like 'HS%' )
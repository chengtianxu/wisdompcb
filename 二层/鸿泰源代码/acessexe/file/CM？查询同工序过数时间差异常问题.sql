--intime  是收板时间  outtime是送板时间  预过数时间是 sendtime
select work_order_number 作业单号, CUSTOMER_PART_NUMBER AS 产品型号, c.dept_code 工序代码,c.DEPT_NAME as 部门名称 , 
INTIME 接板时间,sendtime 预过数出板时间,e.EMPLOYEE_NAME as 过数员,

* from data0048 a --0048流转表
join data0006 b on a.WO_PTR=b.rkey 
join data0034 c on a.WORK_CENTER_PTR=c.rkey and c.ttype=1 
join data0034 d on c.DEPT_PTR=d.rkey 
join Data0005 e on a.EMPL_PTR=e.RKEY
join Data0025 f on b.BOM_PTR=f.RKEY
join Data0050 j on f.ANCESTOR_PTR=j.RKEY AND J.CUSTOMER_PART_NUMBER='DS10291'

 where  (a.sendtime-a.INTIME)<0.0007 and c.BARCODE_ENTRY_FLAG='Y'--BARCODE_ENTRY_FLAG='Y'为工序是需过数工序
 --进出板时间差小于1分钟的;
 and INTIME>='2016-03-10 00:00:00'
 and INTIME<='2016-03-21 23:00:00'
-- and work_order_number='151226008-0-5-5T'
  order by work_order_number 

/*------自定义查询工序同时过数现象---
select top 100 percent 
 work_order_number 作业单号,c.dept_code 工序代码 ,c.DEPT_NAME  部门名称,INTIME 接板时间,sendtime 预过数出板时间,
QUAN_SCH  投产数量, QUAN_REJ 报废数量, QUAN_PROD 完工数量,e.EMPLOYEE_NAME 过数员,

case b.PROD_STATUS
  when 1 then '等待审核'  when 2 then '等待生产'  
  when 3 then '生产中'  when 9 then '生产结束' 
  when 103 then '生产中暂缓'  when 202 then '生产取消'  end as 生产状态

 from data0048

inner join data0006 b on data0048.WO_PTR=b.rkey  
inner join data0034 c on data0048.WORK_CENTER_PTR=c.rkey 
inner join data0034 d on c.DEPT_PTR=d.rkey and d.ttype=1 
inner join Data0005 e on data0048.EMPL_PTR=e.RKEY    

WHERE 1=:VWhere1 

and (data0048.sendtime-data0048.INTIME)<0.0007
and c.BARCODE_ENTRY_FLAG='Y'
and data0048.INTIME >=:VDate1
and data0048.sendtime<=:VDate2

 order by c.dept_code
 */
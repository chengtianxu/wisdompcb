--EP201入仓审核
exec ep201;1 '2013-08-01 00:00:00','2013-08-31 23:59:59','1',2

create PROCEDURE EP201
@vdate1 varchar(20),		--日期1
@vdate2 varchar(20),		--日期2
@vstatus  varchar(5),          --状态
@vptr varchar(5),			--入仓单提交审核类别0提交到成品仓审核1提交到尾数仓审核
@whse_ptrstr varchar(1000) --增加工厂条件字串 20130821 LLL 
--with encryption
AS
declare @cond varchar(8000)

set @cond='select data0416.rkey,data0416.number,data0416.type,data0416.empl_ptr,data0416.sys_date,data0416.quantity,
       data0416.reference,data0416.rma_ptr,data0416.so_ptr,data0416.d414rkey,data0416.tstatus,Data0416.ToRemainStock,
       data0416.create_date,data0416.create_empl_ptr,data0416.post_date,data0416.post_empl_ptr,
       data0416.remark,t1.abbr_name as mfg_name,t2.abbr_name as create_name,t3.abbr_name as post_name,
       (select sum(quantity) from data0053 where npad_ptr=data0416.rkey) as qty,
       case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓'' when 2 then ''已入仓'' 
          when 3 then ''被退回'' end as tstatus_desc,  
       (case Data0416.ToRemainStock when 0 then (case data0416.tstatus when 0 then '''' else ''出货仓审核'' end) 
         when 2  then ''成品叉板仓审核''   else ''尾数仓审核'' end) as audit_desc
        ,isnull(data0015.ABBR_NAME,''未指定'') as ABBR_NAME   
from data0416 left join
     data0005 t1 on data0416.empl_ptr=t1.rkey left join
     data0005 t2 on data0416.create_empl_ptr=t2.rkey left join 
     data0005 t3 on data0416.post_empl_ptr=t3.rkey 
      left join data0015 on data0416.whse_ptr=data0015.rkey 
where type=2 '

 set @cond=@cond+' and data0416.create_date>='''+@vdate1+''' and data0416.create_date<'''+@vdate2+''''
set @cond=@cond+' and tstatus='''+@vstatus+''''

if @vptr<>2
  set @cond=@cond+'and Data0416.ToRemainStock ='''+@vptr+'''' 

if @whse_ptrstr<>''  --增加工厂条件字串 20130821 LLL 
set @cond=@cond+@whse_ptrstr  

set @cond=@cond+' order by number'  
--print(@cond)
exec (@cond)
go


exec sp_executesql N'select data0416.rkey,data0416.number,data0416.type,data0416.sys_date,data0010.CUST_CODE,data0010.ABBR_NAME,
  data0416.tstatus, data0416.remark,data0006.work_order_number,data0053.wo_datecode, 
  data0053.quantity/(isnull(data0050.set_x_qty,1)*isnull(data0050.set_y_qty,1)) as set_quantity,
  case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓''
      when 2 then ''已入仓'' when 3 then ''被退回'' end as tstatus_desc,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0053.quantity
     ,Data0053.Qty_Packing,data0053.qty_pcs  
     ,data0060.COMMISION_ON_TOOLING ,data0060.sales_order  
     ,case data0060.COMMISION_ON_TOOLING when 0 then ''内销'' when 1 then ''保税'' when 2 then ''外销'' end as COMMISION_ON_TOOLING_desc   --增加订单销售类型 LLL 20121025
    ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
    ,data0416.tstatus, data0416.remark,data0006.work_order_number,data0053.wo_datecode,
    location=case when data0053.location_flag=1 then data0016.location else '''' end 
FROM dbo.Data0006 INNER JOIN
    dbo.data0416  INNER JOIN
    dbo.Data0053 ON dbo.data0416.rkey = dbo.Data0053.NPAD_PTR INNER JOIN
    dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.RKEY ON
    dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PTR LEFT OUTER JOIN
    dbo.data0059 ON dbo.Data0053.CUST_PART_PTR = dbo.data0059.cust_part_ptr AND dbo.Data0053.customer_ptr = dbo.data0059.customer_ptr
    left join Data0010 on Data0053.customer_ptr =Data0010.RKEY 
    left join data0060 on data0006.SO_PTR=data0060.rkey  
   left join data0016 on data0053.loc_ptr=data0016.rkey  
where data0416.type=2
   and data0416.create_date>=(@P1)
   and data0416.create_date<(@P2)+1
   and data0416.tstatus= @P3
order by number,data0050.customer_part_number

 
 
 
',N'@P1 datetime,@P2 datetime,@P3 int','2013-08-01 00:00:00','2013-08-31 23:59:59',1


--入仓处理
Update data0053 set loc_ptr=1, location_flag=1,REFERENCE_NUMBER='2',WO_DATECODE ='33'
 Where Rkey=21821

--修改53表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" 
SET "WHSE_PTR"=@P1,"LOC_PTR"=@P2,"QTY_ON_HAND"=@P3,"MFG_DATE"=@P4,"PANELS"=@P5,"EMPLOYEE_PTR"=@P6,"customer_ptr"=@P7 
WHERE "RKEY"=@P8 AND "WHSE_PTR"=@P9 AND "LOC_PTR"=@P10 AND "QTY_ON_HAND"=@P11 AND "MFG_DATE"=@P12 AND "PANELS"=@P13 AND "EMPLOYEE_PTR"=@P14 AND "customer_ptr"=@P15',
N'@P1 int,@P2 int,@P3 float,@P4 datetime,@P5 int,@P6 int,@P7 int,@P8 int,@P9 int,@P10 int,@P11 float,@P12 datetime,@P13 int,@P14 int,@P15 int',
2,1,20,'2013-08-31 13:00:54',1,1,315,21821,2,1,0,'2013-08-31 12:32:32',2,1,315
--修改6表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0006" 
SET "QUAN_PROD"=@P1,"PROJ_COMPL_DATE"=@P2
 WHERE "RKEY"=@P3 AND "QUAN_PROD"=@P4 AND "PROJ_COMPL_DATE"=@P5',
 N'@P1 float,@P2 datetime,@P3 int,@P4 float,@P5 datetime',
 2301,'2013-08-31 13:00:54',8209,2281,'2013-03-05 17:07:42'
 --流转记录
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0048"
  ("WO_PTR","FM_DEPT_PTR","WORK_CENTER_PTR","INTIME","OUTTIME","QTY_PROD","QTY_REJECT","FLOW_NO","STEP_NO","EMPL_PTR","WTYPE","sys_qty","sq_per_unit","gs_sq_per_unit") 
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 datetime,@P6 int,@P7 int,@P8 smallint,@P9 smallint,@P10 int,@P11 tinyint,@P12 float,@P13 float,@P14 float',
  8209,859,860,'2013-03-05 14:27:44','2013-08-31 13:00:54',20,0,0,20,1,0,1,0.0009944699999999999,0.00108957
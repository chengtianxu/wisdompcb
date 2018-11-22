--data0416成品入仓单/特殊入主表
--data0053成品入仓【特殊】明细表
--data006 lot
--data0056 wip

--入仓单查询

--有两个地方可能出现负数，如果to_be_stocked为0，再进行退回或入仓处理

exec sp_executesql N'select data0416.rkey,data0416.number,data0416.type,data0416.empl_ptr,data0416.sys_date,data0416.quantity,
       data0416.reference,data0416.rma_ptr,data0416.so_ptr,Data0416.ToRemainStock,
  data0416.d414rkey,data0416.tstatus,data0416.create_date,data0416.create_empl_ptr,post_date,post_empl_ptr,
  data0416.remark,t1.abbr_name as mfg_name,t2.abbr_name as create_name,t3.abbr_name as post_name,
  (select sum(quantity) from data0053 where npad_ptr=data0416.rkey) as qty,
  case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓''
      when 2 then ''已入仓'' when 3 then ''被退回'' end as tstatus_desc,
   (case Data0416.ToRemainStock when 0 then (case data0416.tstatus when 0 then '''' else ''出货仓审核'' end) 
     when 2  then ''尾数叉板仓审核''     else ''尾数仓审核'' end) as audit_desc
from data0416 left join
     data0005 t1 on data0416.empl_ptr=t1.rkey left join
     data0005 t2 on data0416.create_empl_ptr=t2.rkey left join
     Data0005 t3 on Data0416.post_empl_ptr=t3.rkey
where type=2
  and data0416.create_date>=(@P1)
  and data0416.create_date<(@P2)+1
  and tstatus= @P3
order by number
 
',N'@P1 datetime,@P2 datetime,@P3 int','2013-04-15 00:00:00','2013-05-16 23:59:59',0


--入仓单查询
exec sp_executesql N'select data0416.rkey,data0416.number,data0416.type,data0416.sys_date,data0010.CUST_CODE,data0010.ABBR_NAME,
  data0416.tstatus, data0416.remark,data0006.work_order_number,data0053.wo_datecode, data0060.RKEY as rkey60, 
  data0053.quantity/(isnull(data0050.set_x_qty,1)*isnull(data0050.set_y_qty,1)) as set_quantity,
  case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓''
      when 2 then ''已入仓'' when 3 then ''被退回'' end as tstatus_desc,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0053.quantity
     ,Data0053.Qty_Packing,data0053.qty_pcs ,data0053.remark as remark_53, Data0050.RKEY as rkey_50 
     ,case data0060.COMMISION_ON_TOOLING when 0 then ''内销'' when ''1'' then ''保税'' when ''2'' then ''外销'' end as COMMISION_ON_TOOLING,data0060.sales_order 
  ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
FROM dbo.Data0006 
INNER JOIN  dbo.data0416  
INNER JOIN  dbo.Data0053 ON dbo.data0416.rkey = dbo.Data0053.NPAD_PTR 
INNER JOIN  dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.RKEY
ON dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PTR 
LEFT OUTER JOIN
    dbo.data0059 ON dbo.Data0053.CUST_PART_PTR = dbo.data0059.cust_part_ptr AND dbo.Data0053.customer_ptr = dbo.data0059.customer_ptr
    left join Data0010 on Data0053.customer_ptr =Data0010.RKEY 
    left join data0492 on data0006.cut_no=data0492.cut_no 
    left join data0060 on data0492.so_no=data0060.sales_order 
where data0416.type=2
   and data0416.create_date>=(@P1)
   and data0416.create_date<(@P2)+1
   and data0416.tstatus= @P3
order by number,data0050.customer_part_number 
',N'@P1 datetime,@P2 datetime,@P3 int','2013-04-15 00:00:00','2013-05-16 23:59:59',0




exec sp_executesql N'Select data0056.rkey,Data0056.to_be_stocked
From Data0053 inner join
     Data0416 on Data0053.NPAD_PTR=Data0416.Rkey left join
     Data0056 on Data0053.d0056_ptr=Data0056.Rkey
Where Data0416.tStatus<>2  and data0053.CUST_PART_PTR =@P1   --2表示已入仓
group by data0056.rkey,Data0056.to_be_stocked
having sum(Data0053.quantity)<>Data0056.to_be_stocked
',N'@P1 int',8484

select * from Data0053 
where WORK_ORDER_PTR in (select rkey from Data0006 where WORK_ORDER_NUMBER='130409014-0-1-1')

select * from Data0056 where WO_PTR in(select rkey from Data0006 where WORK_ORDER_NUMBER='130409014-0-1-1')
select  * from Data0056 where RKEY in (78601,80445)
--新建入库单
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0416" ("number","type","empl_ptr","sys_date","quantity","TSTATUS") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 tinyint','1208305369',2,0,'2013-05-15 00:51:10',0,0
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0056" SET "QTY_BACKLOG"=@P1,"Weight_SET"=@P2,"TO_BE_STOCKED"=@P3,"TO_BE_STOCKED_NOW"=@P4,"TO_BE_CANCD"=@P5,"TDATE"=@P6,"EMPLOYEE_PTR"=@P7,"LOC_PTR"=@P8,"loc_place"=@P9 WHERE "QTY_BACKLOG"=@P10 AND "RKEY"=@P11 AND "Weight_SET"=@P12 AND "TO_BE_STOCKED"=@P13 AND "TO_BE_STOCKED_NOW"=@P14 AND "TO_BE_CANCD"=@P15 AND "TDATE"=@P16 AND "EMPLOYEE_PTR"=@P17 AND "LOC_PTR"=@P18 AND "loc_place"=@P19',N'@P1 float,@P2 float,@P3 float,@P4 float,@P5 int,@P6 datetime,@P7 int,@P8 smallint,@P9 varchar(20),@P10 float,@P11 int,@P12 float,@P13 float,@P14 float,@P15 int,@P16 datetime,@P17 int,@P18 smallint,@P19 varchar(20)',174,0,4,0,0,'2013-05-15 00:49:45',1,7,'04-1                ',178,74240,0,0,0,0,'2013-03-12 11:11:00',841,31,'2Y-01               '
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0006" SET "WO_DATECODE"=@P1 WHERE "WO_DATECODE"=@P2 AND "RKEY"=@P3',N'@P1 varchar(1),@P2 varchar(1),@P3 int','','',58253
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0053" ("WHSE_PTR","LOC_PTR","WORK_ORDER_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","QTY_ALLOC","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","DEPT_PTR","STEP","PANELS","EMPLOYEE_PTR","WaitShip","FinishShip","customer_ptr","d0056_ptr","to_be_cancd","location_flag","WO_DateCode","so_ptr","Weight_SET","remark","Qty_Packing","qty_pcs","WTYPE_53") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float,@P6 float,@P7 float,@P8 datetime,@P9 int,@P10 int,@P11 varchar(20),@P12 int,@P13 smallint,@P14 int,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 tinyint,@P22 varchar(1),@P23 int,@P24 float,@P25 varchar(1),@P26 float,@P27 float,@P28 tinyint',2,7,58253,8519,4,0,0,'2013-05-15 00:51:10',0,58538,'04-1                ',501,29,4,1,0,0,921,74240,0,1,'',16248,0,'',0,0,1
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0416" SET "quantity"=@P1,"reference"=@P2,"CREATE_DATE"=@P3,"CREATE_EMPL_PTR"=@P4 WHERE "rkey"=@P5 AND "quantity"=@P6 AND "reference" IS NULL AND "CREATE_DATE" IS NULL AND "CREATE_EMPL_PTR" IS NULL',N'@P1 int,@P2 varchar(1),@P3 datetime,@P4 int,@P5 int,@P6 int',4,'','2013-05-15 00:51:10',1,58538,0
go
Update data0004 set SEED_VALUE='1208305370' Where  RKEY=5 and table_name='data0416'
select data0416.number,data0053.d0056_ptr,data0053.* from Data0053 
join data0416 on NPAD_PTR=data0416.rkey
where  data0053. WORK_ORDER_PTR in (select rkey from Data0006 where WORK_ORDER_NUMBER='130409014-0-1-1')

select * from Data0056 where WO_PTR in(select rkey from Data0006 where WORK_ORDER_NUMBER='130409014-0-1-1')

--明细
SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE  (Data0025.ANCESTOR_PTR = 8484) -- @vptr2 19322
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    and DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL
  ORDER BY Data0006.WORK_ORDER_NUMBER
  
  
  

SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE  (Data0025.ANCESTOR_PTR = 8484) -- @vptr2 19322
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    and DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL
  ORDER BY Data0006.WORK_ORDER_NUMBER


CREATE PROCEDURE EP200;1  --19322,1,0
@vptr2 int,
@out_source int,
@flag int
WITH ENCRYPTION
AS

declare @ReworkIn_flag int 

set @ReworkIn_flag=(select ReworkIn_flag from data0195) 

if @flag = 0  
begin
  if @ReworkIn_flag=0 --加返工单是否可以入仓的开关，ReworkIn_flag默认为0，不可入仓，1-可入仓 20130221 LLL
  begin 
  SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE  (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    and DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL
  ORDER BY Data0006.WORK_ORDER_NUMBER
  end
  else --1-可入仓
  begin 
    SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
    WHERE  (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    ORDER BY Data0006.WORK_ORDER_NUMBER
  end
end
else 
begin 
 if @ReworkIn_flag=0 --加返工单是否可以入仓的开关，ReworkIn_flag默认为0，不可入仓，1-可入仓 20130221 LLL
  begin 
     SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW,
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53, 
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60   
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING  --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty  --增加叉板数及叉板比例 LLL 20121207   
      FROM Data0056 INNER JOIN
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN 
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey  
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc  ) --53set净重20130125 LLL    
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod) 
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no
                 --Where t2.so_no=Data0060.sales_order
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE    
    (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 and out_source= @out_source ) 
    and  DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL   
    ORDER BY Data0006.WORK_ORDER_NUMBER
 end
 else --1-可入仓
 begin 
   SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr, 
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW,
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53, 
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60   
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING  --增加订单销售类型 LLL 20121008 
      ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty  --增加叉板数及叉板比例 LLL 20121207   
      FROM Data0056 INNER JOIN
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN 
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey  
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc  ) --53set净重20130125 LLL    
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod) 
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no
                 --Where t2.so_no=Data0060.sales_order
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE    
    (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 and out_source= @out_source ) 
  ORDER BY Data0006.WORK_ORDER_NUMBER
 end 
end
GO
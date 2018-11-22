--EP082半成品分配
---------------------------------------
ppc_control30 EP082允许不经过半成品分配可以直接发放作业单
---------------------------
开关没选 还没分配半成器可以发母卡式单，但还是可以发放
case when isnull(data0025.has_child,0)=0 then 2 else data0006.wipmat_status end as wipmat_status
----------------------------------------
--主窗口
SELECT Data0006.RKEY, Data0006.WORK_ORDER_NUMBER, Data0006.BOM_PTR, data0006.sets_qty,
      Data0006.QUAN_SCH, Data0050.CUSTOMER_PART_NUMBER, Data0050.Cp_Rev,
      Data0025.MANU_PART_NUMBER, Data0006.WIPMAT_STATUS,
      Data0006.ENT_DATETIME, Data0006.SCH_COMPL_DATE,data0006.WHOUSE_PTR,
      data0025.qty_bom, data0006.parts_per_set,data0006.sets_bom_ptr,data0006.flow_no ,data0025.stop_step,data0006.wtype,data0006.put_type,DATA0006.prod_status,
      Data0006.PARTS_PER_PANEL,data0006.cut_no,data0006.quan_rej,data0006.quan_prod,data0006.panels
FROM Data0006 
INNER JOIN    Data0025 ON Data0006.BOM_PTR = Data0025.RKEY 
INNER JOIN     Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY
WHERE (Data0006.WIPMAT_STATUS = 0) --半成品发放状态0未发，1已发
AND (Data0006.PROD_STATUS < 9) --生产状态
AND
      (Data0025.RKEY IN
          (SELECT parent_ptr
         FROM data0025
         WHERE parent_ptr > 0 
         and barcode_flag=0)--非过数部件标识在MI里设置主要用在FPCB,不分产生LOT和配料单
      )--母件
ORDER BY Data0006.WORK_ORDER_NUMBER

--子窗口
--exec EP082;6 4558,4558

select data0006.work_order_number,data0025.qty_bom,data0025.manu_part_number,
data0488.quan_issued,data0025.rkey,data0025.bom_step,Data0488.pnl_issued
from data0006,data0025 
left outer join data0488 on data0488.bom_ptr=data0025.rkey and data0488.wo_ptr=4558--@vptr1 父卡DATA0006.RKEY
where data0006.bom_ptr=data0025.parent_ptr and data0025.barcode_flag=0--非过数部件标识在MI里设置主要用在FPCB,不分产生LOT和配料单
 and  data0006.rkey=4558--@vptr2 父卡DATA0006.RKEY
ORDER by data0025.bom_step,data0025.manu_part_number

---------------------------------------------------
-----------------修改发放不对

select WIPMAT_STATUS,* from data0006 where work_order_number like '131012041-0-3-3A'--290124 父卡
--UPDATE DATA0006 SET WIPMAT_STATUS=1 WHERE RKEY=290124 ----半成品发放状态0未发，1已发

select data0488.rkey,data0006.rkey,data0006.work_order_number,data0025.qty_bom,data0025.manu_part_number,
data0488.quan_issued,data0025.rkey,data0025.bom_step,Data0488.pnl_issued
from data0006,data0025 
left outer join data0488
on data0488.bom_ptr=data0025.rkey
and data0488.wo_ptr=290124
where data0006.bom_ptr=data0025.parent_ptr
and data0025.barcode_flag=0
and  data0006.rkey=290124
ORDER by data0025.bom_step,data0025.manu_part_number


insert into data0488 --发放记录
(WO_PTR,--工作单指针DATA0006.RKEY父卡
BOM_PTR,--部件指针DATA0025.RKEY子件
QUAN_REQ,--需求数量
QUAN_BOM,--压合比例
QUAN_ISSUED,--已经发放数量
fm_wo_ptr,
PNL_ISSUED --已经发放PNL数量	
	)
select wo_ptr,35166,4500,1,4500,null,0 from data0488 where rkey=2993--分配记录

------------------------------------------------------------------------------------------------------------------------------------------------------------------
--分配半成品
--作业单
SELECT Data0006.RKEY, Data0006.WORK_ORDER_NUMBER, Data0006.BOM_PTR, data0006.sets_qty,
      Data0006.QUAN_SCH, Data0050.CUSTOMER_PART_NUMBER, Data0050.Cp_Rev,
      Data0025.MANU_PART_NUMBER, Data0006.WIPMAT_STATUS,
      Data0006.ENT_DATETIME, Data0006.SCH_COMPL_DATE,data0006.WHOUSE_PTR,
      data0025.qty_bom, data0006.parts_per_set,data0006.sets_bom_ptr,data0006.flow_no ,data0025.stop_step,data0006.wtype,data0006.put_type,DATA0006.prod_status,
      Data0006.PARTS_PER_PANEL,data0006.cut_no,data0006.quan_rej,data0006.quan_prod,data0006.panels
FROM Data0006 INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN
      Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY
WHERE (Data0006.WIPMAT_STATUS = 0) AND (Data0006.PROD_STATUS < 9) AND
      (Data0025.RKEY IN
          (SELECT parent_ptr
         FROM data0025
         WHERE parent_ptr > 0 and barcode_flag=0))--非过数部件标识在MI里设置主要用在FPCB,不分产生LOT和配料单
ORDER BY Data0006.WORK_ORDER_NUMBER

--exec EP082;6 6737,6737
CREATE PROCEDURE EP082;6
@vptr1 int,
@vptr2 int
as
select data0006.work_order_number,data0025.qty_bom,data0025.manu_part_number,
data0488.quan_issued,data0025.rkey,data0025.bom_step,Data0488.pnl_issued
from data0006,data0025 left outer join data0488
on data0488.bom_ptr=data0025.rkey
and data0488.wo_ptr=@vptr1
where data0006.bom_ptr=data0025.parent_ptr
and data0025.barcode_flag=0
and  data0006.rkey=@vptr2
ORDER by data0025.bom_step,data0025.manu_part_number
go
手动分配
--exec EP082;7 12805,0,'x'
 CREATE PROCEDURE EP082;7
@vptr int,
@vptr2 int,
@vproj varchar(20)
as
if @vptr2=0 
begin
select data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey as d016_rkey,data0025.rkey as data0025_rkey,
sum(data0490.qty_on_hand) as qty_onhand,
sum(data0490.PNLS_on_hand) as PNLS_on_hand
from data0490,data0015,data0016,data0050,data0025
where data0490.manu_part_ptr=@vptr
and data0490.whse_ptr=data0015.rkey
and data0490.loc_ptr=data0016.rkey
and data0490.manu_part_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
and data0490.qty_on_hand>0
group by 
data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey,data0025.rkey
order by 
data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey 
end
if @vptr2=1
begin
select data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey as d016_rkey,data0025.rkey as data0025_rkey,
sum(data0490.qty_on_hand) as qty_onhand,
sum(data0490.PNLS_on_hand) as PNLS_on_hand
from data0490,data0015,data0016,data0050,data0025
where data0050.customer_part_number like @vproj
and data0490.whse_ptr=data0015.rkey
and data0490.loc_ptr=data0016.rkey
and data0490.manu_part_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
and data0490.qty_on_hand>0
group by 
data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey,data0025.rkey

order by 
data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0015.warehouse_code,data0015.warehouse_name,data0015.rkey,
data0016.code,data0016.location,data0016.rkey 
end
GO
---------------------------------分配－－－－－－－－－－－－－－－－－－－
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_live".."data0488"
 ("WO_PTR","BOM_PTR","QUAN_REQ","QUAN_BOM","QUAN_ISSUED","PNL_ISSUED")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 float,@P6 float',
 15962,12841,64,1,14,2
--改半成品库存
exec sp_executesql N'UPDATE "SJ_V20_live".."data0490" 
SET "QTY_ON_HAND"=@P1,"pnls_on_hand"=@P2 
WHERE "RKEY"=@P3 AND "QTY_ON_HAND"=@P4 AND "pnls_on_hand"=@P5',
N'@P1 float,@P2 float,@P3 int,@P4 float,@P5 float',
50,0,838,64,2

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0489" 
("TTYPE","BOM_PTR","WO_PTR","QTY","TDATE","SOURCE_PTR","pnls_qty")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 smallint,@P2 int,@P3 int,@P4 float,@P5 datetime,@P6 int,@P7 float',
 2,12841,15962,14,'2013-09-05 17:08:06',838,2
 
 

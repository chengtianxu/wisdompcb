--查50表指针
exec sp_executesql N'SELECT Rkey,firm_rel_s,Planned_rel_s
from data0050
where rkey=@P1
',N'@P1 varchar(16)','4877'
----------------全局参数和相关
exec sp_executesql N'DECLARE @vptr int
set @vptr =@P1
select *
into #testxx01
from (
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0279.PARAMETER_VALUE) as parameter_value,1 as flag
FROM Data0278 left JOIN
      Data0279 ON Data0279.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0279.SOURCE_PTR = Data0025.RKEY
WHERE  (Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'', ''10'', ''11'',  ''12'', ''13'', ''H'', ''I'', ''S'', ''T'',''B'',''P'',''24'',''25'',''26'',''27'',''28'',''29'',''30'',''31''))
 AND  data0025.ancestor_ptr=@vptr
union
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0047.PARAMETER_VALUE) as parameter_value,2 as flag
FROM Data0278 left JOIN
      Data0047 ON Data0047.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0047.SOURCE_Pointer = Data0025.RKEY
WHERE  Data0278.SPEC_RKEY=''B''
 AND  data0025.ancestor_ptr=@vptr) a

select * from  #testxx01
ORDER BY SEQUENCE_NO,PARAMETER_NAME

drop table #testxx01
 
 
',N'@P1 int',4877

---------------开料图等502表

exec sp_executesql N'select data0050.ttype,Data0502.rkey as d0502_ptr,case when data0025.parent_ptr=0 then data0025.EST_SCRAP  else 0 end as EST_SCRAP ,data0050.set_lngth,data0050.set_width,data0050.set_x_qty*data0050.set_y_qty as uset,
data0025.rkey as d25_ptr,data0025.parent_ptr,data0025.qty_bom,case when data0025.parent_ptr=0 then data0025.EST_SCRAP  else 0 end as old_EST_SCRAP,data0050.rkey as d50_rkey,data0050.unit_sq,
data0025.SHELF_LIFE,data0008.opt_lot_size,cast(data0008.opt_lot_size as float) as actual_opt_lot_size,data0025.manu_part_number,data0025.manu_part_desc,data0025.barcode_flag,
data0050.mfg_lead_time,data0059.onhold_sales_flag,data0008.product_name,data0025.eng_route_ptr as pcbcut_ptr,data0025.prod_route_ptr as repl_flag,
data0008.est_scrap as est_scrap0,est_scrap_ltm,est_scrap1,est_scrap1_lmt,data0047.parameter_value as sets,data0008.min_LOT_SIZE,data0008.mo_prechar
into #test00
from data0050 left join data0059  on data0050.rkey=data0059.cust_part_ptr and data0059.customer_ptr=@P1
left join data0025 on data0025.ancestor_ptr=data0050.rkey
left outer join data0502 on data0502.source_ptr=data0025.rkey and data0502.flow_no=0
left outer join data0008 on data0025.prod_code_ptr=data0008.rkey
left join data0047 on data0047.parameter_ptr=3 and data0047.source_pointer=data0025.rkey
where data0050.rkey=@P2
order by parent_ptr,manu_part_number
select * from #test00
drop table #test00
 
',N'@P1 int,@P2 int',123,4877

--------------全局及相关
exec sp_executesql N'DECLARE @vptr int
set @vptr =@P1
select *
into #testxx01
from (
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0279.PARAMETER_VALUE) as parameter_value
FROM Data0278 left JOIN
      Data0279 ON Data0279.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0279.SOURCE_PTR = Data0025.RKEY
WHERE  (Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'', ''10'', ''11'',  ''12'', ''13'', ''H'', ''I'', ''S'', ''T'',''B'',''P'',''24'',''25'',''26'',''27'',''28'',''29'',''30'',''31''))
 AND  data0025.ancestor_ptr=@vptr
union
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0047.PARAMETER_VALUE) as parameter_value
FROM Data0278 left JOIN
      Data0047 ON Data0047.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0047.SOURCE_Pointer = Data0025.RKEY
WHERE  Data0278.SPEC_RKEY=''B''
 AND  data0025.ancestor_ptr=@vptr) a

select * from  #testxx01
ORDER BY SEQUENCE_NO,PARAMETER_NAME

drop table #testxx01
  
',N'@P1 int',4877

-----------------------------装运

exec sp_executesql N'SELECT data0012.RKEY, overship_flag, OVERSHIP_BY_QTY_1, OVERSHIP_BY_QTY_2, 
      OVERSHIP_BY_QTY_3, ORDER_QTY_RANGE_1, ORDER_QTY_RANGE_2
FROM Data0012 right join data0060 on data0012.rkey=data0060.cust_ship_addr_ptr
where data0060.rkey=@P1
',N'@P1 int',6567
----开料图参数
exec EP052;12 4925--d25.rkey

CREATE PROCEDURE EP052;12
@vptr int
with encryption
AS
SELECT [rkey], [source_ptr], [sheet_BMP], description,
[TOTAL_PNLS_1], [PNL_LEN], [PNL_WTH], [UPANEL], 
[TOTAL_PNLS_2], [PNL_LEN_2], [PNL_WTH_2], [UPANEL_2], 
[TOTAL_PNLS_3], [PNL_LEN_3], [PNL_WTH_3], [UPANEL_3],
 [TOTAL_PNLS_4],[PNL_LEN_4], [PNL_WTH_4], [UPANEL_4], [flow_no] ,tusage3
from data0502
where source_ptr=@vptr
order by flow_no
go

--基本参数
exec EP052;10 4925-- 基本参数
create PROCEDURE EP052;10
@vptr int
with encryption
AS
begin
select data0278.category_ptr,'基本单位' as ttype,data0278.mark,data0278.parameter_desc,
cast(data0047.parameter_value as varchar(50))  as parameter_value,data0278.sequence_no
from data0277,data0278 left outer join data0047
on data0047.parameter_ptr=data0278.rkey
and data0047.source_pointer=@vptr
where 
data0278.category_ptr=data0277.rkey
and data0277.category_type=1
and data0278.RKEY>1
union
select data0278.category_ptr,'基本参数' as ttype,data0278.mark,data0278.parameter_desc,
cast(data0279.parameter_value as varchar(50))  as parameter_value ,data0278.sequence_no
from data0277,data0278 left outer join data0279
on data0279.parameter_ptr=data0278.rkey
and data0279.source_ptr=@vptr
where 
data0278.category_ptr=data0277.rkey
and data0277.category_type=2
order by data0278.category_ptr,data0278.mark,data0278.sequence_no,data0278.parameter_desc
end
GO

--工艺及参数
exec EP052;11 4925
create PROCEDURE EP052;11
@vptr int
with encryption
AS
select data0038.step_number,data0034.dept_name as dept_code,
data0278.parameter_desc,data0494.parameter_value
from data0494,data0278,data0038,data0034
where data0494.parameter_ptr=data0278.rkey
and data0494.route_step_ptr =data0038.rkey
and data0038.dept_ptr=data0034.rkey
and data0038.source_ptr=@vptr 
and data0038.flow_no=0
order by data0038.step_number,data0494.rkey
go




--流号
exec sp_executesql N'declare @vptr int
set @vptr=@P1
SELECT distinct data0038.flow_no,data0025.rkey as rkey_25
from data0038,data0025
where
data0038.source_ptr=data0025.rkey
and data0025.ancestor_ptr=@vptr
and data0025.parent_ptr=0
order by data0038.flow_no


',N'@P1 int',4877

--每PNL多少PCS
SELECT data0047.* FROM DATA0025,data0047,data0278
WHERE 
data0047.source_pointer=data0025.rkey
and data0025.ancestor_ptr in 
(4877)
and data0025.parent_ptr=0
and data0047.parameter_ptr=data0278.rkey
and data0278.spec_rkey='C'

-------------动态计划数
exec sp_executesql N'SELECT data0060.*,data0050.customer_part_number,data0050.cp_rev,data0360.sch_date AS PPC_DATE,data0360.rkey as rkey360,data0360.quantity-isnull(data0360.cancel_qty,0) as quantity,data0360.planned_qty,data0360.REMARK
FROM data0050,DATA0060 left join data0360 on data0360.so_ptr=Data0060.RKEY and data0360.planned_qty<data0360.quantity
WHERE data0060.cust_part_ptr in
(4877)
and (data0060.to_be_planned>0 or data0060.reput_qty >0)
and (data0060.status=1 or (data0060.status=4 and data0060.so_style=3)) and data0060.sch_date is not null
and data0060.cust_part_ptr=data0050.rkey   and so_tp<>1
and data0050.onhold_planning_flag=0
and quote_price<>0
and quote_price<>2
and prod_rel<>@P1

order by data0060.sch_date,data0360.sch_date
',N'@P1 varchar(16)','1'


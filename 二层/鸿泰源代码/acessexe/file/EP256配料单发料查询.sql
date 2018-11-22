配料单发料主表
exec ep256;1 '2013-08-30','2013-09-30',0


--发放明细
exec ep256;2 '130909006-1'

alter procedure ep256;2
@vcut_no varchar(20)
as
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='#tmpdata0468' AND TYPE='U')
  drop table #tmpdata0468
create table #tmpdata0468
(
  RKEY INT,		 		 
  dept_ptr int,
  dept_code nvarchar(10),	 	 
  dept_name nvarchar(50),
  step int,
  invent_ptr int,		 
  quan_bom float,
  quan_issued float,		 
  vendor nvarchar(30),
  rkey23 int,
  code23 nvarchar(18),
  supplier_name nvarchar(50),
  status nvarchar(4),
  invent_or nvarchar(6),
  inv_part_number nvarchar(25),
  inv_name nvarchar(50),
  inv_desc nvarchar(70),
  Unit_Code nvarchar(10)

	)  
insert into #tmpdata0468(RKEY,dept_ptr,dept_code,dept_name,step,invent_ptr,
quan_bom,quan_issued,vendor,rkey23,code23,supplier_name,status,invent_or,inv_part_number
,inv_name,inv_desc,Unit_Code)
SELECT data0468.rkey,data0468.dept_ptr,data0034.dept_code,data0034.dept_name,data0468.step,data0468.invent_ptr,
round(data0468.quan_bom,2,1) as quan_bom,--现在是截取原来round(data0468.quan_bom,2) as quan_bom四舍五入,

round(data0468.quan_issued,2) as quan_issued,data0468.vendor,d23.rkey as rkey23,d23.code as code23,d23.supplier_name,
case data0468.status when 0 then '有效' else '关闭' end as 'status',
case data0468.invent_or when 0 then'标准料'
  when 1 then '余料'
  when 2 then'留余料'
  else ''
end as 'invent_or','' as inv_part_number,'' as inv_name,'' as inv_desc,'' as Unit_Code
from data0468 
inner join data0034 on data0468.dept_ptr=data0034.rkey 
left join data0023 d23 on data0468.vendor=d23.abbr_name
where cut_no=@vcut_no

select * from #tmpdata0468 order by step
go




-----------------------------------
alter procedure ep256;1
@date1 varchar(10),
@date2 varchar(20),
@All INT  --1包已经发料，0不包
as
declare @cond nvarchar(2500)
declare @PLFL_flag int
set @PLFL_flag=0
select @PLFL_flag=PLFL_flag from data0195 --总控开关，配料单需审核才能发料
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='#492_468_0' AND TYPE='U')
  drop table #492_468_0
--  ,data0457.GON_NUMBER LEFT OUTER JOIN data0457 ON data0492.CUT_NO =data0457.cut_no
if @All=1 
begin
  set @cond='SELECT cast(0 as bit) as ifselect,data0492.*, Data0060.PARTS_ORDERED, Data0060.SCH_DATE, 
      data0050.unit_sq as PARAMETER_VALUE, data0050.set_x_qty*data0050.set_y_qty AS sets, Data0060.QTY_PLANNNED, 
      Data0025.MANU_PART_NUMBER, Data0025.REMARK AS remark25, 
      Data0025.RKEY AS d025_rkey, Data0025.MANU_PART_DESC, Data0025.EST_SCRAP, 
      Data0025.PARENT_PTR, Data0097.PO_NUMBER, 
      Data0050.CUSTOMER_PART_NUMBER, data0059.customer_part_desc, 
      Data0050.ONHOLD_RELEASE_FLAG, Data0050.CP_REV, Data0050.BOM_STATUS, 
      Data0010.CUST_CODE, Data0010.ABBR_NAME AS CUSTOMER_NAME, Data0005.EMPLOYEE_NAME, 
      Data0050.BOM_APPR_DATE, Data0050.CATALOG_NUMBER, data0008.prod_code,
      Data0008.PRODUCT_NAME, Data0050.RKEY AS rkey50,Data0025.ENG_NOTE,
      ltrim(str(data0050.set_lngth))+''*''+ltrim(str(data0050.set_width)) as setsize,
      data0050.unit_sq * data0492.ISSUED_QTY as area,data0050.green_flag,data0050.green_desc,
      data0050.set_lngth,data0050.set_width
      into #492_468_0
  FROM dbo.Data0010 INNER JOIN
      dbo.data0492 LEFT OUTER JOIN
      dbo.Data0060 ON 
      dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER LEFT OUTER JOIN
      dbo.Data0097 ON 
      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY LEFT OUTER JOIN
      dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY ON 
      dbo.Data0010.RKEY = dbo.data0492.CUSTOMER_PTR LEFT OUTER JOIN
      dbo.Data0008 INNER JOIN
      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR ON 
      dbo.data0492.BOM_PTR = dbo.Data0025.RKEY LEFT OUTER JOIN
      dbo.Data0050 ON 
      dbo.Data0025.ANCESTOR_PTR = dbo.Data0050.RKEY LEFT OUTER JOIN
      dbo.data0059 ON dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY 
     
  where 
  data0492.issue_date>='''+@date1+'''
  and data0492.issue_date<='''+@date2+'''
  and data0059.customer_ptr=data0492.customer_ptr'
end
else
begin
  set @cond='select cast(0 as bit) as ifselect,data0492.*, Data0060.PARTS_ORDERED, Data0060.SCH_DATE, 
      data0050.unit_sq as PARAMETER_VALUE, data0050.set_x_qty*data0050.set_y_qty AS sets, Data0060.QTY_PLANNNED, 
      Data0025.MANU_PART_NUMBER, Data0025.REMARK AS remark25, 
      Data0025.RKEY AS d025_rkey, Data0025.MANU_PART_DESC, Data0025.EST_SCRAP, 
      Data0025.PARENT_PTR, Data0097.PO_NUMBER, 
      Data0050.CUSTOMER_PART_NUMBER, data0059.customer_part_desc, 
      Data0050.ONHOLD_RELEASE_FLAG, Data0050.CP_REV, Data0050.BOM_STATUS, 
      Data0010.CUST_CODE, Data0010.ABBR_NAME AS CUSTOMER_NAME, Data0005.EMPLOYEE_NAME, 
      Data0050.BOM_APPR_DATE, Data0050.CATALOG_NUMBER, data0008.prod_code,
      Data0008.PRODUCT_NAME, Data0050.RKEY AS rkey50,Data0025.ENG_NOTE,
      ltrim(str(data0050.set_lngth))+''*''+ltrim(str(data0050.set_width)) as setsize,
      data0050.unit_sq * data0492.ISSUED_QTY as area,data0050.green_flag,data0050.green_desc,
      data0050.set_lngth,data0050.set_width
      into #492_468_0
  FROM dbo.Data0010 INNER JOIN
      dbo.data0492 LEFT OUTER JOIN
      dbo.Data0060 ON 
      dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER LEFT OUTER JOIN
      dbo.Data0097 ON 
      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY LEFT OUTER JOIN
      dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY ON 
      dbo.Data0010.RKEY = dbo.data0492.CUSTOMER_PTR LEFT OUTER JOIN
      dbo.Data0008 INNER JOIN
      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR ON 
      dbo.data0492.BOM_PTR = dbo.Data0025.RKEY LEFT OUTER JOIN
      dbo.Data0050 ON 
      dbo.Data0025.ANCESTOR_PTR = dbo.Data0050.RKEY LEFT OUTER JOIN
      dbo.data0059 ON dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY
  where 
  data0492.issue_date>='''+@date1+'''
  and data0492.issue_date<='''+@date2+'''
  and data0059.customer_ptr=data0492.customer_ptr'
end
if @PLFL_flag=1
set @cond=@cond+' and isnull(data0492.status,0)=3'
set @cond=@cond+' and (('+Convert(varchar,@All)+'=1) or (data0492.con_flag<1)) order by data0492.cut_no'
--print @cond 
set @cond=@cond+' select * from #492_468_0'
exec (@cond)
PRINT (@cond)

go

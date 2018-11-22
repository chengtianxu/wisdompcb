 --EP100;111 bomlist打印BOM清单
--exec EP100;111 13189
--create PROCEDURE EP100;111
declare
@vptr int 
--with encryption
--AS
SELECT @vptr=13189
declare @vflag INT

select @vflag=isnull(print_childbom_flag,0) from data0195
IF @VPTR>0
if @vflag=0
select 
case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+rtrim(data0050.cp_rev1) end as inv_part_number,
case when data0026.inventory_ptr>0 then data0017.inv_part_description else '自制品'+rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev1)+' '+rtrim(data0025.manu_part_number) end as inv_part_description,
round(data0026.qty_bom,6) as qty_bom,data0026.remark,Data0023.abbr_name,Data0034.dept_name
,data0002.unit_code,data0002.unit_name,data0026.length,data0026.width,data0026.thickness,data0026.uset,data0026.sys
from data0026 left outer join data0017 on data0026.inventory_ptr=data0017.rkey
left join Data0034 on data0026.DEPT_PTR=Data0034.RKEY
left join data0023 on data0026.supp_ptr=data0023.rkey
left join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey
left join data0025 on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey 
where manu_bom_ptr=@vptr and data0026.doc_flag='Y'
and data0026.flow_no=0
UNION
select data0025.manu_part_number,data0025.manu_part_desc,data0025.qty_bom,'子部件',null,null
,null as unit_code,null as unit_name,null as length,null as width,null as thickness,null as uset,null as sys
from data0025 where parent_ptr=@vptr
order by inv_part_number
else
select 
case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+rtrim(data0050.cp_rev1) end as inv_part_number,
case when data0026.inventory_ptr>0 then data0017.inv_part_description else '自制品'+rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev1)+' '+rtrim(data0025.manu_part_number) end as inv_part_description,
round(data0026.qty_bom,6) as qty_bom,data0026.remark,Data0034.dept_name
,data0002.unit_code,data0002.unit_name,data0026.length,data0026.width,data0026.thickness,data0026.uset,data0026.sys
from data0026 left outer join data0017 on data0026.inventory_ptr=data0017.rkey
left join Data0034 on data0026.DEPT_PTR=Data0034.RKEY
left join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey
left join data0025 on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey 
where manu_bom_ptr=@vptr and data0026.doc_flag='Y'
and data0026.flow_no=0

IF @VPTR<=0
select '' as inv_part_number,'' as inv_part_description,0 AS qty_bom,'' AS remark,'' AS abbr_name,'' as dept_name
,null as unit_code,null as unit_name,null as length,null as width,null as thickness,null as uset,null as sys
GO
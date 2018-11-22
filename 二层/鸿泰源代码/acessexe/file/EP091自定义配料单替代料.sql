EP10091自定义配料单替代料
SELECT A.INV_PART_DESCRIPTION,
       DATA0017.INV_PART_DESCRIPTION,
       DATA0026.* 
FROM   DATA0026,
       DATA0017,
       DATA0226,
       DATA0017 A
WHERE  DATA0226.INVENTORY_PTR = DATA0017.RKEY
       AND DATA0226.d26_PTR = DATA0026.RKEY
       AND DATA0026.INVENTORY_PTR = A.RKEY
       AND DATA0026.MANU_BOM_PTR = 36872
       
       
SELECT data0226.* FROM data0026    
left JOIN data0226 ON  DATA0226.d26_PTR = DATA0026.RKEY
LEFT JOIN data0017 ON  data0017.rkey=DATA0226.INVENTORY_PTR
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'user_defined_spBAK'
	   AND 	  type = 'P')
   DROP PROCEDURE user_defined_spBAK

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'user_defined_sp'
	   AND 	  type = 'P')
exec sp_rename 'user_defined_sp', 'user_defined_spBAK'
go



CREATE PROCEDURE user_defined_sp
@vptr int
AS
declare @rkey INT

select @rkey=data0060.rkey from data0060,data0492 where data0060.sales_order=data0492.so_no
and data0492.rkey=@vptr

select memo_text from data0011
where source_type=60 and
file_pointer=@rkey
go



SELECT A.INV_PART_DESCRIPTION,
       DATA0017.INV_PART_DESCRIPTION,
       DATA0026.* 
FROM   DATA0026,
       DATA0017,
       DATA0226,
       DATA0017 A
WHERE  DATA0226.INVENTORY_PTR = DATA0017.RKEY
       AND DATA0226.d26_PTR = DATA0026.RKEY
       AND DATA0026.INVENTORY_PTR = A.RKEY
       AND DATA0026.MANU_BOM_PTR = 36872
       
       
create PROCEDURE EP100;4
@vproj_ptr int
with encryption
AS
begin
select 0 as ttype,data0026.pcbcut_ptr,data0026.rkey,data0026.inventory_ptr,data0026.manu_bom_ptr,data0026.dept_ptr,data0026.QTY_BOM  ,data0026.FLOW_NO      ,data0026.ROUTE_STEP_NO      ,data0026.DOC_FLAG      ,data0026.repl_flag      ,data0026.alt_flag
      ,data0026.remark      ,data0026.CUST_PART_PTR      ,data0026.length      ,data0026.width      ,data0026.thickness
      ,data0026.uset      ,data0026.sys,data0023.ABBR_NAME,Data0026.KEY_FLAG,
data0002.unit_code,case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev) end as inv_part_number,
case when  data0026.inventory_ptr>0 then data0017.inv_part_number+' '+data0017.inv_part_description
+(case when isnull(Data0017.MANUFACTURER_NAME,'')<>'' then '[spec:'+Data0017.MANUFACTURER_NAME+']' else '' end) else  '自制品-'+rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev)+' '+rtrim(data0025.manu_part_number) end 
as inv_part_description,data0034.dept_code,data0502.description 
from data0034,data0026 left outer join data0502
on data0026.pcbcut_ptr=data0502.rkey left join data0017
on data0026.inventory_ptr=data0017.rkey left join data0025
on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey left join data0002
on data0017.stock_unit_ptr=data0002.rkey left join data0023
on Data0026.supp_ptr=data0023.rkey
where data0026.manu_bom_ptr=@vproj_ptr
and data0026.flow_no=0
and data0026.dept_ptr=data0034.rkey
union all
select 
      1 as ttype,data0026.pcbcut_ptr,data0026.rkey,data0026.inventory_ptr,data0026.manu_bom_ptr,data0026.dept_ptr,NULL  ,data0026.FLOW_NO      ,data0026.ROUTE_STEP_NO      ,data0026.DOC_FLAG      ,data0026.repl_flag      ,data0026.alt_flag
      ,'替代'+ltrim(a.inv_part_number) as remark      ,data0026.CUST_PART_PTR      ,NULL as length      ,NULL as width      ,NULL as thickness
      ,NULL as uset      ,NULL as sys,data0023.ABBR_NAME,Data0026.KEY_FLAG,
data0002.unit_code,data0017.inv_part_number, data0017.inv_part_number+' '+data0017.inv_part_description
+(case when isnull(Data0017.MANUFACTURER_NAME,'')<>'' then '[spec:'+Data0017.MANUFACTURER_NAME+']' else '' end)
as inv_part_description,data0034.dept_code,null as description 
from data0034,data0026 inner join data0226
on data0026.rkey=data0226.d26_ptr left join data0017
on data0226.inventory_ptr=data0017.rkey left join data0017 a
on data0026.inventory_ptr=a.rkey left join data0025
on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey left join data0002
on data0017.stock_unit_ptr=data0002.rkey left join data0023
on Data0026.supp_ptr=data0023.rkey
where data0026.manu_bom_ptr=@vproj_ptr
and data0026.flow_no=0
and data0026.dept_ptr=data0034.rkey

order by route_step_no,ttype,data0026.rkey,alt_flag,case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev) end
end
GO       
       
       
  
       
       
       
       

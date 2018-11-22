ep275工具管理
select data0034.rkey as d34_rkey,data0034.dept_name,data0030.tool_tp_name,data0032.rkey as d32_rkey,data0032.tool_tp_ptr, Tool_name, TOOL_REV, Created_by_ptr, Created_Date, data0032.Status, Tool_remark,
data0042.*,a.employee_name as checkinman,b.employee_name as checkoutman,data0023.code,data0023.supplier_name ,c.employee_name as outsourceman,data0070.po_number
from data0030 ,data0032,data0042 
left outer join data0005 a on data0042.checked_in_by_ptr=a.rkey
left outer join data0005 b on data0042.checked_out_by_ptr=b.rkey 
left outer join data0023 on data0042.supplier_ptr=data0023.rkey   
left outer join data0005 c ON data0042.planned_by_ptr=c.rkey 
left outer join data0034 on data0042.check_out_dept_ptr=data0034.rkey 
left join data0072 on d0072_ptr=data0072.rkey 
left join data0070 on data0072.poptr=data0070.rkey
where data0032.tool_tp_ptr=data0030.rkey and data0042.tool_ptr=data0032.rkey
and created_date>='2013-05-31' and created_date<='2013-08-31'
order by data0032.tool_name


exec sp_executesql N'declare @vptr int
set @vptr=@P1       
select data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,
data0060.sales_order,data0050.set_x_qty*data0050.set_y_qty as pcs_per_set,
data0060.status,data0060.ent_date,data0060.sch_date,data0060.parts_ordered,DATA0050.sm_color,DATA0050.etest_tp,Data0060.set_ordered,
data0492.upanel1,data0492.panel_1_qty,data0492.upanel2,data0492.panel_2_qty,data0492.upanel3,data0492.panel_3_qty,data0492.upanel4,data0492.panel_4_qty
from data0033,data0050 left join data0060 on data0050.rkey=data0060.cust_part_ptr
left join data0059 on  data0060.cust_part_ptr=data0059.cust_part_ptr
and data0059.customer_ptr=data0060.customer_ptr
left join data0010 on data0060.customer_ptr=data0010.rkey
left join data0492 on data0060.sales_order=data0492.so_no
left join Data0025 on data0492.BOM_PTR=Data0025.RKEY
where data0033.tool_ptr=@vptr
and data0033.cust_part_ptr=data0050.rkey
and Data0025.PARENT_PTR=0
order by data0492.issue_date

',N'@P1 int',4517


产品信息
exec sp_executesql N'declare @vptr int
set @vptr=@P1       
select data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,
data0060.sales_order,data0050.set_x_qty*data0050.set_y_qty as pcs_per_set,
data0060.status,data0060.ent_date,data0060.sch_date,data0060.parts_ordered,DATA0050.sm_color,DATA0050.etest_tp,Data0060.set_ordered,
data0492.upanel1,data0492.panel_1_qty,data0492.upanel2,data0492.panel_2_qty,data0492.upanel3,data0492.panel_3_qty,data0492.upanel4,data0492.panel_4_qty
from data0033,data0050 left join data0060 on data0050.rkey=data0060.cust_part_ptr
left join data0059 on  data0060.cust_part_ptr=data0059.cust_part_ptr
and data0059.customer_ptr=data0060.customer_ptr
left join data0010 on data0060.customer_ptr=data0010.rkey
left join data0492 on data0060.sales_order=data0492.so_no
left join Data0025 on data0492.BOM_PTR=Data0025.RKEY
where data0033.tool_ptr=@vptr
and data0033.cust_part_ptr=data0050.rkey
and Data0025.PARENT_PTR=0
order by data0492.issue_date

',N'@P1 int',4517

增加

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0032"
("tool_tp_ptr","Tool_name","TOOL_REV","Created_by_ptr","Created_Date","Status","Tool_remark") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY()
 AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 varchar(2),@P3 varchar(12),@P4 int,@P5 datetime,@P6 tinyint,@P7 varchar(2)',
 NULL,'aa','P2E268036.A0',1,'2013-08-30 00:00:00',0,'aa'
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0042" 
 ("tool_ptr") VALUES (@P1); 
 SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN',
 N'@P1 int',5
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live"."dbo"."Data0033" 
 ("tool_ptr") 
 VALUES (@P1); 
 SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN',
 N'@P1 int',5
 
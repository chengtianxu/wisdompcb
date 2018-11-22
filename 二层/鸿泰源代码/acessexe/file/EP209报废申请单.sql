exec sp_executesql N'select  data0058.*,data0006.work_order_number,data0034.dept_code,data0034.dept_name,
b.dept_code as dept_code_1,b.dept_name as dept_name_1,data0006.parts_per_panel,
data0006.prod_status,data0039.rej_code,data0039.reject_description,
data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,
data0005.employee_name,data0059.customer_part_desc,data0059.customer_matl_desc,
data0015.warehouse_name,data0492.issued_qty,data0010.cust_code,data0010.abbr_name
from data0058 inner join data0006 on data0058.wo_ptr=data0006.rkey 
  left join data0039 on data0058.reject_ptr=data0039.rkey 
  left join data0005 on data0058.empl_ptr=data0005.rkey 
  left join data0025 on data0006.bom_ptr=data0025.rkey 
  left join data0050 on data0025.ancestor_ptr=data0050.rkey 
  left join data0034 on data0058.dept_ptr=data0034.rkey 
  left join data0034 b on data0058.resp_dept_ptr=b.rkey 
  left join data0015 on data0006.whouse_ptr=data0015.rkey 
  left join data0492 on data0006.cut_no=data0492.cut_no 
  left join data0060 on data0492.so_no=data0060.sales_order 
  left join data0010 on data0060.customer_ptr=data0010.rkey
  left join Data0059 on Data0059.customer_ptr=Data0060.CUSTOMER_PTR
    and Data0059.cust_part_ptr  =Data0060.CUST_PART_PTR
where data0058.mrb_no=@P1
and data0058.step>0
order by data0050.customer_part_number

 
',N'@P1 varchar(15)','113010404'
exec sp_executesql N'
select data0006.rkey,data0006.work_order_number,data0056.panels,data0006.sets_bom_ptr,Data0006.prod_status,
data0050.customer_part_number,data0050.cp_rev,data0006.bom_ptr, data0050.set_x_qty*data0050.set_y_qty as set_qty,
data0025.manu_part_number,data0056.qty_backlog,data0006.parts_per_panel,isnull(Data0006.stop_lmt_step,0) as stop_lmt_step,
data0056.to_be_stocked,isnull(data0056.flow_no,0) as flow_no,data0056.rkey as d0056_rkey,Data0006.PARTS_PER_SET,
isnull(data0056.step,0) as step,data0034.dept_code,data0056.dept_ptr,Data0006.WHOUSE_PTR,Data0056.SETS_QTY,
data0034.dept_ptr as deptptr,data0059.customer_part_desc,data0059.customer_matl_desc,data0034.dept_name,
DATA0056.QTY_REJ,
case 
  when Data0006.prod_status=1 then ''等待审核''  
  when Data0006.prod_status=2 then ''等待生产''
  when Data0006.prod_status=3 then ''生产中''
  when Data0006.prod_status=9 then ''生产结束''
  when Data0006.prod_status in (101,102,103) then 
    case when isnull(Data0006.stop_lmt_step,0)=0 then ''暂缓从当前步骤''
      else ''暂缓从第''+cast(Data0006.stop_lmt_step as varchar(10))+''步''
    end
  when Data0006.prod_status in (201,202,203) then ''已取消''
end as prodstatus
from Data0056 
  inner join Data0006 on data0056.wo_ptr=data0006.rkey
  inner join Data0025 on data0006.bom_ptr=data0025.rkey
  inner join Data0050 on data0025.ancestor_ptr=data0050.rkey
  inner join Data0034 on data0056.dept_ptr=data0034.rkey
  left join Data0060 on Data0006.so_ptr=Data0060.rkey
  left join Data0059 on Data0059.customer_ptr=Data0060.CUSTOMER_PTR
    and Data0059.cust_part_ptr  =Data0060.CUST_PART_PTR
where data0034.dept_ptr in (select data0034.dept_ptr
  from data0487,data0034 WHERE data0487.user_ptr=@P1 and data0487.dept_ptr=data0034.rkey)
order by data0050.customer_part_number,data0025.manu_part_number,data0006.work_order_number
',N'@P1 int',229
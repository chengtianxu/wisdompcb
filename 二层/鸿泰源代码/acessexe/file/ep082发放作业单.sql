发放作业单
exec EP082;46 0

CREATE PROCEDURE EP082;46
@vwhse_ptr int
as
select data0006.rkey,data0006.sets_bom_ptr,data0006.bom_ptr,data0006.flow_no,data0006.quan_sch,data0006.WHOUSE_PTR,
data0006.quan_rej,data0006.quan_prod,data0006.sets_qty,data0006.BEGIN_STEP_NO,data0006.wtype,data0006.put_type,
data0006.work_order_number,data0006.priority_code,data0006.parts_per_panel,data0006.panels,data0006.sch_compl_date,
case when isnull(data0025.has_child,0)=0 then 2 else data0006.wipmat_status end as wipmat_status,
rtrim(data0050.customer_part_number)+' '+data0050.cp_rev as customer_part_number,data0010.abbr_name,
data0025.rkey as data0025_rkey,data0025.manu_part_number,data0008.prod_code,data0050.onhold_release_flag,
data0050.shelf_life,data0010.cust_code,data0492.ttype,data0059.customer_matl_desc,data0025.stop_step,
data0008.product_name,data0492.Pnl1_Size,data0492.Pnl2_Size,data0492.Pnl3_Size,data0492.Pnl4_Size 
from data0006 left join 
data0025 on (case when sets_bom_ptr>0 then data0006.sets_bom_ptr else data0006.bom_ptr end)=data0025.rkey left join 
data0050 on data0025.ancestor_ptr=data0050.rkey left join 
data0008 on data0025.prod_code_ptr=data0008.rkey left join 
data0492 on data0006.cut_no=data0492.cut_no left join 
data0010 on data0492.customer_ptr=data0010.rkey left join 
data0059 on data0050.rkey=data0059.cust_part_ptr and data0010.rkey=data0059.customer_ptr 
where data0006.prod_status=2 
and (@vwhse_ptr=0 or data0006.whouse_ptr=@vwhse_ptr)
order by data0006.work_order_number
go


--------------------------------------------------------------------------------------------

--exec EP082;3 '2013-05-17 09:28:01','2013-06-07 09:28:04'

--create PROCEDURE EP082;3
declare 
@vdate1 datetime='2013-05-17 09:28:01',
@vdate2 datetime='2013-06-07 09:28:04'
--AS
select data0006.rkey,data0006.work_order_number,data0006.prod_status,data0006.wtype as wtype06,data0006.stop_lmt_step,data0006.sets_bom_ptr,
data0006.quan_sch,flow_no=IsNull(data0056.flow_no,data0006.flow_no),data0006.quan_rej,data0006.quan_prod,data0006.whouse_ptr,
data0006.reference_ptr,data0025.parent_ptr,a.dept_ptr as deptptr,a.ttype,d492Type=Data0492.ttype,data0050.rkey as d50rkey,Data0050.user_info,
data0006.bom_ptr,data0025.manu_part_number,data0050.customer_part_number,Data0015.warehouse_name,a.rkey as rkey34g,
data0050.cp_rev,data0056.step,data0056.rkey as d0056_rkey,data0056.wtype,a.dept_code,data0006.WO_DATECODE,
a.dept_name,data0059.customer_part_desc,Data0015.warehouse_code,data0492.customer_ptr,data0098.rma_number,
data0056.qty_backlog+data0056.to_be_stocked as qty_backlog,data0056.dept_ptr,Data0015.abbr_name,
data0060.parts_ordered,data0060.parts_shipped,data0060.sales_order,data0005.employee_name,data0056.send_to_dept_ptr,
data0060.parts_ordered-data0060.parts_shipped+data0060.quan_to_re_delivery-data0060.returned_ship as plan_ship,
data0059.customer_matl_desc,data0010.abbr_name as cust_abbr_name,data0010.cust_code,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,data0050.onhold_release_flag,data0060.sales_order as so_no,
wtype_desc=case Data0056.wtype when 2 then '返工生产中'
                               when 0 then '正常生产中'
                               else  '' end,case when data0006.sets_cust_part_ptr>0 then 'Y' else '' end as sets_flag
from (select * from data0006
where data0006.ent_datetime>=@vdate1
and data0006.ent_datetime<=@vdate2) as data0006 left join 
     data0056 on data0056.wo_ptr=data0006.rkey left join 
     data0034 a on data0056.dept_ptr=a.rkey left join 
     data0025 on data0006.bom_ptr=data0025.rkey left join 
     data0050 on data0025.ancestor_ptr=data0050.rkey left join 
     data0492 on data0006.cut_no=data0492.cut_no  left join 
     data0060 on data0006.so_ptr=data0060.rkey left join
     data0098 on data0060.rma_ptr=data0098.rkey left join
     data0059 on data0050.rkey=data0059.cust_part_ptr 
             and data0492.customer_ptr=data0059.customer_ptr left join 
     Data0015 on data0006.whouse_ptr=Data0015.Rkey left join
     data0005 on data0006.user_ptr=data0005.rkey left join
     data0010 on data0060.customer_ptr=data0010.rkey 
where data0006.ent_datetime>=@vdate1
and data0006.ent_datetime<=@vdate2
order by data0056.dept_ptr,data0006.work_order_number
GO

/*prod_status	1	等待审核
	2	等待生产
	3	生产中
	9	生产结束
	101	审核暂缓
	102	生产前暂缓
	103	生产中暂缓
	201	Cancelled from Engineering Review
	202	Cancelled from Production Backlog
	203	Cancelled from Shop Floor
WTYPE	0	正常投產
	1	退货重检返工
	2	正常重检返工
	3	正常重检返工
PUT_TYPE	0	正常投產
	1	補料投產
	2	退貨補料投產
	
	*/
	
	--工作单结束,在线品
select * from Data0056 where WO_PTR in (select rkey from data0006 where prod_status=9)
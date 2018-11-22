--工作单搜索
select data0006.sets_bom_ptr,-->data0038.source_ptr=当0取这值，否则取  1变量
data0006.bom_ptr,--1变量
isnull(data0056.step,0) as step,--2变量
isnull(data0056.flow_no,0) as flow_no,--3变量,
data0056.rkey as d56rkey,
 data0006.rkey,data0006.work_order_number,data0056.panels,data0006.sets_bom_ptr,Data0006.prod_status,
data0050.customer_part_number,data0050.cp_rev,data0006.bom_ptr, data0050.set_x_qty*data0050.set_y_qty as set_qty,
data0025.manu_part_number,data0056.qty_backlog,data0006.parts_per_panel,isnull(Data0006.stop_lmt_step,0) as stop_lmt_step,
data0056.to_be_stocked,isnull(data0056.flow_no,0) as flow_no,data0056.rkey as d0056_rkey,Data0006.PARTS_PER_SET,
isnull(data0056.step,0) as step,data0034.dept_code,data0056.dept_ptr,Data0006.WHOUSE_PTR,Data0056.SETS_QTY,
data0034.dept_ptr as deptptr,data0059.customer_part_desc,data0059.customer_matl_desc,data0034.dept_name,
DATA0056.QTY_REJ --加报废数量20120608LLL
from Data0056 inner join Data0006 on data0056.wo_ptr=data0006.rkey and data0006.work_order_number like '130228010-0-26-26' --工作单号
  inner join Data0025 on data0006.bom_ptr=data0025.rkey
  inner join Data0050 on data0025.ancestor_ptr=data0050.rkey
  inner join Data0034 on data0056.dept_ptr=data0034.rkey--工序、组、中心
  left join Data0060 on Data0006.so_ptr=Data0060.rkey
  left join Data0059 on Data0059.customer_ptr=Data0060.CUSTOMER_PTR
    and Data0059.cust_part_ptr  =Data0060.CUST_PART_PTR
where data0034.dept_ptr in (select data0034.dept_ptr
  from data0487,data0034 
  WHERE data0487.user_ptr=112 --@vptr 指向486.rkey 可以用登录名查这个值
  and data0487.dept_ptr=data0034.rkey)
order by data0050.customer_part_number,data0025.manu_part_number,data0006.work_order_number



------------------------------------------------------------------
--报废当前工序,根据38表来判断过数

--显示 step_number+dept_code
--copy(inttostr(1000+FrmMain.Adoquery9.fieldbyname('step_number').Asinteger),2,3)+'. '+FrmMain.Adoquery9.Fieldbyname('dept_code').AsString);
select data0038.rkey,data0034.dept_code,data0038.dept_ptr,a.barcode_entry_flag,data0038.step_number --过数 往前推找到最后一个要过数的
from data0038,data0034,data0034 a --工序
where source_ptr=11298--:vptr data0025.rkey 1变量
and data0034.rkey=data0038.dept_ptr
and data0034.dept_ptr=a.rkey
and data0038.step_number<=16--:vstep 2变量
and data0038.flow_no=0--:vflow 3变量
order by data0038.step_number desc

--update data0038 set  dept_ptr=400 where rkey= 212032

--在EP082作业单管理里可选变更作业单，在里面调一下当前位置就可以
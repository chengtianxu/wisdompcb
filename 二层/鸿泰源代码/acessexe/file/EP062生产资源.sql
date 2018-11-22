--工作组

select rkey,ttype,out_source,dept_code,dept_name,group_ptr,barcode_entry_flag,active_flag,
dept_ptr,pcs_as_unit,big_dept_ptr,seq_no ,seq_nr,schedule_flag,whouse_ptr,scp_pcent,wo_days,wo_min_days,lead_days
from data0034 where ( ttype=0 or (ttype=1)) --1工序,2工作组,3工作中心,4部门,班组
order by DEPT_CODE




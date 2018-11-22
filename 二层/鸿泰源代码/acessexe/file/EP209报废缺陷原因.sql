select data0039.RKEY,REJ_CODE,REJECT_DESCRIPTION,REJECT_DEFECT_FLAG,data0034.rkey as rkey34,dept_code,dept_name 
  from data0039
  left join data0040 on data0039.rkey=data0040.reject_code_ptr
  left join data0034 on data0034.rkey=data0040.dept_ptr
  where reject_defect_flag='R'
  order by data0039.rej_code
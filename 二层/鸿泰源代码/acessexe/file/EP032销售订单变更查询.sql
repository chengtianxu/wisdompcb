select USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, 
FROM_STRING,TO_STRING,file_number,convert(varchar(300),reason) as reason ,Update_REMARK,updateSoAccess_path
from data0318 
inner join data0073 on data0318.user_ptr=data0073.rkey
where sales_ORDER_PTR=15210
 order by data0318.rkey desc

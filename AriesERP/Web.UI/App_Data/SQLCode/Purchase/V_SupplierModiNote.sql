(--供应商变更记录
select supplier_ptr,user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,
	TRANS_DESCRIPTION,FROM_STRING,TO_STRING,file_number
from data0318 inner join data0073 on
data0318.user_ptr=data0073.rkey
) a
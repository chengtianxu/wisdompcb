select user_login_name,user_full_name,data0077.*
from data0077 inner join data0073 on data0077.user_ptr=data0073.rkey
where ttype=1
order by seq_no

--ttype=0：采购；1：外发采购；2：订单退货流程；4:配料单审批流
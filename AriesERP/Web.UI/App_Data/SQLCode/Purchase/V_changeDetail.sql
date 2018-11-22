
(  ---V_changeDetail
select data0328.price_ptr,data0005.EMPLOYEE_NAME, data0328.sys_longdate ,
data0328.old_price, data0328.new_price,data0328.reason,
round(data0328.new_price-data0328.old_price,2) as change,
      case when data0328.old_price>0 then
      round((data0328.new_price-data0328.old_price)*100/data0328.old_price,2)
      else 100 end as rand,
CONVERT(datetime, CONVERT(varchar, sys_longdate, 102))  as sys_sortdate
from data0328 inner join data0005
on data0328.user_ptr=data0005.rkey
)a

 

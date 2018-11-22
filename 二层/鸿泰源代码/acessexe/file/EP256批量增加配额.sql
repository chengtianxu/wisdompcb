--EP256批量增加配额 
--材料
select data0496.group_name,data0017.rkey,data0017.inv_part_number,
data0017.inv_part_description,data0002.unit_code,
data0017.quan_assign,data0017.quan_on_hand
from data0002,data0017 ,data0496
where data0017.stock_unit_ptr=data0002.rkey
and data0017.moflag=1
and data0017.quan_assign>0
and data0017.group_ptr=data0496.rkey
union 
select '余料',data0556.rkey,mat_code,mat_desc,'Sheet' as unit_code,quan_assign,
quan_on_hand
from data0556 
where quan_assign>0
order by inv_part_number,inv_part_description

--EP082°æ±¾Éı¼¶
select distinct customer_part_number,cp_rev,rkey,manu_part_number from (
select distinct data0050.customer_part_number,data0050.cp_rev,
data0025.rkey,data0025.manu_part_number
from data0050,data0025,data0059
where data0050.rkey=data0059.cust_part_ptr and data0050.rkey=data0025.ancestor_ptr
and data0059.customer_part_desc = 'ËÄ²ã²£ÏË°åFR-4 121X85.5mmX1.6mm Í­ºñ1OZ ³Á½ğ1u PCBFR00008-0304 ROHS'
and data0059.customer_ptr = '344'
and data0025.parent_ptr=0
union all
select  data0050.customer_part_number,data0050.cp_rev,
data0025.rkey,data0025.manu_part_number
from data0273,data0025 a,data0050 left join data0025
on data0050.rkey=data0025.ancestor_ptr
where data0273.copyfromcust_ptr=a.ancestor_ptr and a.rkey=12587
and data0273.customer_part_ptr=data0050.rkey
and data0025.parent_ptr=0
) a order by  customer_part_number,cp_rev,rkey,manu_part_number

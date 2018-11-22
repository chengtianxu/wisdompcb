SELECT data0496.group_desc,data0034.dept_code,data0034.dept_name,data0017.inv_part_number,data0468.invent_or,
data0017.inv_part_description,'' as len_size,'' as wei_size,data0002.unit_code,data0468.step,data0468.std_qty_bom,
data0468.quan_bom,data0468.quan_issued,data0468.status,data0468.vendor,data0468.remark,data0468.reference_number,data0468.location,
data0496.group_desc as inventor,'' as spec ,data0468.length,data0468.width,data0468.thickness,data0468.uset,data0468.sys,data0017.inv_name,data0017.inv_description
from data0468,data0017,data0034,data0002 ,data0496
where cut_no ='130802001-0' --@P1
and data0468.invent_ptr=data0017.rkey
and data0468.printit like 'Y%'
and data0017.stock_unit_ptr=data0002.rkey
and data0496.rkey=data0017.group_ptr
and data0468.dept_ptr=data0034.rkey and data0468.invent_or=0
union all
SELECT data0496.group_desc,data0034.dept_code,data0034.dept_name,data0556.mat_code,  data0468.invent_or,
data0556.mat_desc,cast(data0556.len_size as varchar(15)) as len_size,cast(data0556.wei_size as varchar(15)) as wei_size,data0002.unit_code,data0468.step,data0468.std_qty_bom,
data0468.quan_bom,data0468.quan_issued,data0468.status,data0468.vendor,data0468.remark,  data0468.reference_number,data0468.location,
case data0468.invent_or
when 0 then '标准料'
when 1 then '余料'
when 2 then '留余料'
else ''
end as inventor,
(cast(data0556.len_size as varchar(15))+'*'+cast(data0556.wei_size as varchar(15))) as spec,data0468.length,data0468.width,data0468.thickness,data0468.uset,data0468.sys,data0017.inv_name,data0017.inv_description
from data0468,data0556,data0034,data0002,data0558,data0017,data0496
where cut_no ='130802001-0'  --@P3
and data0468.invent_ptr=data0558.rkey
and data0468.invent_or=1
and data0558.d556_ptr=data0556.rkey
and data0468.printit like 'Y%'
and data0556.rkey17=data0017.rkey
and data0017.stock_unit_ptr=data0002.rkey
and data0496.rkey=data0017.group_ptr
and data0468.dept_ptr=data0034.rkey
union all
SELECT data0496.group_desc,data0034.dept_code,data0034.dept_name,data0556.mat_code,data0468.invent_or,
data0556.mat_desc,cast(data0556.len_size as varchar(15)) as len_size,cast(data0556.wei_size as varchar(15)) as wei_size,data0002.unit_code,data0468.step,data0468.std_qty_bom,
data0468.quan_bom,data0468.quan_issued,data0468.status,data0468.vendor,data0468.remark, data0468.reference_number,data0468.location,
case data0468.invent_or
when 0 then '标准料'
when 1 then '余料'
when 2 then '留余料'
else ''
end as inventor,
(cast(data0556.len_size as varchar(15))+'*'+cast(data0556.wei_size as varchar(15))) as spec ,data0468.length,data0468.width,data0468.thickness,data0468.uset,data0468.sys,data0017.inv_name,data0017.inv_description
from data0468,data0556,data0034,data0002,data0017,data0496
where cut_no ='130802001-0'  --@P5
and data0468.invent_ptr=data0556.rkey
and data0468.invent_or=2
and data0468.printit like 'Y%'
and data0556.rkey17=data0017.rkey
and data0017.stock_unit_ptr=data0002.rkey
and data0496.rkey=data0017.group_ptr
and data0468.dept_ptr=data0034.rkey
order by data0468.invent_or,data0468.step,data0034.dept_code,data0034.dept_name,data0017.inv_part_number,data0017.inv_part_description,
data0002.unit_code,data0468.quan_bom,data0468.quan_issued,data0468.status
 
 
 

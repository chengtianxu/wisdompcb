--ECN²é¿´
create procedure ep121;24 
@vptr int
with encryption
as

select top 10 data0273.RKEY, CUSTOMER_PART_PTR, COPYFROMCUST_PTR, ENTERED_BY, VERIFIED_BY,data0050.qty_on_hand,
 ENTERED_DATE, VERIFIED_DATE, STATUS, SOURCE, TEXT1, rtrim(a.customer_part_number)+' '+rtrim(a.cp_rev) as OldCustomer_part_number, TEXT3, TEXT4,text5,
 ECN_NO, text, data0273.remark, Tooling_close, last_modi_by_ptr, last_modi_date,data0010.abbr_name,data0050.customer_part_number,data0059.customer_matl_desc,
 g.customer_matl_desc as oldcustomer_matl_desc,g.customer_part_desc as oldcustomer_part_desc,
 ECNSTART, del, del_empl_ptr, del_date ,a.sample_nr as old_sample_nr,data0050.sample_nr as sample_nr,
data0050.ALLOW_EDIT_FLAG,data0273.status,
data0050.cp_rev,data0059.customer_part_desc,data0050.catalog_number,
data0050.Last_modified_date,data0050.Last_modified_by_ptr,
b.employee_name as audited_by_name_1,Data0273.checked_by_date as audited_by_date_1,
c.employee_name as audited_by_name_2,Data0273.audited_by_date as audited_by_date_2,  
d.employee_name as audited_by_name_3,Data0273.audited_by_date_2 as audited_by_date_3,    
e.employee_name as audited_by_name_4,Data0273.audited_by_date_3 as audited_by_date_4,  
f.employee_name as creator_name,  
DATA0050.RKEY AS RKEY50,data0005.employee_name,data0010.cust_code
from data0273 left outer join data0050 on
data0273.customer_part_ptr=data0050.rkey  left outer join data0050 a on
data0273.COPYFROMCUST_PTR=a.rkey left outer join data0059
on data0273.customer_part_ptr=data0059.cust_part_ptr left outer join data0010
on data0059.customer_ptr=data0010.rkey left outer join data0059 g
on data0273.COPYFROMCUST_PTR=g.cust_part_ptr  and g.customer_ptr=data0010.rkey
left outer join data0005 on data0273.VERIFIED_BY=data0005.rkey
left outer join data0005 b on data0273.ecr_checked_by_ptr=b.rkey
left outer join data0005 c on data0273.ecr_audited_by_ptr=c.rkey
left outer join data0005 d on data0273.ecr_audited_by_ptr_2=d.rkey
left outer join data0005 e on data0273.ecr_audited_by_ptr_3=e.rkey
left outer join data0005 f on data0273.ENTERED_BY=f.rkey
where  data0273.rkey=@vptr

go

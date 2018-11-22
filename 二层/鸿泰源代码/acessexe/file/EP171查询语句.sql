--EP171查询语句
--明细帐
select data0103.*,data0001.curr_code
from data0103 left outer join data0001
on data0103.curr_ptr=data0001.rkey
where data0103.has_child=0 
and isnull(acct_items_type,0)=0  AND isnull(d082_ptr,0)=0
order by gl_acc_number
 
---项目核算-客户
select data0103.rkey as gl_ptr,data0103.gl_acc_number,data0103.GL_DESCRIPTION,data0103.db_cr,
data0001.curr_code,case when data0083.rkey>0 then data0083.item_name+'-' else '' end as item_nam,
rtrim(data0010.cust_code)+'['+rtrim(data0010.customer_name)+']' as item_name,
data0083.rkey as d0083ptr,data0010.rkey as d083ptr,data0123.*
from data0103 left outer join data0001
on data0103.curr_ptr=data0001.rkey left join data0010
on data0010.rkey>0 and CUSTomer_type<> 4 left join data0083_2 as data0083
on data0103.d082_ptr=data0083.d082_ptr left join data0123
on data0123.gl_acct_ptr=data0103.rkey and data0123.customer_ptr=data0010.rkey
and isnull(data0123.d083_ptr,0)=isnull(data0083.rkey,0)
where data0103.has_child=0
and data0103.acct_items_type=1
order by data0103.gl_acc_number,data0083.item_name,data0010.cust_code

--项目核算-供应商
select data0103.rkey as gl_ptr,data0103.gl_acc_number,data0103.GL_DESCRIPTION,data0103.db_cr,
data0001.curr_code,case when data0083.rkey>0 then data0083.item_name+'-' else '' end as item_nam,
rtrim(data0023.code)+'['+rtrim(data0023.supplier_name)+']' as item_name,
data0083.rkey as d0083ptr,data0023.rkey as d083ptr,data0123.*
from data0103 left outer join data0001
on data0103.curr_ptr=data0001.rkey left join data0023
on data0023.rkey>0 left join data0083_2 as data0083
on data0103.d082_ptr=data0083.d082_ptr left join data0123
on data0123.gl_acct_ptr=data0103.rkey and data0123.supp_ptr=data0023.rkey 
and isnull(data0123.d083_ptr,0)=isnull(data0083.rkey,0)
where data0103.has_child=0
and data0103.acct_items_type=2
order by data0103.gl_acc_number,data0083.item_name,data0023.code

--项目核算-部门

select data0103.rkey as gl_ptr,data0103.gl_acc_number,data0103.GL_DESCRIPTION,data0103.db_cr,
data0001.curr_code,case when data0083.rkey>0 then data0083.item_name+'-' else '' end as item_nam,
rtrim(data0034.dept_code)+'['+rtrim(data0034.dept_name)+']' as item_name,
data0083.rkey as d0083ptr,data0034.rkey as d083ptr,data0123.*
from data0103 left outer join data0001
on data0103.curr_ptr=data0001.rkey left join data0034
on data0034.ttype=4 left join data0083_2 as data0083
on data0103.d082_ptr=data0083.d082_ptr left join data0123
on data0123.gl_acct_ptr=data0103.rkey and data0123.dept_ptr=data0034.rkey
and isnull(data0123.d083_ptr,0)=isnull(data0083.rkey,0)
where data0103.has_child=0
and data0103.acct_items_type=4
order by data0103.gl_acc_number,data0083.item_name,data0034.dept_code

--项目核算-员工
select data0103.rkey as gl_ptr,data0103.gl_acc_number,data0103.GL_DESCRIPTION,data0103.db_cr,
data0001.curr_code,case when data0083.rkey>0 then data0083.item_name+'-' else '' end as item_nam,
rtrim(data0034.dept_code)+'['+rtrim(data0005.employee_name)+']' as item_name,
data0083.rkey as d0083ptr,data0005.rkey as d083ptr,data0123.*
from data0103 left outer join data0001
on data0103.curr_ptr=data0001.rkey left join data0005
on data0005.rkey>0 left join data0034 on data0005.employee_id=data0034.rkey left join data0083_2 as data0083
on data0103.d082_ptr=data0083.d082_ptr left join data0123
on data0123.gl_acct_ptr=data0103.rkey and data0123.empl_ptr=data0005.rkey
and isnull(data0123.d083_ptr,0)=isnull(data0083.rkey,0)
where data0103.has_child=0
and data0103.acct_items_type=3
order by data0103.gl_acc_number,data0083.item_name,data0034.dept_code,data0005.employee_name
 
 

--项目核算-其它
select data0103.rkey as gl_ptr,data0103.gl_acc_number,data0103.GL_DESCRIPTION,data0103.db_cr,
data0001.curr_code,data0083.item_name,data0083.rkey as d083ptr,data0123.*
from data0103
 left outer join data0001 on data0103.curr_ptr=data0001.rkey 
 left join data0083_2 as data0083 on data0103.d082_ptr=data0083.d082_ptr 
 left join data0123 on data0123.gl_acct_ptr=data0103.rkey and data0123.d083_ptr=data0083.rkey
where data0103.has_child=0
and isnull(data0103.acct_items_type,0)=0 and data0103.d082_ptr>0
order by gl_acc_number,data0083.item_no

--试算平衡
select data0103.*
from data0103
where data0103.parent_ptr=0
order by gl_acc_number
 
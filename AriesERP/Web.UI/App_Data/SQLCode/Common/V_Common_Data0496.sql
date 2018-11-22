(--材料类别选择查询
select data0496.GROUP_NAME,data0496.GROUP_DESC,
case data0496.ttype when 'P' then '直接材料' when 'M' then '间接材料' end as type,
	data0496.group_ptr,data0019.inv_group_desc,data0496.rkey,data0496.rkey595,data0496.IF_FLAG,
	data0496.INSPECT,data0496.CATALOG_NUM,data0496.AVL_FLAG,data0496.SHELF_LIFE
from Data0496 inner join Data0019 on Data0496.group_ptr=Data0019.rkey
) a
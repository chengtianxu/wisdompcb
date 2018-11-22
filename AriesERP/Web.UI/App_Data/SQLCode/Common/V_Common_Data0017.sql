(--材料类别选择查询
select a.INV_PART_NUMBER,a.INV_NAME,INV_PART_DESCRIPTION,b.RKEY as rkey02, c.RKEY as rkey02_2,b.UNIT_CODE,b.UNIT_NAME,a.PURCH_UNIT_PTR,a.STOCK_UNIT_PTR,
c.UNIT_CODE as UNIT_CODE2, c.UNIT_NAME as UNIT_NAME2, a.STOCK_PURCH,isnull(a.SHELF_LIFE,0)SHELF_LIFE ,a.CATALOG_NUM,a.avl_flag,a.RKEY,a.manufacturer_name,a.STOP_PURCH 
from Data0017 a 
inner join Data0002 b on a.PURCH_UNIT_PTR=b.RKEY 
inner join Data0002 c  on a.STOCK_UNIT_PTR=c.RKEY
) a
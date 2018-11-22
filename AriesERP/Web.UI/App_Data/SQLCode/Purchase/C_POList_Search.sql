--订单列表查询条件
select * from(
SELECT '采购订单号' AS value,'采购订单号' AS text,'' AS parent,10 as sortno union
SELECT '材料编码' AS value,'材料编码' AS text,'' AS parent,20 as sortno union 
SELECT '材料名称' AS value,'材料名称' AS text,'' AS parent,30 as sortno union
SELECT '材料规格' AS value,'材料规格' AS text,'' AS parent,40 as sortno union
SELECT '供应商简称' AS value,'供应商简称' AS text,'' AS parent,50 as sortno union 
SELECT '类型' AS value,'订单类型' AS text,'' AS parent,60 as sortno union 
SELECT '状态' AS value,'状态' AS text,'' AS parent,60 as sortno union 
SELECT '请购部门' AS value,'请购部门' AS text,'' AS parent,70 as sortno
) a order by sortno
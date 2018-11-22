--材料入库明细22列表查询条件
select * from(
SELECT '采购单号' AS value,'采购单号' AS text,'' AS parent,10 as sortno union
SELECT '材料编码' AS value,'材料编码' AS text,'' AS parent,20 as sortno union 
SELECT '材料名称' AS value,'材料名称' AS text,'' AS parent,30 as sortno union
SELECT '材料类别' AS value,'材料类别' AS text,'' AS parent,40 as sortno union
SELECT '入库单号' AS value,'入库单号' AS text,'' AS parent,50 as sortno union 
SELECT '送货单号' AS value,'送货单号' AS text,'' AS parent,50 as sortno union 
SELECT '供应商' AS value,'供应商' AS text,'' AS parent,60 as sortno union 
SELECT '入仓类型' AS value,'入仓类型' AS text,'' AS parent,70 as sortno union 
SELECT '入库仓库' AS value,'入库仓库' AS text,'' AS parent,80 as sortno
) a order by sortno
--材料库存明细查询条件
select * from(
SELECT '材料编码' AS value,'材料编码' AS text,'' AS parent,10 as sortno union 
SELECT '材料名称' AS value,'材料名称' AS text,'' AS parent,20 as sortno union 
SELECT '材料规格' AS value,'材料规格' AS text,'' AS parent,30 as sortno union 
SELECT '材料类型' AS value,'材料类型' AS text,'' AS parent,40 as sortno union
SELECT '材料组别' AS value,'材料组别' AS text,'' AS parent,50 as sortno union 
SELECT '供应商代码' AS value,'供应商代码' AS text,'' AS parent,60 as sortno union 
SELECT '供应商简称' AS value,'供应商简称' AS text,'' AS parent,70 as sortno union 
SELECT '入库单号' AS value,'入库单号' AS text,'' AS parent,80 as sortno union
SELECT '采购单号' AS value,'采购单号' AS text,'' AS parent,90 as sortno union
SELECT '工厂' AS value,'工厂' AS text,'' AS parent,100 as sortno union
SELECT '仓库' AS value,'仓库' AS text,'' AS parent,110 as sortno
) a order by sortno
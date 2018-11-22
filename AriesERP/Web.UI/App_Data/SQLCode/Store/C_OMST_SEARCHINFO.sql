--杂项材料库存明细查询条件
select * from(
SELECT '材料名称' AS value,'材料名称' AS text,'' AS parent,20 as sortno union 
SELECT '材料规格' AS value,'材料规格' AS text,'' AS parent,30 as sortno union 
SELECT '材料类型' AS value,'材料类型' AS text,'' AS parent,40 as sortno union 
SELECT '供应商简称' AS value,'供应商简称' AS text,'' AS parent,70 as sortno union 
SELECT '采购单号' AS value,'采购单号' AS text,'' AS parent,90 as sortno union
SELECT '工厂简称' AS value,'工厂简称' AS text,'' AS parent,100 as sortno union
SELECT '仓库位置' AS value,'仓库位置' AS text,'' AS parent,110 as sortno
) a order by sortno
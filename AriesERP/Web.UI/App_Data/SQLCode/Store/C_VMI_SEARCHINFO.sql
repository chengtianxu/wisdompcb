--VMI入库列表查询条件
select * from(
SELECT '出库单号' AS value,'出库单号' AS text,'' AS parent,10 as sortno union
SELECT '材料编码' AS value,'材料编码' AS text,'' AS parent,20 as sortno union 
SELECT '材料类别' AS value,'材料类别' AS text,'' AS parent,30 as sortno union
SELECT '配料单号' AS value,'配料单号' AS text,'' AS parent,40 as sortno union
SELECT '领料部门名称' AS value,'领料部门名称' AS text,'' AS parent,50 as sortno union 
SELECT '材料组别' AS value,'材料组别' AS text,'' AS parent,60 as sortno union 
SELECT '领料工厂' AS value,'领料工厂' AS text,'' AS parent,70 as sortno union 
SELECT '领料单号' AS value,'领料单号' AS text,'' AS parent,80 as sortno union 
SELECT '发放仓库名称' AS value,'发放仓库名称' AS text,'' AS parent,90 as sortno union 
SELECT '入库单号' AS value,'入库单号' AS text,'' AS parent,100 as sortno union 
SELECT '入库类型' AS value,'入库类型' AS text,'' AS parent,110 as sortno union 
SELECT '工厂简称' AS value,'工厂简称' AS text,'' AS parent,120 as sortno union 
SELECT '请购部门' AS value,'请购部门' AS text,'' AS parent,130 as sortno 
) a order by sortno
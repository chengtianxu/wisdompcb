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
SELECT '供应商简称' AS value,'供应商简称' AS text,'' AS parent,90 as sortno union 
SELECT '领料人员' AS value,'领料人员' AS text,'' AS parent,100 as sortno union 
SELECT '发放仓库名称' AS value,'发放仓库名称' AS text,'' AS parent,110 as sortno union
SELECT '入仓单号' AS value,'入仓单号' AS text,'' AS parent,120 as sortno union
SELECT '入仓类型' AS value,'入仓类型' AS text,'' AS parent,130 as sortno union 
SELECT '库存工厂' AS value,'库存工厂' AS text,'' AS parent,140 as sortno union 
SELECT '部门类型' AS value,'部门类型' AS text,'' AS parent,150 as sortno union
SELECT '直接或间接' AS value,'直接或间接' AS text,'' AS parent,160 as sortno 
) a order by sortno
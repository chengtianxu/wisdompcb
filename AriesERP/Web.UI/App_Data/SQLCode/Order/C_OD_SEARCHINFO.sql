--订单列表查询条件
select * from(
SELECT '销售订单号' AS value,'销售订单号' AS text,'' AS parent,10 as sortno union
SELECT '工厂' AS value,'工厂' AS text,'' AS parent,20 as sortno union 
SELECT '本厂编号' AS value,'本厂编号' AS text,'' AS parent,30 as sortno union
SELECT '客户型号' AS value,'客户型号' AS text,'' AS parent,40 as sortno union
SELECT '客户代码' AS value,'客户代码' AS text,'' AS parent,50 as sortno union 
SELECT '客户简称' AS value,'客户简称' AS text,'' AS parent,60 as sortno
) a order by sortno
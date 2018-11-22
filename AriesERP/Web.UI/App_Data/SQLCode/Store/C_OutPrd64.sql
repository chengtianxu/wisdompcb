--出货64列表查询条件
select * from(
SELECT '销售订单' AS value,'销售订单' AS text,'' AS parent,10 as sortno union
SELECT '装箱单号' AS value,'装箱单号' AS text,'' AS parent,20 as sortno union 
SELECT '本厂编号' AS value,'本厂编号' AS text,'' AS parent,30 as sortno union
SELECT '客户订单号' AS value,'客户订单号' AS text,'' AS parent,40 as sortno union
SELECT '客户代码' AS value,'客户代码' AS text,'' AS parent,50 as sortno union 
SELECT '关联原客户' AS value,'关联原客户' AS text,'' AS parent,60 as sortno union 
SELECT '出货日期' AS value,'出货日期' AS text,'' AS parent,70 as sortno union 
SELECT '客户型号' AS value,'客户型号' AS text,'' AS parent,80 as sortno

) a order by sortno
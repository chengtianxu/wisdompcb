--退货明细查询条件
select * from(
SELECT '退货单号码' AS value,'退货单号码' AS text,'' AS parent,10 as sortno union
SELECT '客户代码' AS value,'客户代码' AS text,'' AS parent,20 as sortno union
SELECT '客户简称' AS value,'客户简称' AS text,'' AS parent,30 as sortno union
SELECT '客户型号' AS value,'客户型号' AS text,'' AS parent,40 as sortno union
SELECT '本厂编号' AS value,'本厂编号' AS text,'' AS parent,50 as sortno union
SELECT '订单编号' AS value,'订单编号' AS text,'' AS parent,60 as sortno union
SELECT '客户订单号' AS value,'客户订单号' AS text,'' AS parent,10 as sortno 
) a order by sortno
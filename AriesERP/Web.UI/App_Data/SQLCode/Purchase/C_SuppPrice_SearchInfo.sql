


--供应商价格--供应商查询信息
select * from(
SELECT '供应商简称' AS value,'供应商简称' AS text,'' AS parent,10 as sortno union 
SELECT '物料代码' AS value,'物料代码' AS text,'' AS parent,20 as sortno    
) a order by sortno



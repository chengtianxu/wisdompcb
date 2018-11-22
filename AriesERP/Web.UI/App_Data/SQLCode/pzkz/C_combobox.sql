select * from(
SELECT '报废单号' AS value,'报废单号' AS text,'' AS parent,10 as sortno union
SELECT '配料单号' AS value,'配料单号' AS text,'' AS parent,20 as sortno union
SELECT '作业单号' AS value,'作业单号' AS text,'' AS parent,30 as sortno

) a order by sortno
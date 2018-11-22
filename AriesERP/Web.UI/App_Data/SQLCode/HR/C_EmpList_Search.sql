--订单列表查询条件
select * from(
SELECT '工号' AS value,'工号' AS text,'' AS parent,10 as sortno union
SELECT '姓名' AS value,'姓名' AS text,'' AS parent,20 as sortno union 
SELECT '职务' AS value,'职务' AS text,'' AS parent,30 as sortno UNION
SELECT '籍贯' AS value,'籍贯' AS text,'' AS parent,40 as sortno union
SELECT '身份证号' AS value,'身份证号' AS text,'' AS parent,50 as sortno union
SELECT '部门' AS value,'部门' AS text,'' AS parent,60 as sortno union
SELECT '工资账套' AS value,'工资账套' AS text,'' AS parent,70 as sortno union 
SELECT '学历' AS value,'学历' AS text,'' AS parent,80 as sortno
) a order by sortno  

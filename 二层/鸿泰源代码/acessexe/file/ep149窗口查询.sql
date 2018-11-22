--ep149左边窗口查询

select * from data0346 --报价产品基本价格分类子表
order by row_index

--特殊工艺 (右）
select * from data0351
where d0346_ptr=5 --data0346.rkey
order by seq_no


exec sp_executesql N'select * from data0351 --报价基价和额外价格关联表
where d0346_ptr=@P1
order by seq_no
',N'@P1 int',5

select * from data0280 ORDER by Eng_table_name--工程表单

select rkey,adder_name ,selectit from data0348 --特殊工艺项目选择
where ttype=1
order by adder_name

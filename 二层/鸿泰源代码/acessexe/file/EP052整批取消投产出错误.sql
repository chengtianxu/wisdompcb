EP052整批取消投产出错误
1取消投产时显示成功，但删除配料单，没有删除LOT单，是因为DATA006里有一个外键DATA0006和492表,通过cut_NO,删除规范（级联,2005用层叠）
select data0006.rkey from daata0006 where cut_no not in(select cut_no from data0492 )

select distinct ent_datetime, data0006.rkey,data0492.cut_no,data0006.cut_no 
from data0006 
left join data0492 on data0492.cut_no =data0006.cut_no 
where data0492.cut_no is null

delete from data0006 where rkey in(
select data0006.rkey 
from data0006 
left join data0492 on data0492.cut_no =data0006.cut_no 
where data0492.cut_no is null)

2取消报错外键6关联492错
a.48表有流转记录
b.上面外键级联不对
C、再看其它外键关联
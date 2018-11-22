EP177报错expression 转换为数据类型int 时出现算术溢出错误

是由于100 * isnull(Data0060.ISSUED_QTY,0)超出INT范围
create PROCEDURE EP177;1 
case when (data0060.parts_ordered>0) then round(100 * isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,2) else 0 end as ratio1,
改为
case when (data0060.parts_ordered>0) then round(isnull(Data0060.ISSUED_QTY,0)/data0060.parts_ordered,4)*100 else 0 end as ratio1,
data0052表(成品出仓)  data0465成品出仓/特殊明细表
--查成品库存不对有哪些
select data0053.MFG_DATE,data0053.RKEY,data0053.QUANTITY,data0053.QTY_ON_HAND,
(select isnull(SUM(QUAN_SHP),0) from Data0052 where DATA0053_PTR=data0053.rkey)
+(select isnull(SUM(QUANTITY),0) from Data0465 where D0053_PTR=data0053.rkey) as outqty,
 QUANTITY-
 (select isnull(SUM(QUAN_SHP),0) from Data0052 where DATA0053_PTR=data0053.rkey)
 -(select isnull(SUM(QUANTITY),0) from Data0465 where D0053_PTR=data0053.rkey) as cyqty
 
 from Data0053 
where QUANTITY-
 (select isnull(SUM(QUAN_SHP),0) from Data0052 where DATA0053_PTR=data0053.rkey)
 -(select isnull(SUM(QUANTITY),0) from Data0465 where D0053_PTR=data0053.rkey)
<>data0053.QTY_ON_HAND

select * from data0052 where DATA0053_PTR= --Data0053.rkey

select * from data0465 where DATA0053_PTR= --Data0053.rkey
--成品库存明细
select * from (
select '客户代码' as value,'客户代码' as text,'' as parent,10 as sortno union
select '客户简称' as value,'客户简称' as text,'' as parent,15 as sortno union
select '本厂编号' as value,'本厂编号' as text,'' as parent,20 as sortno union
--select '作业单号' as value,'作业单号' as text,'' as parent,30 as sortno union
select '产品类别' as value,'产品类别' as text,'' as parent,50 as sortno union
select '工厂' as value,'工厂' as text,'' as parent,60 as sortno union
select '仓库' as value,'仓库' as text,'' as parent,70 as sortno union
--select '客户型号' as value,'客户型号' as text,'' as parent,80 as sortno union
--select '销售订单号' as value,'销售订单号' as text,'' as parent,90 as sortno union
--select '入仓单号' as value,'入仓单号' as text,'' as parent,100 as sortno union
--select '层数' as value,'层数' as text,'' as parent,110 as sortno union
--select '周期' as value,'周期' as text,'' as parent,120 as sortno union
--select '好板叉板' as value,'好板叉板' as text,'' as parent,130 as sortno union
select '产品阶数' as value,'产品阶数' as text,'' as parent,140 as sortno
) a order by sortno
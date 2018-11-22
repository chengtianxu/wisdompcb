--审核级别
select ranking=ISNULL(max(ranking),0) + 1 from Data0274 where (auth_date is not null) and D415_ptr=2029

--查看相应库存
Select Data0053.Rkey From Data0465 inner join  Data0053 on Data0465.d0053_ptr=Data0053.Rkey 
  Where Data0053.Qty_On_Hand-Data0465.Quantity<0 and Data0465.heard_ptr=2029
--修改审核信息 
  update data0274 set D415_audit_Remark =''
 ,auth_date = '2013-06-20'
where rkey = 9027
--修改库存
update data0053 
set qty_alloc = qty_alloc - data0465.QUANTITY, 
 QTY_ON_HAND = QTY_ON_HAND - data0465.QUANTITY
from data0465,data0053 
where data0465.d0053_ptr=data0053.rkey 
and data0465.heard_ptr = 2029
--修改主表状态
update data0415 set status = 3,auth_date=getdate(),ranking =2
,auth_empl_ptr=1
where rkey = 2029
--修改报废单主表状态
 update data0158 set status=2,audit_datetime=getdate(),audit_empl_ptr=1
 where mrb_no=(select top 1 mrb_no from data0058 where d415_rkey=2029)
 
 --盘亏产出报废单（不要审核），特殊出仓单（要审核）
 
 
 
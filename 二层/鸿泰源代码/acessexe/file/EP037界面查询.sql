EP037界面查询
exec sp_executesql N'declare @flag int
select @flag=ep037_flag from data0195
declare @user_ptr int
Set @user_ptr =0
if @flag=1
Select @user_ptr =isnull(data0009.RKEY,0) from data0009 where isnull(class,0)=0 and employee_ptr in (select employee_ptr from data0073 where rkey=@P1)

select data0098.rma_number,data0098.note_pad_ptr,data0098.rma_date,data0098.QTY_AUTH,data0098.qty_ship,data0098.so_ptr,data0098.co_Price,data0098.audited_by_ptr,data0098.EFFECT_TP,data0098.Re_purchase_order_ptr,round(data0098.co_Price*data0098.QTY_AUTH,2) as amount,
 data0098.RMA_STATUS,data0098.rkey,data0098.customer_ptr,data0098.customer_part_ptr,isnull(data0098.REQUEST_D0050_RKEY,data0098.customer_part_ptr) as REQUEST_D0050_RKEY,Data0098.Qty_shipd,data0098.ReDate,
 data0060.sales_order,data0098.shipment_ptr,data0098.qty_recd,data0098.audited_date,Data0098.qty_planned,d05a.employee_name as audit_name,data0098.required_amount,data0098.actual_Retn_Qty,convert(varchar(500),data0011.memo_text) as memo_text,
 data0010.cust_code, data0050.customer_part_number,data0050.cp_rev ,data0098.curr_ptr,data0098.ref_number,data0005.employee_name,data0098.sys_date,isnull(data0098.whse_ptr,0) as whse_ptr,
isnull(data0098.srce_ptr,0) as srce_ptr,data0098.lost_amount,LASTMOD_DATE,d60.SALES_ORDER as RMA_SALES_ORDER,data0097.PO_NUMBER,d60.PARTS_SHIPPED as RMA_PARTS_SHIPPED,isnull(d60.STATUS,0) as RMAORDER_STATUS    
from data0098 
left outer join data0060 on data0098.SO_PTR=data0060.rkey 
  left join data0060 d60 on data0098.rkey=d60.RMA_PTR  --退货订单  
  left join data0005 d05a on data0098.audited_by_ptr=d05a.rkey
  inner join data0010  on data0098.customer_ptr=data0010.rkey
  inner join data0050 on data0098.customer_part_ptr=data0050.rkey
  left join data0005 on data0098.auth_by_empl_ptr=data0005.rkey
  left join data0097 on data0098.Re_purchase_order_ptr=data0097.rkey
  left join data0011 on data0098.rkey=data0011.FILE_POINTER and data0011.SOURCE_TYPE=98 
where (data0098.rma_date>=@P2) and (data0098.rma_date<=@P3)
and (isnull(@user_ptr,0)=0 or data0010.rkey in (select customer_ptr from data0012
 where srep_ptr_1 =@user_ptr or srep_ptr_2 =@user_ptr or srep_ptr_3 =@user_ptr or srep_ptr_4 =@user_ptr or srep_ptr_5 =@user_ptr ))

order by rma_number
',N'@P1 int,@P2 datetime,@P3 datetime',1,'2013-11-26 00:00:00','2014-01-26 00:00:00'
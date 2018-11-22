ep017成品退回到原料仓
要416.TYPE=4要退货入仓,不要发回重检


CREATE PROCEDURE EP017;48
@begintime datetime,
@endtime datetime,
@customer_part_number varchar(60)
with encryption
AS
begin
	select 
	data0053.rkey,data0416.number,data0053.mfg_date,data0053.qty_on_hand,
	data0050.customer_part_number,data0050.cp_rev,
	data0098.rma_number
	from data0053(nolock) 
	inner join data0416(nolock) on data0053.NPAD_PTR=data0416.rkey
	inner join data0050(nolock) on data0053.cust_part_ptr=data0050.rkey
	left join data0098(nolock) on data0098.rkey=data0416.rma_ptr
	where   
	isnull(data0053.qty_on_hand,0)>0
	and data0416.type=4
    and data0053.mfg_date>=@begintime and data0053.mfg_date<=@endtime+'23:59:59'
    and data0050.customer_part_number like @customer_part_number
	order by data0050.customer_part_number,data0050.cp_rev
end
GO

外发退货流程 :客户退货    退货审核 EP177成品退回原料, EP042退货给供应商
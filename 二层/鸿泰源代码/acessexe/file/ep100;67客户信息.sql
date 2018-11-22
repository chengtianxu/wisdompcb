--ep100;67客户信息
exec ep100;67 13351 --50表的RKEY
create PROCEDURE EP100;67
@vptr int 
with encryption
AS
begin
select data0010.cust_code,data0010.customer_name,data0059.cust_inv_name, Data0059.fin_CUSTOMER_PART_DESC, Data0059.fin_CUSTOMER_matl_DESC,data0059.FIN_customer_name,data0059.fin_cust_inv_name,
data0010.general_req as memo_text,data0059.onhold_sales_flag,data0059.rkey,data0059.customer_part_desc,data0059.customer_matl_desc
from data0010,data0059 
where data0059.cust_part_ptr=@vptr
and data0059.customer_ptr=data0010.rkey
end
go
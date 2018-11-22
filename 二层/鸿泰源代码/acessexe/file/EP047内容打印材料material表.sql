--CREATE PROCEDURE EP047;10
--select * from Data0253 where QUOTE_PTR= --data0085.rkey
--select * from Data0085 where tnumber like 'QT0000010'

declare
@vptr int=43
--with encryption
--AS
begin
select data0253.price,data0253.qty,data0253.sys_qty,QTE_USHEET,data0253.price*data0253.qty*data0253.sys_qty*QTE_USHEET as cj, data0028.tax_flag,'aaa',data0253.*,data0348.adder_name,
data0001.curr_code,data0253.price*data0253.qty*data0253.sys_qty as unit_amount,data0028.tax_2 as tax_rate,
data0253.price*data0253.qty*data0253.sys_qty*QTE_USHEET as sq_amount,
case when data0028.tax_flag='Y' then data0253.price*data0253.qty*data0253.sys_qty*QTE_USHEET/(1+data0028.tax_2/100) else
data0253.price*data0253.qty*data0253.sys_qty*QTE_USHEET end as sq_amount_no_tax
from data0085(nolock),data0253(nolock) left join data0017(nolock) on data0253.std_invent_ptr=data0017.rkey
left join data0348(nolock) on data0253.d0348_ptr=data0348.rkey
left join data0028(nolock) on data0028.rkey=data0253.d0028_ptr
left join data0023(nolock) on data0028.supplier_ptr=data0023.rkey
left join data0001(nolock) on data0028.currency_ptr=data0001.rkey
where data0253.quote_ptr=@vptr
and data0253.quote_ptr=data0085.rkey
order by data0253.rkey
end
GO
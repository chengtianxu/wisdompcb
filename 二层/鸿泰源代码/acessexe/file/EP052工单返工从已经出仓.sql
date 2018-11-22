EP052工单返工从产品出仓已经出仓Y
exec sp_executesql N'declare @vwhse_ptr int
set @vwhse_ptr=@P1
Select data0415.rkey,Data0415.custpart_ptr,Data0415.qty_rewked as qty_reworked,DATA0415.SYS_DATE,
data0050.customer_part_number,data0050.cp_rev,data0415.quantity,data0414.qty_to_be_stocked,data0414.qty_to_be_reworked,
data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,data0414.rkey as d14rkey,
data0415.type,data0415.status,data0415.customer_ptr,data0414.reference
 From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
where data0415.status=3
and data0415.type in (3,4) --3退貨重檢MRB出倉(EP300)   4正常重檢MRB出倉(EP300)
and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
order by data0415.sys_date


 
',N'@P1 varchar(16)','0'

update data0415 set quantity=2340 ,qty_rewked=1000 where rkey=4106
--EP031装箱单管理查询
exec sp_executesql N'SELECT	data0439.*,2,data0010.cust_code,data0010.parentcust_ptr,data0010.abbr_name,data0010.customer_name,data0001.curr_code ,data0012.location,data0012.SHIP_TO_CONTACT,data0005.employee_name,data0012.SHIP_TO_FAX,data0012.do_rptfmt_ptr,(select sum(quan_stocked) from data0064 where packing_list_ptr=data0439.rkey) as quan_stocked,Data0012.SHIP_TO_ADDRESS_1 ,(select sum(quan_diff) from data0064 where packing_list_ptr=data0439.rkey) as quan_diff  
from data0439 inner 
join data0010 on data0439.customer_ptr=data0010.rkey 
 inner join data0012 on data0439.ship_addr_ptr=data0012.rkey 
  inner join data0005 on data0439.employee_ptr=data0005.rkey 
   left join data0001 on data0439.currency_ptr=data0001.rkey  
where (data0439.date_sailing >=@P1) and (data0439.date_sailing <@P2) 
 and IsNull(invoice_ptr,0)=0 and tstatus=0 
 order by delivery_no
',N'@P1 varchar(10),@P2 varchar(10)','2013-07-25','2013-08-03'
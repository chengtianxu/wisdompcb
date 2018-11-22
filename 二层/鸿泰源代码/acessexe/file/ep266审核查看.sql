--审核查看
SELECT	 data0439.* , data0010.cust_code,data0010.customer_name,data0010.ABBR_NAME,
    data0012.location,data0012.SHIP_TO_CONTACT,a.employee_name as audit,data0001.CURR_NAME,data0010.FED_TAX_ID_NO,
     (select sum(quan_stocked) from data0064 where packing_list_ptr=data0439.rkey) as quan_stocked,
    data0005.employee_name,data0012.SHIP_TO_FAX,Data0274.rkey as rkey274,b.min_ranking ,c.max_ranking   
from data0439 
    inner join data0010 on data0439.customer_ptr=data0010.rkey
    left join data0001 on data0001.rkey=data0010.CURRENCY_PTR
    inner join data0012 on data0439.ship_addr_ptr=data0012.rkey 
    inner join data0005 on data0439.employee_ptr=data0005.rkey  
    left join data0005 a  on data0439.Audit_ptr=a.rkey
    left join Data0274 on Data0274.D439_ptr=data0439.rkey  and  Data0274.user_ptr=112 --用户指针73.rkey
    left join data0073 on data0073.rkey=data0274.user_ptr  
    left join (select d439_ptr,min(ranking) as min_ranking from data0274 group by d439_ptr ) b  on data0439.rkey=b.d439_ptr 
     left join (select d439_ptr,max(ranking) as max_ranking from data0274 group by d439_ptr ) c  on data0439.rkey=c.d439_ptr 
where (data0439.date_sailing >= '2013-08-25 16:31:29:000') and (data0439.date_sailing <'2013-10-25 16:31:29:000')  --日期范围
    and data0439.use_stauts <> 5 
    and  (invoice_ptr is null)
    and  ((data0439.use_stauts = 2  and Data0274.ranking=data0439.ranking) or (data0439.use_stauts =4 and data0439.ranking = (select ranking from Data0274 
where D439_ptr=Data0439.rkey and user_ptr=112))) --用户指针73.rkey
 and 1=1 
    and 1=1
   order by data0439.delivery_no 

/*
 * -查看一个审核人在同级不能有两条记录
 * 子查询返回的值不止一个。当子查询跟随在 =、!=、<、<=、>、>= 之后，或子查询用作表达式时，这种情况是不允许的。.

 * 
 */
--
select d439_ptr,count(*)from data0274 
where Data0274.user_ptr=112 group by d439_ptr 
having count(*)>1
order by d439_ptr

select * from data0274 where d439_ptr in(6,32,43) and Data0274.user_ptr=112

delete from data0274 where rkey=84




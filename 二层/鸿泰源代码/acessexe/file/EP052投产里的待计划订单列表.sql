--EP052投产里的待计划订单列表
exec sp_executesql N'SELECT data0060.*,data0050.customer_part_number,data0050.cp_rev
 FROM DATA0060 ,data0050
WHERE data0060.cust_part_ptr in
(30722)--data0050.rkey
and (data0060.to_be_planned>0 or data0060.reput_qty >0)
and (data0060.status=1 or (data0060.status=4 and data0060.so_style=3)) and sch_date is not null
and data0060.cust_part_ptr=data0050.rkey   and so_tp<>1
and data0050.onhold_planning_flag=0
and quote_price<>0
and quote_price<>2
and prod_rel<>@P1

order by data0060.sch_date

 
 
 
',N'@P1 varchar(16)','1'
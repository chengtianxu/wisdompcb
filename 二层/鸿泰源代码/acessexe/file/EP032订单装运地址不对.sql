
EP032订单装运地址不对  
会导致查不到这个订单  ？？？？
一个客户只有一装运地址
--select data0060.CUST_SHIP_ADDR_PTR,data0012.rkey,data0060.* 
update data0060 set CUST_SHIP_ADDR_PTR=data0012.rkey
from data0060
join data0012 on  data0060.customer_ptr=data0012.customer_ptr
where data0060.rkey in
(
select data0060.rkey---data0012.rkey,data0060.CUST_SHIP_ADDR_PTR , data0060.customer_ptr, data0012.customer_ptr 
from data0060 ,data0012 
where data0012.rkey=data0060.CUST_SHIP_ADDR_PTR and data0060.customer_ptr<> data0012.customer_ptr)
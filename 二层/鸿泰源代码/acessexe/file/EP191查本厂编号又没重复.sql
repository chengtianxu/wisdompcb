select data0010.RKEY dk10,data0050.RKEY dk50,data0059.rkey  dk59 from data0050
left join data0059 on cust_part_ptr=data0050.rkey
left join Data0010 on data0059.customer_ptr=data0010.RKEY
where data0059.ONHOLD_SALES_FLAG=0
order by CUSTOMER_PART_NUMBER

select dk10,dk50,dk59,COUNT(*) rownumber
 from 
(select data0010.RKEY dk10,data0050.RKEY dk50,data0059.rkey  dk59 from data0050
left join data0059 on cust_part_ptr=data0050.rkey
left join Data0010 on data0059.customer_ptr=data0010.RKEY
where data0059.ONHOLD_SALES_FLAG=0
) tb
group by dk10,dk50,dk59
having COUNT(*)>1
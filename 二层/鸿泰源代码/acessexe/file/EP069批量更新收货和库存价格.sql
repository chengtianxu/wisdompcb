select * from data0022  
select * from data0071 where discount=0 data0071.conversion_factor<>1



select data0022.price as d0022price,
data0071.price as d071price,
data0071.tax_price/(1+data0071.tax_2/100) as '动态计算',
data0022.tax_price as d0022taxprice,
data0071.tax_price as d0071taxprice,
data0022.* from data0022 
inner join data0071 on data0022.source_ptr=data0071.rkey
where data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor
*(1-data0071.DISCOUNT/100)
<>data0022.price

select data0909.price as d909price,
data0071.price as d071price,
data0071.tax_price/(1+data0071.tax_2/100) as '动态计算',
data0909.tax_price as d909taxprice,
data0071.tax_price as d0071taxprice,
data0909.* from data0909 
inner join data0071 on data0909.source_ptr=data0071.rkey
where data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor
*(1-data0071.DISCOUNT/100)
<>data0909.price





select data0022.price as d0022price,
data0071.price as d071price,
data0071.tax_price/(1+data0071.tax_2/100) as '动态计算',
data0022.tax_price as d0022taxprice,
data0071.tax_price as d0071taxprice,
data0022.* from data0022 
inner join data0071 on data0022.source_ptr=data0071.rkey
where data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor<>data0022.price

update data0071 set price=data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor
where price<>data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor

update data0022 set tax_price=a.tax_price
from data0022,
(select * from data0071) a
where data0022.source_ptr=a.rkey

update data0022 set price=a.price
from data0022,
(select * from data0071) a
where data0022.source_ptr=a.rkey



select data0909.price as d909price,
data0071.price as d071price,
data0071.tax_price/(1+data0071.tax_2/100) as '动态计算',
data0909.tax_price as d909taxprice,
data0071.tax_price as d0071taxprice,
data0909.* from data0909 
inner join data0071 on data0909.source_ptr=data0071.rkey
where data0071.tax_price/(1+data0071.tax_2/100)/data0071.conversion_factor<>data0909.price

update data0909 set tax_price=a.tax_price
from data0909,
(select * from data0071) a
where data0909.source_ptr=a.rkey

update data0909 set price=a.price
from data0909,
(select * from data0071) a
where data0909.source_ptr=a.rkey



--有po收货
update data0022 set tax_price=a.tax_price/a.conversion_factor
*(1-a.DISCOUNT/100)
from data0022,
(select * from data0071) a
where data0022.source_ptr=a.rkey
and data0022.source_ptr is not null

--无po收货
update data0022 set tax_price=price*(1+tax_2/100)
where data0022.source_ptr is null


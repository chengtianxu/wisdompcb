--更新含税价格
update data0022 set tax_price=a.jsprice
from data0022,
(select data0022.rkey,data0070.po_number,data0071.price,
data0071.tax_price,data0071.tax_2,data0022.price as data0022price, 
(data0071.tax_price*(1-data0071.discount/100))/data0071.conversion_factor as jsprice
from data0022 
inner join data0071 on data0022.source_ptr=data0071.rkey
inner join data0070 on data0070.rkey=data0071.po_ptr
where 
data0022.source_ptr is not null
and (data0071.tax_price*(1-data0071.discount/100))/data0071.conversion_factor<>data0022.tax_price) a
where data0022.rkey=a.rkey


update data0022 set tax_price=price*(1+tax_2/100) where tax_price is null and source_ptr is NULL

要相应更新EP016入仓,EP122按采购订（EP125非标准材料收货） 单接收,EP648仓库业务数据维护和EP176原料盘点,ep290外出收货

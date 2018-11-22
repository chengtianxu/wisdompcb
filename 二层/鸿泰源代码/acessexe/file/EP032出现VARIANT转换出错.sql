EP032出现VARIANT转换出错

COULD NOT CONVERT VARIANT OF TYPE (NULL) INTO TYPE (DOUBLE)
是要查找一下
分配和拥金

如
今天
客户改了

 蒋开阳-生溢快捷 16:26:18 
update Data0012 set Data0012.SREP_PTR_5='84'   where Data0012.CUSTOMER_PTR in 
(select a.CUSTOMER_PTR from data0012 a  left join Data0010  b 
on a.CUSTOMER_PTR=b.RKEY  WHERE    b.CUST_CODE LIKE 'sz0%' and  a.SREP_PTR_4<>'84')
出现上面的错

后来通过修改

UPDATE data0012 SET SREP_PTR_4=0,SREP_4_COMM=0, SREP_PTR_5=0,SREP_5_COMM=0 
from data0012 JOIN data0012.cust_ptr=data0010.rkey WHERE CUST_CODE LIKE 'sz0%'  
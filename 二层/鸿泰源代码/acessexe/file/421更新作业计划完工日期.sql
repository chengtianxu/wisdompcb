select *from data0056 
inner join data0006 on data0056.WO_PTR=data0006.RKEY
where unit_ptr=0 --注意这里unit_ptr=0，=1的要改为0
and WORK_ORDER_NUMBER LIKE '160413008-0-2-%'
------------------------------------------------------------

UPdate data0006 set SCH_COMPL_DATE='2016-04-27'
 from data0056
INNER JOIN Data0006 ON DATA0056.WO_PTR=DATA0006.RKEY
where unit_ptr=0 
and WORK_ORDER_NUMBER LIKE '160413008-0-2-%'

/*--UPdate data0056 set UNIT_PTR=0
from data0056
where unit_ptr=1*/


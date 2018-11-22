select CUSTOMER_PART_NUMBER,CP_REV,DATA0025.BOM_STEP_ptr, 
 DATA0025.MANU_PART_NUMBER,*from data0056 
inner join data0006 on data0056.WO_PTR=Data0006.RKEY
inner join Data0025 ON DATA0006.BOM_PTR=data0025.RKEY
inner join data0050 on data0025.ANCESTOR_PTR=data0050.RKEY
WHERE UNIT_PTR=1

/*
UPdate data0056 set unit_ptr=0 from data0056
inner join data0006 on data0056.WO_PTR=data0006.RKEY
where unit_ptr=1
*/
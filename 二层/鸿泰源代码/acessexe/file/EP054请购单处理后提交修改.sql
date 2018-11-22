

update data0276 set auth_date=null where purchase_ptr =5083 and auth_type=1 
update data0068 set auth_date=getdate(),data275_ptr=1,status=1,APPD_BY=316 where rkey=5083
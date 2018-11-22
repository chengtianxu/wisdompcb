select delivery_no ,TOTAL_ADD_L_PRICE,SHIPMENT_NO,b.rkey from data0439 a
right join data0064 b on a.rkey=b.packing_list_ptr
right join data0060 c on b.so_ptr=c.rkey 
where c.SALES_ORDER ='140301187-01'
update data0064 set SHIPMENT_NO=1 where rkey=24960
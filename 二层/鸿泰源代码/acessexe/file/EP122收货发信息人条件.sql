--EP122收货发信息人条件
select data0073.RKEY from data0073 
inner join data0005 on data0073.employee_ptr=data0005.rkey where data0005.buyer_flag=''y'''

RCY13060013-02

Update data0060 set last_push_date=getdate()
,so_tp='1'
,modf_date='2013-06-14 10:40:36'
 where rkey=6668
 
 insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number,reason,updateSoAccess_path)
values (6668,4,'更改销售订单加工形式',
'0','1',1,
'2013-06-14 10:40:36',305,'','
','')

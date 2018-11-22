
手工结案
exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "ACTIVE_S_ORDERS"=@P1,"UNPLANNED_REL_S"=@P2 
WHERE "ACTIVE_S_ORDERS"=@P3 AND "UNPLANNED_REL_S"=@P4 AND "RKEY"=@P5',
N'@P1 smallint,@P2 smallint,@P3 smallint,@P4 smallint,@P5 int',
-2,6,-1,7,4877
exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "MODF_DATE"=@P1,"STATUS"=@P2,"last_push_date"=@P3 
WHERE "RKEY"=@P4 AND "MODF_DATE" IS NULL AND "STATUS"=@P5 AND "last_push_date"=@P6',
N'@P1 datetime,@P2 tinyint,@P3 datetime,@P4 int,@P5 tinyint,@P6 datetime',
'2013-09-25 09:36:37',3,'2013-09-25 09:36:37',8736,1,'2013-09-05 16:51:47'

insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,reason)
values (8736,11,'手工将销售订单结案',
'有效','已关闭',1,
'2013-09-25 09:36:37',32,'rr')




--启用手工结案
exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "ACTIVE_S_ORDERS"=@P1,"UNPLANNED_REL_S"=@P2 
WHERE "ACTIVE_S_ORDERS"=@P3 AND "UNPLANNED_REL_S"=@P4 AND "RKEY"=@P5',
N'@P1 smallint,@P2 smallint,@P3 smallint,@P4 smallint,@P5 int',
0,2,-1,1,1315


exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "MODF_DATE"=@P1,"STATUS"=@P2,"last_push_date"=@P3
 WHERE "RKEY"=@P4 AND "MODF_DATE"=@P5 AND "STATUS"=@P6 AND "last_push_date"=@P7',
 N'@P1 datetime,@P2 tinyint,@P3 datetime,@P4 int,@P5 datetime,@P6 tinyint,@P7 datetime',
 '2013-09-25 09:31:17',1,'2013-09-25 09:31:17',8540,'2013-09-25 09:29:00',3,'2013-09-25 09:29:20'

insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,reason)
values (8540,11,'手工将销售订单从结案中重新起动',
'已关闭','有效',1,
'2013-09-25 09:31:17',32,'test1')


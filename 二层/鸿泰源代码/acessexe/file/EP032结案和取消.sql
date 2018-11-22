EP032手工结案

exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "MODF_DATE"=@P1,"STATUS"=@P2,"last_push_date"=@P3 
--修改时间    状态改为3关闭         控制下发状态
WHERE "RKEY"=@P4 AND "MODF_DATE" IS NULL AND "STATUS"=@P5 AND "last_push_date"=@P6',
N'@P1 datetime,@P2 tinyint,@P3 datetime,@P4 int,@P5 tinyint,@P6 datetime',
'2013-12-16 13:43:36',3,'2013-12-16 13:43:36',9552,6,'2013-12-16 13:40:20.467'

exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "ACTIVE_S_ORDERS"=@P1,"UNPLANNED_REL_S"=@P2 
 WHERE "ACTIVE_S_ORDERS"=@P3 AND "UNPLANNED_REL_S"=@P4 AND "RKEY"=@P5',
 N'@P1 smallint,@P2 smallint,@P3 smallint,@P4 smallint,@P5 int',
 0,0,1,1,200
 
 insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,reason)
values (9552,11,'手工将销售订单结案',
'未提交','已关闭',1,
'2013-12-16 13:43:36',32,'test1')

--------------------------------
EP032订单启用
exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "ACTIVE_S_ORDERS"=@P1,"UNPLANNED_REL_S"=@P2 
WHERE "ACTIVE_S_ORDERS"=@P3 AND "UNPLANNED_REL_S"=@P4 AND "RKEY"=@P5',
N'@P1 smallint,@P2 smallint,@P3 smallint,@P4 smallint,@P5 int',
1,1,0,0,200

exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "MODF_DATE"=@P1,"STATUS"=@P2,"last_push_date"=@P3 
WHERE "RKEY"=@P4 AND "MODF_DATE"=@P5 AND "STATUS"=@P6 AND "last_push_date"=@P7',
N'@P1 datetime,@P2 tinyint,@P3 datetime,@P4 int,@P5 datetime,@P6 tinyint,@P7 datetime',
'2013-12-16 13:51:37',6,'2013-12-16 13:51:37',9552,'2013-12-16 13:44:00',3,'2013-12-16 13:43:36'

insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,reason)
values (9552,11,'手工将销售订单从结案中重新起动',
'已关闭','未提交',1,
'2013-12-16 13:51:37',32,'test2')


------------------------------------


--EP305取消
--
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011"
 ("FILE_POINTER","SOURCE_TYPE","memo_text")
  VALUES (@P1,@P2,@P3); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 text',9552,60,'gd'
  
  exec sp_executesql N'UPDATE "SJ_V20_live".."data0060"
  SET "modf_date"=@P1,"last_push_date"=@P2,"status"=@P3,"old_cancel_status"=@P4 
WHERE "rkey"=@P5 AND "modf_date"=@P6 AND "last_push_date"=@P7 AND "status"=@P8 AND "old_cancel_status" IS NULL',
N'@P1 datetime,@P2 datetime,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 datetime,@P8 tinyint','2013-12-16 13:55:46','2013-12-16 13:55:46',5,6,9552,'2013-12-16 13:52:00','2013-12-16 13:51:37',6
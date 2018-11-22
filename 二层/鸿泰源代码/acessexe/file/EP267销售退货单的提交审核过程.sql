
--条件过滤
exec sp_executesql N'SELECT USER_PTR,seq_no FROM data0077
WHERE  ttype=2 and (UPPER_LIMIT >=@P1) AND (LOWER_LIMIT <= @P2) and (whouse_ptr = 0 or whouse_ptr =@P3) 
ORDER BY SEQ_NO
',N'@P1 money,@P2 money,@P3 int',$450.0000,$450.0000,2

--把审核人写入审核信息表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("user_ptr","ranking","rma_ptr") VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'
@P1 int,@P2 tinyint,@P3 int',
896,0,246

--修改退货表的状态
exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" 
SET "RMA_STATUS"=@P1 
WHERE "RMA_STATUS"=@P2 AND "rkey"=@P3',
N'@P1 smallint,@P2 smallint,@P3 int',
1,0,246


update data0274 set RMA_Remark ='
'
where rkey = 12251

exec sp_executesql N'UPDATE "SJ_V20_live".."data0060"
SET "parts_returned"=@P1 
WHERE "rkey"=@P2 AND "parts_returned"=@P3',N'@P1 float,@P2 int,@P3 float',103,8643,0

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0274" 
SET "auth_date"=@P1 
WHERE "auth_date" IS NULL AND "rkey"=@P2',N'@P1 datetime,@P2 int','2013-09-16 00:00:00',12251

exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" 
SET "RMA_STATUS"=@P1,"audited_by_ptr"=@P2,"audited_date"=@P3 
WHERE "RMA_STATUS"=@P4 AND "rkey"=@P5 AND "audited_by_ptr" IS NULL AND "audited_date" IS NULL',
N'@P1 smallint,@P2 int,@P3 datetime,@P4 smallint,@P5 int',2,1,'2013-09-16 00:00:00',1,350





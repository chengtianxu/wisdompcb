--EP032修改订单数量及交期
--只是把它分交货，不能修改总数
exec sp_executesql N'UPDATE "SJ_V20_live".."data0360"
SET "quantity"=@P1 
WHERE "rkey"=@P2 AND "quantity"=@P3',
N'@P1 int,@P2 int,@P3 int',
200,6459,234

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0360" 
("so_ptr","quantity","Item_no") VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int',
6671,34,4
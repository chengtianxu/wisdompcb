--EP032记事本
exec sp_executesql N'UPDATE "SJ_V20_live".."data0011" SET "memo_text"=@P1 WHERE "RKEY"=@P2',N'@P1 text,@P2 int','新开精冲模具222',126805

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" 
("FILE_POINTER","SOURCE_TYPE","memo_text") 
VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 text',
6677,60,'adfadsfasdfasd新开普通模具周期：订单数量公差：+/-    PCS'
--"FILE_POINTER"用60表RKEY,第二个字段60
SELECT * FROM data0060 WHERE rkey=6677
--EP052取消待投数量
exec sp_executesql N'UPDATE "SJ_V20_live".."data0360" 
SET "so_ptr"=@P1,"last_modi_by_ptr"=@P2,"modi_tdate"=@P3,"cancel_qty"=@P4 
                     WHERE "rkey"=@P5 AND "so_ptr"=@P6 AND "last_modi_by_ptr" IS NULL AND "modi_tdate" IS NULL AND "cancel_qty" IS NULL',
                     N'@P1 int,@P2 int,@P3 datetime,@P4 int,@P5 int,@P6 int',
                     11386,1,'2014-03-18 13:43:26',3,11173,11386
go
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_live".."Data0318" 
("SALES_ORDER_PTR","TRANS_TYPE","TRANS_DESCRIPTION","FROM_STRING","TO_STRING","USER_PTR","TRANS_DATE","PROGRAM_SOURCE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 smallint,@P3 varchar(26),@P4 varchar(3),@P5 varchar(3),@P6 int,@P7 datetime,@P8 smallint',
11386,15,'取消待投数量！取消原因TEST','308','305',1,'2014-03-18 13:43:55',52
go
exec sp_executesql N'UPDATE "SJ_V20_live"."dbo"."Data0060" 
SET "TO_BE_PLANNED"=@P1,"qty_cancel_plan"=@P2 
 WHERE "RKEY"=@P3 AND "TO_BE_PLANNED"=@P4 AND "qty_cancel_plan"=@P5',N'
 @P1 int,@P2 int,@P3 int,@P4 int,@P5 int',
 305,3,11386,308,0
GO


--恢复待投数量
SELECT * FROM data0060 WHERE rkey=11386

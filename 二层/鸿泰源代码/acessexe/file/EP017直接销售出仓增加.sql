EP017直接销售出仓
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0095" 
("TRAN_TP","INVT_PTR","SRCE_PTR","TRAN_BY","TRAN_DATE","QUANTITY") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 float',
13,388,11206,1,'2013-09-29 11:26:22',13


exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0060" 
SET "parts_shipped"=@P1
 WHERE "RKEY"=@P2 AND "parts_shipped"=@P3',
 N'@P1 float,@P2 int,@P3 float',13,16698,0
go
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_Sample".."data0207"
 ("TTYPE","INVENTORY_PTR","GON_PTR","TRANSACTION_PTR","D0022_PTR","TDATE","QUANTITY","STANDARD_COST","SO_PTR")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 numeric(19,4),@P8 float,@P9 int',
  2,388,11961,62743,11206,'2013-09-29 11:26:22',13.0000,0,16698
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0022" 
SET "QUAN_ON_HAND"=@P1 WHERE "RKEY"=@P2 AND "QUAN_ON_HAND"=@P3',
N'@P1 numeric(19,4),@P2 int,@P3 numeric(19,4)',
19.0000,11206,32.0000
go

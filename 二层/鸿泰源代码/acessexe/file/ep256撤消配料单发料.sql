--取编号
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_MEAN"=@P3 AND "BIG5_SEED_MEAN"=@P4 AND "SEED_VALUE"=@P5 AND "SEED_FLAG"=@P6 AND "table_name"=@P7 AND "rkey_ref"=@P8 AND "rkey"=@P9 AND "BillType" IS NULL',N'@P1 varchar(9),@P2 smallint,@P3 varchar(13),@P4 varchar(13),@P5 varchar(9),@P6 tinyint,@P7 varchar(8),@P8 int,@P9 int','X10016232',10,'出仓/退仓单号','出倉/退倉單號','X10016232',4,'DATA0457',56,56
--增加配料单领料主表（退回也要增加一项）
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0457"
 ("GON_NUMBER","TTYPE","CREATE_DATE","CREATE_BY","STATUS") 
 VALUES (@P1,@P2,@P3,@P4,@P5); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(9),@P2 smallint,@P3 datetime,@P4 int,@P5 tinyint',
 'X10016232',4,'2013-07-03 14:24:03',1,0
 
 --增加材料处理综合记录表)【接收，收货，退货，装运?
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0095"
  ("TRAN_TP","INVT_PTR","SRCE_PTR","TRAN_BY","TRAN_DATE","QUANTITY","REFERENCE_NUMBER") 
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 float,@P7 varchar(20)',
  15,344,11711,1,'2013-07-03 14:24:03',-22,'130423001-0' 
 
 --修改库存 
  exec sp_executesql N'UPDATE "SJ_V20_live".."data0022" 
  SET "Quan_on_hand"=@P1
   WHERE "RKEY"=@P2 AND "Quan_on_hand"=@P3',
   N'@P1 numeric(19,6),@P2 int,@P3 numeric(19,6)',
   25.000000,11711,3.000000  
 
 --修改原来领料的的退回字段值
   exec sp_executesql N'UPDATE "SJ_V20_live".."data0207" 
   SET "RTN_QUANTITY"=@P1 WHERE "RKEY"=@P2 AND "RTN_QUANTITY"=@P3'
   ,N'@P1 float,@P2 int,@P3 float',
   22,41676,0
   
 --增加领料明细，反确认用负数  
   exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0207" 
   ("TTYPE","INVENTORY_PTR","DEPT_PTR","GON_PTR","TRANSACTION_PTR","D0022_PTR","D0468_PTR","TDATE","QUANTITY","STANDARD_COST") 
   VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
   N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 numeric(19,6),@P10 float',
   4,344,348,15337,78237,11711,3843,'2013-07-03 14:24:03',-22.000000,0
 
 --修改配料单  
   exec sp_executesql N'UPDATE "SJ_V20_live".."data0468" 
   SET "QUAN_ISSUED"=@P1,"status"=@P2 
   WHERE "RKEY"=@P3 AND "QUAN_ISSUED"=@P4 AND "status"=@P5',
   N'@P1 float,@P2 smallint,@P3 int,@P4 float,@P5 smallint',
   0,0,3843,22,1
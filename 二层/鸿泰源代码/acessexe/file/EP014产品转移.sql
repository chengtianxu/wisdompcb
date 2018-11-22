EP014产品转移
特殊出仓
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0415" 
("number","type","status","empl_ptr","custpart_ptr","sys_date","quantity","reference","auth_empl_ptr","auth_date","qty_received","CUSTOMER_PTR") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(3),@P2 tinyint,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 int,@P8 varchar(6),@P9 int,@P10 datetime,@P11 int,@P12 int',
'ZY2',8,3,1,18,'2013-09-26 22:25:15',1641,'转移出',1,'2013-09-26 22:25:15',0,10
减库存
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0053" 
SET "QTY_ON_HAND"=@P1 
WHERE "RKEY"=@P2 AND "QTY_ON_HAND"=@P3',
N'@P1 float,@P2 int,@P3 float',
0,53,1641
加库存
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_Sample".."data0053"
 ("WHSE_PTR","LOC_PTR","WORK_ORDER_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","customer_ptr","REF_MFG_DATE","WO_DATECODE","srce_ptr")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float,@P6 float,@P7 datetime,@P8 int,@P9 int,@P10 varchar(20),@P11 int,@P12 datetime,@P13 varchar(4),@P14 int',
  1,18,74,18,1641,1641,'2013-09-25 15:08:00',7,15,'02                  ',10,'2013-09-25 15:08:00','1338',NULL
  记录
  exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0113" 
  ("TRAN_TYPE","SRCE_PTR","DEST_PTR","EMPL_PTR","CSI_USER_PTR","TDATE","QUANTITY") 
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7);
   SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 tinyint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float',
   2,53,55,1,1,'2013-09-26 22:25:15',1641
   出仓主表
   exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0465" 
   ("D0053_PTR","QUANTITY","REFERENCE","heard_ptr","tot_matl_cost","tot_ovhd_cost") 
   VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
   SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
   N'@P1 int,@P2 int,@P3 varchar(6),@P4 int,@P5 float,@P6 float',53,1641,'转移出',2,0,0
   
   exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004"   
   SET "seed_value"=@P1 WHERE "seed_value"=@P2 AND "seed_flag"=@P3',
   N'@P1 varchar(10),@P2 varchar(10),@P3 tinyint',
   'PG13000016','PG13000015',2

 --原来旧程序这边存是当前号，与其它入仓存是下一个号，会导致号码重复


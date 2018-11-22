--更新盘点明细
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0215" 
SET "status"=@P1 WHERE "RKEY"=@P2 AND "status"=@P3',
N'@P1 tinyint,@P2 int,@P3 tinyint',
2,37742,1

--成品入仓单/特殊入主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0416" 
("number","type","empl_ptr","sys_date","quantity","reference")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(13),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 varchar(6)',
 'PD13062100001',6,1,'2013-06-21 19:36:15',30,'盘点入'
 --部品非过数入仓记录表
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0113" 
 ("TRAN_TYPE","DEST_PTR","EMPL_PTR","CSI_USER_PTR","TDATE","QUANTITY") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
 SELECT SCOPE_IDENTITY()  AS SCOPE_ID_COLUMN',
 N'@P1 tinyint,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 float',
 3,21814,1,1,'2013-06-21 19:36:15',30
 --更改库存表
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" 
 SET "QUANTITY"=@P1,"QTY_ON_HAND"=@P2,"NPAD_PTR"=@P3 
 WHERE "RKEY"=@P4 AND "QUANTITY"=@P5 AND "QTY_ON_HAND"=@P6 AND "NPAD_PTR" IS NULL',
 N'@P1 float,@P2 float,@P3 int,@P4 int,@P5 float,@P6 float',
 30,30,4911,21814,50,0
 
 --录入盘点数 减少
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0215" 
 SET "QUANTITY"=@P1,"ENTERED_BY_PTR"=@P2,"ENTERED_BY_USER_PTR"=@P3,"COUNTED_BY_EMPL_PTR"=@P4,"status"=@P5,"check_no"=@P6 
 WHERE "RKEY"=@P7 AND "QUANTITY"=@P8 AND "ENTERED_BY_PTR" IS NULL AND "ENTERED_BY_USER_PTR" IS NULL AND "COUNTED_BY_EMPL_PTR" IS NULL AND "status"=@P9 AND "check_no" IS NULL',
 N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 tinyint,@P6 varchar(1),@P7 int,@P8 float,@P9 tinyint',
 16,1,1,1,1,'',37743,-2,0
 
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0215" SET "status"=@P1 WHERE "RKEY"=@P2 AND "status"=@P3',N'@P1 tinyint,@P2 int,@P3 tinyint',2,37743,1
特殊出仓
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0415" ("number","type","status","empl_ptr","custpart_ptr","sys_date","quantity","reference","auth_empl_ptr","auth_date","qty_received","CUSTOMER_PTR") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(13),@P2 tinyint,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 int,@P8 varchar(6),@P9 int,@P10 datetime,@P11 int,@P12 int','PD13062100001',7,3,1,11001,'2013-06-21 20:01:02',14,'盘点出',1,'2013-06-21 20:01:02',0,61
  特殊出仓明细
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0465" ("D0053_PTR","QUANTITY","REFERENCE","heard_ptr","tot_matl_cost","tot_ovhd_cost") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(6),@P4 int,@P5 float,@P6 float',21814,14,'盘点出',2030,0,0
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0113" ("TRAN_TYPE","DEST_PTR","EMPL_PTR","CSI_USER_PTR","TDATE","QUANTITY") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 tinyint,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 float',3,21814,1,1,'2013-06-21 20:01:02',-14
 --更改库存表o0 
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" SET "QTY_ON_HAND"=@P1 WHERE "RKEY"=@P2 AND "QTY_ON_HAND"=@P3',N'@P1 float,@P2 int,@P3 float',16,21814,30
 
 
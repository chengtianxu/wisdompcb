EP013过数
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0048" 
("WO_PTR","FM_DEPT_PTR","WORK_CENTER_PTR","TO_DEPT_PTR","INTIME","OUTTIME","QTY_PROD","QTY_REJECT","PANELS","FLOW_NO","STEP_NO","EMPL_PTR","WTYPE","SETS_QTY","sys_qty","sq_per_unit","gs_sq_per_unit") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 smallint,@P11 smallint,@P12 int,@P13 tinyint,@P14 int,@P15 float,@P16 float,@P17 float',
 15963,358,359,362,'2013-09-05 12:24:27','2013-09-05 12:25:10',64,0,2,0,4,1,0,8,1,0.0030911100000000002,0.0040592199999999997

exec sp_executesql N'UPDATE "SJ_V20_live".."data0056" 
SET "DEPT_PTR"=@P1,"EMPLOYEE_PTR"=@P2,"STEP"=@P3,"QTY_BACKLOG"=@P4,"PANELS"=@P5,"INTIME"=@P6,"d0038_ptr"=@P7,"SETS_QTY"=@P8,"ipqc_flg"=@P9,"qty_rej"=@P10
 WHERE "RKEY"=@P11 AND "DEPT_PTR"=@P12 AND "EMPLOYEE_PTR"=@P13 AND "STEP"=@P14 AND "QTY_BACKLOG"=@P15 AND "PANELS"=@P16 AND "INTIME"=@P17 AND "d0038_ptr"=@P18 AND "SETS_QTY"=@P19 AND "ipqc_flg"=@P20 AND "qty_rej"=@P21',
 N'@P1 int,@P2 int,@P3 smallint,@P4 float,@P5 int,@P6 datetime,@P7 int,@P8 int,@P9 bit,@P10 int,@P11 int,@P12 int,@P13 int,@P14 smallint,@P15 float,@P16 int,@P17 datetime,@P18 int,@P19 int,@P20 bit,@P21 int',
 362,26,5,64,2,'2013-09-05 12:25:10',254949,8,0,0,21872,358,26,4,64,2,'2013-09-05 12:24:27',254948,8,0,0
 
 exec sp_executesql N'select * from data0158 where mrb_no=@P1
',N'@P1 varchar(15)',''

exec sp_executesql N'UPDATE "SJ_V20_live".."data0006" 
SET "QUAN_REJ"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
WHERE "RKEY"=@P4 AND "QUAN_REJ"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',
0,2,8,15963,0,2,8

---过半成品仓
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0048"
 ("WO_PTR","FM_DEPT_PTR","WORK_CENTER_PTR","TO_DEPT_PTR","INTIME","OUTTIME","QTY_PROD","QTY_REJECT","PANELS","FLOW_NO","STEP_NO","EMPL_PTR","WTYPE","SETS_QTY","sys_qty","sq_per_unit","gs_sq_per_unit") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 smallint,@P11 smallint,@P12 int,@P13 tinyint,@P14 int,@P15 float,@P16 float,@P17 float',
 15963,957,958,904,'2013-09-05 12:29:20','2013-09-05 12:31:14',64,0,2,0,6,1,0,8,1,0.0030911100000000002,0.0040592199999999997
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0490" --半成品库存
 ("WORK_ORDER_PTR","WHSE_PTR","LOC_PTR","MANU_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","EXPIRE_DATE","pnls_qty","pnls_on_hand") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float,@P6 float,@P7 datetime,@P8 datetime,@P9 float,@P10 float',
 15963,2,11,12840,64,64,'2013-09-05 12:31:14','2014-08-31 12:31:14',2,2
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0489" --存放自制阶段性完工半成品的入仓及出仓记录
 ("TTYPE","BOM_PTR","WO_PTR","QTY","TDATE","SOURCE_PTR","pnls_qty")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 smallint,@P2 int,@P3 int,@P4 float,@P5 datetime,@P6 int,@P7 float',
  1,12840,15963,64,'2013-09-05 00:00:00',839,2
  
  exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0056" WHERE "RKEY"=@P1',N'@P1 int',21872
  
  exec sp_executesql N'select * from data0158 where mrb_no=@P1
',N'@P1 varchar(15)',''

exec sp_executesql N'UPDATE "SJ_V20_live".."data0006" 
SET "PROD_STATUS"=@P1,"QUAN_REJ"=@P2,"QUAN_PROD"=@P3,"PANELS"=@P4,"SETS_QTY"=@P5
WHERE "RKEY"=@P6 AND "PROD_STATUS"=@P7 AND "QUAN_REJ"=@P8 AND "QUAN_PROD"=@P9 AND "PANELS"=@P10 AND "SETS_QTY"=@P11',
N'@P1 smallint,@P2 float,@P3 float,@P4 int,@P5 int,@P6 int,@P7 smallint,@P8 float,@P9 float,@P10 int,@P11 int',
9,0,64,2,8,15963,3,0,0,2,8
--ep013过数拆卡过程
--首先把接收工序在EP069生产资源设置打开允许拆开作业单

--过数记录
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0048" 
("WO_PTR","FM_DEPT_PTR","WORK_CENTER_PTR","TO_DEPT_PTR","INTIME","OUTTIME","QTY_PROD","QTY_REJECT","PANELS","FLOW_NO","STEP_NO","EMPL_PTR","WTYPE","SETS_QTY","sys_qty","sq_per_unit","gs_sq_per_unit") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17);
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 smallint,@P11 smallint,@P12 int,@P13 tinyint,@P14 int,@P15 float,@P16 float,@P17 float',
24622,448,449,466,'2013-10-14 03:30:44','2014-02-20 09:14:14',80,0,2,0,14,1,0,9,1,0.0012720800000000001,0.0015679299999999999
GO
--已经过到新的工序
exec sp_executesql N'UPDATE "SJ_V20_live".."data0056" 
SET "DEPT_PTR"=@P1,"EMPLOYEE_PTR"=@P2,"STEP"=@P3,"QTY_BACKLOG"=@P4,"PANELS"=@P5,"INTIME"=@P6,"d0038_ptr"=@P7,"SETS_QTY"=@P8,"ipqc_flg"=@P9,"qty_rej_to_stocked"=@P10
 WHERE "RKEY"=@P11 AND "DEPT_PTR"=@P12 AND "EMPLOYEE_PTR"=@P13 AND "STEP"=@P14 AND "QTY_BACKLOG"=@P15 AND "PANELS"=@P16 AND "INTIME"=@P17 AND "d0038_ptr"=@P18 AND "SETS_QTY"=@P19 AND "ipqc_flg"=@P20 AND "qty_rej_to_stocked" IS NULL',
 N'@P1 int,@P2 int,@P3 smallint,@P4 float,@P5 int,@P6 datetime,@P7 int,@P8 int,@P9 bit,@P10 int,@P11 int,@P12 int,@P13 int,@P14 smallint,@P15 float,@P16 int,@P17 datetime,@P18 int,@P19 int,@P20 bit',
 467,38,15,80,2,'2014-02-20 09:14:14',292180,9,0,0,36043,448,25,14,126,2,'2013-10-14 03:30:44',292194,14,0
 GO
--留下来的原来工序 
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0056" 
("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","WTYPE","ipqc_flag","d0038_ptr","SETS_QTY","qty_rej_to_stocked")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 tinyint,@P11 tinyint,@P12 int,@P13 int,@P14 int',
  24622,448,0,25,0,14,46,0,'2013-10-14 03:30:44',0,0,292194,5,0
GO
--改工单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0006" 
SET "QUAN_REJ"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 WHERE "RKEY"=@P4 AND "QUAN_REJ"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',0,2,14,24622,0,2,14
go

--EP013预过数
--发板EP013A
exec sp_executesql N'UPDATE "rcy".."data0056"
 SET "EMPLOYEE_PTR"=@P1,"QTY_BACKLOG"=@P2,"PANELS"=@P3,"ipqc_flag"=@P4,"send_to_dept_ptr"=@P5,"sendtime"=@P6,"SETS_QTY"=@P7,"qty_rej_to_stocked"=@P8 
                     WHERE "RKEY"=@P9 AND "EMPLOYEE_PTR"=@P10 AND "QTY_BACKLOG"=@P11 AND "PANELS"=@P12 AND "ipqc_flag"=@P13 AND "send_to_dept_ptr" IS NULL AND "sendtime" IS NULL AND "SETS_QTY"=@P14 AND "qty_rej_to_stocked" IS NULL',
                     N'@P1 int,@P2 float,@P3 int,@P4 tinyint,@P5 int,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 int,@P11 float,@P12 int,@P13 tinyint,@P14 int',
                     1,50,1,0,388,'2014-04-23 14:13:58',1,0,
                     53626,0,50,1,0,1
go
exec sp_executesql N'UPDATE "rcy".."data0006" SET "QUAN_REJ"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
                     WHERE "RKEY"=@P4 AND "QUAN_REJ"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
                     N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',0,1,1,36153,0,1,1
GO

--收板

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."data0048" 
("WO_PTR","FM_DEPT_PTR","WORK_CENTER_PTR","TO_DEPT_PTR","INTIME","OUTTIME","QTY_PROD","QTY_REJECT","PANELS","FLOW_NO","STEP_NO","EMPL_PTR","WTYPE","sendtime","send_empl_ptr","SETS_QTY","sys_qty","sq_per_unit","gs_sq_per_unit") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 datetime,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 smallint,@P11 smallint,@P12 int,@P13 tinyint,@P14 datetime,@P15 int,@P16 int,@P17 float,@P18 float,@P19 float',
 36153,392,393,696,'2014-04-23 15:12:42','2014-04-24 15:48:27',50,0,1,0,3,1,1,'2014-04-24 15:48:27',1,1,1,1.8700000000000001e-005,2.2560000000000001e-005
go
exec sp_executesql N'UPDATE "rcy".."data0056" 
SET "DEPT_PTR"=@P1,"EMPLOYEE_PTR"=@P2,"STEP"=@P3,"QTY_BACKLOG"=@P4,"PANELS"=@P5,"INTIME"=@P6,"d0038_ptr"=@P7,"send_to_dept_ptr"=@P8,"sendtime"=@P9,"SETS_QTY"=@P10,"ipqc_flg"=@P11,"qty_rej_to_stocked"=@P12 
                     WHERE "RKEY"=@P13 AND "DEPT_PTR"=@P14 AND "EMPLOYEE_PTR"=@P15 AND "STEP"=@P16 AND "QTY_BACKLOG"=@P17 AND "PANELS"=@P18 AND "INTIME"=@P19 AND "d0038_ptr"=@P20 AND "send_to_dept_ptr"=@P21 AND "sendtime"=@P22 AND "SETS_QTY"=@P23 AND "ipqc_flg"=@P24 AND "qty_rej_to_stocked"=@P25',
                     N'@P1 int,@P2 int,@P3 smallint,@P4 float,@P5 int,@P6 datetime,@P7 int,@P8 int,@P9 datetime,@P10 int,@P11 bit,@P12 int,@P13 int,@P14 int,@P15 int,@P16 smallint,@P17 float,@P18 int,@P19 datetime,@P20 int,@P21 int,@P22 datetime,@P23 int,@P24 bit,@P25 int',
                     774,26,5,50,1,'2014-04-24 15:48:27',200485,NULL,NULL,1,0,0,53626,392,1,3,50,1,'2014-04-23 15:12:42',200482,773,'2014-04-24 15:22:27',1,0,0
go
exec sp_executesql N'UPDATE "rcy".."data0006" 
SET "QUAN_REJ"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 WHERE "RKEY"=@P4 AND "QUAN_REJ"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',0,1,1,36153,0,1,1
go

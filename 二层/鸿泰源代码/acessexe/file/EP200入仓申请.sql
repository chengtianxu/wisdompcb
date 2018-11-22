--EP200入仓申请
--主表
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_live".."Data0416" 
("number","type","empl_ptr","sys_date","quantity","TSTATUS")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN',
 N'@P1 varchar(8),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 tinyint',
'PG004426',2,0,'2013-08-31 12:32:32',0,0
--修改在56表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0056" 
SET "QTY_BACKLOG"=@P1,"Weight_SET"=@P2,"TO_BE_STOCKED"=@P3,"TO_BE_STOCKED_NOW"=@P4,"TO_BE_CANCD"=@P5,"TDATE"=@P6,"EMPLOYEE_PTR"=@P7,"loc_place"=@P8 
WHERE "QTY_BACKLOG"=@P9 AND "RKEY"=@P10 AND "Weight_SET" IS NULL AND "TO_BE_STOCKED"=@P11 AND "TO_BE_STOCKED_NOW"=@P12 AND "TO_BE_CANCD" IS NULL AND "TDATE"=@P13 AND "EMPLOYEE_PTR"=@P14 AND "loc_place" IS NULL',
N'@P1 float,@P2 float,@P3 float,@P4 float,@P5 int,@P6 datetime,@P7 int,@P8 varchar(1),@P9 float,@P10 int,@P11 float,@P12 float,@P13 datetime,@P14 int',
245,1,20,0,0,'2013-08-31 12:27:04',1,'0',265,11397,0,0,'2013-03-05 16:48:00',650
--修改在6表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0006" 
SET "WO_DATECODE"=@P1 
WHERE "WO_DATECODE"=@P2 AND "RKEY"=@P3',N'@P1 varchar(2),@P2 varchar(1),@P3 int','33','',8209

--增加53表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0053" 
("WHSE_PTR","LOC_PTR","WORK_ORDER_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","QTY_ALLOC","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","DEPT_PTR","STEP","PANELS","EMPLOYEE_PTR","WaitShip","FinishShip","customer_ptr","d0056_ptr","to_be_cancd","location_flag","WO_DateCode","SO_PTR","Weight_SET","remark","Qty_Packing","qty_pcs","WTYPE_53","serial_no") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float,@P6 float,@P7 float,@P8 datetime,@P9 int,@P10 int,@P11 varchar(20),@P12 int,@P13 smallint,@P14 int,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 tinyint,@P22 varchar(2),@P23 int,@P24 float,@P25 varchar(1),@P26 float,@P27 float,@P28 tinyint,@P29 int',
2,1,8209,8457,20,0,0,'2013-08-31 12:32:32',0,4918,'0                   ',859,20,2,1,0,0,315,11397,0,0,'33',4184,1,'',0,2,1,1
--修改在416表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0416" 
SET "quantity"=@P1,"reference"=@P2,"CREATE_DATE"=@P3,"CREATE_EMPL_PTR"=@P4 
WHERE "rkey"=@P5 AND "quantity"=@P6 AND "reference" IS NULL AND "CREATE_DATE" IS NULL AND "CREATE_EMPL_PTR" IS NULL',
N'@P1 int,@P2 varchar(1),@P3 datetime,@P4 int,@P5 int,@P6 int'
,20,'','2013-08-31 12:32:32',1,4918,0

Update data0004 set SEED_VALUE='PG004427' Where  RKEY=5 and table_name='data0416'


--提交审核
exec sp_executesql N'UPDATE "SJ_V20_live".."data0416" 
SET "ToRemainStock"=@P1,"tstatus"=@P2,"post_date"=@P3,"post_empl_ptr"=@P4,"remark"=@P5 
WHERE "rkey"=@P6 AND "ToRemainStock"=@P7 AND "tstatus"=@P8 AND "post_date" IS NULL AND "post_empl_ptr" IS NULL AND "remark" IS NULL',
N'@P1 tinyint,@P2 tinyint,@P3 datetime,@P4 int,@P5 varchar(1),@P6 int,@P7 tinyint,@P8 tinyint',
0,1,'2013-08-31 12:53:15',1,'',4918,0,0


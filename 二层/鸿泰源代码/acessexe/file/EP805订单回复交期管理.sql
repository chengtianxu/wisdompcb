--EP805订单回复交期管理
--新增
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0318" 
("SALES_ORDER_PTR","TRANS_TYPE","USER_PTR","TRANS_DATE","PROGRAM_SOURCE","Update_REMARK","Update_sch_date_status","apply_sch_date","apply_ptr") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9);
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 smallint,@P3 int,@P4 datetime,@P5 smallint,@P6 varchar(2),@P7 tinyint,@P8 datetime,@P9 int',
9559,20,0,'2014-01-22 15:11:10',805,'22',0,'2014-01-22 00:00:00',1

--提交
--
exec sp_executesql N'UPDATE "SJ_V20_live".."data0318" 
SET "Update_sch_date_status"=@P1 
 WHERE "RKEY"=@P2 AND "Update_sch_date_status"=@P3',
 N'@P1 tinyint,@P2 int,@P3 tinyint',
 2,45050,0
 
 --评审
 --
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0318" 
 SET "TRANS_DESCRIPTION"=@P1,"FROM_STRING"=@P2,"TO_STRING"=@P3,"USER_PTR"=@P4,"Update_sch_date_status"=@P5,"confirm_sch_date"=@P6,"confirm_date"=@P7 
WHERE "RKEY"=@P8 AND "TRANS_DESCRIPTION" IS NULL AND "FROM_STRING" IS NULL AND "TO_STRING" IS NULL AND "USER_PTR"=@P9 AND "Update_sch_date_status"=@P10 AND "confirm_sch_date" IS NULL AND "confirm_date" IS NULL',
N'@P1 varchar(20),@P2 varchar(10),@P3 varchar(10),@P4 int,@P5 tinyint,@P6 datetime,@P7 datetime,@P8 int,@P9 int,@P10 tinyint',
'更改销售订单回复交期','2013-12-27','2014-01-23',1,3,'2014-01-23 00:00:00',NULL,45050,0,2
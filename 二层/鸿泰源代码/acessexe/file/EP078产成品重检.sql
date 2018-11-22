--EP078产成品重检
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_MEAN"=@P3 AND "BIG5_SEED_MEAN"=@P4 AND "SEED_VALUE"=@P5 AND "SEED_FLAG"=@P6 AND "table_name"=@P7 AND "rkey_ref"=@P8 AND "rkey"=@P9 AND "BillType" IS NULL',
N'@P1 varchar(10),@P2 smallint,@P3 varchar(11),@P4 varchar(1),@P5 varchar(10),@P6 tinyint,@P7 varchar(8),@P8 int,@P9 int',
'MRB0000003',15,'MRB处理编号','','MRB0000002',2,'data0414',45,45

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0414" 
("number","empl_ptr","d415_ptr","qty_rece","qty_to_be_reworked","qty_to_be_remaked","reference","status","sys_date","QTY_REWORKED","QTY_REMAKED","qty_to_be_stocked","qty_stocked","rma_ptr","sys_id","sys_rq") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(15),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 text,@P8 tinyint,@P9 datetime,@P10 int,@P11 int,@P12 int,@P13 int,@P14 int,@P15 varchar(16),@P16 datetime',
'MRB0000002',1,2033,12,3,2,'te',1,'2013-08-23 12:41:02',0,0,7,0,NULL,'ADMIN','2013-08-23 12:41:02'

ec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0058" 
("MRB_NO","REJECT_PTR","QTY_ORG_REJ","QTY_REJECT","PANELS","EMPL_PTR","TDATETIME","REFERENCE","TTYPE","mrb_ptr","d25_rkey")
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(10),@P2 int,@P3 int,@P4 float,@P5 int,@P6 int,@P7 datetime,@P8 varchar(30),@P9 smallint,@P10 int,@P11 int',
'2013-08-23',154,2,2,0,1,'2013-08-23 12:42:20','t1                            ',10,2,11584
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0057" 
("MRB_NO","TRAN_PTR","REJECT_PTR","QTY_REJECT","EMPL_PTR","TDATETIME","REFERENCE","mrb_ptr","d25_rkey") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(10),@P2 int,@P3 int,@P4 float,@P5 int,@P6 datetime,@P7 varchar(30),@P8 int,@P9 int',
'2013-08-23',-1,256,3,1,'2013-08-23 12:42:39','t2                            ',2,11584

exec sp_executesql N'UPDATE "SJ_V20_live".."data0415" 
SET "qty_received"=@P1,"status"=@P2 
WHERE "qty_received"=@P3 AND "status"=@P4 AND "rkey"=@P5',N'@P1 int,@P2 tinyint,@P3 int,@P4 tinyint,@P5 int',
12,4,0,3,2033
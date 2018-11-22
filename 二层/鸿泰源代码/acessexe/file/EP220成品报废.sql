EP220成品报废
新建
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."data0158" ("MRB_NO","EMPL_PTR","TDATETIME","STATUS","MRB_FLAG","TTYPE","sys_id","sys_rq") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 int,@P3 datetime,@P4 tinyint,@P5 tinyint,@P6 tinyint,@P7 varchar(5),@P8 datetime','1404240002',1,'2014-04-24 11:02:27',0,0,0,'ADMIN','2014-04-24 11:02:27'
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."Data0058" ("MRB_NO","WO_PTR","TRAN_PTR","DEPT_PTR","REJECT_PTR","QTY_ORG_REJ","QTY_REJECT","PANELS","FLOW_NO","STEP","EMPL_PTR","TDATETIME","RESP_DEPT_PTR","TTYPE","d53_rkey","status","SETS_QTY") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 float,@P8 int,@P9 int,@P10 int,@P11 int,@P12 datetime,@P13 int,@P14 smallint,@P15 int,@P16 tinyint,@P17 int','1404240002',34693,0,329,154,3,3,0,0,0,1,'2014-04-24 11:03:12',808,11,43687,2,0
go
 update Data0053 set QTY_ALLOC=QTY_ALLOC+3 where rkey=43687 --
 
 
 
--提交
--
查找审核人员
SELECT USER_PTR,seq_no FROM data0077 WHERE  ttype=7 
ORDER BY SEQ_NO
--插入特殊出仓
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."Data0415" ("number","type","status","empl_ptr","custpart_ptr","sys_date","quantity","reference","qty_received","Ranking") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(6),@P2 tinyint,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 int,@P8 varchar(42),@P9 int,@P10 int','BF4109',9,2,1,14402,'2014-04-24 11:09:35',3,'直接报废出(customer_ptr用明细关联data0053)',0,1

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."Data0465" ("D0053_PTR","QUANTITY","REFERENCE","heard_ptr","tot_matl_cost","tot_ovhd_cost") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(10),@P4 int,@P5 float,@P6 float',43687,3,'直接报废出',4109,0,0

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "rcy".."data0274" ("user_ptr","ranking","D415_ptr") VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 tinyint,@P3 int',1,1,4109

exec sp_executesql N'UPDATE "rcy".."data0158" SET "STATUS"=@P1 WHERE "RKEY"=@P2 AND "STATUS"=@P3',N'@P1 tinyint,@P2 int,@P3 tinyint',1,69403,0

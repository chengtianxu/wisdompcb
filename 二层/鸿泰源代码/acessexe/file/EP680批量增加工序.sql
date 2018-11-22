EP680批量增加工序
exec sp_executesql N'UPDATE "SJ_V20_live".."data0038" SET "STEP_NUMBER"=@P1 WHERE "RKEY"=@P2 AND "STEP_NUMBER"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',21,248549,20
exec sp_executesql N'UPDATE "SJ_V20_live".."data0038" SET "STEP_NUMBER"=@P1 WHERE "RKEY"=@P2 AND "STEP_NUMBER"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',22,248547,21
exec sp_executesql N'UPDATE "SJ_V20_live".."data0038" SET "STEP_NUMBER"=@P1 WHERE "RKEY"=@P2 AND "STEP_NUMBER"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',23,248548,22
exec sp_executesql N'UPDATE "SJ_V20_live".."data0038" SET "STEP_NUMBER"=@P1 WHERE "RKEY"=@P2 AND "STEP_NUMBER"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',24,248559,23
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0038" ("SOURCE_PTR","DEPT_PTR","DEF_ROUT_INST","FLOW_NO","STEP_NUMBER","OUTP_SPFC") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(1),@P4 smallint,@P5 smallint,@P6 money',12655,441,'',0,20,$1.0000



--EP188修改暂停投产
--修改50表投产字段
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "ONHOLD_PLANNING_FLAG"=@P1 WHERE "RKEY"=@P2 AND "ONHOLD_PLANNING_FLAG"=@P3',
N'@P1 smallint,@P2 int,@P3 smallint',
1,12428,1 --0为取消投产，1为暂停投产

--修改变更记录
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150" 
("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR","NOTE_INFO")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN'
 ,N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int,@P6 varchar(18)',
 '2013-07-23 11:42:46',0,12428,9,1,'投产暂缓处理；test'
--取消暂停投产
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
 SET "ONHOLD_PLANNING_FLAG"=@P1 
 WHERE "RKEY"=@P2 AND "ONHOLD_PLANNING_FLAG"=@P3',
 N'@P1 smallint,@P2 int,@P3 smallint',
 0,12428,1
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150" ("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR","NOTE_INFO") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int,@P6 varchar(18)','2013-07-23 11:45:43',0,12428,9,1,'取消投产暂缓处理；'
 
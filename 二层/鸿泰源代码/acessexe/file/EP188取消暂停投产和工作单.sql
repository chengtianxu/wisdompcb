-- 取消投产
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050"
 SET "ONHOLD_PLANNING_FLAG"=@P1 --0允许投产,1禁止投产
 WHERE "RKEY"=@P2 AND "ONHOLD_PLANNING_FLAG"=@P3',
 N'@P1 smallint,@P2 int,@P3 smallint'
 ,0,12379,1
 
 exec sp_executesql N'SET NOCOUNT OFF; 
 INSERT INTO "SJ_V20_live".."data0150" 
 ("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR","NOTE_INFO") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int,@P6 varchar(20)',
 '2013-07-24 22:00:16',0,12379,9,1,'取消投产暂缓处理；rr'
 

-- 取消投产
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "ONHOLD_RELEASE_FLAG"=@P1 WHERE "RKEY"=@P2 AND "ONHOLD_RELEASE_FLAG"=@P3',
N'@P1 smallint,@P2 int,@P3 smallint',
0,12379,1 

--暂停工作单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0059" 
SET "ONHOLD_SALES_FLAG"=@P1 
WHERE "ONHOLD_SALES_FLAG"=@P2 AND "rkey"=@P3',
N'@P1 bit,@P2 bit,@P3 int',
1,0,15769

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "ON_HOLD_BY_PTR"=@P1,"on_hold_date"=@P2 
WHERE "RKEY"=@P3 AND "ON_HOLD_BY_PTR" IS NULL AND "on_hold_date" IS NULL',
N'@P1 int,@P2 datetime,@P3 int',1,'2013-07-24 22:15:50',12352

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011"
 ("FILE_POINTER","SOURCE_TYPE","memo_text") VALUES (@P1,@P2,@P3); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 smallint,@P3 text',
 12352,59,'【2013-07-24 22:15:50经由 系统管理员】过期状态由"有效"变更为"过期",备注信息:ss'

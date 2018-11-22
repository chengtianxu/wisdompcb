update data0050 set edit_flag=0 where rkey =11941
update data0050 set edit_flag=1 where rkey =12321
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "TSTATUS"=@P1,"ALLOW_EDIT_FLAG"=@P2,
"ONHOLD_PLANNING_FLAG"=@P3,"CHECK_BY_PTR"=@P4,"CHECK_DATE"=@P5,"ONHOLD_RELEASE_FLAG"=@P6 
WHERE "RKEY"=@P7 AND "TSTATUS"=@P8 AND "ALLOW_EDIT_FLAG"=@P9 AND "ONHOLD_PLANNING_FLAG"=@P10 AND "CHECK_BY_PTR"=@P11 AND "CHECK_DATE"=@P12 AND "ONHOLD_RELEASE_FLAG"=@P13',
N'@P1 smallint,@P2 varchar(1),@P3 smallint,@P4 int,@P5 datetime,@P6 smallint,@P7 int,@P8 smallint,@P9 varchar(1),@P10 smallint,@P11 int,@P12 datetime,@P13 smallint',2,'Y',1,1,'2013-07-23 13:59:10',1,12321,1,'Y',1,732,'2013-05-21 15:48:00',1

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150" ("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR","NOTE_INFO") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int,@P6 varchar(4)','2013-07-23 13:59:10',1,12321,1,1,'test'

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" SET "TSTATUS"=@P1,"ALLOW_EDIT_FLAG"=@P2,"ONHOLD_PLANNING_FLAG"=@P3,"CHECK_BY_PTR"=@P4,"CHECK_DATE"=@P5,"ONHOLD_RELEASE_FLAG"=@P6 WHERE "RKEY"=@P7 AND "TSTATUS"=@P8 AND "ALLOW_EDIT_FLAG"=@P9 AND "ONHOLD_PLANNING_FLAG"=@P10 AND "CHECK_BY_PTR"=@P11 AND "CHECK_DATE" IS NULL AND "ONHOLD_RELEASE_FLAG"=@P12',N'@P1 smallint,@P2 varchar(1),@P3 smallint,@P4 int,@P5 datetime,@P6 smallint,@P7 int,@P8 smallint,@P9 varchar(1),@P10 smallint,@P11 int,@P12 smallint',5,'N',1,1,'2013-07-23 14:03:43',1,11924,1,'Y',1,0,1
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150" ("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR","NOTE_INFO","REJECT_REASON") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int,@P6 varchar(4),@P7 varchar(8)','2013-07-23 14:03:43',1,11924,2,1,'test','流程错误'


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
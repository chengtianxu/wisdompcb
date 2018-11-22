--EP191提交MI制作
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150"
 ("TDATEtime","ttype","cust_part_ptr","PS_REJ","EMPL_PTR") VALUES (@P1,@P2,@P3,@P4,@P5); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 datetime,@P2 int,@P3 int,@P4 tinyint,@P5 int',
 '2013-11-27 19:31:57',25,13352,0,1
 
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
 SET "baseinfo_status"=@P1 
  WHERE "baseinfo_status" IS NULL AND "RKEY"=@P2',
  N'@P1 tinyint,@P2 int',0,13352

----建档状态   NULL 未提交  0已提交  1退回  2 待确认
---tstatus   null 0-未提交,1-待1审,2-待2审,3-待3审,4-待4审,5-1审退,6-2审退,7-3审退,,8-4审退,9通过,10CAM处理中
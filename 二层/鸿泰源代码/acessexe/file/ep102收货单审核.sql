ep102 ’ªıµ•…Û∫À
exec sp_executesql N'UPDATE "qld".."data0456" 
SET "STATUS"=@P1,"AUDITED_BY"=@P2,"AUDITED_DATE"=@P3 
 WHERE "RKEY"=@P4 AND "STATUS"=@P5 AND "AUDITED_BY" IS NULL AND "AUDITED_DATE" IS NULL',
 N'@P1 smallint,@P2 int,@P3 datetime,@P4 int,@P5 smallint',
 1,1,'2014-04-18 11:08:09',5898,0
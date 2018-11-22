--EP01053外发审核
exec sp_executesql N'UPDATE "SJ_V20_live".."data0078" 
SET "auth_date"=@P1 
WHERE "RKEY"=@P2 AND "auth_date" IS NULL',N'@P1 datetime,@P2 int','2013-12-25 17:34:59',6078
go
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0070" 
SET "STATUS"=@P1,"CONFIRMATION_NUMBER"=@P2,"EXPIRED_DATE"=@P3 
WHERE "RKEY"=@P4 AND "STATUS"=@P5 AND "CONFIRMATION_NUMBER" IS NULL AND "EXPIRED_DATE" IS NULL',
N'@P1 tinyint,@P2 varchar(10),@P3 datetime,@P4 int,@P5 tinyint',
5,'系统管理员','2013-12-25 17:34:43',5101,1
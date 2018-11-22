--查找已经存在的
exec ep054;4 4847
--删除旧的
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0276" WHERE "rkey"=@P1',N'@P1 int',12994

--条件查询
select Data0275.USER_PTR,Data0275.auth_type,Data0275.SEQ_NO FROM Data0068 
 inner join Data0275 on Data0068.AUTH_TYPE=Data0275.AUTH_GROUP_PTR
 where data0068.total<=Data0275.upper_limit  and data0068.total>=Data0275.lower_limit
 and Data0068.rkey = 4847--申请单号
ORDER BY Data0275.auth_type,Data0275.SEQ_NO, Data0275.rkey

--插入审核记录表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0276" 
("purchase_ptr","user_ptr","ranking","Auth_type")
 VALUES (@P1,@P2,@P3,@P4); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 tinyint,@P4 tinyint',
 4847,832,0,0
 
 --修改69表
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0068" 
 SET "status"=@P1,"APPD_BY"=@P2,"ent_date"=@P3,"tstate"=@P4 
 WHERE "rkey"=@P5 AND "status"=@P6 AND "APPD_BY"=@P7 AND "ent_date" IS NULL AND "tstate"=@P8',
 N'@P1 tinyint,@P2 int,@P3 datetime,@P4 tinyint,@P5 int,@P6 tinyint,@P7 int,@P8 tinyint',
 8,832,'2013-05-20 22:14:19',0,4847,7,832,1
 
 
 
 select top 100 APPD_BY , *  from Data0068 order by rkey desc 

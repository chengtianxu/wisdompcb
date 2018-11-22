EP2060变量采购单
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0921" 
("PoBg_Number","Po_Ptr","PoBg_Type","PoBg_TypePo","PoBg_Date","Bg_time","PoBg_Create","PoBg_Status","CSI_USER_POINTER","sys_id","sys_rq") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(11),@P2 int,@P3 int,@P4 varchar(1),@P5 datetime,@P6 datetime,@P7 int,@P8 int,@P9 int,@P10 varchar(5),@P11 datetime',
'POBG1301043',4609,1,'S','2013-09-20 17:21:12',NULL,1,1,1,'ADMIN','2013-09-20 17:21:12'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0922" 
("Bg_PoBgRkey","Bg_reky71","Bg_BeforValue","Bg_EndrValue") 
VALUES (@P1,@P2,@P3,@P4); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 float,@P4 float',
1,16656,80,67

exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_VALUE"=@P3 AND "SEED_FLAG"=@P4',
N'@P1 varchar(11),@P2 smallint,@P3 varchar(11),@P4 tinyint',
'POBG1301044',15,'POBG1301043',2

提交
exec sp_executesql N'select * from data0923 where PoBg_ptr=@P1 order by ranking asc
',N'@P1 int',1

exec sp_executesql N'SELECT USER_PTR,seq_no FROM Data0077 WHERE data0077.ttype=@P1 and (lower_limit <= @P2) and (upper_limit >= @P3) and ((whouse_ptr = @P4) or (whouse_ptr = 0)) ORDER BY seq_no 
',N'@P1 int,@P2 money,@P3 money,@P4 int',10,$4450.0000,$4450.0000,2

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0923" ("PoBg_ptr","user_ptr","ranking") VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int',1,1,0


update Data0921 set SECOND_WHSE_PTR=1,PoBg_Status=2,DATE_EDITED='2013-09-20 17:36:44'  where rkey=1

查询审核信息
exec sp_executesql N'SELECT user_id,user_full_name,
              auth_date,ranking,user_ptr
FROM data0923 inner join data0073
     On data0923.user_ptr=data0073.rkey
WHERE PoBg_ptr=@P1 order by ranking
',N'@P1 int',1
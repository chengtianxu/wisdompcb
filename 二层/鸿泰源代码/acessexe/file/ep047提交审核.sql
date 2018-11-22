
--ep047提交审核
--条件
SELECT seq_nr,USER_PTR,allow_modi_flag FROM Data0265
WHERE (LOWER_LIMIT >= 0)
and (UPPER_LIMIT <= 0)
 AND (AUTH_GROUP_PTR = 5)
ORDER BY seq_nr 
--写入审核记录
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("qte_ptr","user_ptr","ranking","ALLOW_MODI_FLAG") 
VALUES (@P1,@P2,@P3,@P4); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 tinyint,@P4 varchar(1)',
57,1,1,'Y'
--修改状态 AUDITED_STATUS0建档中，１已经提交，２审批中，３已审批
exec sp_executesql N'UPDATE "SJ_V20_live"."dbo"."Data0085" 
SET "AUDITED_STATUS"=@P1,"appd_by"=@P2,"seq_nr"=@P3 
WHERE "RKEY"=@P4 AND "AUDITED_STATUS"=@P5 AND "appd_by"=@P6 AND "seq_nr"=@P7',
N'@P1 tinyint,@P2 int,@P3 int,@P4 int,@P5 tinyint,@P6 int,@P7 int',
1,1,1,57,0,1,1

SELECT AUDITED_STATUS,* FROM data0085 ORDER BY rkey DESC 
UPDATE data0085 SET AUDITED_STATUS=0 WHERE rkey=57


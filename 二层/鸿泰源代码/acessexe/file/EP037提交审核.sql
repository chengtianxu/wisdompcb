--审核流检查
exec sp_executesql N'SELECT USER_PTR,seq_no FROM data0077
WHERE  ttype=2 and (UPPER_LIMIT >=@P1) AND (LOWER_LIMIT <= @P2) and (whouse_ptr = 0 or whouse_ptr =@P3) 
ORDER BY SEQ_NO
',N'@P1 money,@P2 money,@P3 int',$0.6480,$0.6480,2
--增加审核人信息
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("user_ptr","ranking","rma_ptr")
 VALUES (@P1,@P2,@P3); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 tinyint,@P3 int',1053,0,353
 --修改状态
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" 
 SET "RMA_STATUS"=@P1 
 WHERE "RMA_STATUS"=@P2 AND "rkey"=@P3',
 N'@P1 smallint,@P2 smallint,@P3 int',1,0,353
-- 
检查审核情况
SELECT user_id,user_full_name,
       auth_date,ranking,user_ptr,RMA_Remark
FROM data0274 inner join data0073
     On data0274.user_ptr=data0073.rkey
WHERE rma_ptr =353 --@purch_ptr data0098.rkey
  
ORDER BY
  ranking




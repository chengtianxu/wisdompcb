--过滤条件
SELECT USER_PTR,seq_no FROM data0077 WHERE  ttype=7 
ORDER BY SEQ_NO
--写入记录表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("user_ptr","ranking","D415_ptr")
 VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN'
 ,N'@P1 int,@P2 tinyint,@P3 int',
 1018,1,2029
 --修改主表状态
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0415" 
 SET "status"=@P1,"Ranking"=@P2 
 WHERE "status"=@P3 AND "rkey"=@P4 AND "Ranking"=@P5',
 N'@P1 tinyint,@P2 int,@P3 tinyint,@P4 int,@P5 int',
 2,1,1,2029,1




-查看审核信息
exec sp_executesql N'SELECT user_id,user_full_name, auth_date,ranking,user_ptr,rtrim(convert(varchar(500),D415_audit_Remark)) as D415_audit_Remark 
 FROM data0274 inner join data0073 On data0274.user_ptr=data0073.rkey  WHERE  D415_ptr=@P1  ORDER BY  ranking 
',N'@P1 int',2029

--删除审核
delete from data0274  WHERE  D415_ptr=2029
update data0415 set status =1 WHERE  rkey=2029 --状态1,2,3,4,5待提交,待出仓,已出仓,已重检,被退回
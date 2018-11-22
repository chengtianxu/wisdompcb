EP2060提交审核
查询条件
exec sp_executesql N'SELECT USER_PTR,seq_no FROM Data0077 
 WHERE data0077.ttype=@P1 
 and (lower_limit <= @P2) and (upper_limit >= @P3) 
 and ((whouse_ptr = @P4) or (whouse_ptr = 0)) 
     ORDER BY seq_no 
',N'@P1 int,@P2 money,@P3 money,@P4 int',
10,$29600.0000,$29600.0000,2  --data0077.ttype=10采购单变更
                              --金额
                              --工厂
   --写入记录             
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0923" 
 ("PoBg_ptr","user_ptr","ranking") 
 VALUES (@P1,@P2,@P3); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int',
 1,1,0   
 
 update Data0921
  set SECOND_WHSE_PTR=1,PoBg_Status=2,DATE_EDITED='2014-03-25 15:17:56' 
   where rkey=1
                          
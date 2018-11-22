EP781Ã·Ωª
SELECT USER_PTR,seq_no FROM data0077 WHERE  ttype=6 
ORDER BY SEQ_NO

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("user_ptr","ranking","D439_ptr") VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 tinyint,@P3 int',1,1,3556

update data0439 set use_stauts=2,Ranking=1,audited_by_ptr=NULL,audited_date=NULL,
  checked_date=NULL,checked_by_ptr=NULL where rkey = 3556



exec sp_executesql N'select data0468.* from data0468 
where  data0468.cut_no=@P1
',N'@P1 varchar(12)','130603018-0'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0095" ("TRAN_TP","INVT_PTR","SRCE_PTR","TRAN_BY","REC_BY","TRAN_DATE","QUANTITY","REFERENCE_NUMBER") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float,@P8 varchar(20)',12,206,13508,1,1,'2013-07-03 15:34:28',2,'130603018-0         '
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0457" ("GON_NUMBER","TTYPE","CREATE_DATE","CREATE_BY","RECD_BY","STATUS","Cut_NO") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(9),@P2 smallint,@P3 datetime,@P4 int,@P5 int,@P6 tinyint,@P7 varchar(12)','X10016234',1,'2013-07-03 15:34:28',1,1,0,'130603018-0 '
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0207" ("TTYPE","INVENTORY_PTR","DEPT_PTR","GON_PTR","TRANSACTION_PTR","D0022_PTR","D0468_PTR","TDATE","QUANTITY") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 numeric(19,6)',1,206,348,15339,78239,13508,4619,'2013-07-03 15:34:28',2.000000

exec sp_executesql N'UPDATE "SJ_V20_live".."data0468" SET "QUAN_ISSUED"=@P1 WHERE "RKEY"=@P2 AND "QUAN_ISSUED"=@P3',N'@P1 float,@P2 int,@P3 float',5,4619,3

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0022" SET "QUAN_ON_HAND"=@P1 WHERE "RKEY"=@P2 AND "QUAN_ON_HAND"=@P3',N'@P1 numeric(19,6),@P2 int,@P3 numeric(19,6)',397.000000,13508,399.000000


提问是否关闭配料单
create procedure ep256;3
@vcut_no varchar(20)
as
update data0468 set status=1 
where status=0
and cut_no=@vcut_no
go
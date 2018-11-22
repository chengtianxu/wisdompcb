--EP017发料退料
--EP017发料

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0457" 
("GON_NUMBER","TTYPE","CREATE_DATE","CREATE_BY","RECD_BY","REF_NUMBER","sys_id","sys_rq","warehouse_ptr","DEPT_PTR","TTYPE_EX") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(7),@P2 smallint,@P3 datetime,@P4 int,@P5 int,@P6 varchar(2),@P7 varchar(5),@P8 datetime,@P9 int,@P10 int,@P11 int',
 '1311583',2,'2013-12-23 00:14:21',1,1,'df','ADMIN','2013-12-23 00:14:21',2,329,2
 
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0207" 
("TTYPE","INVENTORY_PTR","DEPT_PTR","GON_PTR","D0022_PTR","TDATE","QUANTITY","REMARK_INFO") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 numeric(19,6),@P8 nvarchar(1)',
2,5260,329,21836,25034,'2013-12-23 00:14:21',2.000000,N''

update data0022 set quan_on_hand=quan_on_hand-isnull(b.quantity,0)
 from data0022,
 (select d0022_ptr,sum(data0207.quantity) as quantity  from data0207 where data0207.gon_ptr=21836 group by d0022_ptr) b  
where data0022.rkey=b.d0022_ptr

--退回
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" SET "seed_value"=@P1 WHERE "seed_value"=@P2',N'@P1 varchar(7),@P2 varchar(7)','1311584','1311583'
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0457"
 ("GON_NUMBER","TTYPE","CREATE_DATE","CREATE_BY","location_ptr","warehouse_ptr","DEPT_PTR","TTYPE_EX") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(7),@P2 smallint,@P3 datetime,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int',
 '1311584',4,'2013-12-23 00:21:54',1,2,2,329,4
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0095"
 ("TRAN_TP","INVT_PTR","SRCE_PTR","TRAN_BY","REC_BY","TRAN_DATE","QUANTITY") --SRCE_PTR =data0064.rkey 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float',
 15,5260,25034,1,1,'2013-12-23 00:21:54',-1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0207" 
("TTYPE","INVENTORY_PTR","DEPT_PTR","GON_PTR","TRANSACTION_PTR","D0022_PTR","TDATE","QUANTITY","STANDARD_COST") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 datetime,@P8 numeric(19,6),@P9 float',
4,5260,329,21837,107034,25034,'2013-12-23 00:21:54',-1.000000,0
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0207" --修改原单
SET "RTN_QUANTITY"=@P1 WHERE "RKEY"=@P2 AND "RTN_QUANTITY"=@P3',
N'@P1 float,@P2 int,@P3 float',1,64380,0
go

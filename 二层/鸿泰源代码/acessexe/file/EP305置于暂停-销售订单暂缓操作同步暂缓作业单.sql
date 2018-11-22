EP305置于暂停-销售订单暂缓操作同步暂缓作业单

exec sp_executesql N'insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number,updateSoAccess_path) 
 values(@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10)
',N'@P1 int,@P2 smallint,@P3 varchar(300),@P4 varchar(300),@P5 varchar(300),@P6 int,@P7 datetime,@P8 smallint,@P9 varchar(50),@P10 varchar(500)',
13344,12,'更改销售订单状态为暂缓','有效','暂缓',1,'2014-03-21 08:57:53',32,'',''

exec sp_executesql N'UPDATE "SJ_V20_live"."dbo"."Data0006" 
SET "PROD_STATUS"=@P1 
WHERE "rkey"=@P2 AND "PROD_STATUS"=@P3',
N'@P1 smallint,@P2 int,@P3 smallint',
103,35386,3
--新状态、工单号、原状态
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011"
 ("FILE_POINTER","SOURCE_TYPE","NOTE_PAD_LINE_1","memo_text") 
 VALUES (@P1,@P2,@P3,@P4); SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 smallint,@P3 varchar(1000),@P4 text',
 35386,1,'销售订单暂缓操作同步暂缓作业单！','备注：test'
 --工单号、类型、说明、备注
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0117" 
("SOURCE_PTR","SOURCE_TYPE","NOTEPAD_PTR","EMPL_PTR","TDATE","ACTION")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 smallint,@P3 int,@P4 int,@P5 datetime,@P6 smallint',
 35386,1,241170,1,'2014-03-21 08:57:53',1
 --工单号、类型、说明、备注
GO

SELECT so_ptr,* FROM data0006 WHERE rkey=35386
SELECT * FROM data0011 WHERE rkey=
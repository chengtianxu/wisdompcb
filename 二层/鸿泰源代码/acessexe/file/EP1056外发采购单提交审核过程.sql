/*
exec ep056;4 3389
CREATE PROCEDURE ep056;4 --查找每一个PO的审批人
   @porkey int
with encryption
AS
select * 
from 
 data0078
where 
 po_ptr=@porkey
go
*/
-- 报废单主表
select * from Data0070 order by 1 desc 
--审核人条件过滤
exec sp_executesql N'SELECT USER_PTR,seq_no FROM Data0077
WHERE data0077.ttype=@P1 and (lower_limit <= @P2)
and (upper_limit >= @P3) 
and ((whouse_ptr = @P4) or (whouse_ptr = 0))
ORDER BY seq_no
',N'@P1 int,@P2 money,@P3 money,@P4 int',1,$48.4404,$48.4404,2

--把审核人写入写入采购订单审批记录人员表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0078" 
("po_ptr","user_ptr","ranking") 
VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 tinyint',
3389,911,0

--修改当前审核人
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0070" 
SET "SECOND_WHSE_PTR"=@P1 --当前审核人
WHERE "rkey"=@P2 AND "SECOND_WHSE_PTR" IS NULL',
N'@P1 int,@P2 int',911,3389

--修改提交日期和订单状态
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0070" 
SET "DATE_EDITED"=@P1,"status"=@P2
 WHERE "rkey"=@P3 AND "DATE_EDITED" IS NULL AND "status"=@P4',
 N'@P1 datetime,@P2 tinyint,@P3 int,@P4 tinyint','2013-05-12 00:11:34',1,3389,8
go


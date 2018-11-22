合并查询
exec EP082;34 971,22550,13136,'RCY13090111-01'

CREATE PROCEDURE EP082;34
@vptr int,
@vptr2 int,
@vptr3 int,
@vso varchar(20)
with encryption
AS
begin
select data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,data0056.rkey as d56_rkey,data0056.sets_qty,data0056.qty_rej_to_stocked,data0056.qty_rej,
data0006.rkey,data0006.work_order_number,data0056.qty_backlog,data0056.panels,data0492.cut_no,data0492.so_no,cast(0 as bit) as chose_flag 
into #data0006
from data0006,data0056,data0492,data0025,data0050
where data0056.wo_ptr=data0006.rkey
and data0056.dept_ptr=@vptr
and data0006.cut_no=data0492.cut_no
--and isnull(data0492.so_no,'') like @vso
and data0006.bom_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
and data0006.bom_ptr=@vptr3
and data0006.rkey<>@vptr2
and isnull(data0056.send_to_dept_ptr,0)=0

select * from #data0006
end
go


----------

--主LOT     130907024-0-2-2 22550 投产480 报废33
--被合并LOT 130907024-0-2-1 22549 投产600 报废22
exec sp_executesql N'SELECT * from data0006
WHERE rkey=@P1
',N'@P1 int',22550 --主LOT
go
exec sp_executesql N'SELECT * from data0056
WHERE rkey=@P1
',N'@P1 int',32359 --主LOT在线
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0006" 
SET "QUAN_SCH"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
WHERE "RKEY"=@P4 AND "QUAN_SCH"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',
1058,90,360,22550,480,40,160--(1058＝600+480－22 投产之总－被合并的报废数)？？
go

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0134"
 ("WO_PTR","TTYPE","TO_WO_PTR","TDATE","TRANS_PCS","TRANS_PNLS","EMPL_PTR") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 int,@P6 int,@P7 int',
 22549,2,22550,'2013-09-26 14:01:30',578,50,1
go
exec sp_executesql N'SELECT * from data0056
WHERE rkey=@P1
',N'@P1 int',32359
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0056" 
SET "QTY_BACKLOG"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
WHERE "RKEY"=@P4 AND "QTY_BACKLOG"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',1025,90,360,32359,447,40,160
go

删除被合并LOT的56在线，后面没跟踪到

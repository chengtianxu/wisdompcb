--窗口数据
exec sp_executesql N'select data0492.cut_no,data0050.customer_part_number,data0050.rkey as d0050_rkey,
data0050.cp_rev,data0025.manu_part_number,
data0492.so_no,data0492.issued_qty,data0492.issue_date,
data0492.sch_compl_date,data0492.tstatus,data0491.rkey,
data0491.mo_ptr,data0491.app_quan,
data0491.app_by_ptr,data0491.app_date,data0491.remark
from data0491,data0492,data0025,data0050
where data0491.mo_ptr=data0492.rkey
and data0492.bom_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
and data0492.issue_date>=@P1
and data0492.issue_date<=@P2
and data0492.tstatus=@P3
',N'@P1 datetime,@P2 datetime,@P3 int','2013-05-05 14:39:09','2013-06-05 14:39:09',1


--投产前检视
exec EP234;4 12563  --此编号投产情况
go
exec EP234;1 12563  --已经总数
go
exec EP234;2 12563 --wip
go
exec EP234;3 12563--成品总数
go

--批准
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0491" 
SET "app_by_ptr"=@P1,"app_date"=@P2
 WHERE "rkey"=@P3 AND "app_by_ptr"=@P4 AND "app_date"=@P5',
 N'@P1 int,@P2 datetime,@P3 int,@P4 int,@P5 datetime',
 1,'2013-06-04 00:00:00',1408,1,'2013-06-04 00:00:00'
 
 exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0492" 
 SET "tstatus"=@P1 --0状态通过
  WHERE "tstatus"=@P2 AND "rkey"=@P3',N'@P1 smallint,@P2 smallint,@P3 int',0,1,15697
  
  
  
  exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0491" 
  SET "app_by_ptr"=@P1,"app_date"=@P2 
  WHERE "rkey"=@P3 AND "app_by_ptr"=@P4 AND "app_date"=@P5',
  N'@P1 int,@P2 datetime,@P3 int,@P4 int,@P5 datetime',
  1,'2013-06-04 00:00:00',1408,1,'2013-06-04 00:00:00'
  
  exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0492" 
  SET "tstatus"=@P1 --1退回
  WHERE "tstatus"=@P2 AND "rkey"=@P3',
  N'@P1 smallint,@P2 smallint,@P3 int',1,0,15697


select * from data0400 --盘点代码

--建立WIP盘点表

--写工序
/*declare @p4 varchar(20)
set @p4=''
exec ep403;1 947,2,0,@p4 output
select @p4
create procedure ep403 */

declare 
@d034_ptr int=947,
@d0015_ptr int=2,
@d400_ptr int=0
--@d034_code varchar(20) output
--as

Select --@d034_code=
     Data0034.DEPT_CODE 
From Data0400 inner join
     Data0401 on Data0400.Rkey=Data0401.header_ptr inner join
     Data0034 on Data0401.dept_ptr=data0034.Rkey inner join
     Data0006 on Data0401.wo_ptr=Data0006.Rkey
Where Data0400.status=0
  and (Data0034.Rkey=@d034_ptr or Data0034.group_ptr=@d034_ptr or data0034.dept_ptr=@d034_ptr)
  and (Data0006.whouse_ptr=@d0015_ptr or IsNull(@d0015_ptr,0)=0)

--库存  
  select data0056.rkey from data0056
inner join data0006 on Data0056.WO_PTR = Data0006.RKEY
INNER JOIN Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY
where data0056.TO_BE_STOCKED>0
and data0034.dept_ptr =947
and data0006.whouse_ptr =2

--写稿盘点表
--盘点主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0400" 
("wip_code","user_ptr","ent_date","status","serial_no","whouse_ptr","group_ptr") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),
@P2 int,@P3 datetime,@P4 tinyint,@P5 varchar(1),@P6 int,@P7 int',
'2013-6-1  ',1,'2013-06-01 21:07:47',0,'',2,18
--盘点明细1指针
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0403" 
("d400_ptr","d034_ptr") --写入工序指针
VALUES (@P1,@P2);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int',
 142,947
 --盘点代码对应的盘点在线工单子表
 delete from data0401 --删除旧数据
where header_ptr=142

SET FMTONLY ON select data0034.rkey,data0034.group_ptr,data0034.dept_ptr from  dbo.Data0056 INNER JOIN
      dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKEY INNER JOIN
      dbo.Data0034 ON dbo.Data0056.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN
      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY WHERE 1=2  SET FMTONLY OFF
      
exec sp_executesql N'SELECT dbo.Data0056.QTY_BACKLOG, dbo.Data0056.WO_PTR, dbo.Data0056.RKEY,
      dbo.Data0056.DEPT_PTR, dbo.Data0056.STEP, dbo.Data0056.PANELS
FROM dbo.Data0056 INNER JOIN
      dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKEY INNER JOIN
      dbo.Data0034 ON dbo.Data0056.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN
      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY
where (data0034.rkey = @P1 or data0034.group_ptr = @P2 or data0034.dept_ptr = @P3) and data0056.outsource=0  
   and not exists(select 1 from data0401 inner join data0400 on data0401.header_ptr=data0400.rkey  where data0056.rkey=data0401.wiprkey_ptr and data0400.status=0) --20121210 LLL   
  and data0006.whouse_ptr =2
and data0008.pr_grp_pointer=18
',N'@P1 int,@P2 int,@P3 int',947,947,947
--写入盘点表明细 2  WIP,工作单   
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0401" 
("header_ptr","wo_ptr","dept_ptr","wip_ptr","wip_system_qty","seaial_no","panels","wiprkey_ptr","physical_panels") --header_ptr为401表的RKEY 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); SELECT SCOPE_IDENTITY()
 AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int,@P8 int,@P9 int',
 142,14351,947,1,96,1,0,19553,0


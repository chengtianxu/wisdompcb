use master
go
create procedure sp_who_lock
as
begin
declare @spid int,@bl int,
 @intTransactionCountOnEntry  int,
        @intRowcount    int,
        @intCountProperties   int,
        @intCounter    int

 create table #tmp_lock_who (
 id int identity(1,1),
 spid smallint,
 bl smallint)
 
 IF @@ERROR<>0 RETURN @@ERROR
 
 insert into #tmp_lock_who(spid,bl) select  0 ,blocked
   from (select * from sysprocesses where  blocked>0 ) a 
   where not exists(select * from (select * from sysprocesses where  blocked>0 ) b 
   where a.blocked=spid)
   union select spid,blocked from sysprocesses where  blocked>0

 IF @@ERROR<>0 RETURN @@ERROR 
  
-- 找到临时表的记录数
 select  @intCountProperties = Count(*),@intCounter = 1
 from #tmp_lock_who
 
 IF @@ERROR<>0 RETURN @@ERROR 
 
 if @intCountProperties=0
  select '现在没有阻塞和死锁信息' as message

-- 循环开始
while @intCounter <= @intCountProperties
begin
-- 取第一条记录
  select  @spid = spid,@bl = bl
  from #tmp_lock_who where Id = @intCounter 
 begin
  if @spid =0 
            select '引起数据库死锁的是: '+ CAST(@bl AS VARCHAR(10)) + '进程号,其执行的SQL语法如下'
 else
            select '进程号SPID：'+ CAST(@spid AS VARCHAR(10))+ '被' + '进程号SPID：'+ CAST(@bl AS VARCHAR(10)) +'阻塞,其当前进程执行的SQL语法如下'
 DBCC INPUTBUFFER (@bl )
 end 

-- 循环指针下移
 set @intCounter = @intCounter + 1
end

drop table #tmp_lock_who

return 0
end


----------------------------------------------------------------------------------
use master

select spid 进程,STATUS 状态, 登录帐号=SUBSTRING(SUSER_SNAME(sid),1,30)
,用户机器名称=SUBSTRING(hostname,1,12)
,是否被锁住=convert(char(3),blocked)
,数据库名称=SUBSTRING(db_name(dbid),1,20),cmd 命令,waittype as 等待类型
,last_batch 最后批处理时间,open_tran 未提交事务的数量
from master.sys.sysprocesses
Where  status='sleeping' and waittype=0x0000 and open_tran>0



select t1.resource_type [资源锁定类型],DB_NAME(resource_database_id) as 数据库名
,t1.resource_associated_entity_id 锁定对象,t1.request_mode as 等待者请求的锁定模式
,t1.request_session_id 等待者SID
,t2.wait_duration_ms 等待时间
,(select TEXT from sys.dm_exec_requests r cross apply
sys.dm_exec_sql_text(r.sql_handle) where r.session_id=t1.request_session_id) as 等待者要执行的SQL
,(select SUBSTRING(qt.text,r.statement_start_offset/2+1,
(case when r.statement_end_offset=-1 then DATALENGTH(qt.text) else r.statement_end_offset end -r.statement_start_offset)/2+1
)
from sys.dm_exec_requests r cross apply sys.dm_exec_sql_text(r.sql_handle)qt
where r.session_id=t1.request_session_id) 等待者正要执行的语句
,t2.blocking_session_id [锁定者SID]
,(select TEXT from sys.sysprocesses p cross apply
sys.dm_exec_sql_text(p.sql_handle)
where p.spid=t2.blocking_session_id
) 锁定者执行语句
from sys.dm_tran_locks t1,sys.dm_os_waiting_tasks t2
where t1.lock_owner_address=t2.resource_address

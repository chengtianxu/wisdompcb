--ERPWatchÓï¾ä
select user_lmt_qty from data0195
select data0073.rkey,data0073.network_id,data0073.computer,user_full_name,case when a.last_time>0 then a.last_time else data0073.login_in_time end as last_time,
data0073.reject_flag,case when data0073.reject_flag=1 then 'Yes' else 'No' end as ttype,
round(cast(getdate()-(case when a.last_time>0 then a.last_time else data0073.login_in_time end) as float)*24*60,0) as stop_mins
from data0073 left join (select host_name,max(last_request_end_time) as last_time
from sys.dm_exec_sessions
where host_name<>''
and session_id not in (select a.session_id from sys.dm_exec_sessions a,(
select host_name,max(last_request_end_time) as last_time from sys.dm_exec_sessions
where host_name<>''
group by host_name) b where a.host_name=b.host_name and a.last_request_end_time=b.last_time )
group by host_name) a on upper(substring(data0073.computer,1,len(a.host_name)))=a.host_name
where data0073.network_id<>''
order by a.last_time desc

--µ¯³öÓÃ»§
exec sp_executesql N'update data0073 set network_id='''' where rkey=@P1
',N'@P1 int',1

select data0073.rkey,data0073.network_id,data0073.computer,user_full_name,case when a.last_time>0 then a.last_time else data0073.login_in_time end as last_time,
data0073.reject_flag,case when data0073.reject_flag=1 then 'Yes' else 'No' end as ttype,
round(cast(getdate()-(case when a.last_time>0 then a.last_time else data0073.login_in_time end) as float)*24*60,0) as stop_mins
from data0073 left join (select host_name,max(last_request_end_time) as last_time
from sys.dm_exec_sessions
where host_name<>''
and session_id not in (select a.session_id from sys.dm_exec_sessions a,(
select host_name,max(last_request_end_time) as last_time from sys.dm_exec_sessions
where host_name<>''
group by host_name) b where a.host_name=b.host_name and a.last_request_end_time=b.last_time )
group by host_name) a on upper(substring(data0073.computer,1,len(a.host_name)))=a.host_name
where data0073.network_id<>''
order by a.last_time desc

--装箱单审核流查询
select user_login_name,user_full_name,data0077.*
from data0077 inner join data0073 on data0077.user_ptr=data0073.rkey
where ttype=6
order by seq_no

提交
update Data0053 set to_be_audit=to_be_audit +300
 where rkey = 18906
 
 --删除旧的
 exec sp_executesql N'select * from data0274 where  D439_ptr=@P1
',N'@P1 int',3552

exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0274" WHERE "rkey"=@P1',N'@P1 int',9040

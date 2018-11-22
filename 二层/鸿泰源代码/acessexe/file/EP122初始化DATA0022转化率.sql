--EP122初始化DATA0022转化率
-
if not exists(select 1 from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='data0022'
                and t2.name='conversion_factor')
begin
   alter table data0022 add conversion_factor float 
end
go
update data0022 set conversion_factor=b.conversion_factor
from data0022 a,data0071 b
where a.source_ptr=b.rkey and a.conversion_factor is null
go
update data0022 set conversion_factor=1 where conversion_factor is null

go
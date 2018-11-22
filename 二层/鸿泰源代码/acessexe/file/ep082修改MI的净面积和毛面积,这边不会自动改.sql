--ep082修改MI的净面积和毛面积,这边不会自动改，
--因为48表存在sq_per_unit单元净面积gs_sq_per_unit单元毛面积两个字段
--可以运行EP013_EP002.sql脚本
--
IF not EXISTS (
SELECT name FROM syscolumns
WHERE (name = 'sqft_sqmt_flag') AND (id IN
          (SELECT id FROM sysobjects WHERE name = 'data0195'))) 
ALTER TABLE DATA0195 ADD sqft_sqmt_flag tinyint null
--data0048记录的静态面积单位是公制还是英制，0：公制；1英制
go

if not exists(select t2.name
              From syscolumns t1 inner join
                   sysobjects t2 on t1.id=t2.id
              where t1.name='sys_qty'
                and t2.name='data0048')
begin
alter table data0048 add sys_qty float null,sq_per_unit float null,gs_sq_per_unit float null
end
go

declare @v1 int
declare @v2 int
declare @vflag int
select @vflag=isnull(sqft_sqmt_flag,0) from data0195

if @vflag=0
begin
select @v1=rkey from data0278 where spec_rkey='D' 
select @v2=rkey from data0278 where spec_rkey='L' 
end else
begin
select @v1=rkey from data0278 where spec_rkey='E'
select @v2=rkey from data0278 where spec_rkey='K'
end
update data0048 set sys_qty=1,gs_sq_per_unit=a.parameter_value,sq_per_unit=b.parameter_value
from data0048 left join data0006 on data0048.wo_ptr=data0006.rkey
left join data0047 a on data0006.bom_ptr=a.source_pointer and a.parameter_ptr=@v1
left join data0047 b on data0006.bom_ptr=b.source_pointer and b.parameter_ptr=@v2
where isnull(data0048.sys_qty,0)=0
and data0048.outtime>getdate()-365


update data0048 set sys_qty=1,gs_sq_per_unit=a.parameter_value,sq_per_unit=b.parameter_value
from data0048 left join data0006 on data0048.wo_ptr=data0006.rkey
left join data0047 a on data0006.bom_ptr=a.source_pointer and a.parameter_ptr=@v1
left join data0047 b on data0006.bom_ptr=b.source_pointer and b.parameter_ptr=@v2
where isnull(gs_sq_per_unit,0)=0
and data0048.outtime>getdate()-365
go

--select * from data0048
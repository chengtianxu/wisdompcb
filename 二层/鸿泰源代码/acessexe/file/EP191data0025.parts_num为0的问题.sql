--data0025.parts_num=0的问题
--Trigger_for_data0025
update data0025 set parts_num=1
go

update data0025 set parts_num=a.vqty from data0025,(
select data0025.parent_ptr,sum((case when data0025.qty_bom>0 then data0025.qty_bom else 1 end)*(case when a.parts_num>0 then a.parts_num else 1 end))  as vqty
from data0025  
left join data0025 a on data0025.parent_ptr=a.rkey
where data0025.parent_ptr>0 and a.parent_ptr=0
group by data0025.parent_ptr
	) a where data0025.parent_ptr=a.parent_ptr
go

update data0025 set parts_num=a.vqty from data0025,(
select data0025.parent_ptr,sum(data0025.qty_bom*(case when a.parts_num>0 then a.parts_num else 1 end))  as vqty
from data0025  
left join data0025 a on data0025.parent_ptr=a.rkey
left join data0025 b on a.parent_ptr=b.rkey
where data0025.parent_ptr>0 and b.parent_ptr=0
group by data0025.parent_ptr
	) a where data0025.parent_ptr=a.parent_ptr
go


update data0025 set parts_num=a.vqty from data0025,(
select data0025.parent_ptr,sum(data0025.qty_bom*(case when a.parts_num>0 then a.parts_num else 1 end))  as vqty
from data0025  
left join data0025 a on data0025.parent_ptr=a.rkey
left join data0025 b on a.parent_ptr=b.rkey
left join data0025 c on b.parent_ptr=c.rkey
where data0025.parent_ptr>0 and c.parent_ptr=0
group by data0025.parent_ptr
	) a where data0025.parent_ptr=a.parent_ptr
go

update data0025 set parts_num=a.vqty from data0025,(
select data0025.parent_ptr,sum(data0025.qty_bom*(case when a.parts_num>0 then a.parts_num else 1 end))  as vqty
from data0025  
left join data0025 a on data0025.parent_ptr=a.rkey
left join data0025 b on a.parent_ptr=b.rkey
left join data0025 c on b.parent_ptr=c.rkey
left join data0025 d on c.parent_ptr=d.rkey
where data0025.parent_ptr>0 and d.parent_ptr=0
group by data0025.parent_ptr
	) a where data0025.parent_ptr=a.parent_ptr
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data0025_x_1]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[data0025_x_1]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data0025_x_2]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[data0025_x_2]
GO
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data0025_x_3]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[data0025_x_3]
GO


CREATE TRIGGER [data0025_x_1] ON [dbo].[data0025] 
WITH ENCRYPTION
after insert
AS
set nocount on--增加句1
declare @vqty int
select @vqty=parts_num from inserted 
if @vqty<=1
begin
declare @vparent_ptr int
select @vparent_ptr=parent_ptr from inserted 
set @vqty=1
if @vparent_ptr>0 
select @vqty=sum(data0025.qty_bom*(case when a.rkey>0 then a.parts_num else 1 end))  
from data0025  
left join data0025 a on data0025.parent_ptr=a.rkey
	where data0025.parent_ptr=@vparent_ptr

if @vparent_ptr>0
begin
	update data0025 set parts_num=@vqty from data0025
	where data0025.parent_ptr=@vparent_ptr
end
end
set nocount off--增加句2
go


CREATE TRIGGER [data0025_x_2] ON [dbo].[data0025] 
WITH ENCRYPTION
after update
AS
if update(qty_bom)
begin
	set nocount on--增加句1
	declare @vparent_ptr int
	select @vparent_ptr=parent_ptr from inserted 
	declare @vqty int
	set @vqty=1
	if @vparent_ptr>0 
	select @vqty=sum(data0025.qty_bom*(case when a.rkey>0 then a.parts_num else 1 end))  
	from data0025  
	left join data0025 a on data0025.parent_ptr=a.rkey
		where data0025.parent_ptr=@vparent_ptr

	if @vparent_ptr>0
	begin
		update data0025 set parts_num=@vqty from data0025
		where data0025.parent_ptr=@vparent_ptr
	end
end
go

CREATE TRIGGER [data0025_x_3] ON [dbo].[data0025] 
WITH ENCRYPTION
after delete
AS
	set nocount on--增加句1
	declare @vparent_ptr int
	select @vparent_ptr=parent_ptr from deleted 
	declare @vqty int
	set @vqty=1
	if @vparent_ptr>0 
	select @vqty=sum(data0025.qty_bom*(case when a.rkey>0 then a.parts_num else 1 end))  
	from data0025  
	left join data0025 a on data0025.parent_ptr=a.rkey
		where data0025.parent_ptr=@vparent_ptr

	if @vparent_ptr>0
	begin
		update data0025 set parts_num=@vqty from data0025
		where data0025.parent_ptr=@vparent_ptr
	end
go



IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'has_child') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0025'))) 
begin
alter table data0025 add has_child tinyint NULL
end
go

update data0025 set has_child=0
go

update data0025 set has_child=1 from data0025
where rkey in (select parent_ptr from data0025)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data0025_x_4]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[data0025_x_4]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[data0025_x_5]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[data0025_x_5]
GO


CREATE TRIGGER [data0025_x_4] ON [dbo].[data0025] 
WITH ENCRYPTION
after insert
AS
set nocount on--增加句1
declare @vparent_ptr int
select @vparent_ptr=parent_ptr from inserted 
if @vparent_ptr>0 
begin
	update data0025 set has_child=1 from data0025
	where rkey=@vparent_ptr
end
set nocount off--增加句2
go


CREATE TRIGGER [data0025_x_5] ON [dbo].[data0025] 
WITH ENCRYPTION
after delete
AS
	set nocount on--增加句1
	declare @vparent_ptr int
	select @vparent_ptr=parent_ptr from deleted 
	if @vparent_ptr>0
	begin
		update data0025 set has_child=0 from data0025
		where rkey=@vparent_ptr and rkey not in (select isnull(parent_ptr,0) from data0025 where parent_ptr =@vparent_ptr)
	end
go


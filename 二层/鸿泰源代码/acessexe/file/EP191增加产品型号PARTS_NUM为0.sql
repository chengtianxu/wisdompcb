EP191增加产品型号PARTS_NUM为0
SELECT PARTS_NUM,* FROM data0025 
--WHERE PARTS_NUM=0 
ORDER BY 2 DESC

SELECT * FROM data0050 P0B001662
--下面是增加25表的语句
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0025" 
("MANU_PART_NUMBER","MANU_PART_DESC","ANCESTOR_PTR","PARENT_PTR","REMARK","PROD_CODE_PTR","OPT_LOT_SIZE","EST_SCRAP","SHELF_LIFE","REVIEW_DAYS") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(9),@P2 varchar(2),@P3 int,@P4 int,@P5 varchar(1),@P6 int,@P7 int,@P8 float,@P9 int,@P10 smallint',
'P0B001662','12',13156,0,'',38,50,1,7,360

----触发器在Trigger_for_data0025(PCB专用).sql

------------------------修改原值

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

---------------------------
--修改后的触发器
CREATE TRIGGER [data0025_x_1] ON [dbo].[data0025] 
WITH ENCRYPTION
after insert
AS
set nocount on--增加句1
declare @vqty int
select @vqty=parts_num from inserted 
if @vqty<=1
BEGIN

update data0025 set parts_num=1 from data0025,inserted where  data0025.rkey=inserted.rkey --SZMEITAN增加的,也可以修改默认值为1（后者方法较好）

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


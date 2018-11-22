EP056在途量和库存
--在途量
SELECT Data0071.INVT_PTR,
SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN) as qty_zaitu
FROM Data0071 INNER JOIN
Data0070 ON Data0071.PO_PTR = Data0070.RKEY
WHERE Data0070.STATUS = 5 -- 1='待审核',2='被退回',3='已审核',5= '已审核',6='已收货',7='已完成',8='未提交'
and isnull(data0071.status,1) = 1 and data0071.invt_ptr=388 --0 then '已关闭' else '正常'
GROUP BY dbo.Data0071.INVT_PTR





SELECT Data0071.INVT_PTR,data0017.INV_PART_NUMBER,
SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN) as qty_zaitu
FROM Data0071 INNER JOIN
Data0070 ON Data0071.PO_PTR = Data0070.RKEY
LEFT JOIN data0017 ON data0071.INVT_PTR=data0017.RKEY
WHERE Data0070.STATUS = 5 -- 1='待审核',2='被退回',3='已审核',5= '已审核',6='已收货',7='已完成',8='未提交'
and isnull(data0071.status,1) = 1 --and data0071.invt_ptr=388 --0 then '已关闭' else '正常'

GROUP BY dbo.Data0071.INVT_PTR,data0017.INV_PART_NUMBER

having SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN)>0


--------------------------------------

--库存

UPDATE data0017 SET quan_on_hand =0
go

UPDATE data0017
SET quan_on_hand =
          (SELECT SUM(quan_on_hand+QUAN_TO_BE_STOCKED)
         FROM data0022
         GROUP BY data0022.inventory_ptr
         HAVING data0017.rkey = data0022.inventory_ptr)
FROM data0017, data0022
WHERE data0017.rkey = data0022.inventory_ptr
go

CREATE TRIGGER [data0022_1] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR insert
AS
update data0017 set quan_on_hand =data0017.quan_on_hand  +
(Select sum(quan_on_hand+QUAN_TO_BE_STOCKED ) from inserted 
group by inserted.inventory_ptr 
having  data0017.rkey = inserted.inventory_ptr)
from data0017,inserted
where  data0017.rkey = inserted.inventory_ptr
go


CREATE TRIGGER [data0022_2] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR update
AS
if update (quan_on_hand)or update (QUAN_TO_BE_STOCKED)
begin
update data0017 set quan_on_hand =data0017.quan_on_hand  +
(Select sum(quan_on_hand+QUAN_TO_BE_STOCKED ) from inserted 
group by inserted.inventory_ptr 
having  data0017.rkey = inserted.inventory_ptr)
from data0017,inserted
where  data0017.rkey = inserted.inventory_ptr

update data0017 set quan_on_hand =data0017.quan_on_hand -
(Select sum(quan_on_hand+QUAN_TO_BE_STOCKED ) from deleted 
group by deleted.inventory_ptr
having  data0017.rkey = deleted.inventory_ptr)
from data0017,deleted
where  data0017.rkey = deleted.inventory_ptr
end
go



CREATE TRIGGER [data0022_3] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR delete
AS
update data0017 set quan_on_hand =data0017.quan_on_hand -
(Select sum(quan_on_hand+QUAN_TO_BE_STOCKED ) from deleted 
group by deleted.inventory_ptr
having  data0017.rkey = deleted.inventory_ptr)
from data0017,deleted
where  data0017.rkey = deleted.inventory_ptr
go

UPDATE data0071
SET RECD_DATE =
          (SELECT MAX(TDATE)
         FROM data0022
		 where isnull(data0022.invoice_ptr,0)<=0
         GROUP BY data0022.source_ptr
         HAVING data0071.rkey = data0022.source_ptr)
FROM data0071, data0022
WHERE data0071.rkey = data0022.source_ptr

go
CREATE TRIGGER [data0022_4] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR insert
AS
declare @vnum int
select @vnum=count(*) from  inserted where source_ptr>0
if @vnum>0 
UPDATE data0071 SET RECD_DATE =
          (SELECT MAX(data0022.TDATE)
         FROM data0022
         where data0022.source_ptr in (select source_ptr from inserted where source_ptr>0)
		 and isnull(data0022.invoice_ptr,0)<=0
         GROUP BY data0022.source_ptr
	 having data0071.rkey = data0022.source_ptr)
FROM data0071, inserted
WHERE data0071.rkey = inserted.source_ptr
go


CREATE TRIGGER [data0022_5] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR update
AS
if update (tdate)
begin
declare @vnum int
select @vnum=count(*) from  inserted where source_ptr>0
if @vnum>0 
UPDATE data0071 SET RECD_DATE =
          (SELECT MAX(data0022.TDATE)
         FROM data0022
         where data0022.source_ptr in (select source_ptr from inserted where source_ptr>0)
		 and isnull(data0022.invoice_ptr,0)<=0
         GROUP BY data0022.source_ptr
	 having data0071.rkey = data0022.source_ptr)
FROM data0071, inserted
WHERE data0071.rkey = inserted.source_ptr
end
go



CREATE TRIGGER [data0022_6] ON [dbo].[data0022] 
WITH ENCRYPTION
FOR delete
AS
declare @vnum int
select @vnum=count(*) from  deleted where source_ptr>0
if @vnum>0 
UPDATE data0071 SET RECD_DATE =
          (SELECT MAX(data0022.TDATE)
         FROM data0022
         where data0022.source_ptr in (select source_ptr from deleted where source_ptr>0)
		 and isnull(data0022.invoice_ptr,0)<=0
         GROUP BY data0022.source_ptr
	 having data0071.rkey = data0022.source_ptr)
FROM data0071, deleted
WHERE data0071.rkey = deleted.source_ptr
go
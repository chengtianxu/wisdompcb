53表有库存，但特殊出仓显示库存为0

在EP300中显示库存为DATA0050.QTY_0N_HAND，为这个类型的总库存
在53表里有一个解发器，当这个触发器丢失时，这个数就不准了

trigger_ep164_Data0053


IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'qty_allocated') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0053'))) 
begin
ALTER TABLE DATA0053 ADD qty_allocated int default(0) not null
END--预分配
go

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'qty_alloc') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0050'))) 
begin
ALTER TABLE DATA0050 ADD qty_alloc int default(0) not NULL--待出仓
end
go

IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'parts_alloc') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0060'))) 
begin
ALTER TABLE DATA0060 ADD parts_alloc int default(0) not null
end
go


IF not EXISTS (
SELECT name
FROM syscolumns
WHERE (name = 'LAST_FG_INDATE') AND (id IN
          (SELECT id
         FROM sysobjects
         WHERE name = 'data0050'))) 
begin
ALTER TABLE DATA0050 ADD LAST_FG_INDATE datetime null
end
go

-- =============================================
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'ep164_data0053_1' 
	   AND 	  type = 'TR')
    DROP TRIGGER ep164_data0053_1
GO
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'ep164_data0053_2' 
	   AND 	  type = 'TR')
    DROP TRIGGER ep164_data0053_2
GO
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'ep164_data0053_3' 
	   AND 	  type = 'TR')
    DROP TRIGGER ep164_data0053_3
GO


update data0050 set qty_on_hand=0
UPDATE data0050
SET qty_on_hand =
          (SELECT SUM(qty_on_hand)
         FROM data0053
         GROUP BY data0053.cust_part_ptr
         HAVING data0050.rkey = data0053.cust_part_ptr)
FROM data0050, data0053
WHERE data0050.rkey = data0053.cust_part_ptr
GO

update data0050 set qty_alloc=0
UPDATE data0050
SET qty_alloc =
          (SELECT SUM(qty_allocated)
         FROM data0053
         GROUP BY data0053.cust_part_ptr
         HAVING data0050.rkey = data0053.cust_part_ptr)
FROM data0050, data0053
WHERE data0050.rkey = data0053.cust_part_ptr
GO




UPDATE data0050
SET last_fg_indate =
          (SELECT max(mfg_date)
         FROM data0053
         GROUP BY data0053.cust_part_ptr
         HAVING data0050.rkey = data0053.cust_part_ptr)
FROM data0050, data0053
WHERE data0050.rkey = data0053.cust_part_ptr
GO

CREATE TRIGGER [ep164_data0053_1] ON [dbo].[data0053] 
WITH ENCRYPTION
FOR insert
AS
set nocount on--增加句1
UPDATE data0050 SET qty_on_hand =data0050.qty_on_hand  + (SELECT SUM(inserted.qty_on_hand)
         FROM inserted
         GROUP BY inserted.cust_part_ptr
         HAVING data0050.rkey = inserted.cust_part_ptr),last_fg_indate=getdate()
FROM data0050, inserted
WHERE data0050.rkey = inserted.cust_part_ptr

set nocount off
GO


CREATE TRIGGER [ep164_data0053_2] ON [dbo].[data0053] 
WITH ENCRYPTION
FOR update
AS
set nocount on--增加句1
if update(qty_on_hand) or update(qty_allocated)
begin
UPDATE data0050 SET 
qty_on_hand =data0050.qty_on_hand  - (SELECT SUM(deleted.qty_on_hand)
         FROM deleted
         GROUP BY deleted.cust_part_ptr
         HAVING data0050.rkey = deleted.cust_part_ptr),
qty_alloc =data0050.qty_alloc  - (SELECT SUM(deleted.qty_ALLOCATED)
         FROM deleted
         GROUP BY deleted.cust_part_ptr
         HAVING data0050.rkey = deleted.cust_part_ptr)
FROM data0050, deleted
WHERE data0050.rkey = deleted.cust_part_ptr


UPDATE data0050 SET 
qty_on_hand =data0050.qty_on_hand  + (SELECT SUM(inserted.qty_on_hand)
         FROM inserted
         GROUP BY inserted.cust_part_ptr
         HAVING data0050.rkey = inserted.cust_part_ptr),
qty_alloc =data0050.qty_alloc  + (SELECT SUM(inserted.qty_ALLOCATED)
         FROM inserted
         GROUP BY inserted.cust_part_ptr
         HAVING data0050.rkey = inserted.cust_part_ptr)
FROM data0050, inserted
WHERE data0050.rkey = inserted.cust_part_ptr

set nocount off
end
GO



CREATE TRIGGER [ep164_data0053_3] ON [dbo].[data0053] 
WITH ENCRYPTION
FOR delete
AS
set nocount on--增加句1
UPDATE data0050 SET 
qty_on_hand =data0050.qty_on_hand  - (SELECT SUM(deleted.qty_on_hand)
         FROM deleted
         GROUP BY deleted.cust_part_ptr
         HAVING data0050.rkey = deleted.cust_part_ptr),
qty_alloc =data0050.qty_alloc  - (SELECT SUM(deleted.qty_ALLOCATED)
         FROM deleted
         GROUP BY deleted.cust_part_ptr
         HAVING data0050.rkey = deleted.cust_part_ptr)
FROM data0050, deleted
WHERE data0050.rkey = deleted.cust_part_ptr
set nocount off
GO

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'data0053_1' 
	   AND 	  type = 'TR')
    DROP TRIGGER data0053_1
GO
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'data0053_2' 
	   AND 	  type = 'TR')
    DROP TRIGGER data0053_2
GO
IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'data0053_3' 
	   AND 	  type = 'TR')
    DROP TRIGGER data0053_3
GO



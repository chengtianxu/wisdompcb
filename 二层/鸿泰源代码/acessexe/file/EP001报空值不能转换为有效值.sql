EP001报空值不能转换为有效值
原因
一、SETS_QTY为空

--EP082修改SETS_QTY
if not exists(select t2.name
              From syscolumns t1 inner join
                   sysobjects t2 on t1.id=t2.id
              where t1.name='SETS_QTY'
                and t2.name='DATA0056')
begin
ALTER TABLE DATA0056 ADD SETS_QTY INT null
ALTER TABLE DATA0048 ADD SETS_QTY INT null
ALTER TABLE DATA0006 ADD SETS_QTY INT null,parts_per_set INT null
ALTER TABLE DATA0156 ADD SETS_QTY INT null
alter table data0041 add prod_sets decimal(8,1) null
end
go


update data0006 set parts_per_set=data0047.parameter_value from data0006,data0047,data0278 where data0006.bom_ptr=data0047.source_pointer
and data0047.parameter_ptr=data0278.rkey
and data0278.spec_rkey='B'
AND DATA0006.ENT_DATETIME>GETDATE()-180
and parts_per_set is null
UPDATE DATA0006 SET SETS_QTY=CEILING(QUAN_SCH/parts_per_set) WHERE parts_per_set>0 and data0006.sets_qty is null
UPDATE DATA0056 SET SETS_QTY=CEILING(QTY_BACKLOG/DATA0006.parts_per_set) 
FROM DATA0056,DATA0006
WHERE DATA0056.WO_PTR=DATA0006.RKEY
AND DATA0006.parts_per_set>0
and data0056.sets_qty is null
GO
二、DEPT_PTR 为空
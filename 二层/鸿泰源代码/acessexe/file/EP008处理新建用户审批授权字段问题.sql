--领料单审批授权
if not exists(select t1.name from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='Data0073' and t2.name='RPL_BO_PTR')
begin
	ALTER  TABLE Data0073 ADD RPL_BO_PTR int null
END
GO
--客户退货审批授权
if not exists(select t1.name from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='Data0073' and t2.name='Return_SO_PTR')
begin
	ALTER  TABLE Data0073 ADD Return_SO_PTR int null
END
GO
  update Data0073 set Return_SO_PTR=rkey where Return_SO_PTR is null
GO

--采购变更单审批转授权
IF not EXISTS (
SELECT name FROM syscolumns
WHERE (name = 'rpl_PoBg_ptr') AND (id IN
          (SELECT id FROM sysobjects WHERE name = 'data0073'))) 
begin
alter table data0073 add rpl_PoBg_ptr int default null
end
go

update data0073 set rpl_PoBg_ptr=rkey where rpl_PoBg_ptr is null
go

--出货审批授权0120616LLL
if not exists(select t1.name from sysobjects t1 inner join
                   syscolumns t2 on t1.id=t2.id
              where t1.name='Data0073' and t2.name='packing_out_ptr')
begin
	ALTER  TABLE Data0073 ADD packing_out_ptr int null
END
GO
update Data0073 set packing_out_ptr=rkey where packing_out_ptr  is null
GO


update data0073 set RPL_QO_PTR=rkey where (RPL_QO_PTR is null or RPL_QO_PTR='')
update data0073 set RPL_BO_PTR=rkey where (RPL_BO_PTR is null or RPL_BO_PTR='')
update data0073 set RPL_SO_PTR=rkey where (RPL_SO_PTR is null or RPL_SO_PTR='')
update data0073 set Return_SO_PTR=rkey where (Return_SO_PTR is null or Return_SO_PTR='')
update data0073 set rpl_PoBg_ptr=rkey where (rpl_PoBg_ptr is null or rpl_PoBg_ptr='')
update data0073 set packing_out_ptr=rkey where (packing_out_ptr is null or packing_out_ptr='')
update data0073 set rpl_pr_ptr=rkey where (rpl_pr_ptr is null or rpl_pr_ptr='')
update data0073 set rpl_po_ptr=rkey where (rpl_po_ptr is null or rpl_po_ptr='')


select * from data0073

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = 'DATA0073_1' 
	   AND 	  type = 'TR')
    DROP TRIGGER DATA0073_1
GO

CREATE TRIGGER [DATA0073_1] ON [dbo].[DATA0073] 
WITH ENCRYPTION
FOR insert
AS
   update data0073 set RPL_QO_PTR=data0073.rkey,RPL_BO_PTR=data0073.rkey,
    RPL_SO_PTR=data0073.rkey,Return_SO_PTR=data0073.rkey,rpl_PoBg_ptr=data0073.rkey,packing_out_ptr=data0073.rkey,
    rpl_pr_ptr=data0073.rkey,rpl_po_ptr=data0073.rkey
   from data0073,inserted
   where  data0073.rkey=inserted.rkey
go

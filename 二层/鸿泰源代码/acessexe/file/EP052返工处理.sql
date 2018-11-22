从MRB返工处理
exec sp_executesql N'declare @vwhse_ptr int
set @vwhse_ptr=@P1
declare @vflag int
select @vflag=isnull(RMA_NoMRB,0) from data0195
if @vflag=1
  Select Data0098.CUSTOMER_PART_PTR as custpart_ptr,data0098.actual_Retn_Qty as qty_to_be_reworked,data0098.Qty_ISSUED as qty_reworked,
  data0098.rma_date as sys_date,data0050.customer_part_number,data0050.cp_rev, data0098.rkey as rma_ptr,null as rkey,
  data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,data0098.rewk_flag,
  null as type,null as status,Data0098.CUSTOMER_PTR,
  null as qty_to_be_remaked,null as qty_remaked,
  null as qty_to_be_stocked,null as qty_stocked,cast('''' as varchar(200)) as reference
  from  Data0098
    left join Data0050 on Data0098.CUSTOMER_PART_PTR=Data0050.rkey
    left join Data0010 on Data0098.CUSTOMER_PTR =Data0010.rkey
    left join Data0059 on Data0098.CUSTOMER_PART_PTR= data0059.cust_part_ptr
      and Data0059.customer_ptr= Data0098.CUSTOMER_PTR
  where isnull(data0098.actual_Retn_Qty,0)>isnull(data0098.Qty_ISSUED,0) and isnull(data0098.rewk_flag,0)=0 and data0098.rma_status in (2,3,4,5,6)
  and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
  union all
  Select Data0415.custpart_ptr,data0414.qty_to_be_reworked,data0414.qty_reworked,
  data0414.sys_date,data0050.customer_part_number,data0050.cp_rev, data0414.rma_ptr,data0414.rkey,
  data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,null as rewk_flag,
  data0415.type,data0414.status,data0415.customer_ptr,
  data0414.qty_to_be_remaked,data0414.qty_remaked,
  data0414.qty_to_be_stocked,data0414.qty_stocked,cast(data0414.reference as varchar(200)) as reference
  From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
  where  data0414.qty_to_be_reworked>data0414.qty_reworked
  and data0414.status=2 --and isnull(data0415.type,3)<>3
  and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
  order by data0414.sys_date
  
if @vflag=0
  Select Data0098.CUSTOMER_PART_PTR as custpart_ptr,data0414.qty_to_be_reworked,data0414.qty_reworked,
  data0414.sys_date,data0050.customer_part_number,data0050.cp_rev, data0414.rma_ptr,data0414.rkey,
  data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,data0098.rewk_flag,
  isnull(data0415.type,3) as type,data0414.status,Data0098.CUSTOMER_PTR,
  data0414.qty_to_be_remaked,data0414.qty_remaked,
  data0414.qty_to_be_stocked,data0414.qty_stocked,cast('''' as varchar(200)) as reference
  from data0414 left join Data0098 ON Data0414.rma_ptr=Data0098.rkey
    left join Data0050 on Data0098.CUSTOMER_PART_PTR=Data0050.rkey
    left join Data0010 on Data0098.CUSTOMER_PTR =Data0010.rkey
    left join Data0059 on Data0098.CUSTOMER_PART_PTR= data0059.cust_part_ptr
      and Data0059.customer_ptr= Data0098.CUSTOMER_PTR
    left join Data0415 on data0414.d415_ptr=data0415.rkey
  where data0414.qty_to_be_reworked>data0414.qty_reworked and data0414.status=3
    and isnull(data0415.type,3)=3
  and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
  union all
  Select Data0415.custpart_ptr,data0414.qty_to_be_reworked,data0414.qty_reworked,
  data0414.sys_date,data0050.customer_part_number,data0050.cp_rev, data0414.rma_ptr,data0414.rkey,
  data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,null as rewk_flag,
  data0415.type,data0414.status,data0415.customer_ptr,
  data0414.qty_to_be_remaked,data0414.qty_remaked,
  data0414.qty_to_be_stocked,data0414.qty_stocked,cast(data0414.reference as varchar(200)) as reference
  From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
  where  data0414.qty_to_be_reworked>data0414.qty_reworked
  and data0414.status=2 
  and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
  --and isnull(data0415.type,3)<>3
  order by data0414.sys_date

',N'@P1 varchar(16)','0'
-------------------------------------
--从成品仓（已出仓）
exec sp_executesql N'declare @vwhse_ptr int
set @vwhse_ptr=@P1
Select data0415.rkey,Data0415.custpart_ptr,Data0415.qty_rewked as qty_reworked,DATA0415.SYS_DATE,
data0050.customer_part_number,data0050.cp_rev,data0415.quantity,
data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,
data0415.type,data0415.status,data0415.customer_ptr,data0414.reference
 From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
where data0415.status=3
and data0415.type in (3,4)
and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
order by data0415.sys_date

 
',N'@P1 smallint',0
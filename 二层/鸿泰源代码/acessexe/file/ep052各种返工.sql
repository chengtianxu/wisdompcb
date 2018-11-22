--1\EP052 生产入仓\工作单返工、从成品仓未出仓       exec ep300;2 4,'2'
--
--2特殊出仓审核后\工作单返工、从成品仓已经出仓
--
--3如果EP078不良品\  工作单返工\从MRB可以看到
--4如果EP078不良品\ 人工投产编号、按照MRB      exec EP052;9 0,0
--

-----------------------1-----------------------------
create PROCEDURE ep300;2
       @rkey50 int,
       @type tinyint  --data0416.ttype入仓类型1,直接2生产3委外4退货5转换6盘点
with encryption
AS
SELECT
  Data0053.RKEY as Data0053RKEY,data0053.WO_DATECODE,
  Data0015.ABBR_NAME as Data0015ABBR_NAME,isnull(data0053.customer_ptr,0) as customer_ptr_53,
  data0010.CUST_CODE,data0010.ABBR_NAME,
  Data0016.CODE as Data0016CODE,data0016.location,Data0416.type,
  Data0006.WORK_ORDER_NUMBER as Data0006WORK_ORDER_NUMBER,
  Data0053.REFERENCE_NUMBER as Data0053REFERENCE_NUMBER,
  Data0053.MFG_DATE as Data0053MFG_DATE,data0492.so_no,Data0060.PARTS_ORDERED,
 -- Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC as QTY_AVAIL,
  --(Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC)/data0047.PARAMETER_VALUE as QTY_SET_AVAIL,
  (Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC-Data0053.qty_allocated) as QTY_AVAIL,--可用库存减去特殊出仓占用数量-预分配数量QTY_ALLOC-qty_allocated20131231
  (Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC-Data0053.qty_allocated)/data0047.PARAMETER_VALUE as QTY_SET_AVAIL,
  ISNULL(DATA0047.PARAMETER_VALUE,0) AS P_VALUE,
  Data0053.QTY_ON_HAND as Data0053QTY_ON_HAND,Data0053.qty_allocated,
  Data0053.QTY_ALLOC as Data0053QTY_ALLOC,
  Data0025.REVIEW_DAYS as Data0050SHELF_LIFE,
 ( select a.rma_ptr from data0416 a ,data0098 b
  where  a.type =4
  and a.rma_ptr=b.rkey and a.Rkey=data0053.NPAD_PTR ) as Rma_Ptr ,

( select  b.Rma_number from data0416 a ,data0098 b
  where  a.type =4
  and a.rma_ptr=b.rkey and a.Rkey=data0053.NPAD_PTR ) as Rma_Name ,
  Data0006.RKEY as Data0006RKEY,cast(0 as bit) as choose_flag,
  cast(0 as integer) as quantity 
into #test00
FROM
  Data0053 inner join Data0015 on Data0053.WHSE_PTR = Data0015.RKEY
           inner join Data0016 on Data0053.LOC_PTR = Data0016.RKEY
           left outer join Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY
           left join Data0492 on data0006.CUT_NO=data0492.CUT_NO
           left join Data0060 on data0492.so_no =data0060.sales_order 
           left outer join Data0025 on Data0053.CUST_PART_PTR = Data0025.ANcESTOR_PTR
           And Data0025.parent_ptr = 0
           left join data0047 on data0047.SOURCE_POINTER=data0025.rkey and data0047.PARAMETER_PTR=3
           left join Data0416 on Data0416.Rkey=data0053.NPAD_PTR
           left join data0010 on data0053.customer_ptr=data0010.rkey 
WHERE
 (Data0053.QTY_ON_HAND - isnull(Data0053.QTY_ALLOC,0)) > 0 and
  (Data0053.CUST_PART_PTR = @rkey50)
  and exists (select 1 from data0416 
              where data0416.rkey=data0053.NPAD_PTR 
                and(data0416.type=@type or (@type =1 and Data0416.type<>4) or (@type =2 and Data0416.type<>4)))
Order by Data0053.MFG_DATE
select * from #test00
drop table #test00
GO
------------------------2--------------------------------
exec sp_executesql N'declare @vwhse_ptr int
set @vwhse_ptr=@P1
Select data0415.rkey,Data0415.custpart_ptr,Data0415.qty_rewked as qty_reworked,DATA0415.SYS_DATE,
data0050.customer_part_number,data0050.cp_rev,data0415.quantity,data0414.qty_to_be_stocked,data0414.qty_to_be_reworked,
data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,data0414.rkey as d14rkey,
data0415.type,data0415.status,data0415.customer_ptr,data0414.reference
 From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
where data0415.status=3 --状态1,2,3,4,5待提交,待出仓,已出仓,已重检,被退回
and data0415.type in (3,4) --出仓类型1,直接出仓2退货出仓（委外）3退货重检4正常重检出到MRB 11入仓反审
and (@vwhse_ptr=0 or ISNULL(data0050.whse_ptr,0)=0 or Data0050.whse_ptr=@vwhse_ptr)
order by data0415.sys_date

 
',N'@P1 varchar(16)','0'

-----------3------------------------
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
  order by sys_date
  
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



-----------4------------------------
exec EP052;9 0,0

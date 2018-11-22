--EP0300查出来的可用库存与EP069库存查询不一样
--EP0300 ()Data0053.QTY_ON_HAND - isnull(Data0053.QTY_ALLOC,0))>0 当这个为负数时Data0053.QTY_ALLOC
--EP069 Data0053.QTY_ON_HAND>0
create PROCEDURE ep300;2
       @rkey50 int,
       @type tinyint 
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

GO
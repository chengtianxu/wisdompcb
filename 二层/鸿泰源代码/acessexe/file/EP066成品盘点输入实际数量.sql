--exec ep066;2 15


--create PROCEDURE ep066;2   --盘点明细 
declare
       @rkey int=15 --data0214.rkey 盘点指针
--with encryption
--AS
declare @strsql varchar(8000)
declare @flag int
select @flag=ep066_OrderBy from Data0195

select @strsql='
SELECT Data0215.RKEY,data0215.check_no,data0053.mfg_date,
      Data0050.CUSTOMER_PART_NUMBER,Data0416.Type,
      Data0050.CP_REV, isnull(D59.customer_part_desc,data0059.customer_part_desc) as customer_part_desc,
      isnull(d59.rkey,isnull(vdata0059.rkey,0)) as rkey_59,
      Data0006.WORK_ORDER_NUMBER,--Data0010.CUST_CODE,更改2006-3-9
      Data0053.QTY_ON_HAND,Data0005.EMPLOYEE_NAME,
      Data0215.COUNTED_BY_EMPL_PTR,Data0215.QUANTITY,
      data0016.code,Data0016.LOCATION,data0053.REFERENCE_NUMBER,
      data0215.custpart_ptr,data0215.location_ptr,
      data0050.LATEST_PRICE,data0050.unit_sq,
      Data0053.QTY_ON_HAND* data0050.unit_sq as mianji
      ,Data0008.PROD_CODE --产品类别
      ,data0010.ABBR_NAME 
From Data0215 INNER JOIN
     Data0050 on Data0215.CUSTPART_PTR = Data0050.RKEY INNER JOIN
     Data0053 on Data0215.CUSTPART_BATCH_PTR = Data0053.RKEY 
    INNER JOIN  Data0025 on Data0050.Rkey=Data0025.ANCESTOR_PTR
             and Data0025.PARENT_PTR = 0 
    left JOIN  vData0059 on data0050.rkey=vdata0059.cust_part_ptr 
     left join  Data0059 on vdata0059.rkey=data0059.rkey 
   left join  data0059  D59 on data0053.CUST_PART_PTR=D59.cust_part_ptr and (data0053.customer_ptr=D59.customer_ptr)
    left join   Data0005 ON Data0215.COUNTED_BY_EMPL_PTR = Data0005.RKEY 
    LEFT JOIN   Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY 
    left join  Data0016 ON Data0215.location_ptr = Data0016.RKEY left join
     Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey left join
     Data0416 on Data0053.NPAD_PTR=Data0416.Rkey
     left join data0010 on vdata0059.customer_ptr=data0010.rkey 
WHERE Data0215.FG_LIST_PTR ='+convert(varchar,@rkey)
if @flag = 0 
  select @strsql = @strsql +' ORDER BY Data0050.CUSTOMER_PART_NUMBER,data0053.mfg_date,Data0016.LOCATION,data0053.REFERENCE_NUMBER'
if @flag = 1 
  select @strsql = @strsql +' ORDER BY Data0016.LOCATION,data0053.REFERENCE_NUMBER,Data0050.CUSTOMER_PART_NUMBER,data0053.mfg_date'


exec(@strsql)
GO

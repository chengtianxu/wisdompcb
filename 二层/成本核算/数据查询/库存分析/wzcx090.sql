if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[wzcx090]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop PROCEDURE wzcx090
GO

CREATE PROCEDURE wzcx090;1
AS
 select data0444.*,data0005.employee_name
 from data0444 left outer join data0005
        on data0444.cut_by=data0005.rkey
 order by cut_date
GO

CREATE PROCEDURE wzcx090;2
AS
  select rkey,pct_date from data0443
GO

CREATE PROCEDURE wzcx090;3
@vptr int
AS
SELECT TOP 100 PERCENT dbo.Data0448.RKEY, dbo.Data0448.WO_PTR, 
      dbo.Data0448.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PART_NUMBER, 
      dbo.Data0448.unit_sq, dbo.Data0008.PROD_CODE, dbo.Data0010.CUST_CODE, 
      dbo.Data0034.DEPT_CODE, dbo.Data0448.STEP, dbo.Data0448.SO_NO, 
      dbo.Data0448.CUT_NO, dbo.Data0448.QUANTITY, dbo.Data0448.INDATE, 
      dbo.Data0448.UNIT_PRICE AS latest_price, 
      dbo.Data0448.ACT_MATL_COST_PER_PCS AS std_matl_cost_per_pcs, 
      dbo.Data0448.ACT_OVHD_COST_PER_PCS AS std_ovhd_cost_per_pcs, 
      dbo.Data0025.MANU_PART_DESC, dbo.Data0010.ABBR_NAME, 
      dbo.Data0034.DEPT_NAME
FROM dbo.Data0448 INNER JOIN
      dbo.Data0025 ON 
      dbo.Data0448.MANU_PART_PTR = dbo.Data0025.RKEY INNER JOIN
      dbo.Data0010 ON dbo.Data0448.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN
      dbo.Data0034 ON dbo.Data0448.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY
WHERE (dbo.Data0448.D0444_PTR = @vptr)
ORDER BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0034.DEPT_CODE, 
      dbo.Data0448.WORK_ORDER_NUMBER
GO

CREATE PROCEDURE wzcx090;4
@vptr int
--with encryption
AS
  select data0008.prod_code,data0008.product_name,
    sum(data0448.quantity*data0448.std_matl_cost_per_pcs) as std_matl_cost,
    sum(data0448.quantity*data0448.std_ovhd_cost_per_pcs) as std_ovhd_cost,
    sum(data0448.quantity*data0448.unit_price) as sales_amount
  from data0448,data0025,data0008
  where data0448.d0444_ptr=@vptr
    and data0448.manu_part_ptr=data0025.rkey
    and data0025.prod_code_ptr=data0008.rkey
  group by data0008.prod_code,data0008.product_name
  order by sales_amount desc

/*
FROM Data0448 INNER JOIN
      Data0025 ON 
      Data0448.MANU_PART_PTR = Data0025.RKEY INNER JOIN
      Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY
WHERE (Data0448.D0444_PTR = @vptr)
*/
GO

CREATE PROCEDURE wzcx090;5
@vptr int
--with encryption
AS
  select data0010.cust_code,data0010.customer_name,data0050.customer_part_number,data0050.cp_rev,
    sum(data0448.quantity*data0448.std_matl_cost_per_pcs) as std_matl_cost,
    sum(data0448.quantity*data0448.std_ovhd_cost_per_pcs) as std_ovhd_cost,
    sum(data0448.quantity*data0448.unit_price) as sales_amount
  

  from data0448,data0010,data0050
  where data0448.d0444_ptr=@vptr
    and data0448.customer_ptr=data0010.rkey
    and data0448.customer_part_ptr=data0050.rkey
  group by data0010.cust_code,data0010.customer_name,data0050.customer_part_number,data0050.cp_rev
  order by data0050.customer_part_number,data0050.cp_rev
GO

CREATE PROCEDURE wzcx090;6
 @vptr int
AS
SELECT TOP 100 PERCENT dbo.Data0025.MANU_PART_NUMBER, 
      dbo.Data0025.MANU_PART_DESC, dbo.Data0010.CUST_CODE, 
      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0016.CODE, dbo.Data0449.unit_sq, 
      dbo.Data0008.PROD_CODE,  dbo.Data0449.INDATE,
 dbo.Data0449.ACT_MATL_COST_PER_PCS AS std_matl_cost_per_pcs, 
      dbo.Data0449.ACT_OVHD_COST_PER_PCS AS std_ovhd_cost_per_pcs, 
      dbo.Data0449.UNIT_PRICE, dbo.Data0449.RMA_NUMBER, dbo.Data0449.WO_PTR, 
      dbo.Data0449.QUANTITY AS quan_on_hand, 
      dbo.Data0449.WORK_ORDER_NUMBER
FROM dbo.Data0008 INNER JOIN
      dbo.Data0025 ON 
      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN
      dbo.Data0449 INNER JOIN
      dbo.Data0010 ON dbo.Data0449.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN
      dbo.Data0015 ON dbo.Data0449.WHOUSE_PTR = dbo.Data0015.RKEY INNER JOIN
      dbo.Data0016 ON dbo.Data0449.LOCATION_PTR = dbo.Data0016.RKEY ON 
      dbo.Data0025.RKEY = dbo.Data0449.CUSTOMER_PART_PTR
WHERE (dbo.Data0449.D0444_PTR = @vptr)
ORDER BY dbo.Data0449.WORK_ORDER_NUMBER, dbo.Data0449.INDATE
GO

CREATE PROCEDURE wzcx090;7
@vptr int
AS
SELECT TOP 100 PERCENT dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, 
      SUM(dbo.Data0449.QUANTITY) AS quantity, 
      SUM(dbo.Data0449.QUANTITY * dbo.Data0449.unit_sq) AS sqft, 
      SUM(dbo.Data0449.QUANTITY * dbo.Data0449.ACT_MATL_COST_PER_PCS) 
      AS std_matl_cost, 
      SUM(dbo.Data0449.QUANTITY * dbo.Data0449.ACT_OVHD_COST_PER_PCS) 
      AS std_ovhd_cost, SUM(dbo.Data0449.QUANTITY * dbo.Data0449.UNIT_PRICE) 
      AS sales_amount
FROM dbo.Data0008 INNER JOIN
      dbo.Data0025 ON 
      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN
      dbo.Data0449 ON 
      dbo.Data0025.RKEY = dbo.Data0449.CUSTOMER_PART_PTR
WHERE (dbo.Data0449.D0444_PTR = @vptr)
GROUP BY dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME
ORDER BY sales_amount DESC
GO

CREATE PROCEDURE wzcx090;8
@vptr int
--with encryption
AS
  select data0050.customer_part_number,Data0050.cp_rev,data0025.manu_part_number,
         data0459.work_order_number,data0015.warehouse_code,data0016.code,data0008.prod_code,
         convert(char(10),data0459.indate,101) as indate,
         data0459.act_matl_cost_per_pcs as std_matl_cost_per_pcs,data0459.act_ovhd_cost_per_pcs as std_ovhd_cost_per_pcs,
         --改为以上data0459.std_matl_cost_per_pcs,data0459.std_ovhd_cost_per_pcs,

         data0459.unit_sq,data0459.wo_ptr,
         data0459.quantity as quan_on_hand
  from data0459,data0050,data0025,data0015,data0016,data0008
  where data0459.customer_part_ptr=data0050.rkey
    and data0459.bom_ptr=data0025.rkey
    and data0459.d0444_ptr=@vptr
    and data0459.whouse_ptr=data0015.rkey
    and data0459.location_ptr=data0016.rkey
    and data0025.prod_code_ptr=data0008.rkey
  order by
    data0050.customer_part_number,Data0050.cp_rev,data0025.manu_part_number,
    data0459.work_order_number,data0015.warehouse_code,data0016.code,
    convert(char(10),data0459.indate,101)
GO

CREATE PROCEDURE wzcx090;9
@vptr int
--with encryption
AS
  select data0008.prod_code,data0008.product_name,
    sum(data0459.quantity*data0459.std_matl_cost_per_pcs) as std_matl_cost,
    sum(data0459.quantity*data0459.std_ovhd_cost_per_pcs) as std_ovhd_cost
  from data0459,data0025,data0008
  where data0459.d0444_ptr=@vptr
    and data0459.bom_ptr=data0025.rkey
    and data0025.prod_code_ptr=data0008.rkey
  group by data0008.prod_code,data0008.product_name
GO

CREATE PROCEDURE wzcx090;10
@vptr int
--with encryption
AS
  Select data0496.group_name,data0017.inv_part_number,data0017.inv_part_description,
    data0002.unit_code,data0445.recd_date,data0445.unit_price,
    sum(data0445.quantity) as quantity,
    sum(data0445.quantity*data0445.unit_price) as amount,
    sum(data0445.day366*data0445.unit_price) as day1,
    sum(data0445.day365_271*data0445.unit_price) as day2,
    sum(data0445.day270_181*data0445.unit_price) as day3,
    sum(data0445.day180_91*data0445.unit_price) as day4,
    sum(data0445.day90_31*data0445.unit_price) as day5,
    sum(data0445.day30*data0445.unit_price) as day6
  from data0445,data0017,data0002,data0496
  where data0445.d0444_ptr=@vptr
    and data0445.invent_ptr=data0017.rkey
    and data0017.stock_unit_ptr=data0002.rkey
    and data0017.group_ptr=data0496.rkey
  group by
    data0496.group_name,data0017.inv_part_number,data0017.inv_part_description,
    data0002.unit_code,data0445.recd_date,data0445.unit_price
  order by
    data0496.group_name,data0017.inv_part_number,data0002.unit_code,data0445.recd_date
GO

CREATE PROCEDURE wzcx090;11
@vptr int
AS
SELECT     TOP 100 PERCENT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_CODE, 
                      SUM(dbo.Data0445.QUANTITY) AS quantity, SUM(dbo.Data0445.QUANTITY * dbo.Data0445.UNIT_PRICE) AS amount, AVG(dbo.Data0445.UNIT_PRICE) 
                      AS AVG_UNIT_PRICE
FROM         dbo.Data0445 INNER JOIN
                      dbo.Data0017 ON dbo.Data0445.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN
                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY
WHERE (dbo.Data0445.D0444_PTR = @vptr)
GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, 
      dbo.Data0002.UNIT_CODE
ORDER BY dbo.Data0017.INV_PART_NUMBER
GO

CREATE PROCEDURE wzcx090;12
@vptr int

AS
SELECT TOP 100 PERCENT dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC, 
      SUM(dbo.Data0445.QUANTITY) AS quantity, 
      SUM(dbo.Data0445.QUANTITY * dbo.Data0445.UNIT_PRICE) AS amount
FROM dbo.Data0445 INNER JOIN
      dbo.Data0017 ON dbo.Data0445.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN
      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY
WHERE (dbo.Data0445.D0444_PTR = @vptr)
GROUP BY dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC
ORDER BY dbo.Data0496.GROUP_NAME
GO

CREATE PROCEDURE wzcx090;13
@vptr int
AS
 SELECT TOP 100 PERCENT Data0034.DEPT_CODE, 
      Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, 
      Data0002.UNIT_CODE, Data0462.QUAN, Data0462.STD_PRICE
 FROM Data0462 INNER JOIN
      Data0017 ON Data0462.INVENT_PTR = Data0017.RKEY INNER JOIN
      Data0034 ON Data0462.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY
 WHERE (Data0462.D0443_PTR = @vptr)
 ORDER BY Data0034.DEPT_CODE, Data0017.INV_PART_NUMBER
GO

CREATE PROCEDURE wzcx090;14
@vptr int

AS

 SELECT TOP 100 PERCENT Data0017.INV_PART_NUMBER, 
      Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_CODE, 
      Data0462.STD_PRICE, SUM(Data0462.QUAN) AS quantity, 
      SUM(Data0462.QUAN * Data0462.STD_PRICE) AS amount
 FROM Data0462 INNER JOIN
      Data0017 ON Data0462.INVENT_PTR = Data0017.RKEY INNER JOIN
      Data0034 ON Data0462.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY
 WHERE (Data0462.D0443_PTR = @vptr)
 GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, 
      Data0002.UNIT_CODE, Data0462.STD_PRICE
 ORDER BY Data0017.INV_PART_NUMBER
GO

CREATE PROCEDURE wzcx090;15
@vptr int
AS
  select data0034.dept_code,data0034.dept_name,sum(data0462.quan*data0462.std_price) as amount
  from data0462,data0034,data0017,data0002
  where data0462.d0443_ptr=@vptr
	and data0462.invent_ptr=data0017.rkey
	and data0462.dept_ptr=data0034.rkey
	and data0017.stock_unit_ptr=data0002.rkey
  group by data0034.dept_code,data0034.dept_name
  order by data0034.dept_code
GO

CREATE PROCEDURE wzcx090;16
@vptr int,  
@vstep int
AS
  if @vstep > 0
SELECT TOP 100 PERCENT dbo.Data0451.FM_DATE, dbo.Data0451.END_DATE, 
      dbo.Data0451.ACTUAL_FM_DATE, dbo.Data0451.ACTUAL_END_DATE, 
      dbo.Data0034.DEPT_NAME, dbo.data0410.STEP, dbo.data0410.QTY, 
      dbo.data0410.matl_pcs, dbo.data0410.ovhd_pcs, 
      dbo.data0410.bring_matl_pcs + dbo.data0410.bring_ovhd_pcs AS bring_cost_pcs, 
      dbo.Data0006.BOM_PTR, dbo.data0410.DEPT_PTR, dbo.Data0451.RKEY, 
      dbo.data0410.MATL_AMOUNT, dbo.data0410.ovhd1_AMOUNT, 
      dbo.data0410.ovhd2_AMOUNT, dbo.data0410.ovhd3_AMOUNT, 
      dbo.data0410.bring_matl_pcs, dbo.data0410.bring_ovhd_pcs, 
      dbo.Data0006.RKEY AS reky06, data0006.cut_no,
      (dbo.data0410.matl_pcs + dbo.data0410.ovhd_pcs + dbo.data0410.bring_matl_pcs + dbo.data0410.bring_ovhd_pcs)
       / dbo.data0410.unit_sq AS PcspereEar
FROM dbo.data0410 INNER JOIN
      dbo.Data0451 ON dbo.data0410.D0451_PTR = dbo.Data0451.RKEY INNER JOIN
      dbo.Data0034 ON dbo.data0410.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0006 ON dbo.data0410.WO_PTR = dbo.Data0006.RKEY
WHERE (dbo.Data0410.wo_ptr = @vptr) AND (dbo.data0410.STEP < @vstep)
ORDER BY dbo.data0410.STEP
else
SELECT TOP 100 PERCENT dbo.Data0451.FM_DATE, dbo.Data0451.END_DATE, 
      dbo.Data0451.ACTUAL_FM_DATE, dbo.Data0451.ACTUAL_END_DATE, 
      dbo.Data0034.DEPT_NAME, dbo.data0410.STEP, dbo.data0410.QTY, 
      dbo.data0410.matl_pcs, dbo.data0410.ovhd_pcs, 
      dbo.data0410.bring_matl_pcs + dbo.data0410.bring_ovhd_pcs AS bring_cost_pcs, 
      dbo.Data0006.BOM_PTR, dbo.data0410.DEPT_PTR, dbo.Data0451.RKEY, 
      dbo.data0410.MATL_AMOUNT, dbo.data0410.ovhd1_AMOUNT, 
      dbo.data0410.ovhd2_AMOUNT, dbo.data0410.ovhd3_AMOUNT, 
      dbo.data0410.bring_matl_pcs, dbo.data0410.bring_ovhd_pcs, 
      dbo.Data0006.RKEY AS reky06, data0006.cut_no,
      (dbo.data0410.matl_pcs + dbo.data0410.ovhd_pcs + dbo.data0410.bring_matl_pcs + dbo.data0410.bring_ovhd_pcs)
       / dbo.data0410.unit_sq AS PcspereEar
FROM dbo.data0410 INNER JOIN
      dbo.Data0451 ON dbo.data0410.D0451_PTR = dbo.Data0451.RKEY INNER JOIN
      dbo.Data0034 ON dbo.data0410.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0006 ON dbo.data0410.WO_PTR = dbo.Data0006.RKEY
WHERE (dbo.Data0410.wo_ptr = @vptr) 
ORDER BY dbo.data0410.STEP
GO

CREATE PROCEDURE wzcx090;17
 @cut_no char(12),
 @vdept_ptr int
AS --根据配料单发放的材料成本计算明细

SELECT TOP 100 PERCENT dbo.Data0468.CUT_NO, dbo.Data0017.INV_PART_NUMBER, 
      dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.TDATE, 
      dbo.Data0207.QUANTITY, dbo.Data0022.PRICE, dbo.Data0456.exch_rate, 
      (dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) 
      / (1 + dbo.Data0022.TAX_2 * 0.01) AS amount, dbo.data0492.ISSUED_QTY, 
      (dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) 
      / (1 + dbo.Data0022.TAX_2 * 0.01) / dbo.data0492.ISSUED_QTY AS cost_pcs
FROM dbo.Data0207 INNER JOIN
      dbo.Data0468 ON dbo.Data0207.D0468_PTR = dbo.Data0468.RKEY INNER JOIN
      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY INNER JOIN
      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN
      dbo.data0492 ON dbo.Data0468.CUT_NO = dbo.data0492.CUT_NO INNER JOIN
      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.RKEY
where data0468.dept_ptr=@vdept_ptr and  data0492.CUT_NO=@cut_no
GO

CREATE PROCEDURE wzcx090;18
 @vtdate1 datetime,
 @vtdate2 datetime,
 @vbom_ptr int,
 @vdept_ptr int,
 @vtype int --0在制品,1半成品,2产成品
AS  --根据配料单发放的材料成本计算明细
 if @vtype=0 or @vtype=1 or @vtype=2
   select data0006.work_order_number,data0048.qty_prod
   from data0048,data0006,data0034
   where data0048.wo_ptr=data0006.rkey
         and data0048.fm_dept_ptr=data0034.rkey
         and data0006.bom_ptr=@vbom_ptr
         and data0048.outtime >@vtdate1
         and data0048.outtime <=@vtdate2
         and data0034.dept_ptr=@vdept_ptr
   order by data0006.work_order_number
GO

CREATE PROCEDURE wzcx090;19
 @vdept_ptr int,
 @d451 int,
 @vtype int, --0在制品,1半成品,2产成品
 @OVHD_MTAL_1 varchar(20) output,
 @yield_sqft varchar(20) output,
 @STD_MTAL_1 varchar(20) output,
 @STD_MTAL_2 varchar(20) output 

AS

  set @OVHD_MTAL_1=(select CONVERT(varchar(20),OVHD_MTAL_1) from data0424 where D0451_PTR=@d451 and DEPT_PTR=@vdept_ptr)
  set @yield_sqft=(select CONVERT(varchar(20),yield_sqft) from data0424 where D0451_PTR=@d451 and DEPT_PTR=@vdept_ptr)
  set @STD_MTAL_1=(select CONVERT(varchar(20),STD_MTAL_1) from data0424 where D0451_PTR=@d451 and DEPT_PTR=@vdept_ptr)
  set @STD_MTAL_2=(select CONVERT(varchar(20),STD_MTAL_2) from data0424 where D0451_PTR=@d451 and DEPT_PTR=@vdept_ptr)

 if @vtype=0 or @vtype=1 or @vtype=2 
  SELECT Data0017.INV_PART_DESCRIPTION, data0017.inv_part_number,
                 Data0454.IN_QUANTITY as quantity, Data0454.IN_AMOUNT as actual_cost
                ,data0454.OPEN_QUANTITY  ,data0454.OPEN_AMOUNT
               ,data0454.CLOSED_QTY ,data0454.CLOSED_AMOUNT
  FROM Data0454 INNER JOIN
        Data0017 ON Data0454.INVENT_PTR = Data0017.RKEY inner join 
        data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY
  WHERE (Data0454.D0451_PTR = @d451) 
        AND (Data0454.COST_DEPT_PTR = @vdept_ptr)
       and  (Data0496.ttype = 'P')
GO

CREATE PROCEDURE wzcx090;20
 @vdept_ptr int,
 @d451 int,
 @vtype int --0在制品,1半成品,2产成品
AS
  if @vtype=0 or @vtype=1 or @vtype=2
    SELECT Data0025.MANU_PART_NUMBER, Data0006.WORK_ORDER_NUMBER, 
      data0410.QTY AS QTY_PROD, data0410.unit_sq AS PARAMETER_VALUE, 
      data0410.MATL_PER_SQFT_1, data0410.MATL_PER_SQFT_2,
      Data0034.DEPT_CODE, data0025.manu_part_desc
          FROM data0410 INNER JOIN
      Data0006 ON data0410.WO_PTR = Data0006.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN
      Data0034 ON data0410.DEPT_PTR = Data0034.rkey 
   WHERE (data0410.DEPT_PTR = @vdept_ptr) and (data0410.d0451_ptr=@d451)
   order by Data0006.WORK_ORDER_NUMBER
GO

CREATE PROCEDURE wzcx090;21
 @vdept_ptr int,
 @vd451ptr int,
 @vtype int --0在制品,1半成品,2产成品
--with encryption
AS
  if @vtype=0 or @vtype=1 or @vtype=2
   select * from data0424 
   where ovhd_1+ovhd_2+ovhd_3>0
    and d0451_ptr=@vd451ptr
    and dept_ptr=@vdept_ptr
GO

CREATE PROCEDURE wzcx090;22
 @vdept_ptr int,
 @d451 int,
 @vtype int --0在制品,1半成品,2产成品
--with encryption
AS
  if @vtype=0 or @vtype=1 or @vtype=2
    SELECT Data0025.MANU_PART_NUMBER, data0025.manu_part_desc,
           Data0006.WORK_ORDER_NUMBER, 
           data0410.QTY AS QTY_PROD, data0410.unit_sq AS PARAMETER_VALUE, 
           data0410.OVERHEAD1_PER_SQFT,
           data0410.OVERHEAD2_PER_SQFT,
           data0410.OVERHEAD3_PER_SQFT
    FROM data0410 INNER JOIN
      Data0006 ON data0410.WO_PTR = Data0006.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY --INNER JOIN
    WHERE (data0410.DEPT_PTR = @vdept_ptr) and (data0410.d0451_ptr=@d451)
order by Data0006.WORK_ORDER_NUMBER
GO

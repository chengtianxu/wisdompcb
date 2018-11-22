--exec EP100;143 '3','3','0','0','0','2013-12-07','2014-01-07','','order by customer_part_number'
--create PROCEDURE EP100;143
declare
@vptr varchar(20),
@vptr2 varchar(20),
@vptr3 varchar(20),
@vptr4 varchar(20),
@vptr5 varchar(20),
@vdate1 varchar(20),
@vdate2 varchar(20),
@whse_ptr varchar(5),
@vindex varchar(100)
--AS
SELECT @vptr='3',@vptr2='3',@vptr3='0',@vptr4='0',@vptr5='0',@vdate1='2013-12-07',@vdate2='2014-01-07',@whse_ptr='',@vindex='order by customer_part_number'
declare @cond varchar(8000)
select @cond = '
SELECT TOP 100 PERCENT data0050.whse_ptr,data0015.warehouse_code,Data0050.RKEY, Data0050.TTYPE,data0059.ONHOLD_SALES_FLAG,data0050.ON_HOLD_BY_PTR,data0050.on_hold_date,
      Data0050.CUSTOMER_PART_NUMBER, Data0059.CUSTOMER_PART_DESC,DATA0050.PROD_STOP_FLAG,
      Data0050.TSTATUS, Data0050.CP_REV, Data0050.ALLOW_EDIT_FLAG,
      Data0050.AUDITED_BY_PTR, Data0050.LAYERS,data0050.green_desc,
      Data0050.AUDITED_DATE, Data0050.CATALOG_NUMBER,Data0050.bom_appr_by,Data0050.bom_appr_date,Data0050.BOM_STATUS,
      data0050.bom_audited_by,data0050.bom_audited_date,data0050.cost_appr_date,
      Data0050.CUSTPART_ENT_DATE, Data0050.REMARK,data0050.ONHOLD_PLANNING_FLAG,
      Data0050.CHECK_BY_PTR, Data0050.CHECK_DATE,data0050.ONHOLD_RELEASE_FLAG,
      Data0050.SAMPLE_NR, data0059.customer_ptr,data0059.customer_matl_desc,
      Data0050.LAST_MODIFIED_DATE, Data0050.LAST_MODIFIED_BY_PTR,
      Data0050.SALES_ORDER_UNIT_PTR, Data0010.CUST_CODE,
      Data0008.PROD_CODE, Data0008.PRODUCT_NAME, cast(ONHOLD_PLANNING_FLAG as bit) as ONHOLD_PLANNING_FLAG,cast(ONHOLD_RELEASE_FLAG as bit) as ONHOLD_RELEASE_FLAG,
      Data0050.SHELF_LIFE, Data0050.set_lngth, Data0050.set_width,
      Data0050.cp_code, Data0050.ANALYSIS_CODE_1, Data0050.audited_by_ptr_2,Data0050.audited_by_ptr_3,
      Data0050.audited_date_2,Data0050.audited_date_3,Data0050.last_modified_by_ptr_2,Data0050.last_modified_date_2,
      Data0059.customer_part_desc as ANALYSIS_CODE_2, Data0050.ANALYSIS_CODE_3,
      Data0050.set_x_qty, Data0050.set_y_qty,data0005.employee_name as mod_man,
      Data0050.eq_appl_by_ptr,Data0050.eq_close_by_ptr,data0050.eq_status,
      Data0050.COST_APPR_BY,b.employee_name as creator,Data0025.PROD_CODE_PTR,
Data0050.eng_tp,Data0050.etest_tp,Data0050.cnc_tp,Data0050.mat_tp,Data0050.mat_color,
Data0050.mat_thick,Data0050.mat_oz,Data0050.mat_fact,Data0050.mat_other
FROM Data0025(nolock) INNER JOIN
      Data0050(nolock) INNER JOIN
      data0059(nolock) ON Data0050.RKEY = data0059.cust_part_ptr INNER JOIN
      Data0010(nolock) ON data0059.customer_ptr = Data0010.RKEY ON
      Data0025.ANCESTOR_PTR = Data0050.RKEY  LEFT OUTER JOIN
      Data0005(nolock) ON
      Data0050.LAST_MODIFIED_BY_PTR = Data0005.RKEY LEFT OUTER JOIN
      Data0008(nolock) ON
      Data0025.PROD_CODE_PTR = Data0008.RKEY LEFT OUTER JOIN
      Data0005 b(nolock) ON Data0050.created_by_ptr = b.RKEY
      left join data0015 on data0050.whse_ptr=data0015.rkey'
select @cond=@cond+' WHERE (((Data0025.PARENT_PTR = 0 and isnull(data0010.disp_flag,0)=0 ) and data0059.ONHOLD_SALES_FLAG='+@vptr3
select @cond=@cond+' and data0050.ttype<>'+@vptr+' and data0050.ttype<>'+@vptr2+'  and data0050.ttype<3'
select @cond=@cond+' and ((data0050.last_modified_date>='''+@vdate1+''' and data0050.last_modified_date<'''+@vdate2+''') or data0050.last_modified_date is null))'
select @cond=@cond+' and (0='+@vptr4+')) or (data0050.rkey='+@vptr5+')'
if @whse_ptr>'0'
	select @cond=@cond+'and (data0050.whse_ptr='+@whse_ptr+' or isnull(data0050.whse_ptr,0)=0)'
select @cond=@cond+@vindex
exec (@cond)
PRINT(@cond)
GO

----------------------------------------------
SELECT TOP 100 PERCENT data0050.whse_ptr,
       data0015.warehouse_code,
       Data0050.RKEY,
       Data0050.TTYPE,
       data0059.ONHOLD_SALES_FLAG,
       data0050.ON_HOLD_BY_PTR,
       data0050.on_hold_date,
       Data0050.CUSTOMER_PART_NUMBER,
       Data0059.CUSTOMER_PART_DESC,
       DATA0050.PROD_STOP_FLAG,
       Data0050.TSTATUS,
       Data0050.CP_REV,
       Data0050.ALLOW_EDIT_FLAG,
       Data0050.AUDITED_BY_PTR,
       Data0050.LAYERS,
       data0050.green_desc,
       Data0050.AUDITED_DATE,
       Data0050.CATALOG_NUMBER,
       Data0050.bom_appr_by,
       Data0050.bom_appr_date,
       Data0050.BOM_STATUS,
       data0050.bom_audited_by,
       data0050.bom_audited_date,
       data0050.cost_appr_date,
       Data0050.CUSTPART_ENT_DATE,
       Data0050.REMARK,
       data0050.ONHOLD_PLANNING_FLAG,
       Data0050.CHECK_BY_PTR,
       Data0050.CHECK_DATE,
       data0050.ONHOLD_RELEASE_FLAG,
       Data0050.SAMPLE_NR,
       data0059.customer_ptr,
       data0059.customer_matl_desc,
       Data0050.LAST_MODIFIED_DATE,
       Data0050.LAST_MODIFIED_BY_PTR,
       Data0050.SALES_ORDER_UNIT_PTR,
       Data0010.CUST_CODE,
       Data0008.PROD_CODE,
       Data0008.PRODUCT_NAME,
       CAST(ONHOLD_PLANNING_FLAG AS BIT)  AS ONHOLD_PLANNING_FLAG,
       CAST(ONHOLD_RELEASE_FLAG AS BIT)   AS ONHOLD_RELEASE_FLAG,
       Data0050.SHELF_LIFE,
       Data0050.set_lngth,
       Data0050.set_width,
       Data0050.cp_code,
       Data0050.ANALYSIS_CODE_1,
       Data0050.audited_by_ptr_2,
       Data0050.audited_by_ptr_3,
       Data0050.audited_date_2,
       Data0050.audited_date_3,
       Data0050.last_modified_by_ptr_2,
       Data0050.last_modified_date_2,
       Data0059.customer_part_desc        AS ANALYSIS_CODE_2,
       Data0050.ANALYSIS_CODE_3,
       Data0050.set_x_qty,
       Data0050.set_y_qty,
       data0005.employee_name             AS mod_man,
       Data0050.eq_appl_by_ptr,
       Data0050.eq_close_by_ptr,
       data0050.eq_status,
       Data0050.COST_APPR_BY,
       b.employee_name                    AS creator,
       Data0025.PROD_CODE_PTR,
       Data0050.eng_tp,
       Data0050.etest_tp,
       Data0050.cnc_tp,
       Data0050.mat_tp,
       Data0050.mat_color,
       Data0050.mat_thick,
       Data0050.mat_oz,
       Data0050.mat_fact,
       Data0050.mat_other
FROM   Data0025(NOLOCK)
       INNER JOIN Data0050(NOLOCK)
       INNER JOIN data0059(NOLOCK)
            ON  Data0050.RKEY = data0059.cust_part_ptr
       INNER JOIN Data0010(NOLOCK)
            ON  data0059.customer_ptr = Data0010.RKEY
            ON  Data0025.ANCESTOR_PTR = Data0050.RKEY
       LEFT OUTER JOIN Data0005(NOLOCK)
            ON  Data0050.LAST_MODIFIED_BY_PTR = Data0005.RKEY
       LEFT OUTER JOIN Data0008(NOLOCK)
            ON  Data0025.PROD_CODE_PTR = Data0008.RKEY
       LEFT OUTER JOIN Data0005 b(NOLOCK)
            ON  Data0050.created_by_ptr = b.RKEY
       LEFT JOIN data0015
            ON  data0050.whse_ptr = data0015.rkey
WHERE  (
           (
               (
                   Data0025.PARENT_PTR = 0
                   AND ISNULL(data0010.disp_flag, 0) = 0
               )
               AND data0059.ONHOLD_SALES_FLAG = 0
               AND data0050.ttype <> 3
               AND data0050.ttype <> 3
               AND data0050.ttype < 3
               AND (
                       (
                           data0050.last_modified_date >= '2013-12-07'
                           AND data0050.last_modified_date < '2014-01-07'
                       )
                       OR data0050.last_modified_date IS NULL
                   )
           )
           AND (0 = 0)
       )
       OR  (data0050.rkey = 0)
ORDER BY
       customer_part_number

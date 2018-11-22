--EP100窗口数据查询
--exec EP100;122 '0','0','0','2013-05-12','2013-07-16','order by customer_part_number',0

--create PROCEDURE ep100;122
declare
@vtp varchar(5)='0' ,
@vrkey varchar(20)='0' ,
@vptr varchar(2)='0',
@vdate1 varchar(20)='2013-05-12',
@vdate2 varchar(20)='2013-07-16',
@vindex varchar(100)='order by customer_part_number',
@whse_ptr varchar(5)=0,
@vuserptr int=1
--AS
declare @cond varchar(8000)
select @cond = '
SELECT TOP 100 PERCENT data0050.whse_ptr,data0015.warehouse_code,data0050.schno,data0050.baseinfo_status,Data0050.RKEY, Data0050.TTYPE,data0050.assign_to_ptr,c.employee_name as assignman,
      Data0050.CUSTOMER_PART_NUMBER, Data0059.CUSTOMER_PART_DESC,data0050.prod_stop_flag,cast(ONHOLD_RELEASE_FLAG as bit) as ONHOLD_RELEASE_FLAG,
      Data0050.TSTATUS, Data0050.CP_REV, Data0050.ALLOW_EDIT_FLAG,ONHOLD_PLANNING_FLAG,
      Data0050.AUDITED_BY_PTR, Data0050.LAYERS,data0050.green_desc,data0050.edit_flag,
      Data0050.AUDITED_DATE, Data0050.CATALOG_NUMBER,
      Data0050.CUSTPART_ENT_DATE, Data0050.REMARK,Data0050.bom_appr_by,Data0050.bom_appr_date,Data0050.BOM_STATUS,
      Data0050.CHECK_BY_PTR, Data0050.CHECK_DATE,data0050.cp_rev1,data0050.cp_rev2,data0050.cp_rev3,
      Data0050.SAMPLE_NR, data0059.customer_ptr,data0059.customer_matl_desc,
      Data0050.LAST_MODIFIED_DATE, Data0050.LAST_MODIFIED_BY_PTR,
      Data0050.SALES_ORDER_UNIT_PTR, Data0010.CUST_CODE,data0025.PROD_CODE_PTR,
      Data0008.PROD_CODE, Data0008.PRODUCT_NAME,data0050.sm_color,data0050.cm_color,data0050.fg_thick,
      Data0050.SHELF_LIFE, Data0050.set_lngth, Data0050.set_width,
      Data0050.cp_code, Data0050.ANALYSIS_CODE_1,DATA0050.first_modified_date,
      Data0050.ANALYSIS_CODE_2,Data0050.ANALYSIS_CODE_3,Data0050.ANALYSIS_CODE_4,Data0050.ANALYSIS_CODE_5,Data0050.ANALYSIS_CODE_6,Data0050.ANALYSIS_CODE_7,
      Data0050.set_x_qty, Data0050.set_y_qty,data0005.employee_name as mod_man,
      Data0050.COST_APPR_BY,b.employee_name as creator,Data0050.eq_appl_date,Data0050.eq_close_date,
      Data0050.eq_appl_by_ptr,Data0050.eq_close_by_ptr,data0050.eq_status,data0050.outer_oz,data0050.inner_oz,
      Data0050.eng_tp,Data0050.etest_tp,Data0050.cnc_tp,Data0050.mat_tp,Data0050.mat_color,
      Data0050.mat_thick,Data0050.mat_oz,Data0050.mat_fact,Data0050.mat_other,data0050.set_accbad_qty'
select @cond=@cond+'
FROM Data0025(nolock) INNER JOIN
      Data0050 INNER JOIN
      data0059(nolock) ON Data0050.RKEY = data0059.cust_part_ptr INNER JOIN
      Data0010(nolock) ON data0059.customer_ptr = Data0010.RKEY ON 
      Data0025.ANCESTOR_PTR = Data0050.RKEY  LEFT OUTER JOIN
      Data0005(nolock) ON 
      Data0050.LAST_MODIFIED_BY_PTR = Data0005.RKEY LEFT OUTER JOIN
      Data0008(nolock) ON 
      Data0025.PROD_CODE_PTR = Data0008.RKEY LEFT OUTER JOIN
      Data0005 b(nolock) ON Data0050.created_by_ptr = b.RKEY LEFT OUTER JOIN
      Data0005 c(nolock) ON Data0050.assign_to_ptr = c.RKEY
      left join data0015 on data0050.whse_ptr=data0015.rkey'
select @cond=@cond+' 
WHERE ('+@vtp+'=1 and data0050.rkey='+@vrkey+' and parent_ptr=0 ) or ('+@vtp+'=0 and
 (Data0025.PARENT_PTR = 0) and data0050.ttype<3 and isnull(data0010.disp_flag,0)=0 '

if @whse_ptr>'0'
	select @cond=@cond+'and (data0050.whse_ptr='+@whse_ptr+' or isnull(data0050.whse_ptr,0)=0)'

select @cond=@cond+' and data0059.ONHOLD_SALES_FLAG='+@vptr
select @cond=@cond+' and ((data0050.last_modified_date>='''+@vdate1+''' and data0050.last_modified_date<'''+@vdate2+''') or data0050.last_modified_date is null))'
select @cond=@cond+@vindex
exec (@cond)
GO


--ep070装箱单清单查询
SELECT distinct  TOP 100000 data0439.delivery_no, Data0010.CUST_CODE, data0439.date_sailing,data0439.date_ent,data0439.remark as remark439,
      data0439.cartons_no, data0439.charge, Data0060.SALES_ORDER,data0060.parts_ordered,Data0010.CUSTOMER_NAME,Data0060.so_audit_date,
      data0439.fob, Data0060.SCH_DATE, Data0064.SHIPMENT_NO,Data0060.analysis_code_1 as analysis_code1,Data0060.ORIG_REQUEST_DATE,Data0060.ent_date,
      Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,data0010.abbr_name,Data0050.eng_tp,Data0050.LAYERS,
      Data0097.PO_NUMBER, Data0097.PO_DATE,data0001.curr_code,data0060.state_prod_tax_flag,Data0008.PROD_CODE,Data0008.PRODUCT_NAME,
      data0439.reference_number, Data0005.EMPLOYEE_NAME, dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey) as exch_rate,Data0439.delivery_form,
      Data0064.QUAN_SHIPPED+ data0064.ovsh_qty as QUAN_SHIPPED,Data0064.QUAN_SHIPPED as shipped,Data0064.ovsh_qty, Data0060.part_price, data0064.Remark,
  ROUND((Data0064.QUAN_SHIPPED + data0064.ovsh_qty) * Data0050.REPORT_UNIT_VALUE1 / 1000,4) AS weigth,
(case data0060.tax_in_price when 'N' then data0060.part_price * (1+data0189.state_tax/100.00)  else data0060.part_price end) as part_tax_price,
case when Data0050.sales_order_unit_ptr=0 then 'PCS' else 'SET' end as sales_order_unit,(select top 1 issue_date from Data0492 where data0492.so_no=Data0060.sales_order order by issue_date ) as ISSUE_DATE,
case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end AS notax_amount_base,
case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price else
  data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED +(case data0060.tax_in_price when 'N' then data0060.part_price else
  data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else  ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price else 
data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    +(case data0060.tax_in_price when 'N' then data0060.set_price else data0060.set_price/(1+data0189.state_tax/100.00) end)*
   (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end AS notax_amount,

case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price * 
  (1+data0189.state_tax/100.00) else data0060.part_price end) *Data0064.QUAN_SHIPPED + data0060.part_price *data0064.ovsh_qty*
  (100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price * 
(1+data0189.state_tax/100.00) else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    + (case data0060.tax_in_price when 'N' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)
   *(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01) 
   / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end AS yestax_amount_base,
  
case when Data0050.sales_order_unit_ptr=0 then  ROUND(((case data0060.tax_in_price when 'N' then data0060.part_price * (1+data0189.state_tax/100.00)
    else data0060.part_price end) *Data0064.QUAN_SHIPPED + (case data0060.tax_in_price when 'N' then data0060.part_price *
  (1+data0189.state_tax/100.00) else data0060.part_price end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price * (1+data0189.state_tax/100.00)
    else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
  + (case data0060.tax_in_price when 'N' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)*
  (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end AS yestax_amount,

  Data0112.invoice_number,Data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,
  round(a.parameter_value,4) as unit_area, round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * a.PARAMETER_value*dbo.GetALTCustValue(data0050.rkey),4)  AS mianji,
  round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * a.PARAMETER_value,4)  AS mianji_tot,
  Data0529.shipadvice_no, Data0529.MAWB_NO ,data0189.state_tax, data0060.tax_in_price,
  data0050.analysis_code_1+'(/'+ltrim(rtrim(str(set_x_qty*set_y_qty)))+')' as  analysis_code_1,
  Data0439.use_stauts, Data0060.FOB AS AGMNO, round(Data0050.unit_sq,6) as DYMianJi,
                      ROUND((Data0064.QUAN_SHIPPED + Data0064.ovsh_qty) * Data0050.unit_sq, 4) AS JingMianJi,
CASE when data0064.SHIPMENT_NO=1 then dbo.GetSOFees(data0064.rkey) else null end as SOFees, 
CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end as TOTAL_ADD_L_PRICE ,
data0439.reference_number2, Data0060.set_price, Data0060.set_ordered*1.0 AS SOSetQty,
 Round(Data0064.QUAN_SHIPPED / (Data0050.set_x_qty * Data0050.set_y_qty),0) AS SHIPSetQty,
 Round((Data0064.QUAN_SHIPPED + data0064.ovsh_qty)  / (Data0050.set_x_qty * Data0050.set_y_qty),0) AS SHIPovshSetQty,
  data0015.warehouse_name,data0064.GWQty,data0064.NWQty,b.parameter_value as pcs_pnl,round(data0064.QUAN_SHIPPED/b.parameter_value+0.0000001,2) as pnl_qty,ROUND(C.PARAMETER_value,4) AS DYJMJ,
  round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * C.PARAMETER_value,4)  AS JMJ_tot
FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0
  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
  left join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
      Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  left join Data0001 on data0060.currency_ptr=data0001.rkey
  left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left join data0015 on data0060.whse_ptr=data0015.rkey left join Data0008 on Data0025.PROD_CODE_PTR=Data0008.RKEY
WHERE (Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and
  1 = 1
and data0439.date_sailing>='2013-07-25' and data0439.date_sailing<'2013-08-01 23:59:59'
ORDER BY data0439.delivery_no ,Data0060.SALES_ORDER,Data0064.SHIPMENT_NO


----------------------------------------------------------------------------------------------------
create PROCEDURE ep070;3 --装箱单清单  20131113 根据客户信息里的销售开单发票单价标识：默认为0--取60表订单价格，1取64表出货价格
  @ExchRate int=4,
  @sqlwhere varchar(8000)
AS
declare @JUnit varchar(5),@MUnit varchar(5),@flag int,@ExchRate0 varchar(100)
  select @flag=Search_Unit_flag from Data0195
  if @flag = 0
  begin
    set @JUnit='L'
    set @MUnit='D'
  end
  else
  begin
    set @JUnit='K'
    set @MUnit='E'
  end

  if @ExchRate = 0
    set @ExchRate0='Data0060.exch_rate '
  else
    --set @ExchRate0='dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey) '
  set @ExchRate0='dbo.SF_GET_DO_MONTH_EXCHRATE2(data0064.rkey) ' --SF_GET_DO_MONTH_EXCHRATE2函数，以免与EP069中的SF_GET_DO_MONTH_EXCHRATE函数共用，这里不需要开关控制直接取64表的出货当月汇率 20121030
  
  declare @sql varchar(8000),@sql2 varchar(8000),@sql3 varchar(8000)

  set @sql ='
  SELECT  data0439.remark_bak,data0050.mat_tp,data0050.set_lngth,data0050.set_width,data0050.set_x_qty * data0050.set_y_qty AS ''PCS/SET'',data0439.delivery_no, Data0010.CUST_CODE, data0439.date_sailing,data0439.date_ent,data0439.remark as remark439,
      data0439.cartons_no, data0439.charge, Data0060.SALES_ORDER,data0060.parts_ordered,Data0010.CUSTOMER_NAME,Data0060.so_audit_date,Data0060.so_style,
      data0439.fob, Data0060.SCH_DATE, Data0064.SHIPMENT_NO,Data0060.analysis_code_1 as analysis_code1,Data0060.ORIG_REQUEST_DATE,Data0060.ent_date,
      Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,data0010.abbr_name,Data0050.eng_tp,Data0050.LAYERS,
      Data0097.PO_NUMBER, Data0097.PO_DATE,data0001.curr_code,data0060.state_prod_tax_flag,Data0008.PROD_CODE,Data0008.PRODUCT_NAME,data0060.SO_PAYMENT,
      data0439.reference_number, Data0005.EMPLOYEE_NAME,Data0439.delivery_form,data0439.Delivery_person,data0439.Delivery_status,
      case isnull(data0439.Delivery_status,0) when 0 then ''未回签'' else ''已回签'' end as Delivery_status_desc, 
      Data0064.QUAN_SHIPPED+ data0064.ovsh_qty as QUAN_SHIPPED,Data0064.QUAN_SHIPPED as shipped,Data0064.ovsh_qty, case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end as part_price, --取不同单价20131113
  data0064.Remark, ROUND((Data0064.QUAN_SHIPPED + data0064.ovsh_qty) * Data0050.REPORT_UNIT_VALUE1 / 1000,4) AS weigth,
(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)  * (1+data0189.state_tax/100.00)  else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end) as part_tax_price,
case when Data0050.sales_order_unit_ptr=0 then ''PCS'' else ''SET'' end as sales_order_unit,
(select top 1 issue_date from Data0492 where data0492.so_no=Data0060.sales_order order by issue_date ) as ISSUE_DATE,
case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else
  (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) /(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED +(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else
  (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else  ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price else 
data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    +(case data0060.tax_in_price when ''N'' then data0060.set_price else data0060.set_price/(1+data0189.state_tax/100.00) end)*
   (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end AS notax_amount,
case when Data0050.sales_order_unit_ptr=0 then  ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) * (1+data0189.state_tax/100.00)
    else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end) *Data0064.QUAN_SHIPPED + (case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) *
  (1+data0189.state_tax/100.00) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00)
    else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
  + (case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)*
  (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end AS yestax_amount,
  Data0112.invoice_number,Data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,
  round(a.parameter_value,4) as unit_area, 
  round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * a.PARAMETER_value,4)  AS mianji_tot,
  Data0529.shipadvice_no, Data0529.MAWB_NO ,data0189.state_tax, data0060.tax_in_price,
  data0050.analysis_code_1+''(/''+ltrim(rtrim(str(set_x_qty*set_y_qty)))+'')'' as  analysis_code_1,
  Data0439.use_stauts, Data0060.FOB AS AGMNO, round(Data0050.unit_sq,6) as DYMianJi,
                      ROUND((Data0064.QUAN_SHIPPED + Data0064.ovsh_qty) * Data0050.unit_sq, 4) AS JingMianJi,--JingMianJi装运参考面积
CASE when data0064.SHIPMENT_NO=1 then dbo.GetSOFees(data0064.rkey) else null end as SOFees, 
CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end as TOTAL_ADD_L_PRICE ,
data0439.reference_number2, Data0060.set_price, Data0060.set_ordered*1.0 AS SOSetQty,
 Round(Data0064.QUAN_SHIPPED / (Data0050.set_x_qty * Data0050.set_y_qty),0) AS SHIPSetQty,
 Round((Data0064.QUAN_SHIPPED + data0064.ovsh_qty)  / (Data0050.set_x_qty * Data0050.set_y_qty),0) AS SHIPovshSetQty,
  data0015.warehouse_name,data0064.GWQty,data0064.NWQty,b.parameter_value as pcs_pnl,
 case isnull(b.parameter_value,0) when 0 then round(data0064.QUAN_SHIPPED,2) 
   else round(data0064.QUAN_SHIPPED/isnull(b.parameter_value,1),2) end as pnl_qty,ROUND(C.PARAMETER_value,4) AS DYJMJ,
  round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * C.PARAMETER_value,4)  AS JMJ_tot,round(isnull(Data0064.quan_invoiced,0) * isnull(C.PARAMETER_value,0),4)  AS JMJ_invoiced,--JMJ_tot装运净面积含溢装
  round(Data0064.QUAN_SHIPPED * C.PARAMETER_value,4)  AS JMJ_ship,--装运净面积不含溢装 20130403 LLL 
round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * a.PARAMETER_value*dbo.GetALTCustValue(data0050.rkey),4)  AS mianji,
dbo.SF_GET_DO_MONTH_EXCHRATE2(data0064.rkey) as exch_rate2,
case Data0439.use_stauts when 0 then ''未提交'' when 2 then ''待审核'' when 4 then ''被退回'' when 5 then ''已作废'' 
  when 9 then ''已审核'' end as use_stauts_desc, '+@ExchRate0+' as exch_rate,
case (CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end) when null then null else
  round((CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end)/'+@ExchRate0+',2) end as orig_TOTAL_ADD_L_PRICE,'
set @sql2 = ' case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+' +0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when ''N'' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+'+0.0000001,2) end AS notax_amount_base,  
case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) * 
  (1+data0189.state_tax/100.00) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end) *Data0064.QUAN_SHIPPED + (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) *data0064.ovsh_qty*
  (100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+'+0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price * 
(1+data0189.state_tax/100.00) else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    + (case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)
   *(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01) 
   / '+@ExchRate0+' +0.0000001,2) end AS yestax_amount_base,

(case when Data0050.sales_order_unit_ptr=0 then  ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) * (1+data0189.state_tax/100.00)
    else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end) *Data0064.QUAN_SHIPPED + (case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) *
  (1+data0189.state_tax/100.00) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00)
    else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
  + (case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)*
  (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end) +
  isnull((CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end),0) as sumAccountOC,--(含税金额+费用)_原币


(case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) * 
  (1+data0189.state_tax/100.00) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) end) *Data0064.QUAN_SHIPPED + (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) *data0064.ovsh_qty*
  (100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+'+0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price * 
(1+data0189.state_tax/100.00) else data0060.set_price end) *(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    + (case data0060.tax_in_price when ''N'' then data0060.set_price * (1+data0189.state_tax/100.00) else data0060.set_price end)
   *(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01) 
   / '+@ExchRate0+' +0.0000001,2) end) + 
isnull((case (CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end) when null then null else
  round((CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end)/'+@ExchRate0+',2) end),0) as sumAccountBC,--(含税金额+费用)_本币 处理无费用时为0 LLL 20120928 

(case when Data0050.sales_order_unit_ptr=0 then ROUND(((case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else
  (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED +(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else
  (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2)
else  ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price else 
data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
    +(case data0060.tax_in_price when ''N'' then data0060.set_price else data0060.set_price/(1+data0189.state_tax/100.00) end)*
   (1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))*(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) end) + 
isnull((CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end),0) as notax_sumAccountOC ,' --(无税金额+费用)_原币 处理无费用时为0 LLL 20120928 
 
set @sql3=' (case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when ''N'' then (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end) else (case isnull(data0010.Invprice_from_64,0)  when 0 then Data0060.part_price else Data0064.part_price end)/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+' +0.0000001,2)
else ROUND(((case data0060.tax_in_price when ''N'' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when ''N'' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / '+@ExchRate0+'+0.0000001,2) end) +
isnull((case (CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end) when null then null else
  round((CASE when data0064.SHIPMENT_NO=1 then data0060.TOTAL_ADD_L_PRICE else null end)/'+@ExchRate0+',2) end),0) as notax_sumAccountBC --(无税金额+费用)_本币 处理无费用时为0 LLL 20120928
 ,data0439.ship_addr_ptr,d12.location --增加装箱单送货地址20120910 LLL 
 ,data0050.REPORT_UNIT_VALUE1,data0098.RMA_NUMBER,data0060.so_oldnew  --加退货单号
,case data0060.COMMISION_ON_TOOLING when 0 then ''内销'' when 1 then ''保税'' when 2 then ''外销'' end as COMMISION_ON_TOOLING  --增加订单销售类型 LLL 20121013
,dbo.Get_All_WO_DATECODE(Data0064.rkey) as all_WO_DATECODE  --加周码 20121221 LLL 
,case data0050.SALES_ORDER_UNIT_PTR when 1 then ''Strip''  else ''Pcs'' end as sales_order_unit_ptr,Data0050.catalog_number,data0439.shipping_method,data0439.audited_date,data0073.user_full_name as audited_name 
,data0064.date_assign, Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh as parts_margin2 --订单欠数20130810 LLL  
,data0060.ADD_PRICE1,data0060.ADD_PRICE2,data0060.ADD_PRICE3,data0060.ADD_PRICE4   
  FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY 
  inner join data0012 d12 on data0439.ship_addr_ptr=d12.rkey 
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY 
  left join data0098  on data0064.RMA_PTR=data0098.rkey   --关联退货表98表  LLL 20120915 
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0
  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=(select top 1 rkey from data0278 where spec_rkey='''+@MUnit+''' )
  left join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=(select top 1 rkey from data0278 where spec_rkey=''C'' )
  LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=(select top 1 rkey from data0278 where spec_rkey='''+@JUnit+''' )
  left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
      Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  left join Data0001 on data0060.currency_ptr=data0001.rkey
  left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left join data0015 on data0060.whse_ptr=data0015.rkey left join Data0008 on Data0025.PROD_CODE_PTR=Data0008.RKEY
  left join data0073  on data0439.audited_by_ptr=data0073.rkey --审核人
WHERE  1=1 ' 

set @sql3 =@sql3+ @sqlwhere

set @sql3 = @sql3 +'
ORDER BY data0439.delivery_no, Data0097.po_number,data0059.customer_part_desc,Data0060.SALES_ORDER,Data0064.SHIPMENT_NO '
--杨工要求如此排序 20120911 
print(@sql )
print(@sql2)
print(@sql3)
exec(@sql+@sql2+@sql3)

go
 

--EP087材料出库查询
ELECT  Data0457.REF_NUMBER,Data0457.GON_NUMBER, data0456.grn_number, data0022.tax_2,
      Data0017.INV_PART_NUMBER,Data0017.INV_NAME, Data0017.INV_DESCRIPTION,data0017.STOCK_BASE,
      data0034.dept_code,Data0034.DEPT_NAME,Data0207.TDATE,Data0496.GROUP_NAME,data0496.group_desc,
    data0019.inv_group_name, data0019.inv_group_desc,data0071.supp_part_no as MANUFACTURER_CODE,
      Data0015.WAREHOUSE_CODE, data0015.abbr_name as whse_name,data0016.bonded_type,Data0016.CODE AS code16, data0016.location,
      case Data0017.use_flag when '0' then '共用'  when '1' then '专用' end as use_flag,case data0496.ttype when 'P' then '直接材料' when 'M' then 
'间接材料' when 'N' then '其他材料' when 'T' then '外发项目' end grouptypedesc
      ,Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5,
      Data0207.QUANTITY, Data0207.RTN_QUANTITY,data0005.employee_name as employee_name1,I.employee_name as employee_name2,
      Data0001.CURR_CODE, data0070.po_number,data0078.auth_date,data0022.prod_date,data0022.EXPIRE_DATE,
      ROUND(Data0022.PRICE / Data0022.EXCHANGE_RATE, 4) AS STANDARD_price,
      isnull(Data0468.CUT_NO,data0492.cut_no) as cut_no, isnull(Data0468.SO_NO,data0492.so_no) as so_no, Data0022.SUPPLIER2,dbo.getvoucher(data0022.grn_ptr) 
as voucher,
      area=convert(decimal(20,4),data0207.quantity*data0017.mat_len*mat_wth),
      Data0022.BARCODE_ID,data0022.Ref_BarCodeID, ROUND(Data0022.PRICE,4) as price,
      round(1/data0022.exchange_rate,8) as exchange_rate,ROUND(Data0022.PRICE * (1+data0022.tax_2/100),4) as TAX_PRICE,
      ROUND(Data0207.QUANTITY * Data0022.PRICE / Data0022.EXCHANGE_RATE, 4) AS total_price,
      ROUND(Data0207.QUANTITY * Data0022.PRICE * (1+data0022.tax_2/100) / Data0022.EXCHANGE_RATE,4) AS tax_amount,data0022.extra_req,
       Data0023.code,Data0023.ABBR_NAME, Data0023.SUPPLIER_NAME, Data0002.UNIT_NAME,d457Type=case Data0457.TType when 1 then '按照配料单'
      when 2 then  '直接到工序/总仓发料到车间'  when 3 then (case when data0207.invoice_ptr>0 then '发票反写' else '' end) when 4 then '车间向总仓退料' when 
5 then '盘点出'
      when 6 then '转仓出' when 8 then '车间向装配线发料' when 9 then '装配线向车间退料' when 10 then  case isnull(data0207.so_ptr,0) when 0  then 
'车间/装配线特殊出' else '材料销售' end   else '' end,
      Data0457.BAN_NO,data0207.remark_info,Data0022.Reference_Number,Type96=Data0457.ttype,
      case when isnull(Data0207.QUANTITY,0)>0 then data0700.NOTE else data0703.Note end as NOTE,data0060.SALES_ORDER,case Data0017.protariff when 1 then 
'是' else '否' end as protariff
FROM Data0457  
      inner join  Data0207 on Data0457.Rkey=Data0207.GON_PTR
      inner join Data0022 on Data0207.D0022_PTR = Data0022.RKEY
      Left  join  data0005  on data0005.rkey=data0457.Create_by
      left join Data0468 on Data0207.D0468_PTR = Data0468.RKEY
     left join data0492 on data0207.co_no=data0492.cut_no
     left join Data0017 on Data0207.INVENTORY_PTR = Data0017.RKEY
     left join Data0002 on Data0017.STOCK_UNIT_PTR = Data0002.RKEY
     left join Data0015 on Data0022.whouse_ptr = Data0015.RKEY
     left join Data0016 on Data0022.LOCATION_PTR = Data0016.RKEY
     left join Data0496 on Data0017.GROUP_PTR = Data0496.RKEY
     left join Data0019 on Data0496.GROUP_PTR = Data0019.rkey
     left join Data0034 on Data0207.DEPT_PTR = Data0034.RKEY
     left join Data0001 on Data0022.CURRENCY_PTR = Data0001.RKEY
     left join Data0023 on Data0022.SUPPLIER_PTR = Data0023.RKEY
     left join Data0071 on Data0022.source_ptr=Data0071.rkey
     left join Data0070 on Data0071.po_ptr=Data0070.rkey
     left join (select PO_ptr=A.rkey,Auth_date=(select top 1 auth_date
        from data0078 B where a.rkey=b.po_ptr order by auth_date desc)
        from data0070 A ) AS data0078 on data0070.rkey=data0078.po_ptr
     left join data0456 on data0022.grn_ptr=data0456.rkey
     left join Data0700 on Data0457.REF_NUMBER=Data0700.rkey
     Left  join data0005 I on Data0457.RECD_BY= I.rkey
     left join data0060 on data0207.so_ptr=data0060.rkey
    left join data0703 on Data0457.REF_NUMBER=Data0703.rkey

WHERE (Data0207.QUANTITY <> 0)
and Data0496.group_name in ('M00019')--类别
 and  Data0207.tdate>='2013-10-14 00:00:00'and Data0207.tdate<='2013-11-13 23:59:59'
 
 union all 
 
 select 
REF_NUMBER='',GON_NUMBER='',data0456.grn_number,data0022.tax_2,Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_DESCRIPTION,Data0017.STOCK_BASE, 
        dept_code='',DEPT_NAME='IQC',TDATE=Data0095.tran_date, 
      Data0496.GROUP_NAME,data0496.group_desc,data0019.inv_group_name, data0019.inv_group_desc,data0017.MANUFACTURER_CODE, 
      Data0015.WAREHOUSE_CODE, data0015.abbr_name as whse_name,data0016.bonded_type,
      Data0016.CODE AS code16, data0016.location,case Data0017.use_flag when '0' then '共用'  when '1' then '专用' end as use_flag, 
      case data0496.ttype when 'P' then '直接材料' when 'M' then '间接材料' when 'N' then '其他材料' when 'T' then '外发项目' end 
grouptypedesc,Data0017.ANALYSIS_CODE1, 
     Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5, QUANTITY=sum(Data0095.QUANTITY),RTN_QUANTITY=0,
        data0005.employee_name AS employee_name1,I.employee_name AS employee_name2,Data0001.CURR_CODE,po_number='',auth_date=Data0095.tran_date, 
       data0022.prod_date,data0022.EXPIRE_DATE,ROUND(Data0022.PRICE / Data0022.EXCHANGE_RATE, 4) AS STANDARD_COST, 
        
CUT_NO='',SO_NO='',Data0022.SUPPLIER2,'',area=sum(convert(decimal(20,4),data0095.quantity*data0017.mat_len*mat_wth)),Data0022.BARCODE_ID,data0022.Ref_BarCodeID,ROUND(Data0022.PRICE,4) 
as price, 
       round(1/data0022.exchange_rate,8) as exchange_rate,ROUND(Data0022.PRICE * (1+data0022.tax_2/100),4) as TAX_PRICE, 
        sum(ROUND(Data0095.QUANTITY * Data0022.PRICE / Data0022.EXCHANGE_RATE,4)) AS total_price, 
        sum(ROUND(Data0095.QUANTITY * Data0022.PRICE * (1+data0022.tax_2/100) / Data0022.EXCHANGE_RATE,4)) AS tax_amount,data0022.extra_req,
        Data0023.code,Data0023.ABBR_NAME,Data0023.SUPPLIER_NAME,Data0002.UNIT_NAME,
        case when tran_tp=38 then '返回IQC退回' else 'IQC报废' end as 
d457Type,BAN_NO='',remark_info='',Reference_Number='',Type96=Data0456.ttype,Note='',SALES_ORDER='',case Data0017.protariff when 1 then '是' else '否' end as 
protariff 
 from data0095 
  inner join data0022 on Data0095.srce_ptr=data0022.rkey 
  left join Data0005 on Data0095.tran_by=Data0005.Rkey 
  left join Data0005  I on Data0095.REC_BY=I.Rkey 
  inner join data0017   on   data0022.inventory_ptr=data0017.rkey 
  inner join data0023   on   data0022.supplier_ptr=data0023.rkey 
  left join  data0496   on   data0017.group_ptr=data0496.rkey 
  left join Data0019 on Data0496.GROUP_PTR = Data0019.rkey 
  inner join data0002   on   data0017.stock_unit_ptr=data0002.rkey 
  left join Data0001 on Data0022.CURRENCY_PTR = Data0001.RKEY 
  left join Data0015 on Data0022.whouse_ptr = Data0015.RKEY 
  left join Data0016 on Data0022.LOCATION_PTR = Data0016.RKEY 
  left join Data0456 on Data0022.grn_ptr = Data0456.RKEY 
 where Data0095.tran_tp in (38,39) 
and Data0496.group_name in ('M00019')--类别
and  data0095.tran_date>='2013-10-14 00:00:00' and data0095.tran_date<='2013-11-13 23:59:59'
 group by 
data0022.tax_2,Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.protariff,Data0017.INV_DESCRIPTION,Data0017.STOCK_BASE,Data0017.use_flag,Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3, 
        
Data0496.GROUP_name,data0496.group_desc,Data0095.tran_date,data0005.employee_name,I.employee_name,Data0001.CURR_CODE,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5,data0017.MANUFACTURER_CODE, 
        
Data0095.tran_date,data0022.prod_date,data0022.EXPIRE_DATE,data0015.warehouse_code,data0015.abbr_name,data0016.bonded_type,Data0016.CODE,data0016.location,Data0022.PRICE,Data0022.EXCHANGE_RATE,data0022.extra_req, 
        Data0022.SUPPLIER2,Data0022.BARCODE_ID,data0022.Ref_BarCodeID,data0019.inv_group_name,data0019.inv_group_desc,data0496.ttype, 
        
Data0023.code,Data0023.ABBR_NAME,Data0023.SUPPLIER_NAME,Data0002.UNIT_NAME,data0017.mat_len,data0017.mat_wth,data0456.grn_number,Data0456.ttype,data0095.tran_tp 
  order by data0457.gon_number,data0017.inv_part_number

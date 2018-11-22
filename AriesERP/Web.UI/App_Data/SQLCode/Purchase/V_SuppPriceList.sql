
(---供应商价格  V_SuppPriceList
select d17.INV_PART_NUMBER  ,d17.INV_PART_DESCRIPTION ,
d23.CODE ,d23.SUPPLIER_NAME ,d28.PRICE_1  ,cast(d28.TAX_2 as varchar(10))+ '%' as 增值税,
d02.UNIT_CODE   ,d01.curr_name    ,
d28.qte_price   ,d28.qte_price2,d28.avl_flag    ,
case d23.status when 0 then '有效' when 1 then '无效' end as 供应商状态,d805.inv_name as 环测物料名称     ,d805.model  ,
d28.orig_abbrname     
,d28.supplier_part_no,d28.sugg_reorder_qty,d01.curr_code,d28.rkey,d02.UNIT_NAME,
d23.ABBR_NAME  ,d17.inv_name,d28.rohs, d28.prot_report_ptr,d28.remark,
d28.IF_CAF,d17.STOCK_UNIT_PTR,d28.lead_time,isnull(d17.CATALOG_NUM,'') as CATALOG_NUM,
d28.SUPPLIER_PTR,d28.INVENTORY_PTR,d28.EMPLOYEE_PTR,d28.CSI_USER_PTR,d28.TDATE,d28.TAX_2,
d28.AMT_QUAN_FLAG,d28.MIN_ORDER_QTY,d28.MIN_ORDER_AMT,d28.TAX_1,d28.PRICE_2,d28.PRICE_3,d28.PRICE_4,
d28.PRICE_5,d28.PRICE_6,d28.QUAN_VOL_1,d28.QUAN_VOL_2,d28.QUAN_VOL_3,d28.QUAN_VOL_4,d28.QUAN_VOL_5,d28.DISC_1,
d28.DISC_2,d28.DISC_3,d28.DISC_4,d28.DISC_5,d28.DISC_6,d28.TAX_3,d28.TAX_4,d28.PURCHASE_UNIT_PTR,d28.CONVERSION_FACTOR,
d28.CURRENCY_PTR,d28.EDI_OUT_FORCST,d28.tax_flag,d28.QTE_PRICE1,d28.quote_type
, d05.EMPLOYEE_NAME,d73.USER_FULL_NAME,d02_2.UNIT_CODE as UNIT_CODE2,d02_2.UNIT_NAME as UNIT_NAME2,d23.status,d17.STOP_PURCH
from  data0028 d28 
inner join   data0017 d17 on d28.inventory_ptr=d17.rkey
inner join  data0023 d23 on d28.supplier_ptr=d23.rkey 
inner join  data0001 d01 on  d28.currency_ptr=d01.rkey 
inner join data0002 d02 on d28.purchase_unit_ptr=d02.rkey 
 inner join data0002 d02_2 on d17.STOCK_UNIT_PTR=d02_2.rkey  
left join data0805  d805 on d28.prot_report_ptr=d805.rkey
left join Data0005  d05 on d28.EMPLOYEE_PTR=d05.RKEY
left join Data0073  d73  on d73.RKEY=d28.EDI_OUT_FORCST
 )a
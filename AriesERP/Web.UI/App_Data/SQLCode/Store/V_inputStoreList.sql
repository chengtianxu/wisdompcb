(
SELECT     dbo.Data0006.WORK_ORDER_NUMBER as '作业单号',dbo.Data0006.CUT_NO as '配料单号',Data0060_2.SALES_ORDER AS '销售订单',
 dbo.Data0097.PO_NUMBER AS '客户订单号',

dbo.Data0025.MANU_PART_NUMBER as '本厂编号', dbo.Data0025.MANU_PART_DESC as '客户型号', dbo.Data0025.ANALYSIS_CODE_2 as '客户物料号', 
dbo.Data0025.LAYERS as '层数', dbo.Data0025.SAMPLE_NR as '测式成型备注',data0025.CPJS as '产品阶数',

dbo.Data0053.QUANTITY as '入仓数量',dbo.Data0053.QTY_ON_HAND as '库存数量',

CASE WHEN Data0060_2.part_price >= 0 THEN ROUND(Data0060_2.PARTS_ALLOC, 6) ELSE Data0025.LATEST_PRICE END AS '不含税价格(原币)', 
CASE WHEN Data0060_2.part_price >= 0 THEN ROUND(Data0060_2.PARTS_ALLOC * (1 + Data0060_2.RUSH_CHARGE * 0.01), 6) 
ELSE Data0025.LATEST_PRICE END AS  '含税价格(原币)', dbo.Data0001.CURR_CODE AS '货币',
CASE WHEN Data0060_2.PART_PRICE >= 0 THEN  Data0060_2.EXCH_RATE ELSE 1 END AS '原币汇率', 
ROUND(Data0053.QUANTITY * (Data0053.cost_pcs+Data0053.matl_ovhd_pcs+Data0053.OVHD_COST+Data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs), 4) AS '成本',

ROUND(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq, 4) AS '不含板边入库面积',
CASE WHEN data0053.work_order_ptr > 0 THEN round(Data0053.QUANTITY * Data0006.panel_ln * Data0006.panel_wd * 0.000001 / Data0006.PARTS_PER_PANEL, 4) 
ELSE ROUND(dbo.Data0053.QUANTITY * dbo.Data0025.unit_sq, 4) END AS '含板边入库面积',
dbo.Data0053.QUANTITY * dbo.Data0025.REPORT_UNIT_VALUE1 / 1000 AS '入仓重量(KG)',

CASE WHEN Data0060_2.PART_PRICE >= 0 THEN Data0010_1.cust_code ELSE data0010_2.cust_code END AS '客户代码', 
CASE WHEN Data0060_2.PART_PRICE >= 0 THEN Data0010_1.ABBR_NAME ELSE data0010_2.ABBR_NAME END AS '客户简称',
case when data0053.barcode_ptr is not null then data0060_2.ORIG_CUSTOMER else data0025.ORIG_CUSTOMER end as '关联原客户',

dbo.data0416.number as '入仓单号', dbo.Data0005.EMPLOYEE_NAME as '入库人员',
dbo.data0416.type as '入库类型',

dbo.Data0008.PROD_CODE as '产品类别', dbo.Data0008.PRODUCT_NAME as '产品类别名称',
dbo.Data0007.PR_GRP_CODE as '组别代码',dbo.Data0007.PRODUCT_GROUP_NAME as '组别名称',

dbo.Data0015.WAREHOUSE_CODE as '工厂',dbo.Data0016.LOCATION as '仓库', dbo.data0053.spec_place as '具体位置',

CASE WHEN Data0060_2.PART_PRICE >= 0 THEN CASE data0060_2.COMMISION_ON_TOOLING WHEN 'N' THEN '内销' WHEN 'Y' THEN '转厂' END ELSE CASE data0010_2.EDI_FLAG_FOR_SOACK
WHEN 0 THEN '内销' WHEN 1 THEN '转厂' END END AS '是否转厂', 

 dbo.Data0053.MFG_DATE as '入仓日期',data0053.ischaban as '好板叉板',data0053.zhouqi as '周期', 
case  dbo.Data0053.RMA_PTR when 0 then '正常过数入仓' when 1 then '退货重检入仓' when 2 then '返修重检入仓' when 3 then '直接入仓' 
when 4 then '委外加工入仓' when 5 then '委外加工退货入仓' when 6 then '销售退货入仓' when 7 then '转换入仓' when 8 then '特殊入仓' end as '入仓类型',

dbo.Data0053.REFERENCE_NUMBER as '入仓备注',Data0060_2.REFERENCE_NUMBER AS '订单参考',

dbo.Data0023.ABBR_NAME AS '外协厂家' 
FROM         dbo.Data0097 RIGHT OUTER JOIN
                      dbo.Data0023 RIGHT OUTER JOIN
                      dbo.Data0060 AS Data0060_2 ON dbo.Data0023.RKEY = Data0060_2.supplier_ptr LEFT OUTER JOIN
                      dbo.Data0001 ON Data0060_2.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN
                      dbo.Data0010 AS Data0010_1 ON Data0060_2.CUSTOMER_PTR = Data0010_1.RKEY ON 
                      dbo.Data0097.RKEY = Data0060_2.PURCHASE_ORDER_PTR RIGHT OUTER JOIN
                      dbo.data0416 INNER JOIN
                      dbo.Data0005 ON dbo.data0416.empl_ptr = dbo.Data0005.RKEY INNER JOIN
                      dbo.Data0008 INNER JOIN
                      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN
                      dbo.Data0010 AS Data0010_2 ON dbo.Data0025.CUSTOMER_PTR = Data0010_2.RKEY INNER JOIN
                      dbo.Data0053 INNER JOIN
                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN
                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR ON 
                      dbo.data0416.rkey = dbo.Data0053.NPAD_PTR LEFT OUTER JOIN
                      dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY ON Data0060_2.RKEY = dbo.Data0053.barcode_ptr inner join
                     dbo.data0007 ON dbo.data0008.PR_GRP_POINTER=dbo.data0007.rkey
WHERE     dbo.Data0053.QUANTITY > 0 
) A
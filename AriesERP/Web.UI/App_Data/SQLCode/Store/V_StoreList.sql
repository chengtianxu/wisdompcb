(SELECT     TOP (100) PERCENT dbo.Data0006.WORK_ORDER_NUMBER as '作业单号', CASE WHEN Data0060.SALES_ORDER IS NOT NULL 
                      THEN Data0060.SALES_ORDER ELSE '' END AS '销售订单号', dbo.Data0097.PO_NUMBER as '客户订单号', 
                      
                      dbo.Data0025.MANU_PART_NUMBER as '本厂编号', dbo.Data0025.MANU_PART_DESC as '客户型号',dbo.Data0025.ANALYSIS_CODE_2 as '客户物料号', 
                      
                      dbo.Data0025.SAMPLE_NR as '测式成型备注', CASE Data0025.TTYPE WHEN 0 THEN '量产' WHEN 1 THEN '样板' ELSE '未定义' END AS '产品属性',
                      data0025.CPJS as '产品阶数',
                      CASE WHEN Data0060.customer_ptr IS NOT NULL THEN Data0010_1.ABBR_NAME ELSE data0010.ABBR_NAME END AS '客户简称',
                      CASE WHEN Data0060.customer_ptr IS NOT NULL THEN Data0010_1.cust_code ELSE data0010.cust_code END AS '客户代码',
                      case when data0053.barcode_ptr is not null then data0060.ORIG_CUSTOMER else data0025.ORIG_CUSTOMER end as '关联原客户',
                                            
                      dbo.Data0008.PRODUCT_NAME as '产品类别名称', dbo.Data0008.PROD_CODE as '产品类别', 
                      
                      dbo.Data0060.PARTS_ORDERED as '订单数量', dbo.Data0053.QTY_ON_HAND as '库存数量', 
                                                                 
                      dbo.Data0025.LATEST_PRICE as '最新价格',  dbo.Data0001.CURR_NAME as '货币名称', 
                       ROUND(dbo.Data0053.QUANTITY * (dbo.Data0053.cost_pcs + dbo.Data0053.matl_ovhd_pcs +
                      dbo.Data0053.OVHD_COST + dbo.Data0053.PLANNED_QTY+data0053.ovhd1_pcs+data0053.outsource_pcs), 4)   AS '成本',
                      dbo.Data0010.FED_TAX_ID_NO as '付款方法', 
                      
                      dbo.Data0053.MFG_DATE as '入仓日期', dbo.Data0060.SCH_DATE as '回复交期',dbo.Data0053.MFG_DATE + dbo.Data0025.REVIEW_DAYS AS '过期日期',
                      CASE WHEN DATEDIFF(day, GETDATE(), dbo.Data0060.SCH_DATE) < 0 THEN '已超期' ELSE '有效' END AS '状态',
                      
                      dbo.Data0015.WAREHOUSE_CODE as '工厂', dbo.Data0016.LOCATION as '仓库', dbo.Data0053.spec_place as '具体位置',
                      
                      dbo.Data0060.REFERENCE_NUMBER AS '订单参考', dbo.Data0053.REFERENCE_NUMBER as '备注',
                      
                      dbo.Data0005.EMPLOYEE_NAME as '入库人员',d05.EMPLOYEE_NAME AS '业务员姓名',  
                      
                      
                      CASE Data0060.COMMISION_ON_TOOLING WHEN 'Y' THEN '转厂' WHEN 'N' THEN '内销' END AS '销售方式', 
                       
                      dbo.Data0025.REPORT_UNIT_VALUE1 as '单重(G)', ROUND(dbo.Data0053.QTY_ON_HAND * dbo.Data0025.REPORT_UNIT_VALUE1 * 0.001, 4) AS '总重(KG)', 
                      ROUND(dbo.Data0053.QTY_ON_HAND * dbo.Data0025.unit_sq, 4) AS '库存面积',

                      CASE data0053.rma_ptr WHEN 0 THEN '正常过数入仓' WHEN 1 THEN '退货重检入仓' WHEN 2 THEN '返修重检入仓' WHEN 3 THEN '直接入仓' WHEN 4 THEN '委外加工入仓'
                       WHEN 5 THEN '委外加工退货入仓' WHEN 6 THEN '销售退货入仓' WHEN 7 THEN '转换入仓' WHEN 8 THEN '特殊入仓' END AS '入仓类型',
                      dbo.data0053.ischaban as '好板叉板',dbo.data0053.zhouqi as '周期',
                      
                      dbo.Data0023.ABBR_NAME as '外协厂家'
FROM         dbo.Data0006 RIGHT OUTER JOIN
                      dbo.Data0097 RIGHT OUTER JOIN
                      dbo.Data0005 AS d05 RIGHT OUTER JOIN
                      dbo.Data0060 ON d05.RKEY = dbo.Data0060.COMM_ASSIGNED_BY_E_P RIGHT OUTER JOIN
                      dbo.Data0008 INNER JOIN
                      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN
                      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN
                      dbo.Data0053 INNER JOIN
                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY INNER JOIN
                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY ON dbo.Data0025.RKEY = dbo.Data0053.CUST_PART_PTR INNER JOIN
                      dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNER JOIN
                      dbo.Data0005 ON dbo.data0416.empl_ptr = dbo.Data0005.RKEY ON dbo.Data0060.RKEY = dbo.Data0053.barcode_ptr LEFT OUTER JOIN
                      dbo.Data0010 AS Data0010_1 ON dbo.Data0060.CUSTOMER_PTR = Data0010_1.RKEY LEFT OUTER JOIN
                      dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.Data0023.RKEY LEFT OUTER JOIN
                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY ON dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON 
                      dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PTR
WHERE     (dbo.Data0053.QTY_ON_HAND > 0) ) A
(
SELECT Data0098.RMA_NUMBER AS 退货单号码, Data0010.CUST_CODE AS 客户代码,
       Data0010.abbr_name AS 客户简称,Data0025.MANU_PART_DESC AS 客户型号,
       Data0025.MANU_PART_NUMBER AS 本厂编号, Data0060.SALES_ORDER as 订单编号,
       Data0098.RMA_DATE AS 退货日期,Data0097.PO_NUMBER AS 客户订单号,
       Data0098.QTY_AUTH AS 退货数量, Data0098.QTY_RECD AS 已接收数量,
       Data0060.PARTS_RETURNED - Data0060.RETURNED_SHIP AS 欠货数PCS,
       Data0005.EMPLOYEE_NAME AS 录入人员,Data0023.ABBR_NAME AS 外发供应商,
       Data0060.parts_alloc AS 原币不含税单价,
       Round((Data0060.parts_alloc / data0060.exch_rate),6) AS  本币不含税单价,
       Data0001.CURR_NAME AS 货币,Data0008.PRODUCT_NAME AS 产品类别,
       Data0116.MEMO_NUMBER AS 备忘号,Data0025.unit_sq as 单只面积,
       DATA0098.qty_recd*Data0025.unit_sq as 总面积,DATA0015.WAREHOUSE_CODE AS 工厂代码,
       case Data0098.RMA_STATUS when 1 then '未提交' when 2 then '待入仓' when 3 then '已入仓' when 4 then '已充帐' end as 退货状态,
       case Data0098.rma_type when 0 then '客户退货' when 1 then '主动召回' end as 退货类型,
       ROUND(DATA0098.qty_recd*Data0025.REPORT_UNIT_VALUE1*0.001,4) as 总重量,
       ROUND(DATA0098.QTY_AUTH*Data0060.PARTS_ALLOC*(1+Data0060.RUSH_CHARGE*0.01),4) as 原币含税退货金额,
       Data0098.remark AS 常用备注,Data0098.qty_ship AS 需补货数
FROM   Data0008 INNER JOIN
       Data0098 INNER JOIN
       Data0005 ON Data0098.AUTH_BY_EMPL_PTR = Data0005.RKEY INNER JOIN
       Data0025 ON Data0098.CUSTOMER_PART_PTR = Data0025.RKEY ON
       Data0008.RKEY = Data0025.PROD_CODE_PTR INNER JOIN
       Data0010 ON Data0098.CUSTOMER_PTR = Data0010.RKEY LEFT OUTER JOIN
       Data0060 LEFT OUTER JOIN
       Data0015 ON Data0060.SHIP_REG_TAX_ID = Data0015.RKEY LEFT OUTER JOIN
       Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY LEFT OUTER JOIN 
       Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.rkey ON
       Data0098.SO_PTR = Data0060.RKEY LEFT OUTER JOIN
       Data0023 ON Data0060.supplier_ptr = Data0023.RKEY LEFT OUTER JOIN
       Data0116 ON Data0098.srce_ptr= Data0116.rkey
) a
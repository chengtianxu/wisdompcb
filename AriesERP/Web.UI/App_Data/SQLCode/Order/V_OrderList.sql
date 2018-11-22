(--订单列表查询视图
SELECT     dbo.Data0060.SALES_ORDER AS 销售订单号,dbo.Data0015.ABBR_NAME 工厂,

dbo.Data0025.MANU_PART_NUMBER AS 本厂编号, dbo.Data0025.MANU_PART_DESC AS 客户型号, dbo.Data0025.ANALYSIS_CODE_2 AS 客户物料号,
dbo.Data0025.ANALYSIS_CODE_1 AS 交货尺寸, dbo.Data0025.set_qty AS 交货单元数, dbo.Data0025.SAMPLE_NR AS 测试成型备注,

CASE data0025.ttype WHEN 0 THEN '量产' WHEN 1 THEN '样板' END AS 产品属性, dbo.Data0025.LAYERS AS 层数,dbo.Data0008.PRODUCT_NAME AS 产品类型,

dbo.Data0010.CUST_CODE AS 客户代码, dbo.Data0010.ABBR_NAME AS 客户简称, 
dbo.Data0097.PO_NUMBER AS 客户订单号, dbo.Data0060.ORIG_CUSTOMER AS 关联原客户, 
                       
       dbo.Data0060.ENT_DATE AS 下单日期, 
      dbo.Data0060.ORIG_SCHED_SHIP_DATE AS 计划交期,
      dbo.Data0060.SCH_DATE AS 回复交期, 
      dbo.Data0060.CONF_DATE AS 确认日期,

     case DATA0060.STATUS when 1 then '有效' when 2 then '暂缓' when 3 then '关闭' 
     when 4 then '已完成' when 6 then '未提交' end as 订单状态, 
     data0060.so_oldnew  as 订单新旧,                  
     case data0060.QUOTE_PRICE when 0 then '未评审' when 1 then '已评审'
     when 2 then '被退回' when 3 then '不评审' end as 评审标记,
     case data0060.so_tp when 0 then '自制' when 1 then '外发' when 2 then '半制程' end as 加工形式,
    case  data0060.PROD_REL when 1 then '未确认' when 2 then '已确认' when 3 then '已投产' end as 生产标记,

     dbo.Data0005.EMPLOYEE_NAME as 输入人员, data0005_1.EMPLOYEE_NAME AS 业务员, data0005_2.EMPLOYEE_NAME AS 确认人员,

   data0060.PARTS_ORDERED as 数量,data0060.PARTS_ORDERED*data0025.unit_sq as 面积,
  round(data0060.PARTS_ALLOC*(1+data0060.RUSH_CHARGE*0.01),4) as 含税价格,data0060.RUSH_CHARGE as 税率,
  round(data0060.PARTS_ORDERED*data0060.PARTS_ALLOC*(1+data0060.RUSH_CHARGE*0.01),2) as 含税金额,
    case when data0060.tax_in_price='Y' then Data0060.TOTAL_ADD_L_PRICE
   else Data0060.TOTAL_ADD_L_PRICE*(1+data0060.RUSH_CHARGE*0.01) end  as 工具费用,
  data0001.curr_name as 货币,

   dbo.Data0060.REFERENCE_NUMBER AS 订单参考,

   data0060.ISSUED_QTY as 投产数量,data0060.PARTS_SHIPPED as 送货数量,data0060.PARTS_RETURNED as 退货数量,data0060.RETURNED_SHIP as 退货再出货数量,
   data0060.PARTS_ORDERED-data0060.PARTS_SHIPPED+data0060.PARTS_RETURNED-data0060.RETURNED_SHIP as 欠货数量
   
FROM	dbo.Data0060 INNER JOIN
        dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN
        dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN
        dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN
        dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN
        dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RKEY INNER JOIN
        dbo.Data0005 ON dbo.Data0060.ENTERED_BY_EMPL_PTR = dbo.Data0005.RKEY INNER JOIN
        dbo.Data0005 AS data0005_1 ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = data0005_1.RKEY LEFT OUTER JOIN
        dbo.Data0005 AS data0005_2 ON dbo.Data0060.CONF_BY_EMPL_PTR = data0005_2.RKEY inner join data0001
        on data0060.CURRENCY_PTR=data0001.rkey
) a
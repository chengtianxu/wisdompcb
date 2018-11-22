(
--报废明细查询,TDATETIME排序用
SELECT  D58.TDATETIME,D58.MRB_NO as 报废单号, dbo.Data0006.CUT_NO as 配料单号,dbo.Data0006.WORK_ORDER_NUMBER as 作业单号, dbo.Data0039.REJECT_DESCRIPTION as 缺陷名称, 
                      CASE dbo.Data0039.rej_type WHEN 0 THEN '工厂报废' WHEN 1 THEN '供应商报废' WHEN 2 THEN '客户报废' WHEN 3 THEN '市场报废' WHEN 4 THEN '其它' END AS
                       缺陷分类, D58.QTY_REJECT as 报废PCS,dbo.Data0025.SAMPLE_NR as 测试成型备注, D58.PANELS as 报废PNL,  dbo.Data0034.DEPT_NAME as 责任工序名称, dbo.Data0025.MANU_PART_NUMBER as 本厂编号, 
                       dbo.Data0008.PRODUCT_NAME as 类型名称,  dbo.Data0010.ABBR_NAME as 客户简称, dbo.Data0025.set_qty as 交货单元数, dbo.Data0025.ANALYSIS_CODE_1 as 交货尺寸,convert(decimal(18,10), dbo.Data0025.unit_sq) as 单只面积 ,convert(decimal(18,10), D58.QTY_REJECT * dbo.Data0025.unit_sq) AS 报废面积, 
                      CAST(D58.QTY_REJECT * dbo.Data0025.unit_sq / dbo.GetParentNum(dbo.Data0025.RKEY) AS decimal(30, 10)) AS '顶层报废面积', 
                      dbo.Data0034.cost_name as 成本中心名称, 
                     convert(decimal(18,10), CASE WHEN data0006.PARTS_PER_PANEL > 0 THEN D58.QTY_REJECT * data0006.panel_ln * data0006.panel_wd * 0.000001 / data0006.PARTS_PER_PANEL ELSE D58.QTY_REJECT
                       * dbo.Data0025.unit_sq END) AS  报率面积含板边, dbo.Data0060.ORIG_CUSTOMER as 关联原客户, Data0034_1.DEPT_NAME AS 申请工序名称,
                       CASE D58.TTYPE WHEN 0 THEN '生产报废' WHEN 1 THEN '盘点报废' END AS 报废类型, dbo.data0492.SO_NO as 销售订单, dbo.Data0097.PO_NUMBER as 客户订单号, 
                      dbo.Data0015.ABBR_NAME AS 工厂简称,  ISNULL(Data0034_2.DEPT_NAME, 
                      dbo.Data0034.DEPT_NAME) AS 责任班组部门名称, dbo.Data0025.CPJS as 产品阶数, dbo.Data0025.LAYERS as 层数 , dbo.data0492.ISSUED_QTY as 投产数量 , dbo.data0492.ORD_REQ_QTY as 待计数订单数, 
                      dbo.data0492.QTY_REJECT AS 报废数量,D58.TDATETIME as 日期
FROM         dbo.Data0058 AS D58 INNER JOIN
                      dbo.Data0006 ON D58.WO_PTR = dbo.Data0006.RKEY INNER JOIN
                      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN
                      dbo.Data0039 ON D58.REJECT_PTR = dbo.Data0039.RKEY INNER JOIN
                      dbo.Data0005 ON D58.EMPL_PTR = dbo.Data0005.RKEY INNER JOIN
                      dbo.Data0034 ON D58.RESP_DEPT_PTR = dbo.Data0034.RKEY LEFT OUTER JOIN
                      dbo.Data0034 AS Data0034_2 ON dbo.Data0034.BIG_DEPT_PTR = Data0034_2.RKEY INNER JOIN
                      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN
                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN
                      dbo.Data0034 AS Data0034_1 ON D58.DEPT_PTR = Data0034_1.RKEY INNER JOIN
                      dbo.Data0010 ON dbo.data0492.COMPLETED = dbo.Data0010.RKEY LEFT OUTER JOIN 
					  dbo.Data0060 ON dbo.Data0060.SALES_ORDER = dbo.data0492.SO_NO LEFT OUTER JOIN 
					  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY  LEFT OUTER JOIN
                      dbo.Data0005 AS d05 ON D58.AUDIT_EMPL_PTR = d05.RKEY INNER JOIN
                      dbo.Data0015 ON D58.warehouse_ptr = dbo.Data0015.RKEY
--WHERE     (D58.TDATETIME >= '2017-02-11 00:00:00') AND (D58.TDATETIME <= '2017-02-11 7:00:00') AND (D58.TTYPE <> 2)  
) a 

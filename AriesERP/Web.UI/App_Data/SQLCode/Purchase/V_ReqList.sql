(--请购单明细查询
SELECT  Data0068.PO_REQ_NUMBER as 请购单号,Data0068.REQ_DATE as 请购日期,
		Data0034.DEPT_NAME as 请购部门,Data0005.EMPLOYEE_NAME as 请购人员,

        CASE Data0068.FLAG when 'S' then '生产物料' else '非生产物料' end as 类别,
        CASE Data0068.STATUS WHEN 7 THEN '未提交' WHEN 1 THEN '待审批' WHEN 2 THEN '待采购' WHEN 3 THEN '已批准' 
        WHEN 4 THEN '被退回' WHEN 5 THEN '请购单已撤消' WHEN 6 THEN '请购单已处理' END AS 状态,

        Data0017.INV_PART_NUMBER as 材料编码,Data0017.INV_NAME as 材料名称, Data0017.INV_DESCRIPTION as 材料规格,

        Data0069.QUANTITY as 请购数量,Data0069.req_quantity as 请购需求数量,

		Data0001.CURR_NAME as 货币,Data0002.UNIT_NAME as 单位,

		Data0023.ABBR_NAME as 供应商,Data0015.ABBR_NAME as 工厂,

        Data0069.reason as 请购原因,Data0069.extra_req as 特别要求
FROM    Data0069 INNER JOIN
        Data0017 ON Data0069.INVT_PTR = Data0017.RKEY INNER JOIN
        Data0068 ON Data0069.PURCH_REQ_PTR = Data0068.RKEY INNER JOIN
        Data0015 ON Data0068.WHSE_PTR = Data0015.RKEY INNER JOIN
        Data0005 ON Data0068.REQ_BY = Data0005.RKEY INNER JOIN
        Data0002 ON Data0069.UNIT_PTR = Data0002.RKEY INNER JOIN
        Data0034 ON Data0068.DEPARTMENT_NAME = Data0034.DEPT_CODE LEFT OUTER JOIN
        Data0001 ON Data0069.PO_LINK_PTR = Data0001.RKEY LEFT OUTER JOIN
        Data0023 ON Data0069.SUPP_PTR = Data0023.RKEY
--WHERE 1=1
UNION
SELECT  Data0068_1.PO_REQ_NUMBER as 请购单号,Data0068_1.REQ_DATE as 请购日期,

        Data0034_1.DEPT_NAME as 请购部门, Data0005_1.EMPLOYEE_NAME as 请购人员,

        CASE Data0068_1.FLAG when 'S' then '生产物料' else '非生产物料' end as 类别,
        CASE Data0068_1.STATUS WHEN 7 THEN '未提交' WHEN 1 THEN '待审批' WHEN 2 THEN '待采购' WHEN 3 THEN '已批准' 
        WHEN 4 THEN '被退回' WHEN 5 THEN '请购单已撤消' WHEN 6 THEN '请购单已处理' END AS 状态,

        Data0204.DESCRIPTION_2 as 材料编码,Data0204.DESCRIPTION_1 as 材料名称, Data0204.GUI_GE as 材料规格,

		Data0204.QUANTITY_REQUIRED as 请购数量,Data0204.req_quantity 请购需求数量,

        Data0001_1.CURR_NAME as 货币, Data0002_1.UNIT_NAME as 单位, 

        Data0023_1.ABBR_NAME as 供应商,Data0015_1.ABBR_NAME as 工厂,

        Data0204.reason 请购原因, '' AS 特别要求
FROM    Data0204 INNER JOIN
        Data0068 AS Data0068_1 ON Data0204.PURCHASE_REQ_PTR = Data0068_1.RKEY INNER JOIN
        Data0015 AS Data0015_1 ON Data0068_1.WHSE_PTR = Data0015_1.RKEY INNER JOIN
        Data0005 AS Data0005_1 ON Data0068_1.REQ_BY = Data0005_1.RKEY INNER JOIN
        Data0002 AS Data0002_1 ON Data0204.G_L_PTR = Data0002_1.RKEY INNER JOIN
        Data0034 AS Data0034_1 ON Data0068_1.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN
        Data0001 AS Data0001_1 ON Data0204.PO_LINK_PTR = Data0001_1.RKEY LEFT OUTER JOIN
        Data0023 AS Data0023_1 ON Data0204.SUPPLIER_PTR = Data0023_1.RKEY
--WHERE 1=1
) a
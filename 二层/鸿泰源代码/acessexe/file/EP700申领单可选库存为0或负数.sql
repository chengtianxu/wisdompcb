--修改申领单，如库存为0，库存为负数，可以找到
--vdata0700_2,vdata0700_2A

SELECT     Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION, Data0017.INV_NAME, Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_NAME,
                          (SELECT     sum(CASE isnull(data0701.ISSUEDFLAG, 0) WHEN 0 THEN data0701.quan ELSE isnull(data0701.total, 0) END) AS quan
                            FROM          data0701, data0700
                            WHERE      data0701.data0700_rkey = data0700.rkey AND data0700.status IN (0, 1, 2, 4) AND data0701.INV_PART_NUMBER = data0017.inv_part_number AND 
                                                   isnull(data0701.ISSUEDFLAG, 0) IN (0, 2)) AS QuanSum, max(data0022.supplier2) AS SUP2, SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) 
                      > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) AS QUAN_ON_HAND
FROM         Data0017 
LEFT JOIN    Data0022 ON Data0017.RKEY = Data0022.INVENTORY_PTR 
INNER JOIN   Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY 
INNER JOIN   data0496 ON data0017.GROUP_PTR = data0496.rkey AND isnull(data0496.DEP_Flag, 0) = 0
GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION, Data0017.INV_NAME, Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_NAME
HAVING      SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) > 0
UNION
SELECT     Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION, Data0017.INV_NAME, Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_NAME,
                          (SELECT     sum(CASE isnull(ISSUEDFLAG, 0) WHEN 0 THEN quan ELSE isnull(total, 0) END) AS quan
                            FROM          data0701
                            WHERE      INV_PART_NUMBER = data0017.inv_part_number AND isnull(ISSUEDFLAG, 0) IN (0, 2)) AS QuanSum,
                             max(data0022.supplier2) AS SUP2, 
                      SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) AS QUAN_ON_HAND
FROM         Data0017 LEFT JOIN
                      Data0022 ON Data0017.RKEY = Data0022.INVENTORY_PTR INNER JOIN
                      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
                      data0496 ON data0017.GROUP_PTR = data0496.rkey AND isnull(data0496.DEP_Flag, 0) = 1 INNER JOIN
                      Data0837 ON data0496.rkey = Data0837.Key496 AND Data0837.Key34 = 8
GROUP BY Data0017.INV_PART_NUMBER, Data0017.INV_DESCRIPTION, Data0017.INV_NAME, Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_NAME
HAVING      SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) > 0
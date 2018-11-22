--exec EP100;115 24363,536

--CREATE PROCEDURE EP100;115
DECLARE @vptr      INT,
        @vptr2     INT

SET @vptr = 24363   /* 产品型号指针 DATA0050.RKEY */
SET @vptr2 = 536   /* 客户指针 DATA0010.RKEY */
SELECT data0010.cust_code,
       data0010.customer_name,
       data0010.abbr_name,
       data0059.customer_part_desc,
       data0059.customer_matl_desc,
       data0025.manu_part_number,
       data0025.manu_part_desc,
       data0025.qty_bom            AS sysqty,
       data0034.dept_code,
       data0034.dept_name,
       CASE 
            WHEN data0026.inventory_ptr > 0 THEN data0017.inv_part_number
            ELSE RTRIM(data0050.customer_part_number) + RTRIM(data0050.cp_rev1)
       END                         AS inv_part_number,
       CASE 
            WHEN data0026.inventory_ptr > 0 THEN data0017.inv_part_description
            ELSE '自制品' + RTRIM(data0050.customer_part_number) + ' ' + RTRIM(data0050.cp_rev)
                 + ' ' + RTRIM(a.manu_part_number)
       END                         AS inv_part_description,
       ROUND(data0026.qty_bom, 6)  AS qty_bom,
       data0026.remark,
       data0002.unit_code,
       data0002.unit_name,
       data0026.length,
       data0026.width,
       data0026.thickness,
       data0026.uset,
       data0026.sys,
       Data0023.abbr_name          AS supplier
FROM   data0034,
       data0025,
       data0026
       LEFT OUTER JOIN data0017
            ON  data0026.inventory_ptr = data0017.rkey
       LEFT JOIN data0023
            ON  data0026.supp_ptr = data0023.rkey
       LEFT JOIN data0025 A
            ON  data0026.cust_part_ptr = A.rkey
       LEFT JOIN data0050
            ON  A.ancestor_ptr = data0050.rkey
       LEFT JOIN data0010
            ON  data0010.rkey = @vptr2
       LEFT JOIN data0059
            ON  DATA0059.cust_part_ptr = data0050.rkey
            AND data0059.customer_ptr = data0010.rkey
       LEFT JOIN data0002
            ON  data0017.STOCK_UNIT_PTR = data0002.rkey
WHERE  data0026.manu_bom_ptr = data0025.rkey
       AND data0025.ancestor_ptr = @vptr
       AND data0026.flow_no = 0
       AND data0026.dept_ptr = data0034.rkey
ORDER BY
       data0025.parent_ptr,
       data0025.manu_part_number,
       inv_part_number


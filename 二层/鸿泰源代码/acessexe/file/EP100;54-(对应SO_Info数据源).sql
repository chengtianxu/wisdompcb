--exec EP100;54 36872
DECLARE @vptr INT
SET @vptr = 36872
DECLARE @vnum INT
SELECT @vnum = COUNT(*)
FROM   data0060,
       data0025,
       data0050
WHERE  data0060.cust_part_ptr = data0025.ancestor_ptr
       AND data0050.rkey = data0025.ancestor_ptr
       AND data0025.rkey = @vptr
       AND data0060.status <> 2
       AND data0060.status <> 3
       AND data0060.status <> 5
       AND data0060.to_be_planned > 0


IF @vnum = 0
    SELECT TOP 1 data0097.po_number,
           data0060.sales_order,
           data0060.parts_ordered,
           data0060.p_code,
           data0060.CUST_MATL_DESC,
           data0060.parts_ordered / data0050.set_x_qty / data0050.set_y_qty AS 
           sets_ordered,
           data0060.fob                AS contract_number,
           data0060.ORIG_REQUEST_DATE  AS due_date,
           data0060.ent_date,
           data0060.sch_date,
           data0050.unit_sq            AS sales_order_unit_val
    FROM   data0097,
           data0060,
           data0025,
           data0050
    WHERE  data0060.purchase_order_ptr = data0097.rkey
           AND data0060.cust_part_ptr = data0025.ancestor_ptr
           AND data0050.rkey = data0025.ancestor_ptr
           AND data0025.rkey = @vptr
           AND data0060.status <> 2
           AND data0060.status <> 3
           AND data0060.status <> 4
           AND data0060.status <> 5
    ORDER BY
           data0060.rkey                  DESC

IF @vnum > 0
    SELECT TOP 1 data0097.po_number,
           data0060.sales_order,
           data0060.parts_ordered,
           data0060.p_code,
           data0060.CUST_MATL_DESC,
           data0060.parts_ordered / data0050.set_x_qty / data0050.set_y_qty AS 
           sets_ordered,
           data0060.fob                AS contract_number,
           data0060.ORIG_REQUEST_DATE  AS due_date,
           data0060.ent_date,
           data0060.sch_date,
           data0050.unit_sq            AS sales_order_unit_val
    FROM   data0097,
           data0060,
           data0025,
           data0050
    WHERE  data0060.purchase_order_ptr = data0097.rkey
           AND data0060.cust_part_ptr = data0025.ancestor_ptr
           AND data0050.rkey = data0025.ancestor_ptr
           AND data0025.rkey = @vptr
           AND data0060.status <> 2
           AND data0060.status <> 3
           AND data0060.status <> 4
           AND data0060.status <> 5
           AND data0060.to_be_planned > 0
    ORDER BY
           data0060.rkey                  DESC

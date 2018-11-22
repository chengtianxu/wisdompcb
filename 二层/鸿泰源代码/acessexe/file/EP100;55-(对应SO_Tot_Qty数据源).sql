--exec EP100;55 36872,36872 
DECLARE @vptr1     INT,
        @vptr2     INT

SET @vptr1 = 36872
SET @vptr2 = 36872

SELECT SUM(data0060.parts_ordered)  AS total_parts_ordered,
       SUM(
           data0060.parts_ordered / data0050.set_x_qty / data0050.set_y_qty
       )                            AS total_sets_ordered
FROM   data0060,
       data0025,
       data0050
WHERE  data0060.cust_part_ptr = data0025.ancestor_ptr
       AND data0025.ancestor_ptr = data0050.rkey
       AND data0025.rkey = @vptr1
       AND data0060.status <> 2
       AND data0060.status <> 3
       AND data0060.status <> 4
       AND data0060.status <> 5
       AND data0060.purchase_order_ptr IN (SELECT TOP 1 data0097.rkey
                                           FROM   data0097,
                                                  data0060,
                                                  data0025
                                           WHERE  data0060.purchase_order_ptr = 
                                                  data0097.rkey
                                                  AND data0060.cust_part_ptr = 
                                                      data0025.ancestor_ptr
                                                  AND data0025.rkey = @vptr2
                                           ORDER BY
                                                  data0097.po_date DESC)

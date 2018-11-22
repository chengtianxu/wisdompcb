--exec EP100;152 24344 proj_info
DECLARE @vptr INT

SET @vptr = 24344

SELECT data0222.tdate,
       data0222.qa_description,
       data0222.qa_solution,
       data0034.dept_name
FROM   data0222
       LEFT JOIN data0034
            ON  data0222.dept_ptr = data0034.rkey
WHERE  data0222.cust_part_ptr = @vptr

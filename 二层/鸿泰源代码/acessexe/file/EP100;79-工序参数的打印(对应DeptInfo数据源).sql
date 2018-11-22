--exec EP100;79 36872,2,0
DECLARE @vptr      INT,
        @vptr1     INT,
        @vflow     INT

SET @vptr = 36872
SET @vptr1 = 2
SET @vflow = 0
SELECT data0038.rkey,
       data0038.def_rout_inst,
       data0038.step_number,
       data0038.tooling_rev,
       data0034.dept_code,
       data0034.dept_name,
       data0034.dept_file_number
FROM   data0038,
       data0034
WHERE  data0038.source_ptr = @vptr
       AND data0038.flow_no = @vflow
       AND data0038.dept_ptr = data0034.rkey
       AND data0034.visible_in_mi <> @vptr1
ORDER BY
       data0038.step_number

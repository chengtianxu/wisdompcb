--EXEC EP100;57 1007095,''
DECLARE @rkey     INT,
        @vptr     VARCHAR(30)

SET @rkey = 1007095   /* 工序参数 data0038.rkey */
SET @vptr = ''

IF @vptr = ''
    SELECT data0278.parameter_desc,
           data0494.parameter_value,
           data0002.unit_name AS unit_code,
           data0002.rkey,
           data0494.production_flag
    FROM   data0278,
           data0002,
           Data0494
           LEFT JOIN data0506
                ON  data0506.rkey = data0494.source_ptr
    WHERE  data0494.route_step_ptr = @rkey
           AND data0494.parameter_ptr = data0278.rkey
               --and data0506.doc_flag='Y'
           AND (data0506.doc_flag = 'Y' OR ISNULL(data0506.rkey, 0) = 0) --这个是显示以前输入目前不需要的参数
           AND data0002.rkey = data0278.unit_ptr
           AND data0494.parameter_value <> @vptr
               --and data0494.parameter_value<>'0'
    ORDER BY
           data0506.seq_no

IF @vptr <> ''
    SELECT data0278.parameter_desc,
           data0494.parameter_value,
           data0002.unit_name AS unit_code,
           data0002.rkey,
           data0494.production_flag
    FROM   data0278,
           data0002,
           Data0494
           LEFT JOIN data0506
                ON  data0506.rkey = data0494.source_ptr
    WHERE  data0494.route_step_ptr = @rkey
           AND data0494.parameter_ptr = data0278.rkey
               --and data0506.doc_flag='Y'
           AND (data0506.doc_flag = 'Y' OR ISNULL(data0506.rkey, 0) = 0) --这个是显示以前输入目前不需要的参数
           AND data0002.rkey = data0278.unit_ptr
    ORDER BY
           data0506.seq_no

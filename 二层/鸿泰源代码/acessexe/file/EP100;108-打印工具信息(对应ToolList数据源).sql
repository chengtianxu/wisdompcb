--exec EP100;108 36872
DECLARE @vptr INT 
SET @vptr = 36872
DECLARE @vflag INT
DECLARE @vptr2 INT
SELECT @vflag = ISNULL(disp_tool_on_top_layer_flag, 0)
FROM   data0195

IF @vflag = 1
    SELECT @vptr2 = ISNULL(ancestor_ptr, 0)
    FROM   data0025
    WHERE  rkey               = @vptr
           AND parent_ptr     = 0

IF @vflag = 0
    SELECT data0025.manu_part_number,
           data0034.dept_name,
           data0038.step_number,
           data0030.tool_tp_name,
           data0033.tool_ptr,
           data0033.rkey         AS d033_rkey,
           data0033.d038_ptr,
           data0033.d031_ptr,
           data0033.tp_flag,
           data0033.cust_part_ptr,
           data0031.description,
           data0031.filename,
           CASE 
                WHEN ISNULL(tp_flag, 0) = 0 THEN data0032.tool_remark
                ELSE '共用'
           END                   AS tool_remark,
           data0031.rkey         AS d031_rkey,
           data0031.tool_tp_ptr  AS tool_type_ptr,
           data0038.rkey         AS d038_rkey,
           data0032.*,
           data0042.*
    FROM   dbo.Data0032(NOLOCK)
           INNER JOIN dbo.Data0042(NOLOCK)
                ON  dbo.Data0032.RKEY = dbo.Data0042.tool_ptr
           RIGHT OUTER JOIN dbo.Data0038(NOLOCK)
           INNER JOIN dbo.Data0025(NOLOCK)
                ON  dbo.Data0038.SOURCE_PTR = dbo.Data0025.RKEY
           INNER JOIN dbo.Data0034(NOLOCK)
                ON  dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY
           INNER JOIN dbo.Data0031(NOLOCK)
                ON  dbo.Data0034.DEPT_PTR = dbo.Data0031.DEPT_PTR
           INNER JOIN dbo.Data0030(NOLOCK)
                ON  dbo.Data0031.TOOL_TP_PTR = dbo.Data0030.RKEY
           LEFT OUTER JOIN dbo.Data0033(NOLOCK)
                ON  dbo.Data0031.RKEY = dbo.Data0033.D031_PTR
                AND dbo.Data0033.D038_PTR = dbo.Data0038.RKEY
                ON  dbo.Data0032.RKEY = dbo.Data0033.Tool_ptr
    WHERE  Data0025.rkey = @vptr
           AND data0032.rkey > 0
    ORDER BY
           dbo.Data0025.RKEY,
           dbo.Data0038.STEP_NUMBER,
           data0031.seq_no

IF @vflag = 1
    SELECT data0025.manu_part_number,
           data0034.dept_name,
           data0038.step_number,
           data0030.tool_tp_name,
           data0033.tool_ptr,
           data0033.rkey         AS d033_rkey,
           data0033.d038_ptr,
           data0033.d031_ptr,
           data0033.tp_flag,
           data0033.cust_part_ptr,
           data0031.description,
           data0031.filename,
           CASE 
                WHEN ISNULL(tp_flag, 0) = 0 THEN data0032.tool_remark
                ELSE '共用'
           END                   AS tool_remark,
           data0031.rkey         AS d031_rkey,
           data0031.tool_tp_ptr  AS tool_type_ptr,
           data0038.rkey         AS d038_rkey,
           data0032.*,
           data0042.*
    FROM   dbo.Data0032(NOLOCK)
           INNER JOIN dbo.Data0042(NOLOCK)
                ON  dbo.Data0032.RKEY = dbo.Data0042.tool_ptr
           RIGHT OUTER JOIN dbo.Data0038(NOLOCK)
           INNER JOIN dbo.Data0025(NOLOCK)
                ON  dbo.Data0038.SOURCE_PTR = dbo.Data0025.RKEY
           INNER JOIN dbo.Data0034(NOLOCK)
                ON  dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY
           INNER JOIN dbo.Data0031(NOLOCK)
                ON  dbo.Data0034.DEPT_PTR = dbo.Data0031.DEPT_PTR
           INNER JOIN dbo.Data0030(NOLOCK)
                ON  dbo.Data0031.TOOL_TP_PTR = dbo.Data0030.RKEY
           LEFT OUTER JOIN dbo.Data0033(NOLOCK)
                ON  dbo.Data0031.RKEY = dbo.Data0033.D031_PTR
                AND dbo.Data0033.D038_PTR = dbo.Data0038.RKEY
                ON  dbo.Data0032.RKEY = dbo.Data0033.Tool_ptr
    WHERE  Data0025.ancestor_ptr = @vptr2
           AND data0032.rkey > 0
    ORDER BY
           dbo.Data0025.RKEY,
           dbo.Data0038.STEP_NUMBER,
           data0031.seq_no


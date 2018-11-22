-- EP100;56 
DECLARE @vptr1 INT
DECLARE @vptr2 INT

SET @vptr1 = 36872   /* 部件RKEY */
SET @vptr2 = 36872
DECLARE @vflag INT
SELECT @vflag = ISNULL(mi_rpt_sort_flag, 0)
FROM   data0195

PRINT @vflag

-- mi_rpt_sort_flag  控制开关,MI报表全局参数顺序是否单独控制 
-- 0 不单独控制 1 单独控制

IF @vflag = 0
    SELECT data0278.mark,
           data0278.sequence_no,
           data0278.parameter_desc,
           CONVERT(CHAR(30), Data0047.PARAMETER_VALUE) AS parameter_value,
           data0278.production_flag,
           data0002.unit_name AS unit_code,
           data0002.rkey
    FROM   data0002,	--单位表
           data0277,	--参数类型表
           data0278 --参数明细表
           
           LEFT OUTER JOIN data0047 --部件参数表
                ON  data0047.source_pointer = @vptr1
                AND data0047.parameter_ptr = data0278.rkey
    WHERE  data0278.category_ptr = data0277.rkey
           AND data0277.category_type = 1
               --category_type 1-基本单位;2-全局参数;3-其它
           AND data0278.unit_ptr = data0002.rkey
           AND data0278.status = 0
    --STATUS	不显示在MI(全局参数)  0显示  1不显示
    
    UNION

SELECT data0278.mark,
       data0278.sequence_no,
       data0278.parameter_desc,
       data0279.parameter_value,
       data0279.production_flag,
       data0002.unit_name AS unit_code,
       data0002.rkey
FROM   data0277,	--参数类别
       data0002,	--单位
       data0278,	--工程参数
       data0279 --全局参数IES参数
WHERE  data0278.category_ptr = data0277.rkey
       AND data0277.category_type = 2
           --category_type 1-基本单位;2-全局参数;3-其它
       AND data0278.unit_ptr = data0002.rkey
       AND data0278.status = 0
           --STATUS	不显示在MI(全局参数)  0显示  1不显示
       AND data0279.parameter_ptr = data0278.rkey
       AND data0279.ies_prod = 1
           --  data0279.ies_prod (0:不是全局参数;1:全局参数)
       AND data0279.source_ptr = @vptr2
ORDER BY
       data0278.mark,
       data0278.sequence_no,
       data0278.parameter_desc

IF @vflag = 1
    SELECT data0278.mark,
           data0278.rpt_sequence_no,
           data0278.parameter_desc,
           CONVERT(CHAR(30), Data0047.PARAMETER_VALUE) AS parameter_value,
           data0278.production_flag,
           data0002.unit_name AS unit_code,
           data0002.rkey
    FROM   data0002,	--单位
           data0277,	--参数类别
           data0278 --参数明细
           
           LEFT OUTER JOIN data0047 -- 产品部件基本参数表(每个不同的公司，用来单独控制顺序的）
                ON  data0047.source_pointer = @vptr1
                AND data0047.parameter_ptr = data0278.rkey
    WHERE  data0278.category_ptr = data0277.rkey
           AND data0277.category_type = 1
               --category_type 1-基本单位;2-全局参数;3-其它
           AND data0278.unit_ptr = data0002.rkey
           AND data0278.status = 0
    --STATUS	不显示在MI(全局参数)  0显示  1不显示
    UNION

SELECT data0278.mark,
       data0278.rpt_sequence_no,
       data0278.parameter_desc,
       data0279.parameter_value,
       data0279.production_flag,
       data0002.unit_name AS unit_code,
       data0002.rkey
FROM   data0277,
       data0002,
       data0278,
       data0279 ---全局参数IES参数
WHERE  data0278.category_ptr = data0277.rkey
       AND data0277.category_type = 2
           --category_type 1-基本单位;2-全局参数;3-其它
       AND data0278.unit_ptr = data0002.rkey
       AND data0278.status = 0
           --STATUS	不显示在MI(全局参数)  0显示  1不显示
       AND data0279.parameter_ptr = data0278.rkey
       AND data0279.ies_prod = 1
           --  data0279.ies_prod (0:不是全局参数;1:全局参数)
       AND data0279.source_ptr = @vptr2
ORDER BY
       data0278.rpt_sequence_no,
       data0278.parameter_desc

DECLARE @vflag INT
SELECT @vflag = eng_press_instr_flag
FROM   data0195

IF @vflag = 0
BEGIN
    SELECT data0025.rkey,
           data0554.press_bmp,
           data0564.vcut_bmp
    FROM   data0025
           LEFT OUTER JOIN data0554
                ON  data0554.source_ptr = data0025.rkey
           LEFT OUTER JOIN data0564
                ON  data0564.source_ptr = data0025.rkey
    WHERE  data0025.ancestor_ptr = 24344
           AND data0025.parent_ptr = 0
           AND (data0554.rkey > 0 OR data0564.rkey > 0)
END

IF @vflag = 1
BEGIN
    SELECT data0025.rkey,
           data0554.press_bmp,
           data0564.vcut_bmp
    FROM   data0025
           LEFT OUTER JOIN data0554
                ON  data0554.source_ptr = data0025.rkey
           LEFT OUTER JOIN data0564
                ON  data0564.source_ptr = data0025.ancestor_ptr
    WHERE  data0025.RKEY = 36872
END
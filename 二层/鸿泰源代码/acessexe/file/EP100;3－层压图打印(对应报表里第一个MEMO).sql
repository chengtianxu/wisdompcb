--exec EP100;3 36872
44表是层压给结图 ，46表是层压图里的特殊信息，552表是层压示意图SOURCE_PTR=50表的RKEY 554层压排版图 564

-- 层压打印的话，会显示在第一次拖在界面的是MEMO控件上

--MI层压示意图 设置方式 EP100;3
--eng_press_instr_flag  (0 以产品 ； 1 以部件）
-- DATA0046  压层信息表
DECLARE @vflag INT
SELECT @vflag = eng_press_instr_flag
FROM   data0195;

PRINT @vflag;

IF @vflag = 0
    SELECT DATA0046.*
    FROM   data0046
    WHERE  srce_ptr IN (SELECT rkey
                        FROM   DATA0025
                        WHERE  DATA0025.ANCESTOR_PTR = 1844)  --产品型号指针

IF @vflag = 1
    SELECT DATA0046.*
    FROM   data0046
    WHERE  srce_ptr = 36872  --部件指针

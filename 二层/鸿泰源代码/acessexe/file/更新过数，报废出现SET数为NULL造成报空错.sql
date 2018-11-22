EP013报空值出错
SET数量为空导致
UPDATE data0006
SET    parts_per_set = data0047.parameter_value
FROM   data0006,
       data0047,
       data0278
WHERE  data0006.bom_ptr = data0047.source_pointer
       AND data0047.parameter_ptr = data0278.rkey
       AND data0278.spec_rkey = 'B'
       AND DATA0006.ENT_DATETIME > GETDATE() -180
       AND parts_per_set IS NULL

UPDATE DATA0006
SET    SETS_QTY = CEILING(QUAN_SCH / parts_per_set)
WHERE  parts_per_set > 0
       AND data0006.sets_qty IS NULL

UPDATE DATA0056
SET    SETS_QTY = CEILING(QTY_BACKLOG / DATA0006.parts_per_set)
FROM   DATA0056,
       DATA0006
WHERE  DATA0056.WO_PTR = DATA0006.RKEY
       AND DATA0006.parts_per_set > 0
       AND data0056.sets_qty IS NULL

DECLARE @vptr INT
SET @vptr = 24344  /* 产品型号指针  SPEC_RKEY 中必须有 1,3 或2,4*/
SELECT *
       INTO     #testxx01
FROM   (
           SELECT Data0025.RKEY,
                  Data0278.SPEC_RKEY,
                  Data0278.SEQUENCE_NO,
                  Data0278.PARAMETER_DESC AS parameter_name,
                  RTRIM(Data0279.PARAMETER_VALUE) AS parameter_value
           FROM   Data0278
                  LEFT JOIN Data0279
                       ON  Data0279.PARAMETER_PTR = Data0278.RKEY
                  LEFT JOIN Data0025
                       ON  Data0279.SOURCE_PTR = Data0025.RKEY
           WHERE  (
                      Data0278.SPEC_RKEY IN ('1', '2', '3', '4', '10', '11', 
                                            '12', '13', 'H', 'I', 'S', 'T', 'B', 
                                            'P', '24', '25', '26', '27', '28', 
                                            '29', '30', '31')
                  )
                  AND data0025.ancestor_ptr = @vptr
           UNION
           SELECT Data0025.RKEY,
                  Data0278.SPEC_RKEY,
                  Data0278.SEQUENCE_NO,
                  Data0278.PARAMETER_DESC AS parameter_name,
                  RTRIM(Data0047.PARAMETER_VALUE) AS parameter_value
           FROM   Data0278
                  LEFT JOIN Data0047
                       ON  Data0047.PARAMETER_PTR = Data0278.RKEY
                  LEFT JOIN Data0025
                       ON  Data0047.SOURCE_Pointer = Data0025.RKEY
           WHERE  Data0278.SPEC_RKEY = 'B'
                  AND data0025.ancestor_ptr = @vptr
       )        a

SELECT *
FROM   #testxx01
ORDER BY
       SEQUENCE_NO,
       PARAMETER_NAME

DROP TABLE #testxx01
 

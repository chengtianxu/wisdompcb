EP293是否完工
/* 更新订单号，查出回复交期 */

SELECT rkey,
       STATUS,
       sch_date,
       data0060.sch_date,
       modf_date,
       data0060.complete_status
FROM   data0060
WHERE  data0060.SALES_ORDER = 'HXY000162-01'
  
  
  
/* 输入订单号 */
SELECT ISNULL(Data0060.PARTS_ORDERED, 0) AS qty2
FROM   Data0060
       LEFT JOIN Data0050
            ON  Data0060.CUST_PART_PTR = Data0050.rkey
WHERE  --Data0050.customer_part_number = :@number
       --  AND
       Data0060.SALES_ORDER = 'HXY000162-01'


/* 输入订单号 */
DECLARE @dt VARCHAR(4)
DECLARE @date DATETIME
SELECT @dt = EVALUE_DATE_time --考核交期的截止时间点
FROM   data0192

SELECT @date = '2014-01-22 00:00:00'

PRINT  DATEADD(
                  n,
                  CAST(RIGHT(@dt, 2) AS integer),
                  DATEADD(Hh, CAST(LEFT(@dt, 2) AS integer), @date)
              ) 

SELECT ISNULL(SUM(ISNULL(Data0052.quan_shp, 0)), 0) AS qty3
FROM   Data0064
       LEFT JOIN Data0052
            ON  data0052.SO_SHP_PTR = data0064.rkey
       LEFT JOIN Data0053
            ON  data0052.data0053_ptr = data0053.rkey
       LEFT JOIN Data0060
            ON  Data0064.so_ptr = Data0060.Rkey
       LEFT JOIN Data0050
            ON  Data0053.CUST_PART_PTR = Data0050.rkey
WHERE  --Data0050.customer_part_number = :@number
       -- AND 
       Data0060.SALES_ORDER = 'HXY000162-01'
       AND Data0053.mfg_date <= DATEADD(
               n,
               CAST(RIGHT(@dt, 2) AS integer),
               DATEADD(Hh, CAST(LEFT(@dt, 2) AS integer), @date) --入仓时间
           ) 

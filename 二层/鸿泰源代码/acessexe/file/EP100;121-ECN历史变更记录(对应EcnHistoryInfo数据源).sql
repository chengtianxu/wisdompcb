--exec EP100;121 24344

DECLARE @vptr INT
SET @vptr = 24344  /* 产品型号指针 */
DECLARE @vptr2 INT
SELECT @vptr2 = rkey
FROM   data0273
WHERE  customer_part_ptr = @vptr

DECLARE @vp1 INT
DECLARE @vp2 INT
DECLARE @vp3 INT
DECLARE @vp4 INT
DECLARE @vp5 INT
DECLARE @vp6 INT
DECLARE @vp7 INT
DECLARE @vp8 INT
DECLARE @vnum INT
SELECT @vnum = ecn_list_number
FROM   data0192

SET @vp1 = 0
SET @vp2 = 0
SET @vp3 = 0
SET @vp4 = 0
SET @vp5 = 0
SET @vp6 = 0
SET @vp7 = 0
SET @vp8 = 0

IF @vnum > 1
    SELECT @vp1 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  rkey = @vptr2

IF (@vp1 > 0)
   AND (@vnum > 1)
BEGIN
    SELECT @vp2 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp1
END

IF (@vp2 > 0)
   AND (@vnum > 2)
    SELECT @vp3 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp2

IF (@vp3 > 0)
   AND (@vnum > 3)
    SELECT @vp4 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp3

IF (@vp4 > 0)
   AND (@vnum > 4)
    SELECT @vp5 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp4

IF (@vp5 > 0)
   AND (@vnum > 5)
    SELECT @vp6 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp5

IF (@vp6 > 0)
   AND (@vnum > 6)
    SELECT @vp7 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp6

IF (@vp7 > 0)
   AND (@vnum > 7)
    SELECT @vp8 = MAX(data0273.COPYFROMCUST_PTR)
    FROM   data0273
    WHERE  CUSTOMER_PART_PTR = @vp7


SELECT [ECNB1],
       [ECNB2],
       [ECNB3],
       [ECNB4],
       [ECNB5],
       TEXT,
       [ECNB6],
       [ECNB7],
       [ECNB8],
       [ECNB9],
       [ECNB10],
       [ECNA1],
       [ECNA2],
       [ECNA3],
       [ECNA4],
       [ECNA5],
       [ECNA6],
       [ECNA7],
       [ECNA8],
       [ECNA9],
       [ECNA10],
       data0273.remark,
       A.Customer_part_number  AS FROM_customer_part_number,
       B.customer_part_number  AS TO_customer_part_numberV,
       A.CP_REV                AS FROM_CP_REV,
       B.CP_REV                AS TO_CP_REV,
       data0273.entered_date
FROM   data0273,
       data0050                   a,
       data0050                   b
WHERE  data0273.COPYFROMCUST_PTR = a.rkey
       AND data0273.CUSTOMER_PART_PTR = b.rkey
       AND (
               data0273.rkey = @vptr2
               OR (
                      data0273.COPYFROMCUST_PTR IN (@vp1, @vp2, @vp3, @vp4, @vp5, @vp6, @vp7, @vp8)
                  )
               OR data0273.rkey = @vptr2
           )
ORDER BY
       data0273.entered_date

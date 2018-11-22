exec EP191;6 3,'0','0','2012-01-23','2013-04-27','order by customer_part_number'

SELECT data0059.customer_ptr, data0059.ONHOLD_SALES_FLAG,data0059.*
  FROM Data0059  WHERE data0059.customer_ptr IN (SELECT rkey FROM data0010 WHERE data0010.CUST_CODE='C101001' )


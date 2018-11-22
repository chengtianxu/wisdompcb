--EP031窗口查询
SELECT data0439.*,
       ISNULL(data0274.min_ranking, 0)  AS min_ranking,
       data0010.cust_code,
       data0010.parentcust_ptr,
       data0010.abbr_name,
       data0010.customer_name,
       data0001.curr_code,
       data0012.location,
       data0012.SHIP_TO_CONTACT,
       data0005.employee_name,
       data0012.SHIP_TO_FAX,
       data0012.do_rptfmt_ptr,
       (
           SELECT SUM(quan_stocked)
           FROM   data0064
           WHERE  packing_list_ptr = data0439.rkey
       )                                AS quan_stocked,
       Data0012.SHIP_TO_ADDRESS_1,
       (
           SELECT SUM(quan_diff)
           FROM   data0064
           WHERE  packing_list_ptr = data0439.rkey
       )                                AS quan_diff
/*
 * 
      ,CASE ISNULL(Delivery_status, 0)
            WHEN 0 THEN '未回签'
            ELSE '已回签'
       END                            AS Delivery_status_desc
       */    
FROM   data0439
       INNER JOIN data0010
            ON  data0439.customer_ptr = data0010.rkey
       INNER JOIN data0012
            ON  data0439.ship_addr_ptr = data0012.rkey
       INNER JOIN data0005
            ON  data0439.employee_ptr = data0005.rkey
       LEFT JOIN data0001
            ON  data0439.currency_ptr = data0001.rkey
       LEFT JOIN (
                SELECT d439_ptr,
                       MIN(ranking) AS min_ranking
                FROM   data0274
                GROUP BY
                       d439_ptr
            ) data0274
            ON  data0439.rkey = data0274.d439_ptr
WHERE  (data0439.date_sailing >= '2001-10-22 00:00:00')
       AND (data0439.date_sailing < '2013-11-22 23:59:59')
       AND data0439.use_stauts = 0
       AND ISNULL(invoice_ptr, 0) = 0
       AND tstatus = 0
ORDER BY
       delivery_no

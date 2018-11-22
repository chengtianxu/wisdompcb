wip盘点出现非删除
在线工单
SELECT Data0006.RKEY,Data0006.WORK_ORDER_NUMBER,
      Data0006.CUT_NO,data0492.SO_NO,Data0006.FLOW_NO,
      Data0402.system_quan, '生产中' AS ttype,data0402.panels,
  data0402.rkey as rkey402,data0402.step,data0402.rkey56,
  isnull(DATA0006.SETS_BOM_PTR,Data0006.bom_ptr) as rkey25
FROM Data0006 INNER JOIN
      data0492 ON Data0006.CUT_NO = data0492.CUT_NO INNER JOIN
      data0402 ON Data0006.RKEY = data0402.wo_ptr
WHERE 
      (data0006.bom_ptr=:rkey25) and data0402.flag=0
ORDER BY Data0006.WORK_ORDER_NUMBER


非在线工单
SELECT Data0006.RKEY,Data0006.WORK_ORDER_NUMBER,
      Data0006.CUT_NO,data0492.SO_NO,
      Data0006.FLOW_NO,data0006.panels,
      Data0006.QUAN_sch, '生产结束' AS ttype,
      isnull(Data0006.SETS_BOM_PTR,data0006.bom_ptr) as rkey25
FROM Data0006 INNER JOIN
     data0492 ON Data0006.CUT_NO = data0492.CUT_NO
WHERE (Data0006.PROD_STATUS <> 3) AND --等待
      (Data0006.PROD_STATUS <> 2) AND--生产中
      (data0006.bom_ptr = :rkey25) and
      (data0006.whouse_ptr = :rkey15)

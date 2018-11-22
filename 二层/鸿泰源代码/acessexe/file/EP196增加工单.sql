--EP196增加工单
--非在线
SELECT data0006.bom_ptr,data0006.whouse_ptr,Data0006.RKEY,Data0006.WORK_ORDER_NUMBER,
      Data0006.CUT_NO,data0492.SO_NO,
      Data0006.FLOW_NO,data0006.panels,
      Data0006.QUAN_sch, '生产结束' AS ttype,
      isnull(Data0006.SETS_BOM_PTR,data0006.bom_ptr) as rkey25
FROM Data0006 INNER JOIN
     data0492 ON Data0006.CUT_NO = data0492.CUT_NO
WHERE (Data0006.PROD_STATUS <> 3) and
      (Data0006.PROD_STATUS <> 2) 
      and(data0006.bom_ptr = 36) AND   (data0006.whouse_ptr = 2) --没找到记录 对不起!该产品没有已入仓的工作定单
      
SELECT Data0025.MANU_PART_NUMBER,Data0025.MANU_PART_DESC,Data0050.customer_part_number,
      Data0050.CP_REV,Data0010.ABBR_NAME,Data0025.RKEY
FROM Data0010 INNER JOIN
     Data0059 ON Data0010.RKEY = Data0059.CUSTOMER_PTR 
     inner join data0050 on data0059.cust_part_ptr=data0050.rkey
     INNER JOIN
     Data0025 ON Data0050.RKEY = Data0025.ANCESTOR_PTR
--WHERE data0025.rkey =102   

--在线   
SELECT Data0006.RKEY,Data0006.WORK_ORDER_NUMBER,
      Data0006.CUT_NO,data0492.SO_NO,Data0006.FLOW_NO,
      Data0402.system_quan, '生产中' AS ttype,data0402.panels,
  data0402.rkey as rkey402,data0402.step,data0402.rkey56,
  isnull(DATA0006.SETS_BOM_PTR,Data0006.bom_ptr) as rkey25
FROM Data0006 INNER JOIN
      data0492 ON Data0006.CUT_NO = data0492.CUT_NO INNER JOIN
      data0402 ON Data0006.RKEY = data0402.wo_ptr
WHERE 
      (data0006.bom_ptr=:rkey25) and data0402.flag=0 --没找到记录  对不起!该产品没有被删除的在线工作定单
ORDER BY Data0006.WORK_ORDER_NUMBER  
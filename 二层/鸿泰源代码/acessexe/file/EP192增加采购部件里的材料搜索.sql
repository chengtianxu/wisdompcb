--EP192增加采购部件里的材料搜索
SELECT
  Data0017.RKEY ,
  Data0017.group_ptr ,
  Data0017.INV_PART_NUMBER ,
  Data0017.INV_PART_DESCRIPTION ,
  Data0017.std_cost,
  Data0002.unit_code
FROM  Data0017,data0002
WHERE  Data0017.P_M = 'P' --是采购还是自己制造(P/M)(暂不起作用)
and data0017.stock_unit_ptr=data0002.rkey
ORDER BY  INV_PART_NUMBER
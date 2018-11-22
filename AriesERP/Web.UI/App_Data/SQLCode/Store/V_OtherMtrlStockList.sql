(--杂项材料库存查询
SELECT  dbo.Data0235.goods_name AS 材料名称, dbo.Data0235.goods_guige AS 材料规格
, dbo.Data0235.goods_type AS 材料类型

, isnull(dbo.Data0070.PO_NUMBER,'') as 采购订单号, dbo.Data0023.CODE AS 供应商代码, dbo.Data0023.ABBR_NAME AS 供应商简称

, dbo.Data0015.WAREHOUSE_CODE 工厂代码, dbo.Data0015.ABBR_NAME 工厂名称

, dbo.Data0235.unit_price AS 含税价, ROUND(dbo.Data0235.unit_price / (1 + dbo.Data0235.state_tax * 0.01), 3) AS 不含税价
, ROUND(dbo.Data0235.QUAN_ON_HAND * dbo.Data0235.unit_price, 3) AS 总金额

, dbo.Data0001.CURR_CODE AS 货币, dbo.Data0235.state_tax AS 税率, dbo.Data0456.exch_rate AS 汇率

, dbo.Data0235.QUAN_RECD AS 接收数量, dbo.Data0235.QUAN_ON_HAND AS 当前库存数量

, dbo.Data0002.UNIT_NAME as 单位, dbo.Data0016.LOCATION AS 仓库位置
, case dbo.Data0456.TTYPE when 1 then '编码入仓' when 2 then '杂项入仓'
		when 3 then '直接入仓生产物料' when 4 then '调拨入仓' when 5 then 'VMI入库' 
		when 6 then '直接入库非生产物料' end as 入库类型

, dbo.Data0456.ship_DATE as 到货日期

, isnull(dbo.Data0235.cust_decl,'') AS   报关单号, isnull(dbo.Data0235.REF_NUMBER,'') as 备注

FROM         dbo.Data0002 INNER JOIN
                      dbo.Data0235 ON dbo.Data0002.RKEY = dbo.Data0235.unit_ptr INNER JOIN  
                      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN
                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN
                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN
                      dbo.Data0001 ON dbo.Data0001.RKEY = dbo.Data0456.currency_ptr INNER JOIN
                      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY left JOIN
                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY
WHERE     (dbo.Data0235.QUAN_ON_HAND > 0)

) a
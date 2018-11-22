(
 select Stuff_Mesh.GRN_NUMBER as 入库单号,  Stuff_Mesh.DELIVER_NUMBER as 送货单号,  Stuff_Mesh.PO_NUMBER as 采购单号,
      Stuff_Mesh.code as 供应商代码,Stuff_Mesh.ABBR_NAME AS 供应商,
 
      Stuff_Mesh.INV_PART_NUMBER as 材料编码, Stuff_Mesh.INV_NAME as 材料名称, 
      Stuff_Mesh.INV_DESCRIPTION as 材料规格, Stuff_Mesh.GROUP_DESC as 材料类别,Stuff_Mesh.inv_group_desc as 材料组别,
      
      Stuff_Mesh.QUANTITY as 接收数量,Stuff_Mesh.QUAN_ON_HAND as 当前库存, Stuff_Mesh.UNIT_NAME as 单位,
      Stuff_Mesh.CURR_NAME as 货币,Stuff_Mesh.exch_rate as 汇率,Stuff_Mesh.TAX_2 as 税率,Stuff_Mesh.PRICE as 含税价, 
       ROUND(Stuff_Mesh.QUANTITY * Stuff_Mesh.PRICE, 2) AS 金额,
       
      Stuff_Mesh.ABBR_NAME AS 工厂, Stuff_Mesh.LOCATION as 仓库,Stuff_Mesh.spec_place as 具体位置,Stuff_Mesh.BARCODE_ID as 特别要求,
      
      Stuff_Mesh.ship_DATE as 送货时间,Stuff_Mesh.EXPIRE_DATE as 有效期, Stuff_Mesh.rohs as 环保标识,
      case Stuff_Mesh.ttype
      when 1 then '编码入库' when  2 then '杂项入库'
      when 3 then '直接入库'  when 4 then '调拨入仓' 
      when 5 then 'VMI入库'   when 6 then '杂项直入'  end as 入库类型,
            
      Stuff_Mesh.EMPLOYEE_NAME as 创建人,Stuff_Mesh.dept_name as 请购部门,Stuff_Mesh.ANALYSIS_CODE_1 as 请购人员
from (  
SELECT dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER, 
      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, 
      dbo.Data0017.INV_DESCRIPTION, Data0496.GROUP_DESC,data0019.inv_group_desc, 
      dbo.Data0022.QUANTITY,data0022.QUAN_ON_HAND,Data0002.UNIT_NAME,dbo.Data0001.CURR_NAME, dbo.Data0022.PRICE, 
      dbo.Data0022.TAX_2,data0022.spec_place,Data0023.CODE, dbo.Data0023.ABBR_NAME,Data0016.LOCATION, 
      dbo.Data0015.ABBR_NAME AS abbr_warehouse, dbo.Data0005.EMPLOYEE_NAME, 
      dbo.Data0456.ship_DATE, dbo.Data0022.BARCODE_ID, 
      dbo.Data0022.EXPIRE_DATE, dbo.Data0070.PO_NUMBER, 
      dbo.Data0456.exch_rate, dbo.Data0022.rohs,data0034.dept_name ,data0070.ANALYSIS_CODE_1,data0456.ttype
FROM dbo.Data0022 INNER JOIN
      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN
      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY  INNER JOIN 
      dbo.Data0019 on  dbo.Data0019.rkey = dbo.Data0496.group_ptr INNER JOIN 
      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN
      dbo.Data0002 on dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.Rkey INNER JOIN
      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN
      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN
      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY INNER JOIN
      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY INNER JOIN
      dbo.Data0001 ON 
      dbo.Data0456.currency_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN
      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY left join 
      data0034 on data0034.dept_code=Data0070.PO_REV_NO   
    union 
    select dbo.Data0456.GRN_NUMBER,dbo.Data0456.DELIVER_NUMBER,
       null,dbo.Data0235.goods_name,
       dbo.Data0235.goods_guige,null,null,dbo.Data0235.QUAN_RECD,data0235.QUAN_ON_HAND,
       Data0002.UNIT_NAME,dbo.Data0001.CURR_NAME, dbo.Data0235.unit_price*(1-dbo.Data0235.state_tax/100),
       dbo.Data0235.state_tax,null,Data0023.CODE,dbo.Data0023.ABBR_NAME,Data0016.LOCATION, 
       dbo.Data0015.ABBR_NAME AS abbr_warehouse,dbo.Data0005.EMPLOYEE_NAME, 
       dbo.Data0456.ship_DATE,dbo.Data0235.REF_NUMBER, 
       dbo.Data0235.DATE_RECD,dbo.Data0070.PO_NUMBER, 
       dbo.Data0456.exch_rate,dbo.Data0235.rohs,data0034.dept_name ,data0070.ANALYSIS_CODE_1,data0456.ttype
from dbo.Data0235 INNER JOIN
	  dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY INNER JOIN
	  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN
	  dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN
	  dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY INNER JOIN
      dbo.Data0002 on dbo.Data0235.unit_ptr = dbo.Data0002.Rkey INNER JOIN
      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY INNER JOIN
	  dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN
	  dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY left join 
      data0034 on data0034.dept_code=Data0070.PO_REV_NO  
)  as Stuff_Mesh 
WHERE (Stuff_Mesh.QUANTITY > 0)
) In22
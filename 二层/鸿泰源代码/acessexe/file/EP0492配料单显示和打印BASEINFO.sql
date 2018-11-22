--EP0492配料单显示和打印BASEINFO
--同一个存储程序
create procedure ep091
@date1 varchar(10),
@date2 varchar(20)
as
declare @cond varchar(2500)
set @cond='

SELECT data0492.*, Data0060.PARTS_ORDERED, Data0060.SCH_DATE, data0010.EDI_FLAG_FOR_SOACK,DATA0060.FOB,DATA0060.parts_alloc,
      data0050.unit_sq as PARAMETER_VALUE, data0050.set_x_qty*data0050.set_y_qty AS sets, Data0060.QTY_PLANNNED, 
      Data0025.MANU_PART_NUMBER, Data0025.REMARK AS remark25, data0060.ttype as type60,
      Data0025.RKEY AS d025_rkey, Data0025.MANU_PART_DESC, Data0025.EST_SCRAP, 
      Data0025.PARENT_PTR, Data0097.PO_NUMBER,data0050.layers, Data0060.ENT_DATE,Data0060.ORIG_REQUEST_DATE,Data0060.ORIG_SCHED_SHIP_DATE,
      Data0050.CUSTOMER_PART_NUMBER, data0059.customer_part_desc, data0050.SALES_ORDER_UNIT_PTR,
      Data0050.ONHOLD_RELEASE_FLAG, Data0050.CP_REV, Data0050.BOM_STATUS, 
      Data0010.CUST_CODE, Data0010.ABBR_NAME AS CUSTOMER_NAME, Data0005.EMPLOYEE_NAME, 
      Data0050.BOM_APPR_DATE, Data0050.CATALOG_NUMBER, data0008.prod_code,
      Data0008.PRODUCT_NAME, Data0050.RKEY AS rkey50, Data0025.ENG_NOTE,ltrim(str(data0050.set_lngth))+''*''+ltrim(str(data0050.set_width)) as setsize,
data0050.unit_sq * data0492.ISSUED_QTY as area,data0050.green_flag,data0050.green_desc,data0050.set_lngth,data0050.set_width
FROM dbo.Data0010 INNER JOIN
      dbo.data0492 LEFT OUTER JOIN
      dbo.Data0060 ON 
      dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER LEFT OUTER JOIN
      dbo.Data0097 ON 
      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY LEFT OUTER JOIN
      dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY ON 
      dbo.Data0010.RKEY = dbo.data0492.CUSTOMER_PTR LEFT OUTER JOIN
      dbo.Data0008 INNER JOIN
      dbo.Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR ON 
      dbo.data0492.BOM_PTR = dbo.Data0025.RKEY LEFT OUTER JOIN
      dbo.Data0050 ON 
      dbo.Data0025.ANCESTOR_PTR = dbo.Data0050.RKEY LEFT OUTER JOIN
      dbo.data0059 ON dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY
where 
 data0492.issue_date>='''+@date1+'''
and data0492.issue_date<='''+@date2+'''
and data0059.customer_ptr=data0492.customer_ptr
order by data0492.cut_no'

exec (@cond)
GO
--建业出现连接另一个客户，原因一个编号有两个客户，就指向另一个编号，DATA0492.CUSTOMER_PTR错了
--建业ref_scp_ratio报废率,只有外层有
--

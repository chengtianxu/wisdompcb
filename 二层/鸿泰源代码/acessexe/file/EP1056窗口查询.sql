--EP1056窗口查询
--主表
SELECT data0070.rkey,data0070.po_number,data0070.PO_REV_NO,data0070.DATE_EDITED,
       data0070.po_date,data0070.poexpired,data0070.status,data0070.PO_TYPE,data0070.STATE_TAX,
       data0070.PURCHASE_ORDER_TYPE,data0070.shipping_cost,data0070.fob,data0070.shipto_address,
       data0005.employee_name,data0070.MISC_CHARGE,data0070.discount2_days,data0023.green_flag,data0023.green_desc,
       data0023.code,data0023.supplier_name,data0070.SUPP_FAC_ADD_PTR,data0070.PRINT_TIME,
       data0070.PAYMENT_TERMS,data0070.sub_total,data0070.EXCHANGE_RATE,data0023.fax,
       data0015.warehouse_name,data0015.abbr_name as ware_name,data0023.phone,data0070.warehouse_pointer,
       data0023.abbr_name as supp_abbrname,data0070.SECOND_WHSE_PTR,data0070.print_date,
       data0024.factory_location as D24NAME,data0024.factory_address_1 as D24Adress,
       data0024.contact as D24Contact,data0024.phone as D24Phone,data0024.fax as D24Fax
FROM data0070 
    inner join data0005 on data0070.employee_pointer=data0005.rkey
    inner join data0023 on data0070.supplier_pointer=data0023.rkey
    inner join data0015 on data0070.WAREHOUSE_POINTER=data0015.rkey
    inner join data0024 on data0070.SUPP_FAC_ADD_PTR=data0024.rkey
WHERE 1=1
 and ((data0070.po_type='T') or (data0070.po_type='N'))  and data0070.po_date >= '2013-12-22' and data0070.po_date < '2013-12-26'

ORDER BY po_number

--明细 全程
exec sp_executesql N'select data0060.rkey,sales_order,cust_code,customer_part_number+cp_rev as pnrev,data0059.customer_part_desc,data0097.po_number,data0050.layers,
data0050.analysis_code_1,data0050.set_x_qty*data0050.set_y_qty as  pcs_er_set,data0060.part_price/data0060.exch_rate as part_price,data0050.unit_sq
from data0060 inner join data0010 on data0060.customer_ptr=data0010.rkey
	inner join data0050 on data0060.cust_part_ptr=data0050.rkey
	inner join data0059 on data0059.cust_part_ptr=data0050.rkey and data0059.customer_ptr=data0010.rkey
	inner join data0097 on data0060.purchase_order_ptr=data0097.rkey
where data0060.rkey=@P1
order by sales_order

',N'@P1 int',9559

--明细 全程
select * from data0071 where PO_PTR=5101


---------------------------
半程 连接工作单
select data0006.rkey,data0006.work_order_number,data0006.prod_status,data0025.manu_part_number,data0006.parts_per_panel,
data0050.customer_part_number,data0050.cp_rev,data0156.step,data0156.rkey as d0156_rkey,data0156.panels,
a.dept_code,a.dept_name,data0156.qty_backlog,data0025.rkey as d0025_rkey,a.rkey as d0034_rkey
from  data0006 inner join
     data0156 on data0156.wo_ptr=data0006.rkey left join
     data0034 b on data0156.dept_ptr=b.rkey left join
     data0034 a on b.dept_ptr=a.rkey left join
     data0025 on data0006.bom_ptr=data0025.rkey left join
     data0050 on data0025.ancestor_ptr=data0050.rkey
where (data0156.d0069_ptr>0 and data0156.d0069_ptr=0) --请购单明细指针
 or (data0156.d0071_ptr>0 and data0156.d0071_ptr=18496) --采购单明细指针


 
 
 


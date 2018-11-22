--EP124退货入仓退货单查询
select data0098.rma_number,data0098.rma_date,DATA0098.ANALYSIS_CODE_1,data0098.QTY_AUTH,data0098.qty_recd,
isnull(data0098.QTY_AUTH,0)-isnull(data0098.qty_recd,0) as Qty_SY,
 data0098.RMA_STATUS,data0098.rkey,data0098.customer_ptr,data0098.customer_part_ptr,
 data0060.sales_order,data0098.shipment_ptr,data0098.so_ptr,data0279.parameter_value,
 data0010.abbr_name,data0059.CUSTOMER_PART_DESC,data0005.employee_name,
 data0050.customer_part_number,data0050.cp_rev,data0050.tax_flag
FROM Data0098 LEFT JOIN Data0060 ON Data0098.SO_PTR = Data0060.RKEY INNER JOIN
      Data0010 ON Data0098.CUSTOMER_PTR = Data0010.RKEY INNER JOIN Data0050 ON  Data0098.CUSTOMER_PART_PTR = Data0050.RKEY INNER JOIN
      data0059 ON Data0098.CUSTOMER_PTR = data0059.customer_ptr AND 
      Data0098.CUSTOMER_PART_PTR = data0059.cust_part_ptr left join data0005 on data0098.auth_by_empl_ptr=data0005.rkey
      left join data0025 on Data0098.CUSTOMER_PART_PTR=data0025.ancestor_ptr and data0025.parent_ptr=0 left join
     data0279 on Data0025.rkey=Data0279.source_ptr and Data0279.parameter_ptr=441
where data0098.rma_status=2

order by rma_number
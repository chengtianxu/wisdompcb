--ep124特殊入仓重检和退货查RMB号
SELECT data0414.rkey, data0414.number, data0414.qty_to_be_stocked,
      data0414.qty_stocked, data0415.custpart_ptr,Data0415.customer_ptr,
      Data0050.CUSTOMER_PART_NUMBER, Data0010.CUST_CODE,data0414.sys_date,
      data0059.customer_part_desc,data0050.CP_REV,data0005.employee_name,
      outEmplName=t1.employee_name,outDate=data0415.sys_date,
      data0073.user_full_name,d98Date=data0098.sys_date,data0279.parameter_value,
      Type_desc=case Data0415.type when 3 then '退货重检' when 4 then '正常重建' end,data0050.tax_flag                                              
FROM Data0414 left join
     Data0415 on Data0414.d415_ptr=Data0415.Rkey left join
     Data0059 on Data0415.custpart_ptr=Data0059.cust_part_ptr
             and Data0415.CUSTOMER_PTR=Data0059.customer_ptr left join
     Data0050 on Data0415.custpart_ptr = Data0050.RKEY left join
     Data0010 on Data0415.CUSTOMER_PTR = Data0010.RKEY left join
     data0005 on data0414.empl_ptr=data0005.rkey left join
     data0005 t1 on Data0415.empl_ptr=t1.rkey left join
     data0098 on Data0415.rma_ptr=Data0098.Rkey left join
     Data0073 on Data0098.csi_user_ptr=Data0073.rkey left join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 left join
     data0279 on Data0025.rkey=Data0279.source_ptr and Data0279.parameter_ptr=441
WHERE (data0414.qty_to_be_stocked > data0414.qty_stocked) and (data0414.status=2) and isnull(data0414.rma_ptr,0)= 0 --退货单号


union all

SELECT data0414.rkey, data0414.number, data0414.qty_to_be_stocked,
      data0414.qty_stocked, Data0098.CUSTOMER_PART_PTR as custpart_ptr,Data0098.CUSTOMER_PTR,
      Data0050.CUSTOMER_PART_NUMBER, Data0010.CUST_CODE,data0414.sys_date,
      data0059.customer_part_desc,data0050.CP_REV,data0005.employee_name,
      outEmplName=t1.employee_name,outDate=data0415.sys_date,
      data0073.user_full_name,d98Date=data0098.sys_date,data0279.parameter_value,
      Type_desc='退货重检' ,data0050.tax_flag                                           
FROM Data0414 left join
     data0098 on Data0414.rma_ptr=Data0098.Rkey left join
     Data0050 on Data0098.CUSTOMER_PART_PTR = Data0050.RKEY left join
     Data0010 on Data0098.CUSTOMER_PTR = Data0010.RKEY left join
     Data0059 on Data0098.CUSTOMER_PART_PTR=Data0059.cust_part_ptr
             and Data0098.CUSTOMER_PTR=Data0059.customer_ptr left join        
     Data0415 on Data0414.d415_ptr=Data0415.Rkey left join
     data0005 on data0414.empl_ptr=data0005.rkey left join
     data0005 t1 on Data0415.empl_ptr=t1.rkey left join
     Data0073 on Data0098.csi_user_ptr=Data0073.rkey left join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 left join
     data0279 on Data0025.rkey=Data0279.source_ptr and Data0279.parameter_ptr=441
WHERE (data0414.qty_to_be_stocked > data0414.qty_stocked) and (data0414.status=2) and isnull(data0414.rma_ptr,0)<>0

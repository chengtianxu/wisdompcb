--退货审核查询
select data0098.rma_number,data0098.note_pad_ptr,data0098.rma_date,data0098.QTY_AUTH,data0098.so_ptr,round(data0098.co_Price*data0098.QTY_AUTH,2) as amount,
  data0098.qty_ship,Data0098.Redate,data0098.co_Price,data0098.appd_ptr,data0098.EFFECT_TP,
  data0098.RMA_STATUS,data0098.rkey,data0098.customer_ptr,data0098.customer_part_ptr,Data0098.Qty_shipd,
  Data0098.qty_planned,data0098.curr_ptr,dbo.GetRMAAuthMinSeqno(Data0098.rkey) as seq_no,Data0098.Re_purchase_order_ptr,
  data0060.sales_order,data0098.shipment_ptr,data0098.qty_recd,data0005.employee_name as auditor,
  data0098.audited_by_ptr,data0098.audited_date,  data0015.abbr_name,Data0059.customer_part_desc,data0098.srce_ptr,
  data0010.cust_code, data0050.customer_part_number,data0050.cp_rev,data0098.required_amount,data0098.sys_date,
  d05.employee_name as creator, dbo.data0274.auth_date, dbo.data0274.ranking,data0274.rkey as rkey274,d60.SALES_ORDER as RMA_SALES_ORDER  
from data0098 inner join Data0274 on data0274.rma_ptr=data0098.rkey
  inner join data0050  on data0098.customer_part_ptr=data0050.rkey
  inner join data0010 on data0098.customer_ptr=data0010.rkey
  left join data0005 d05 on data0098.auth_by_empl_ptr=d05.rkey 
  left outer join data0060 on data0098.SO_PTR=data0060.rkey 
  left join data0060 d60 on data0098.rkey=d60.RMA_PTR 
  left outer join data0005 on data0098.audited_by_ptr=data0005.rkey  
  left join data0015 on data0098.whse_ptr=data0015.rkey 
  left join Data0059 on Data0059.cust_part_ptr=Data0098.CUSTOMER_PART_PTR 
    and Data0059.customer_ptr=Data0098.CUSTOMER_PTR
  left join Data0073 on data0274.user_ptr=data0073.rkey
where (data0098.rma_date>='2013-07-14 00:00:00') and (data0098.rma_date<='2013-09-13 00:00:00')
and (Data0098.RMA_STATUS = 1) AND (dbo.Data0274.auth_date IS NULL) and (dbo.GetRMAAuthMinSeqno(Data0098.rkey)=data0274.ranking) 
and data0274.user_ptr=1
--进入用用户指针

order by rma_number


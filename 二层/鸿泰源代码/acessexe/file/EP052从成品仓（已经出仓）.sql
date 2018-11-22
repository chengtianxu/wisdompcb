
--从成品仓（已经出仓）
Select data0415.rkey,Data0415.custpart_ptr,Data0415.qty_rewked as qty_reworked,DATA0415.SYS_DATE,
data0050.customer_part_number,data0050.cp_rev,data0415.quantity,
data0059.customer_part_desc,data0010.cust_code,data0010.customer_name,
data0415.type,data0415.status,data0415.customer_ptr,data0414.reference
 From data0415
    left join data0414 on data0415.rkey=data0414.d415_ptr
    left join Data0050 on data0415.custpart_ptr=Data0050.RKEY
    left join Data0010 on data0415.CUSTOMER_PTR=Data0010.RKEY
    left join data0059 on data0415.custpart_ptr=data0059.cust_part_ptr and data0415.CUSTOMER_PTR=data0059.customer_ptr
where data0415.status=3  
and data0415.type in (3,4)  --出仓类型1,直接出仓2退货出仓3出到MRB
order by data0415.sys_date 状态1,2,3,4,5待提交,待出仓,已出仓,已重检,被退回
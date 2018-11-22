--产品特殊入仓主表
exec sp_executesql N'SELECT data0416.rkey,data0416.number, Data0098.RMA_NUMBER,isnull(data0098.so_ptr,0) as so_ptr,type_415=IsNull(Data0415.type,0),data0097.po_number,
      Data0060.SALES_ORDER, Data0005.EMPLOYEE_NAME,Data0050.customer_part_number,data0050.CP_REV,data0416.tstatus,
      data0416.sys_date, data0416.quantity, data0416.type,Data0010.CUST_CODE,data0059.customer_part_desc ,data0416.ranking,
      data0416.rkey,data0416.rma_ptr,data0098.qty_auth,data0098.qty_recd,data0416.d414rkey,data0416.cost_flag,data0059.customer_matl_desc 
FROM data0416 LEFT JOIN
      Data0005 ON data0416.empl_ptr = Data0005.RKEY LEFT JOIN
      Data0060 ON data0416.so_ptr = Data0060.RKEY LEFT JOIN
      Data0059 on Data0060.cust_part_ptr=data0059.cust_part_ptr
              and data0060.customer_ptr=data0059.customer_ptr left join
      data0010 on Data0060.CUSTOMER_PTR=data0010.rkey  LEFT JOIN
      data0097 on data0060.purchase_order_ptr=data0097.rkey LEFT JOIN
      Data0098 ON data0416.rma_ptr = Data0098.RKEY Left  join
      data0050 on Data0060.cust_part_ptr=data0050.rkey left join
      data0414 on Data0416.d414Rkey=Data0414.Rkey left join
      Data0415 on Data0414.d415_ptr=Data0415.Rkey
where data0416.sys_date>=@P1 and data0416.sys_date<=@P2
      and (data0416.type=@P3 or data0416.type=@P4 or data0416.type=@P5 or data0416.type=@P6 or data0416.type=@P7 or data0416.type=@P8 or (data0416.type=7 and isnull(data0415.type,3)=@P9) or (data0416.type=7 and data0415.type=@P10) or data0416.type=@P11)   
 and 1=1
 order by data0416.sys_date 
',N'@P1 datetime,@P2 datetime,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int,@P9 int,@P10 int,@P11 int','2013-04-30 00:00:00','2013-05-31 00:00:00',1,0,3,4,0,0,3,4,0


--产品特殊入仓明细
exec sp_executesql N'select a.serial_no, e.customer_part_desc ,e.customer_matl_desc,a.Qty_Packing,a.qty_pcs,
      a.Rkey   ,a.quantity,b.po_number,a.cust_part_ptr,  
      d.CUST_CODE  ,c.cp_Rev,
      c.CUSTOMER_PART_NUMBER ,d.ABBR_NAME,
      case    when  a.Qty_On_Hand -a.Qty_alloc>0 then a.Qty_On_Hand -a.Qty_alloc
      else 0 end   as Qty
from data0053 a
left join (select data0416.number,data0416.rkey,data0060.rkey as so_ptr,data0097.po_number 
   from data0416 
   left join data0060 on data0416.so_ptr=data0060.rkey
   left join data0097 on data0060.purchase_order_ptr=data0097.rkey ) b on a.npad_ptr=b.rkey
left join data0050 c on a.cust_part_ptr=c.rkey
left join data0010 d on a.customer_ptr=d.rkey
left join Data0059 e on e.customer_ptr=a.customer_ptr  and e.cust_part_ptr=a.cust_part_ptr

where NPAD_PTR = @P1
order by a.serial_no,c.customer_part_number
',N'@P1 int',4341




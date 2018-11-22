--做入仓单，56表，QTY_BACKLOG＝0，TO_BE_STOCKED=数量，53表 QUANTITY=数量，QTY_ON_HNAD=0
--入仓审核，56表TO_BE_STOCKED＝0，53表QTY_ON_HNAD＝数量
--下次进入入仓审核再删除QTY_BACKLOG＝0，TO_BE_STOCKED＝0的记录


--主表
exec sp_executesql N'select data0416.rkey,data0416.number,data0416.type,data0416.empl_ptr,data0416.sys_date,data0416.quantity,
       data0416.reference,data0416.rma_ptr,data0416.so_ptr,Data0416.ToRemainStock,
  data0416.d414rkey,data0416.tstatus,data0416.create_date,data0416.create_empl_ptr,post_date,post_empl_ptr,
  data0416.remark,t1.abbr_name as mfg_name,t2.abbr_name as create_name,t3.abbr_name as post_name,
  (select sum(quantity) from data0053 where npad_ptr=data0416.rkey) as qty,
  case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓''
      when 2 then ''已入仓'' when 3 then ''被退回'' end as tstatus_desc,
   (case Data0416.ToRemainStock when 0 then (case data0416.tstatus when 0 then '''' else ''出货仓审核'' end) 
     when 2  then ''尾数叉板仓审核''     else ''尾数仓审核'' end) as audit_desc
from data0416 left join
     data0005 t1 on data0416.empl_ptr=t1.rkey left join
     data0005 t2 on data0416.create_empl_ptr=t2.rkey left join
     Data0005 t3 on Data0416.post_empl_ptr=t3.rkey
where type=2
  and data0416.create_date>=(@P1)
  and data0416.create_date<(@P2)+1
  and tstatus= @P3
order by number
 
',N'@P1 datetime,@P2 datetime,@P3 int','2011-06-14 00:00:00','2013-05-15 23:59:59',2

--明细
exec sp_executesql N'select data0416.rkey,data0416.number,data0416.type,data0416.sys_date,data0010.CUST_CODE,data0010.ABBR_NAME,
  data0416.tstatus, data0416.remark,data0006.work_order_number,data0053.wo_datecode, data0060.RKEY as rkey60, 
  data0053.quantity/(isnull(data0050.set_x_qty,1)*isnull(data0050.set_y_qty,1)) as set_quantity,data0053. Weight_SET,
  case data0416.tstatus when 0 then ''未提交'' when 1 then ''待入仓''
      when 2 then ''已入仓'' when 3 then ''被退回'' end as tstatus_desc,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,data0053.quantity
     ,Data0053.Qty_Packing,data0053.qty_pcs ,data0053.remark as remark_53, Data0050.RKEY as rkey_50 
     ,case data0060.COMMISION_ON_TOOLING when 0 then ''内销'' when ''1'' then ''保税'' when ''2'' then ''外销'' end as COMMISION_ON_TOOLING,data0060.sales_order 
  ,data0060.Forkplate_qty,data0060.Forkplate_rate ,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
FROM dbo.Data0006 INNER JOIN
    dbo.data0416  INNER JOIN
    dbo.Data0053 ON dbo.data0416.rkey = dbo.Data0053.NPAD_PTR INNER JOIN
    dbo.Data0050 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0050.RKEY ON
    dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PTR LEFT OUTER JOIN
    dbo.data0059 ON dbo.Data0053.CUST_PART_PTR = dbo.data0059.cust_part_ptr AND dbo.Data0053.customer_ptr = dbo.data0059.customer_ptr
    left join Data0010 on Data0053.customer_ptr =Data0010.RKEY 
    left join data0492 on data0006.cut_no=data0492.cut_no 
    left join data0060 on data0492.so_no=data0060.sales_order 
where data0416.type=2
   and data0416.create_date>=(@P1)
   and data0416.create_date<(@P2)+1
   and data0416.tstatus= @P3
order by number,data0050.customer_part_number 
',N'@P1 datetime,@P2 datetime,@P3 int','2011-06-14 00:00:00','2013-05-15 23:59:59',2
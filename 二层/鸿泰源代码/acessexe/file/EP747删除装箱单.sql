--create PROCEDURE ep747;1 --data0064.SHIPMENT_NO,20121115 LLL 
--@rkey int
--with encryption
--AS
--装箱单里的指派单
  select data0064.rkey,data0064.so_ptr,data0064.packing_list_ptr,data0064.ADDNOTE1,data0064.ADDNOTE2,data0064.ADDNOTE3,data0064.ADDNOTE4,data0064.ADDNOTE5,data0064.ADDNOTE6,Data0064.sys_date,
       data0064.packing_slip_flag,data0064.DATE_SHIPPED,Data0064.WO_DateCode,Data0064.Assign_flag,data0064.SHIPMENT_NO,
       data0060.sales_order,data0050.CUSTOMER_PART_NUMBER,data0050.CP_REV,
       Data0064.Spare_shipped,
       po_number,po_date,employee_name,QUAN_SHIPPED,data0064.ovsh_qty,data0064.ovsh_discount,data0064.ovsh_qty1,
       data0060.fob,data0060.REFERENCE_NUMBER,data0060.part_price,data0060.tax_in_price,data0060.CUST_PART_PTR, 
	round(data0064.QUAN_SHIPPED*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+state_tax/100) end,4))
	+(100.0-ovsh_discount)*data0064.ovsh_qty*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+state_tax/100) end,4))*0.01,2) as tax_amount,
	round(case data0060.tax_in_price when 'Y' then data0060.part_price else data0060.part_price*(1+state_tax/100) end,4) tax_price,
       Data0059.CUSTOMER_PART_DESC,Rma_number =isnull((select Rma_number from data0098 where rkey=data0064.rma_ptr),''),
       (QUAN_SHIPPED+data0064.ovsh_qty)*data0050.REPORT_UNIT_VALUE1*0.0001 as weigth,RealityLoadQty
  ,round((Data0064.QUAN_SHIPPED+Data0064.ovsh_qty)/isnull(data0047.parameter_value,(Data0050.set_x_qty*Data0050.set_y_qty)),4) as MI_Quan_Shipped_set  --总装运SET=（正常装运+溢装数）/data0047.parameter_value LLL 20130619
  from data0064  (nolock) inner join data0060 (nolock) on data0064.so_ptr=data0060.rkey
		inner join DATA0059 (nolock) on Data0060.CUSTOMER_PTR = data0059.customer_ptr AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr
		inner join data0050 (nolock) on data0060.cust_part_ptr=data0050.rkey
		inner join data0097 (nolock)  on data0060.purchase_order_ptr=data0097.rkey
		inner join data0005 (nolock) on data0064.ENT_EMPL_PTR = Data0005.RKEY
		left join data0012 (nolock) on data0060.cust_ship_addr_ptr=data0012.rkey
		left join data0189 (nolock) on data0012.ship_ctax_ptr=data0189.rkey
       inner join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 
       left join (select data0047.source_pointer,data0047.parameter_value  
	  from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey 
	  and data0278.SPEC_RKEY='B') as data0047 on data0025.rkey=data0047.source_pointer  --每SET_PCS数LLL 20130619
  where  data0064.packing_list_ptr=14334--@rkey
order by Data0097.po_number,data0059.customer_part_desc
go
--指派单对应的库存
SELECT data0053.rkey,Data0053.WaitShip, Data0053.FinishShip,data0053.to_be_audit,Data0052.QUAN_SHP
FROM Data0053 INNER JOIN  Data0052 ON Data0053.RKEY = Data0052.DATA0053_PTR INNER JOIN
Data0064 ON Data0052.SO_SHP_PTR = Data0064.RKEY where data0064.rkey=25391
--修改库存的待装运单
exec sp_executesql N'UPDATE "wd".."Data0053" 
SET "WaitShip"=@P1,"FinishShip"=@P2 
WHERE "WaitShip"=@P3 AND "FinishShip"=@P4 AND "RKEY"=@P5',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int',
2484,0,0,2484,62281

--修改指派单
 exec sp_executesql N'UPDATE "wd".."data0064" 
 SET "packing_list_ptr"=@P1,"sys_date"=@P2, "packing_slip_flag"=@P3,"DATE_SHIPPED"=@P4,"Assign_flag"=@P5,"SHIPMENT_NO"=@P6 
 WHERE "rkey"=@P7 AND "packing_list_ptr"=@P8 AND "sys_date" IS NULL AND "packing_slip_flag"=@P9 AND "DATE_SHIPPED"=@P10 AND "Assign_flag"=@P11 AND "SHIPMENT_NO"=@P12',
 N'@P1 int,@P2 datetime,@P3 varchar(1),@P4 datetime,@P5 int,@P6 smallint,@P7 int,@P8 int,@P9 varchar(1),@P10 datetime,@P11 int,@P12 smallint',
 NULL,NULL,'0',NULL,1,0,25391,14334,'1','2013-07-09 08:23:00',0,1
 
--当删除的指派数据装箱顺序号为1时，还需将另一个已装运的装箱单改为1，保证装运单中有为1的装箱单
  SELECT top 1 data0064.SHIPMENT_NO,data0064.*   from data0064 left join  data0439 on data0064.packing_list_ptr=data0439.rkey 
 where data0064.packing_list_ptr>0 and PACKING_SLIP_FLAG=1 and data0439.invoice_ptr is null and so_ptr=12801
 and data0064.rkey<>25391
 order by data0064.SHIPMENT_NO 
 --修改装箱顺序号为1时
 update data0064 set SHIPMENT_NO=1 where rkey=24923

 

 
 
 
 --
SELECT DATA0060.rkey,Data0060.STATUS,Data0050.rkey as rkey50,Data0050.ACTIVE_S_ORDERS, data0097.rkey as rkey97,Data0097.OPEN_SOS
FROM Data0060 INNER JOIN Data0050 ON
Data0060.CUST_PART_PTR = Data0050.RKEY INNER JOIN
Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
where data0060.rkey=12801
--修改97表
exec sp_executesql N'UPDATE "wd".."Data0097" 
SET "OPEN_SOS"=@P1
 WHERE "RKEY"=@P2 AND "OPEN_SOS"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',3,6807,2 
--修改50表
 exec sp_executesql N'UPDATE "wd".."Data0050" SET "ACTIVE_S_ORDERS"=@P1 WHERE "RKEY"=@P2 AND "ACTIVE_S_ORDERS"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',1,4927,0
--修改60表 
exec sp_executesql N'UPDATE "wd".."Data0060" SET "STATUS"=@P1 WHERE "rkey"=@P2 AND "STATUS"=@P3',N'@P1 tinyint,@P2 int,@P3 tinyint',1,12801,4

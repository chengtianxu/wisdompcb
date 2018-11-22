--EP031装箱单查询

exec sp_executesql N'SELECT	data0439.*,isnull(data0274.min_ranking,0) as min_ranking,data0010.cust_code,data0010.parentcust_ptr,data0010.abbr_name,data0010.customer_name,data0001.curr_code ,data0012.location,data0012.SHIP_TO_CONTACT,data0005.employee_name,data0012.SHIP_TO_FAX,data0012.do_rptfmt_ptr,(select sum(quan_stocked) from data0064 where packing_list_ptr=data0439.rkey) as quan_stocked,Data0012.SHIP_TO_ADDRESS_1 ,(select sum(quan_diff) from data0064 where packing_list_ptr=data0439.rkey) as quan_diff ,case isnull(Delivery_status,0) when 0 then ''未回签'' else ''已回签'' end as Delivery_status_desc  from data0439 inner join data0010 on data0439.customer_ptr=data0010.rkey  inner join data0012 on data0439.ship_addr_ptr=data0012.rkey  inner join data0005 on data0439.employee_ptr=data0005.rkey  left join data0001 on data0439.currency_ptr=data0001.rkey  left join (select d439_ptr,min(ranking) as min_ranking from data0274 group by d439_ptr) data0274 on data0439.rkey=data0274.d439_ptr  where (data0439.date_sailing >=@P1) and (data0439.date_sailing <@P2) 
 and data0439.use_stauts = 0 
 and IsNull(invoice_ptr,0)=0 and tstatus=0 
 order by delivery_no
',N'@P1 varchar(19),@P2 varchar(19)','2013-08-02 00:00:00','2013-09-02 23:59:59'
--装运指派搜索
SELECT
      Data0060.SALES_ORDER,Data0060.COMMISION_ON_TOOLING,
      Data0060.SCH_DATE, Data0060.ITEM_NBR,Data0064.WO_DateCode,
      Data0060.COD_FLAG,Data0060.RKEY AS rkey60,
      Data0060.PARTS_ORDERED, Data0060.PARTS_SHIPPED,
      Data0060.PARTS_RETURNED,Data0060.SHIPPING_METHOD,
      Data0060.CURRENCY_PTR,Data0060.PART_PRICE, data0060.tax_in_price,
	round(data0064.QUAN_SHIPPED*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+state_tax/100) end,4))
	+(100.0-ovsh_discount)*data0064.ovsh_qty*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+state_tax/100) end,4))*0.01,2) as tax_amount,
	round(case data0060.tax_in_price when 'Y' then data0060.part_price else data0060.part_price*(1+state_tax/100) end,4) tax_price,
      Data0060.STATUS,data0060.fob,data0060.REFERENCE_NUMBER,
      Data0060.CUST_SHIP_ADDR_PTR,Data0060.CUSTOMER_PTR,
      Data0060.PURCHASE_ORDER_PTR,Data0060.CUST_PART_PTR,
      Data0050.CUSTOMER_PART_NUMBER,Data0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc as ANALYSIS_CODE_2,
      Data0050.CP_REV,Data0050.ACTIVE_S_ORDERS,
      Data0010.CUST_CODE,Data0010.CUSTOMER_NAME,
      data0010.INVOICE_NOTE_PAD_PTR,
      Data0064.SHIPMENT_NO, Data0064.QUAN_SHIPPED,data0064.ovsh_qty,Data0064.QUAN_SHIPPED/(Data0050.set_x_qty*Data0050.set_y_qty) as Quan_Shipped_strip,data0064.ovsh_qty/(Data0050.set_x_qty*Data0050.set_y_qty) as ovsh_qty_strip,
      Data0064.DATE_ASSIGN, data0064.ovsh_discount,
      Data0064.DATE_SHIPPED,Data0064.PACKING_SLIP_FLAG,
      Data0064.QUAN_SHIPPED * Data0060.PART_PRICE AS total_case,
      Data0064.RKEY AS rkey64,Data0064.packing_list_ptr,
    (Data0064.QUAN_SHIPPED+data0064.ovsh_qty)*data0050.REPORT_UNIT_VALUE1*0.0001 as weigth,
      Data0012.SHIP_TO_ADDRESS_1,Data0012.SHIP_TO_CONTACT,Data0012.ZIP,
      Data0012.SHIP_TO_PHONE,Data0012.LOCATION,Data0012.STATE,
      Data0097.OPEN_SOS,Data0097.PO_DATE,Data0097.PO_NUMBER,
      Data0001.CURR_CODE,Data0001.CURR_NAME,data0064.Rma_ptr,
      Rma_Number=(select Rma_number from data0098 where rkey =data0064.Rma_ptr),Data0005.EMPLOYEE_NAME,
      data0050.report_unit_value1,data0050.rkey as rkey50,Data0064.PlanDate,Data0064.RealityLoadQty,
      round((Data0064.QUAN_SHIPPED+Data0064.ovsh_qty)/isnull(data0047.parameter_value,(Data0050.set_x_qty*Data0050.set_y_qty)),4) as MI_Quan_Shipped_set  --总装运SET=（正常装运+溢装数）/
FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN
      Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY INNER JOIN
      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY INNER JOIN
      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY INNER JOIN
      Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY left JOIN
      data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr
	  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
      inner join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 
	  left join (select data0047.source_pointer,data0047.parameter_value  
	  from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey 
	  and data0278.SPEC_RKEY='B') as data0047 on data0025.rkey=data0047.source_pointer  --每SET_PCS数
WHERE
      (Data0064.PACKING_SLIP_FLAG = '0') --做了指派初始化为0
      and ( Data0010.customer_type=1)--状态1,2,3,4正常,试用,保留,作废
 and Data0060.CUSTOMER_PTR=122--指定客户指针
ORDER BY Data0059.CUSTOMER_PART_DESC,Data0060.SALES_ORDER,Data0064.SHIPMENT_NO 


--保存
--装箱单主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0439"
 ("delivery_no","customer_ptr","ship_addr_ptr","employee_ptr","unit_ptr","currency_ptr","shipping_method","cartons_no","weight","net_weight","date_sailing","date_ent","charge","use_stauts","Delivery_status") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(8),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 varchar(20),@P8 int,@P9 float,@P10 float,@P11 datetime,@P12 datetime,@P13 float,@P14 tinyint,@P15 int',
 '12033423', 122,120,1,7,5,'华泰物流            ',0,0,0,'2013-09-02 10:24:30','2013-09-02 10:24:31',0,0,0
--修改53表 
 exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" 
 SET "WaitShip"=@P1 
 WHERE "WaitShip"=@P2 AND "RKEY"=@P3',
 N'@P1 int,@P2 int,@P3 int',
 0,300,18906
 --修改64表 
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0064" 
 SET "packing_list_ptr"=@P1,"packing_slip_flag"=@P2,"DATE_SHIPPED"=@P3,"sys_date"=@P4,"RealityLoadQty"=@P5,"SHIPMENT_NO"=@P6 
 WHERE "packing_list_ptr" IS NULL AND "packing_slip_flag"=@P7 AND "DATE_SHIPPED" IS NULL AND "sys_date" IS NULL AND "RealityLoadQty"=@P8 AND "SHIPMENT_NO"=@P9 AND "RKEY"=@P10',
 N'@P1 int,@P2 varchar(1),@P3 datetime,@P4 datetime,@P5 int,@P6 smallint,@P7 varchar(1),@P8 int,@P9 smallint,@P10 int',
 3552,'1','2013-09-02 10:24:30','2013-09-02 10:29:14',300,1,'0',0,0,7382
 
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
 SET "SEED_VALUE"=@P1 
 WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_VALUE"=@P3 AND "SEED_FLAG"=@P4',
 N'@P1 varchar(8),@P2 smallint,@P3 varchar(8),@P4 tinyint',
 '12033424',10,'12033423',4

 
 

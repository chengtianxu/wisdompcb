EP027订单确定
exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "firm_rel_s"=@P1 
WHERE "rkey"=@P2 AND "firm_rel_s"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',12,3575,11

exec sp_executesql N'UPDATE "SJ_V20_live".."data0060"
 SET "conf_by_empl_ptr"=@P1,"prod_rel"=@P2,"conf_date"=@P3,"to_be_confirmed"=@P4,"Conf_audit_status"=@P5,"last_push_date"=@P6,"qty_sure"=@P7,"so_prepay_amount"=@P8 
WHERE "rkey"=@P9 AND "conf_by_empl_ptr" IS NULL AND "prod_rel"=@P10 AND "conf_date" IS NULL AND "to_be_confirmed"=@P11 AND "Conf_audit_status"=@P12 AND "last_push_date"=@P13 AND "qty_sure"=@P14 AND "so_prepay_amount"=@P15',
N'@P1 int,@P2 varchar(1),@P3 datetime,@P4 float,@P5 tinyint,@P6 datetime,@P7 float,@P8 float,@P9 int,@P10 varchar(1),@P11 float,@P12 tinyint,@P13 datetime,@P14 float,@P15 float',
1,'2','2013-12-24 22:48:18',0,1,'2013-12-24 22:48:19',22,0,9558,'1',1,0,'2013-12-24 22:46:48',0,0

--手动改 
prod_rel 订单状态0未确认2已确认未投产3已确认4取消
qty_sure   

----------------------------------------------------------------
--确认过滤数据
select data0060.rkey,data0060.sales_order,Data0189.state_tax,data0060.sch_date,data0001.curr_code,data0060.part_price,data0012.location,
 case Data0060.TAX_IN_PRICE when 'Y' then '已含税' else '不含税' end as TAX_IN_PRICE,
Data0097.po_number,Data0050.customer_part_number,Data0050.cp_rev,Data0050.rkey as rkey50,data0060.status,
data0010.abbr_name as cust_code,data0060.quote_price,Data0060.qty_sure,Data0060.so_prepay_amount,Data0060.so_style,
data0060.PURCHASE_ORDER_PTR,data0060.p_code,ORIG_REQUEST_DATE,ORIG_SCHED_SHIP_DATE,
data0060.ENT_DATE,DATA0060.PARTS_ORDERED,DATA0059.CUSTOMER_PART_DESC,data0059.customer_matl_desc,Data0060.FOB,
data0060.set_price, case when isnull(data0047.PARAMETER_VALUE,0)= 0 then 0 else data0060.parts_ordered/data0047.PARAMETER_VALUE end  as strips_order, 
case data0050.sales_order_unit_ptr when 1 then 'Strip' else 'PCS' End as sales_order_unit_ptr
FROM data0001,Data0060 INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
Data0012 ON data0060.cust_ship_addr_ptr=data0012.rkey INNER JOIN
Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY INNER JOIN
data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
Data0060.CUST_PART_PTR = data0059.cust_part_ptr inner join
data0025 on data0025.ancestor_ptr=data0050.rkey and data0025.PARENT_PTR=0 left join 
data0189 on Data0012.SHIP_CTAX_PTR = Data0189.rkey left join 
data0047 on data0047.SOURCE_POINTER=data0025.rkey and data0047.PARAMETER_PTR=3
WHERE data0060.currency_ptr=data0001.rkey  
 and (Data0060.PROD_REL = '1' or data0060.conf_date is null) 
 AND ((Data0060.STATUS = 1) or (Data0060.STATUS = 4)) and (data0060.quote_price<>0) and (data0060.quote_price<>2)
order by FOB,CUSTOMER_PART_NUMBER,CP_REV,SCH_DATE

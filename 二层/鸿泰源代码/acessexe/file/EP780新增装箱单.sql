--新增装箱单
--装箱单表头保存
select rkey from Data0439 where delivery_no ='12033427'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0439" 
("delivery_no","customer_ptr","ship_addr_ptr","employee_ptr","unit_ptr","currency_ptr","shipping_method","cartons_no","weight","net_weight","date_sailing","date_ent","charge","use_stauts","IS_Plan_881","Plan_status","Planer_ptr","Plan_date") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(8),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 varchar(12),@P8 int,@P9 float,@P10 float,@P11 datetime,@P12 datetime,@P13 float,@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 datetime',
'12033427',242,240,1,7,1,'快递或本厂送',0,0,0,'2013-09-05 21:55:09','2013-09-05 21:55:09',0,0,1,0,1,'2013-09-05 21:55:09'  
 
exec sp_executesql N'update data0004 set seed_value=@P1 where rkey=26
',N'@P1 varchar(20)','12033428'--下一个单号

--增加订单计划 选订单

select * from  data0881 where  D439_PTR =3556 and SO_PTR=5767e
xec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0881" 
("D439_PTR","SO_PTR","Quan_order","Spare_order")
 VALUES (@P1,@P2,@P3,@P4); SELECT SCOPE_IDENTITY() 
 AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 float,@P4 float',
 3556,5767,520,2

--保存
insert into data0318 (D0439_ptr,TRANS_TYPE,TRANS_DESCRIPTION,--销售订单,工作定单变动记录表
FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE,file_number)
values (3556,1,'更改装运地址,装箱单:12033427'
,'','深圳市宝安区福永',1,
'2013-09-05 22:07:56',439,'3556')

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0881" 
SET "QUAN_plan"=@P1,"Spare_plan"=@P2,"oldQuan_plan"=@P3
 WHERE "RKEY"=@P4 AND "QUAN_plan" IS NULL AND "Spare_plan" IS NULL AND "oldQuan_plan" IS NULL',
 N'@P1 float,@P2 float,@P3 float,@P4 int',
 220,1,220,2
 
 
 ------------------提交
 SQL:BatchStarting	select Plan_status from Data0439 where rkey =3556
	

 update Data0439 set Plan_status = 1 where rkey =3556--提交
 update data0439 set Plan_status = 0 where rkey =3556--取消提交

 
 ----主窗口查询
 exec sp_executesql N'SELECT	data0439.*,data0010.cust_code,data0010.parentcust_ptr,data0010.abbr_name,d05.employee_name as Planer,
  data0010.customer_name,data0001.curr_code ,data0012.location,data0012.SHIP_TO_CONTACT,
  data0005.employee_name,data0012.SHIP_TO_FAX,data0012.do_rptfmt_ptr,Data0012.SHIP_TO_ADDRESS_1,
  data0002.unit_code,data0002.unit_name,data0189.state_tax  
from data0439 inner join data0010 on data0439.customer_ptr=data0010.rkey  
  inner join data0012 on data0439.ship_addr_ptr=data0012.rkey  
  inner join data0005 on data0439.employee_ptr=data0005.rkey 
  inner join Data0005 d05 on Data0439.Planer_ptr=d05.rkey 
  left join data0001 on data0439.currency_ptr=data0001.rkey  
  left join Data0002 on Data0439.unit_ptr=Data0002.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
where (data0439.Plan_date >=@P1) and (data0439.Plan_date <=@P2) 
    and   IS_Plan_881=1 
 and 1=1
 and isnull(data0439.invoice_ptr,0) = 0 and data0439.tstatus=0  and data0439.Plan_status = 0 
 order by delivery_no 
',N'@P1 datetime,@P2 datetime','2013-09-04 00:00:00','2013-09-05 23:59:59'

exec sp_executesql N'select data0881.*,data0060.sales_order,data0060.PARTS_ORDERED,data0050.customer_part_number,
  data0050.cp_rev,data0059.customer_part_desc,data0059.customer_matl_desc,data0097.po_number,
  case Assign_status when 0 then ''待指派'' when 1 then ''已指派'' end  as order_Assign_status,
   data0012.LOCATION 
from Data0881 inner join Data0060 on Data0881.so_ptr=Data0060.rkey
  inner join Data0050 on Data0060.CUST_PART_PTR=data0050.rkey
  left join Data0059 on Data0060.CUSTOMER_PTR=data0059.customer_ptr
    and Data0060.CUST_PART_PTR = Data0059.cust_part_ptr
  left join Data0097 on data0060.PURCHASE_ORDER_PTR=data0097.rkey 
  INNER JOIN Data0012 ON Data0060.CUST_SHIP_ADDR_PTR = Data0012.RKEY  
where data0881.D439_PTR=@P1 
',N'@P1 int',3556

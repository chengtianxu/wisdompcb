--直接入仓
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0416" ("number","type","empl_ptr","sys_date","quantity","reference","TSTATUS") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(7),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 varchar(3),@P7 tinyint','PG41419',1,3,'2013-07-10 10:58:21',54,'sdf',2

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004" SET "SEED_VALUE"=@P1 WHERE "RKEY"=@P2 AND "SEED_VALUE"=@P3',N'@P1 varchar(7),@P2 int,@P3 varchar(7)','PG41420',73,'PG41419'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0053" ("WHSE_PTR","LOC_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","customer_ptr","location_flag","WO_DateCode","serial_no","Qty_Packing","qty_pcs") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 float,@P5 float,@P6 datetime,@P7 int,@P8 int,@P9 varchar(20),@P10 int,@P11 tinyint,@P12 varchar(1),@P13 int,@P14 float,@P15 float',2,32,18768,54,54,'2013-07-10 10:58:20',3,84371,'                    ',377,1,'',1,0,0
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
',N'@P1 datetime,@P2 datetime,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int,@P9 int,@P10 int,@P11 int','2013-06-10 00:00:00','2013-07-11 00:00:00',1,0,3,4,0,0,3,4,0



--从MRB入仓
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0098" SET "rma_status"=@P1,"qty_recd"=@P2 WHERE "rma_status"=@P3 AND "qty_recd"=@P4 AND "RKEY"=@P5',N'@P1 smallint,@P2 int,@P3 smallint,@P4 int,@P5 int',3,124,2,0,178

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0416" ("number","type","empl_ptr","sys_date","quantity","reference","rma_ptr","TSTATUS") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(7),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 varchar(1),@P7 int,@P8 tinyint','PG41420',4,3,'2013-07-10 10:59:21',124,'',178,2

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004" SET "SEED_VALUE"=@P1 WHERE "RKEY"=@P2 AND "SEED_VALUE"=@P3',N'@P1 varchar(7),@P2 int,@P3 varchar(7)','PG41421',73,'PG41420'
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0053" ("WHSE_PTR","LOC_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","customer_ptr","location_flag","WO_DateCode","serial_no","Qty_Packing","qty_pcs") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 float,@P5 float,@P6 datetime,@P7 int,@P8 int,@P9 varchar(20),@P10 int,@P11 tinyint,@P12 varchar(1),@P13 int,@P14 float,@P15 float',2,16,10211,124,124,'2013-07-10 10:59:21',6,84372,'                    ',557,1,'',1,0,0


--重检、退货
exec sp_executesql N'update data0414 set qty_to_be_stocked=qty_to_be_stocked-@P1,qty_stocked=qty_stocked+@P2 
where rkey=336
',N'@P1 int,@P2 int',3767,3767

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0416" ("number","type","empl_ptr","sys_date","quantity","reference","d414rkey","TSTATUS") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(7),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 varchar(1),@P7 int,@P8 tinyint','PG41421',7,3,'2013-07-10 11:17:47',3767,'',336,2

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004" SET "SEED_VALUE"=@P1 WHERE "RKEY"=@P2 AND "SEED_VALUE"=@P3',N'@P1 varchar(7),@P2 int,@P3 varchar(7)','PG41422',73,'PG41421'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."Data0053" ("WHSE_PTR","LOC_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","RMA_PTR","NPAD_PTR","REFERENCE_NUMBER","customer_ptr","location_flag","WO_DateCode","serial_no","Qty_Packing","qty_pcs") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 float,@P5 float,@P6 datetime,@P7 int,@P8 int,@P9 varchar(20),@P10 int,@P11 tinyint,@P12 varchar(1),@P13 int,@P14 float,@P15 float',2,37,14853,3767,3767,'2013-07-10 11:17:47',7,84373,'                    ',548,1,'',1,0,0


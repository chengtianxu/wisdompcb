--修改编号
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_VALUE"=@P3 AND "SEED_FLAG"=@P4',
N'@P1 varchar(11),@P2 smallint,@P3 varchar(11),@P4 tinyint',
'RCY13050181',9,'RCY13050180',4

--写入工具额外费用
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0062" 
("SO_PTR","ADDL_CAT_PTR","AMOUNT","FREE_AMOUNT","addl_remark") 
VALUES (@P1,@P2,@P3,@P4,@P5); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 varchar(1)',
6257,1,1,0,''

--写入销售代表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0102"
 ("SALES_ORDER_PTR","SALES_REP_PTR","COMMISSION","CREDIT") 
 VALUES (@P1,@P2,@P3,@P4); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 numeric(5,2),@P4 numeric(5,2)',
 6257,2,0,100.00
 --修改50表信息
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
 SET "latest_price"=@P1,"last_so_date"=@P2,"active_s_orders"=@P3,"unplanned_rel_s"=@P4,"last_state_tax"=@P5,"sales_order_unit_val"=@P6 
 WHERE "latest_price"=@P7 AND "last_so_date" IS NULL AND "active_s_orders"=@P8 AND "unplanned_rel_s"=@P9 AND "last_state_tax"=@P10 AND "sales_order_unit_val"=@P11 AND "RKEY"=@P12',
 N'@P1 float,@P2 datetime,@P3 smallint,@P4 smallint,@P5 numeric(4,2),@P6 float,@P7 float,@P8 smallint,@P9 smallint,@P10 numeric(4,2),@P11 float,@P12 int',
 12,'2013-05-31 15:17:35',1,1,17.00,0,5.4900000000000002,0,0,0,0,2286
--ep159修改价格产生假退货
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0107" 
("INVOICE_NO","SUPP_PTR","INV_TP","EMPL_PTR","INV_DATE","STATUS","INV_TOTAL","MATL_TOT","FED_TAX","EX_RATE","ENT_DATE","FED_SHIP_TAX_FLAG","FED_MISC_TAX_FLAG","DUE_DATE","MISC_TOT","FED_RATE","CURRENCY_PTR","gl_acct_ptr","ttype")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(14),@P2 int,@P3 varchar(1),@P4 int,@P5 datetime,@P6 smallint,@P7 money,@P8 money,@P9 money,@P10 float,@P11 datetime,@P12 varchar(1),@P13 varchar(1),@P14 datetime,@P15 money,@P16 float,@P17 int,@P18 int,@P19 tinyint',
 '盘点进20140413',1,'2',1,'2014-05-02 00:00:00',1,$28.0800,$27.0000,$1.0800,1,'2014-05-02 00:00:00','N','N','2014-06-01 00:00:00',$0.0000,0,1,30,0

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0105" 
("VOUCHER","BATCH_NUMBER","VOU_TYPE","TRANS_TYPE","SOURCE_PTR","ENTERED_BY_EMPL_PTR","ENTERED_DT","ATTACHED","FYEAR","PERIOD","SUPP_PTR") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(12),@P2 varchar(19),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 datetime,@P8 smallint,@P9 int,@P10 smallint,@P11 int',
 'TD140500001 ','盘点进20140413 思方',0,1,4,1,'2014-05-02 00:00:00',2,2014,5,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 varchar(4),@P4 varchar(10),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',
4,11,'思方','购买原材料',1,27.00,'D',NULL,NULL,1,1,27.00
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 varchar(10),@P4 varchar(10),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',
 4,65,'盘点进2014','购买原材料',1,1.08,'D',NULL,NULL,1,1,1.08
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(10),@P4 varchar(10),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',4,30,'盘点进2014','购买原材料',1,28.08,'C',NULL,NULL,1,1,28.08
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0456" --原旧的入仓主表修改
SET "status"=@P1,"Audited_by"=@P2,"Audited_date"=@P3 
 WHERE "rkey"=@P4 AND "status"=@P5 AND "Audited_by" IS NULL AND "Audited_date" IS NULL',
 N'@P1 smallint,@P2 int,@P3 datetime,@P4 int,@P5 smallint',
 2,1,'2014-05-02 23:17:33',9,0
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0096"--假退货给供应商
 ("INVT_PTR","INV_TRAN_PTR","EMPL_PTR","TDATE","QUAN_REJD","FLAG","REFERENCE_NUMBER","invoice_ptr") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 float,@P6 varchar(1),@P7 varchar(20),@P8 int',
 1,8,1,'2014-05-02 00:00:00',3,'9','盘点进20140413      ',4
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0022" --重新插入一条新的价格入库单，不重插入主表
("TTYPE","INVENTORY_PTR","GRN_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","TDATE","STATUS","QUAN_STOCKED","QUAN_ON_HAND","BARCODE_ID","EXPIRE_DATE","TAX_2","quan_invoiced","invoice_ptr","REFERENCE_NUMBER")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 datetime,@P13 varchar(1),@P14 float,@P15 numeric(19,6),@P16 varchar(12),@P17 datetime,@P18 float,@P19 numeric(18,6),@P20 int,@P21 varchar(1)',
  5,1,9,NULL,1,1,1,3,1,1,9,'2014-05-02 00:00:00','5',3,3.000000,'10000122714 ','2015-04-03 00:00:00',4,3.000000,4,''
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" --修改全局变量
SET "SEED_VALUE"=@P1 WHERE "SEED_VALUE"=@P2 AND "rkey"=@P3',
N'@P1 varchar(11),@P2 varchar(11),@P3 int','10000122715','10000122714',63
go
select *  from data0207 where isnull(quantity,0)-isnull(rtn_quantity,0)>0 and d0022_ptr=8

go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0022"--退货原库存处理
 SET "QUAN_RETURNED"=@P1,"QUAN_ON_HAND"=@P2 
 WHERE "RKEY"=@P3 AND "QUAN_RETURNED"=@P4 AND "QUAN_ON_HAND"=@P5',
 N'@P1 numeric(18,6),@P2 numeric(19,6),@P3 int,@P4 numeric(18,6),@P5 numeric(19,6)',
 3.000000,0,8,0,3.000000
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0079" --记录
("INVOICE_PTR","GRN_PTR","quan_invd","D0022_PTR","TAX_2","PRICE","EXCH_RATE")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 float,@P4 int,@P5 float,@P6 float,@P7 float',
 4,9,3,9,4,9,1
GO

----------------如果有发货还有生产线退回到仓库

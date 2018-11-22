exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_Sample".."data0027" --原材料转移主表
("D0022_PTR","QUANTITY","FM_WHOUSE_PTR","FM_LOCATION_PTR","TO_WHOUSE_PTR","TO_LOCATION_PTR","TDATE","EMPL_PTR","REF_NUMBER","FM_REFERENCE_NUMBER","TO_REFERENCE_NUMBER") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 float,@P3 int,@P4 int,@P5 int,@P6 int,@P7 datetime,@P8 int,@P9 varchar(20),@P10 varchar(20),@P11 varchar(20)',
13103,20,2,13,2,11,'2013-07-31 14:29:40',3,'11                  ','                    ','                    '


exec sp_executesql N'SET NOCOUNT OFF; --转入
INSERT INTO "SJ_V20_Sample".."data0022"
 ("TTYPE","INVENTORY_PTR","GRN_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","DISCOUNT","QUAN_IN_INSP","QUAN_TO_BE_SHIPPED","QUAN_TO_BE_STOCKED","QUAN_RETURNED","QUAN_SCRAPPED","TDATE","STATUS","LOCATION_PTR_FROM","PACKING_SLIP_FLAG","QUAN_STOCKED","QUAN_ISSUED_TO_FACT","QUAN_RTNED_FM_FACT","QUAN_ON_HAND","BARCODE_ID","EXPIRE_DATE","SUPPLIER2","TAX_2","QUAN_ASSIGN","QUAN_IN_INSP1","QUAN_TO_BE_SHIPPED1","QUAN_TO_BE_STOCKED1","QUAN_RETURNED1","QUAN_SCRAPPED1","QUAN_TO_BE_scr","QUAN_TO_BE_scr1","STATUS1","QUAN_USEASIS","extra_req","stock_date","quan_send","Ref_BarCodeID","Remark","Prod_Date","invoice_ptr","reference_number")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36,@P37,@P38,@P39,@P40,@P41,@P42,@P43,@P44,@P45,@P46,@P47); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 float,@P13 numeric(18,6),@P14 numeric(18,6),@P15 numeric(18,6),@P16 numeric(18,6),@P17 numeric(18,6),@P18 datetime,@P19 varchar(1),@P20 int,@P21 varchar(1),@P22 float,@P23 float,@P24 float,@P25 numeric(19,6),@P26 varchar(12),@P27 datetime,@P28 varchar(10),@P29 float,@P30 float,@P31 numeric(18,6),@P32 numeric(18,6),@P33 numeric(18,6),@P34 numeric(18,6),@P35 numeric(18,6),@P36 numeric(18,6),@P37 numeric(18,6),@P38 varchar(1),@P39 float,@P40 varchar(1),@P41 datetime,@P42 float,@P43 varchar(1),@P44 varchar(1),@P45 datetime,@P46 int,@P47 varchar(1)',
  2,263,5941,11645,2,11,340,20,1,1,22.2222222222222,0,0,0,0,0,0,'2009-06-04 12:38:00','5',13,' ',100,0,0,20.000000,'100000446770','2012-05-28 00:00:00','          ',17,0,0,0,0,0,0,0,0,'4',0,'','2009-06-04 12:38:13',20,'','','2009-05-28 00:00:00',NULL,''
  
  exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004" SET "SEED_VALUE"=@P1 WHERE "rkey"=@P2 AND "SEED_VALUE"=@P3',N'@P1 varchar(12),@P2 int,@P3 varchar(12)','100000446771',63,'100000446770'
  
  exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0022"  --转出
  SET "QUANTITY"=@P1,"QUAN_ON_HAND"=@P2,"quan_send"=@P3 
  WHERE "RKEY"=@P4 AND "QUANTITY"=@P5 AND "QUAN_ON_HAND"=@P6 AND "quan_send"=@P7',
  N'@P1 float,@P2 numeric(19,6),@P3 float,@P4 int,@P5 float,@P6 numeric(19,6),@P7 float',
  80,30.000000,-20,13103,100,50.000000,0
EP1056外发
--半程外发
--确定
exec sp_executesql N'UPDATE "SJ_V20_live".."data0056" 
SET "D0071_PTR"=@P1
WHERE "RKEY"=@P2 AND "D0071_PTR" IS NULL',N'@P1 int,@P2 int',0,35240

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0156" 
("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","REFERENCE","WTYPE","PR_PTR","D056_PTR","D0069_PTR","D0071_PTR","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","d0038_ptr","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 varchar(1),@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 int,@P22 datetime,@P23 int,@P24 int,@P25 bit,@P26 int,@P27 int',
  24211,922,0,3,0,3,200,2,'2013-10-08 16:13:01',0,NULL,NULL,'',0,NULL,35240,NULL,0,774,3,NULL,NULL,1422,25,0,0,NULL
  
  --保存
  exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0070"
   ("PO_NUMBER","CSI_USER_POINTER","EMPLOYEE_POINTER","SUPPLIER_POINTER","SUPP_FAC_ADD_PTR","WAREHOUSE_POINTER","STATUS","EXCHANGE_RATE","SHIPPING_COST","FEDERAL_TAX","SUB_TOTAL","SHIPPING_METHOD","PO_DATE","SUPPIER_CONTACT","CONTACT_PHONE","DISCOUNT_AMOUNT","PO_TYPE","MISC_CHARGE","COLLECT_PREPAID","STATE_SHIP_TAX_FLAG","STATE_MISC_TAX_FLAG","CURRENCY_PTR","PAYMENT_TERMS","CASH_DISCOUNT","DISCOUNT_DAYS","CASH_DISCOUNT2","DISCOUNT2_DAYS","PURCHASE_ORDER_TYPE","ANALYSIS_CODE_2","ANALYSIS_CODE_3","ANALYSIS_CODE_4","ANALYSIS_CODE_5","SHIPTO_ADDRESS","POExpired","WF_DATE","I_O_FLAG")
    VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36); 
    SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
    N'@P1 varchar(13),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 tinyint,@P8 float,@P9 float,@P10 numeric(4,2),@P11 float,@P12 varchar(1),@P13 datetime,@P14 varchar(1),@P15 varchar(27),@P16 float,@P17 varchar(1),@P18 float,@P19 varchar(1),@P20 varchar(1),@P21 varchar(1),@P22 int,@P23 smallint,@P24 numeric(4,2),@P25 smallint,@P26 numeric(4,2),@P27 smallint,@P28 tinyint,@P29 varchar(4),@P30 varchar(1),@P31 varchar(9),@P32 varchar(8),@P33 varchar(17),@P34 datetime,@P35 datetime,@P36 tinyint',
    'wf13-10-00018',1,1,420,408,2,8,1,0,17.00,24,'','2013-12-25 16:53:04','','0755-27286893/0755-29877369',0,'T',0,'C','N','N',1,0,0,0,0,0,1,'外协','','17%增值税','月结60天','金丰工业区第四栋 ','2014-02-25 16:53:04','2013-12-25 16:53:04',1
    
    exec sp_executesql N'insert into data0339 --采购定单变动记录表
(po_ptr,
 EDITED_BY_PTR,
 TRAN_TYPE,
 TRAN_DESCRIPTION,
 TRAN_FROM,
 TRAN_TO,
 DATA0071_PTR,
 DATA0072_PTR)
 values(@P1,
        @P2,
        @P3,
        @P4,
        @P5,
        @P6,
        @P7,
        @P8)
',N'@P1 int,@P2 int,@P3 int,@P4 varchar(40),@P5 varchar(70),@P6 varchar(70),@P7 int,@P8 int',5101,1,10,'新增采购订单',NULL,NULL,NULL,NULL

exec sp_executesql N'UPDATE "SJ_V20_live".."data0023" 
SET "tax_id_number"=@P1,"analysis_code1"=@P2,"analysis_code2"=@P3 
WHERE "tax_id_number"=@P4 AND "analysis_code1"=@P5 AND "analysis_code2"=@P6 AND "RKEY"=@P7',
N'@P1 varchar(8),@P2 varchar(9),@P3 varchar(1),@P4 varchar(8),@P5 varchar(9),@P6 varchar(1),@P7 int',
'月结60天','17%增值税','','月结60天','17%增值税','',420

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0071" 
("PO_PTR","INVT_PTR","QUAN_ORD","PRICE","TAX_2","REQ_DATE","PURCHASE_UNIT_PTR","CONVERSION_FACTOR","extra_req","avl_flag","tax_price","SUPP_PART_NO","SO_PTR","MANU_PART_PTR","a_b")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 numeric(4,2),@P6 datetime,@P7 int,@P8 float,@P9 varchar(12),@P10 varchar(1),@P11 float,@P12 varchar(4),@P13 int,@P14 int,@P15 varchar(1)',
 5101,5462,2,11.650485440000001,3.00,'2013-12-26 17:06:06',65,1,'P2W053777 A0','Y',12,'test',0,131,'A'
 
 exec sp_executesql N'insert into data0339
(po_ptr,
 EDITED_BY_PTR,
 TRAN_TYPE,
 TRAN_DESCRIPTION,
 TRAN_FROM,
 TRAN_TO,
 DATA0071_PTR,
 DATA0072_PTR)
 values(@P1,
        @P2,
        @P3,
        @P4,
        @P5,
        @P6,
        @P7,
        @P8)
',N'@P1 int,@P2 int,@P3 int,@P4 varchar(40),@P5 varchar(70),@P6 varchar(70),@P7 int,@P8 int',5101,1,6,'新增一个标准采购项目',NULL,NULL,18496,NULL


exec sp_executesql N'UPDATE "SJ_V20_live".."data0056"
 SET "D0071_PTR"=@P1 
WHERE "RKEY"=@P2 AND "D0071_PTR"=@P3',N'@P1 int,@P2 int,@P3 int',18496,35240,0

exec sp_executesql N'UPDATE "SJ_V20_live".."data0156" 
SET "WO_PTR"=@P1,"DEPT_PTR"=@P2,"UNIT_PTR"=@P3,"EMPLOYEE_PTR"=@P4,"FLOW_NO"=@P5,"STEP"=@P6,"QTY_BACKLOG"=@P7,"PANELS"=@P8,"INTIME"=@P9,"TO_BE_STOCKED"=@P10,"TDATE"=@P11,"LOC_PTR"=@P12,"REFERENCE"=@P13,"WTYPE"=@P14,"PR_PTR"=@P15,"D056_PTR"=@P16,"D0069_PTR"=@P17,"D0071_PTR"=@P18,"rework_fm_dept_ptr"=@P19,"rework_fm_step"=@P20,"send_to_dept_ptr"=@P21,"sendtime"=@P22,"d0038_ptr"=@P23,"SETS_QTY"=@P24,"ipqc_flg"=@P25,"qty_rej"=@P26,"qty_rej_to_stocked"=@P27
 WHERE "RKEY"=@P28 AND "WO_PTR"=@P29 AND "DEPT_PTR"=@P30 AND "UNIT_PTR"=@P31 AND "EMPLOYEE_PTR"=@P32 AND "FLOW_NO"=@P33 AND "STEP"=@P34 AND "QTY_BACKLOG"=@P35 AND "PANELS"=@P36 AND "INTIME"=@P37 AND "TO_BE_STOCKED"=@P38 AND "TDATE" IS NULL AND "LOC_PTR" IS NULL AND "REFERENCE"=@P39 AND "WTYPE"=@P40 AND "PR_PTR" IS NULL AND "D056_PTR"=@P41 AND "D0069_PTR" IS NULL AND "D0071_PTR"=@P42 AND "rework_fm_dept_ptr"=@P43 AND "rework_fm_step"=@P44 AND "send_to_dept_ptr" IS NULL AND "sendtime" IS NULL AND "d0038_ptr"=@P45 AND "SETS_QTY"=@P46 AND "ipqc_flg"=@P47 AND "qty_rej"=@P48 AND "qty_rej_to_stocked" IS NULL',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 varchar(1),@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 int,@P22 datetime,@P23 int,@P24 int,@P25 bit,@P26 int,@P27 int,@P28 int,@P29 int,@P30 int,@P31 int,@P32 int,@P33 smallint,@P34 smallint,@P35 float,@P36 int,@P37 datetime,@P38 float,@P39 varchar(1),@P40 tinyint,@P41 int,@P42 int,@P43 int,@P44 int,@P45 int,@P46 int,@P47 bit,@P48 int',
     24211,922,0,3,0,3,200,2,'2013-10-08 16:13:01',0,NULL,NULL,'',0,NULL,35240,NULL,18496,774,3,NULL,NULL,1422,25,0,0,NULL,
1042,24211,922,0,3,0,3,200,2,'2013-10-08 16:13:01',0,'',0,35240,0,774,3,1422,25,0,0

exec sp_executesql N'UPDATE "SJ_V20_live".."data0015" 
SET "out_purchase_order"=@P1 WHERE "RKEY"=@P2 AND "out_purchase_order"=@P3',
N'@P1 varchar(13),@P2 int,@P3 varchar(13)','wf13-10-00019',2,'wf13-10-00018'


-------------------------------------------------------------------

--全程外发
--确定
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0070" 
("PO_NUMBER","CSI_USER_POINTER","EMPLOYEE_POINTER","SUPPLIER_POINTER","SUPP_FAC_ADD_PTR","WAREHOUSE_POINTER","STATUS","EXCHANGE_RATE","SHIPPING_COST","FEDERAL_TAX","SUB_TOTAL","SHIPPING_METHOD","PO_DATE","SUPPIER_CONTACT","CONTACT_PHONE","DISCOUNT_AMOUNT","PO_TYPE","MISC_CHARGE","COLLECT_PREPAID","STATE_SHIP_TAX_FLAG","STATE_MISC_TAX_FLAG","CURRENCY_PTR","PAYMENT_TERMS","CASH_DISCOUNT","DISCOUNT_DAYS","CASH_DISCOUNT2","DISCOUNT2_DAYS","PURCHASE_ORDER_TYPE","ANALYSIS_CODE_2","ANALYSIS_CODE_3","ANALYSIS_CODE_4","ANALYSIS_CODE_5","SHIPTO_ADDRESS","POExpired","WF_DATE","I_O_FLAG") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(13),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 tinyint,@P8 float,@P9 float,@P10 numeric(4,2),@P11 float,@P12 varchar(1),@P13 datetime,@P14 varchar(4),@P15 varchar(27),@P16 float,@P17 varchar(1),@P18 float,@P19 varchar(1),@P20 varchar(1),@P21 varchar(1),@P22 int,@P23 smallint,@P24 numeric(4,2),@P25 smallint,@P26 numeric(4,2),@P27 smallint,@P28 tinyint,@P29 varchar(4),@P30 varchar(1),@P31 varchar(1),@P32 varchar(8),@P33 varchar(17),@P34 datetime,@P35 datetime,@P36 tinyint',
'wf14-14-00001',1,1,46,46,2,8,1,0,17.00,69,'','2013-12-25 19:50:51','刘生','0755-29690585/0755-29690586',0,'N',0,'C','N','Y',1,30,0,0,0,0,1,'外协','','','月结30天','金丰工业区第四栋 ','2014-02-25 19:50:51','2013-12-25 19:50:51',1
go
exec sp_executesql N'insert into data0339
(po_ptr,
 EDITED_BY_PTR,
 TRAN_TYPE,
 TRAN_DESCRIPTION,
 TRAN_FROM,
 TRAN_TO,
 DATA0071_PTR,
 DATA0072_PTR)
 values(@P1,
        @P2,
        @P3,
        @P4,
        @P5,
        @P6,
        @P7,
        @P8)
',N'@P1 int,@P2 int,@P3 int,@P4 varchar(40),@P5 varchar(70),@P6 varchar(70),@P7 int,@P8 int',5102,1,10,'新增采购订单',NULL,NULL,NULL,NULL
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0023" 
SET "tax_id_number"=@P1,"analysis_code1"=@P2,"analysis_code2"=@P3
 WHERE "tax_id_number"=@P4 AND "analysis_code1"=@P5 AND "analysis_code2"=@P6 AND "RKEY"=@P7',
 N'@P1 varchar(8),@P2 varchar(1),@P3 varchar(1),@P4 varchar(8),@P5 varchar(1),@P6 varchar(1),@P7 int',
 '月结30天','','','月结30天','','',46
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0071" 
("PO_PTR","INVT_PTR","QUAN_ORD","PRICE","TAX_2","REQ_DATE","PURCHASE_UNIT_PTR","CONVERSION_FACTOR","extra_req","avl_flag","tax_price","SUPP_PART_NO","SO_PTR","MANU_PART_PTR","a_b") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 numeric(4,2),@P6 datetime,@P7 int,@P8 float,@P9 varchar(27),@P10 varchar(1),@P11 float,@P12 varchar(1),@P13 int,@P14 int,@P15 varchar(1)',
5102,7597,23,2.5641025599999998,17.00,'2013-12-26 20:07:48',29,1,'P0B001567 A0 RCY13100228-01','Y',3,'s',9559,10580,'0'
go
exec sp_executesql N'insert into data0339
(po_ptr,
 EDITED_BY_PTR,
 TRAN_TYPE,
 TRAN_DESCRIPTION,
 TRAN_FROM,
 TRAN_TO,
 DATA0071_PTR,
 DATA0072_PTR)
 values(@P1,
        @P2,
        @P3,
        @P4,
        @P5,
        @P6,
        @P7,
        @P8)
',N'@P1 int,@P2 int,@P3 int,@P4 varchar(40),@P5 varchar(70),@P6 varchar(70),@P7 int,@P8 int',5102,1,6,'新增一个标准采购项目',NULL,NULL,18497,NULL
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0015" 
SET "out_purchase_order2"=@P1 
WHERE "RKEY"=@P2 AND "out_purchase_order2"=@P3',N'@P1 varchar(13),@P2 int,@P3 varchar(13)',
'wf14-14-00002',2,'wf14-14-00001'
go

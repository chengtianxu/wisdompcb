--新增产品型号表

--特别标志
exec sp_executesql N'UPDATE "SJ_V20_live".."data0195" 
SET "green_flag"=@P1,"cl_flag"=@P2
 WHERE "green_flag"=@P3 AND "cl_flag"=@P4 AND "RKEY"=@P5',
 N'@P1 varchar(1),@P2 varchar(1),@P3 varchar(1),@P4 varchar(1),@P5 int',
 'N','N','N','N',1
--产品型号 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0050" 
 ("TTYPE","CUSTOMER_PART_NUMBER","SAMPLE_NR","MFG_LEAD_TIME","SHELF_LIFE","CATALOG_NUMBER","REPORT_UNIT_VALUE1","SALES_ORDER_UNIT_PTR","CUSTPART_ENT_DATE","ANALYSIS_CODE_2","ANALYSIS_CODE_3","ANALYSIS_CODE_4","ANALYSIS_CODE_5","set_x_qty","set_y_qty","LAYERS","cp_code","set_lngth","set_width","GREEN_FLAG","created_by_ptr","GREEN_DESC","CP_REV1","CP_REV2","CP_REV3","eng_tp","etest_tp","cnc_tp","mat_tp","mat_color","mat_thick","mat_oz","mat_fact","mat_other","tax_flag","cl_flag","baseinfo_last_modi_info","spec_info","RSPEC_FLAG_1","RSPEC_FLAG_2","RSPEC_FLAG_3","RSPEC_FLAG_4","RSPEC_FLAG_5","RSPEC_FLAG_6","RSPEC_FLAG_7","RSPEC_FLAG_8","RSPEC_FLAG_9","RSPEC_FLAG_10","RSPEC_FLAG_11","RSPEC_FLAG_12","RSPEC_FLAG_13","RSPEC_FLAG_14","RSPEC_FLAG_15","RSPEC_FLAG_16","RSPEC_FLAG_17","RSPEC_FLAG_18","RSPEC_FLAG_19","RSPEC_FLAG_20","OUTER_OZ","INNER_OZ","SM_COLOR","CM_COLOR","FG_THICK","SET_ACCBAD_QTY","SM_TYPE","MIN_ORD_QTY","ET_TOOL_FLAG","PG_TOOL_FLAG","spec_flag_1","spec_flag_2","spec_flag_3","spec_flag_4","spec_flag_5","spec_flag_6","spec_flag_7","spec_flag_8","spec_flag_9","spec_flag_10","spec_flag_11","spec_flag_12","spec_flag_13","spec_flag_14","spec_flag_15","spec_flag_16","spec_flag_17","spec_flag_18","spec_flag_19","spec_flag_20","max_ord_qty","schno","spec_flag_21","spec_flag_22","spec_flag_23","spec_flag_24","spec_flag_25","spec_flag_26","spec_flag_27","spec_flag_28","spec_flag_29","spec_flag_30","ANALYSIS_CODE_6","ANALYSIS_CODE_7","array_sq","array_size") 
 VALUES
  (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36,@P37,@P38,@P39,@P40,@P41,@P42,@P43,@P44,@P45,@P46,@P47,@P48,@P49,@P50,@P51,@P52,@P53,@P54,@P55,@P56,@P57,@P58,@P59,@P60,@P61,@P62,@P63,@P64,@P65,@P66,@P67,@P68,@P69,@P70,@P71,@P72,@P73,@P74,@P75,@P76,@P77,@P78,@P79,@P80,@P81,@P82,@P83,@P84,@P85,@P86,@P87,@P88,@P89,@P90,@P91,@P92,@P93,@P94,@P95,@P96,@P97,@P98,@P99,@P100,@P101,@P102,@P103,@P104); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 varchar(10),@P3 varchar(1),@P4 smallint,@P5 smallint,@P6 varchar(50),@P7 float,@P8 int,@P9 datetime,@P10 varchar(1),@P11 varchar(1),@P12 varchar(1),@P13 varchar(1),@P14 int,@P15 int,@P16 tinyint,@P17 varchar(1),@P18 float,@P19 float,@P20 varchar(1),@P21 int,@P22 varchar(1),@P23 varchar(1),@P24 varchar(1),@P25 varchar(1),@P26 varchar(1),@P27 varchar(1),@P28 varchar(1),@P29 varchar(1),@P30 varchar(1),@P31 varchar(1),@P32 varchar(1),@P33 varchar(1),@P34 varchar(1),@P35 varchar(1),@P36 varchar(1),@P37 varchar(1),@P38 varchar(1),@P39 bit,@P40 bit,@P41 bit,@P42 bit,@P43 bit,@P44 bit,@P45 bit,@P46 bit,@P47 bit,@P48 bit,@P49 bit,@P50 bit,@P51 bit,@P52 bit,@P53 bit,@P54 bit,@P55 bit,@P56 bit,@P57 bit,@P58 bit,@P59 varchar(1),@P60 varchar(1),@P61 varchar(1),@P62 varchar(1),@P63 varchar(1),@P64 varchar(1),@P65 varchar(1),@P66 int,@P67 varchar(1),@P68 varchar(1),@P69 bit,@P70 bit,@P71 bit,@P72 bit,@P73 bit,@P74 bit,@P75 bit,@P76 bit,@P77 bit,@P78 bit,@P79 bit,@P80 bit,@P81 bit,@P82 bit,@P83 bit,@P84 bit,@P85 bit,@P86 bit,@P87 bit,@P88 bit,@P89 int,@P90 varchar(4),@P91 bit,@P92 bit,@P93 bit,@P94 bit,@P95 bit,@P96 bit,@P97 bit,@P98 bit,@P99 bit,@P100 bit,@P101 varchar(1),@P102 varchar(1),@P103 float,@P104 varchar(1)',
  0,'P1E0020001','',1,7,'                                                  ',0,0,'2013-06-20 07:09:06','','','','',1,3,1,'',33,232,'N',1,'','A','','','','','','','','','','','','N','N','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','','','','','','',0,'N','N',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'0001',0,0,0,0,0,0,0,0,0,0,'','',NULL,NULL
  --产品部件
  exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0025" 
  ("MANU_PART_NUMBER","MANU_PART_DESC","ANCESTOR_PTR","PARENT_PTR","REMARK","PROD_CODE_PTR","OPT_LOT_SIZE","EST_SCRAP","SHELF_LIFE","REVIEW_DAYS") 
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 varchar(5),@P3 int,@P4 int,@P5 varchar(1),@P6 int,@P7 int,@P8 float,@P9 int,@P10 smallint',
  'P1E0020001','test1',12428,0,'',127,50,0,7,360
  --客户 型号
  exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0059"
   ("cust_part_ptr","customer_ptr","ONHOLD_SALES_FLAG","customer_part_desc","customer_matl_desc","cust_inv_name") 
   VALUES (@P1,@P2,@P3,@P4,@P5,@P6); 
   SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
   N'@P1 int,@P2 int,@P3 bit,@P4 varchar(5),@P5 varchar(5),@P6 varchar(5)',
   12428,62,0,'test1','test2','test3'
   --产品型号确认
   exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0119" 
   ("CUST_PART_PTR","ENT_DATE") 
   VALUES (@P1,@P2); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
   N'@P1 int,@P2 datetime',
   12428,'2013-06-20 07:09:06'
   --设置有效
   exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
   SET "ONHOLD_PLANNING_FLAG"=@P1
    WHERE "RKEY"=@P2 AND "ONHOLD_PLANNING_FLAG"=@P3',
    N'@P1 smallint,@P2 int,@P3 smallint',1,12428,1
--拆工作单
exec sp_executesql N'select * from data0006
where work_order_number like @P1
order by work_order_number
',N'@P1 varchar(16)','130603006-0-2-1%'
--新增工作单
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0006" 
("WORK_ORDER_NUMBER","CUT_NO","BEGIN_STEP_NO","PANEL_A_B","WHOUSE_PTR","USER_PTR","EMPLOYEE_PTR","BOM_PTR","SUB_LEVELS","PRIORITY_CODE","ENGG_STATUS","PROD_STATUS","ENGG_PROD_FLAG","QUAN_SCH","QUAN_REJ","QUAN_PROD","PANELS","ENT_DATETIME","SCH_COMPL_DATE","PROJ_START_DATE","PROJ_COMPL_DATE","CANCEL_HOLD_DATE","ACT_COMPL_DATE","RMA_PTR","PARTS_PER_PANEL","EDITED_BY","PLANNED_QTY","RELEASE_DATE","TRAV_PRINTED_BY_PTR","FLOW_NO","WIPMAT_STATUS","PPC_FLAG","reference_ptr","panel_ln","panel_wd","wtype","put_type","remark_pnls","pnl_size","matl_cost","ovhd_cost","ipqc_flag","trav_barcode_printed_by_ptr","from_wo_ptr","memo","trav_printed_date","WO_DATECODE","stop_lmt_step","trans_pcs","SETS_BOM_PTR","SETS_CUST_PART_PTR","SETS_STEP","FIRST_CUT_NO","SO_PTR","ORIG_QUAN_SCH","LAST_STOP_DATE","ACCU_STOPED_DAYS","TDATE","REWORKED_FLAG","QUAN_REJ_PROD","TO_WO_PTR","SETS_QTY","parts_per_set") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36,@P37,@P38,@P39,@P40,@P41,@P42,@P43,@P44,@P45,@P46,@P47,@P48,@P49,@P50,@P51,@P52,@P53,@P54,@P55,@P56,@P57,@P58,@P59,@P60,@P61,@P62,@P63); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(16),@P2 varchar(20),@P3 smallint,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int,@P9 smallint,@P10 tinyint,@P11 smallint,@P12 smallint,@P13 smallint,@P14 float,@P15 float,@P16 float,@P17 int,@P18 datetime,@P19 datetime,@P20 datetime,@P21 datetime,@P22 datetime,@P23 datetime,@P24 int,@P25 float,@P26 int,@P27 float,@P28 datetime,@P29 int,@P30 smallint,@P31 smallint,@P32 smallint,@P33 int,@P34 float,@P35 float,@P36 tinyint,@P37 tinyint,@P38 int,@P39 varchar(1),@P40 float,@P41 float,@P42 tinyint,@P43 tinyint,@P44 int,@P45 varchar(1),@P46 datetime,@P47 varchar(1),@P48 int,@P49 int,@P50 int,@P51 int,@P52 int,@P53 varchar(1),@P54 int,@P55 int,@P56 datetime,@P57 float,@P58 datetime,@P59 tinyint,@P60 int,@P61 int,@P62 int,@P63 int',
'130603006-0-2-1A','130603006-0         ',2,0,2,565,NULL,12625,NULL,0,NULL,3,NULL,1000,0,0,21,'2013-06-03 09:41:22','2013-07-02 00:00:00',NULL,NULL,NULL,NULL,NULL,48,NULL,NULL,'2013-06-03 11:46:10',565,0,0,0,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,16045,NULL,'2013-06-03 11:34:15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,6186,2400,NULL,NULL,'2013-06-03 09:43:00',NULL,NULL,NULL,83,12
--新增wip
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0056" 
("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","WTYPE","TO_BE_CANCD","REFERENCE","PUT_TYPE","STEP_LMT","ipqc_flag","OUTSOURCE","PR_PTR","D0069_PTR","REWORK_LMT_STEP","PPC_FLAG","D0071_PTR","d0038_ptr","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","loc_place","wo_date_code","Weight_SET","SETS_QTY","TO_BE_STOCKED_NOW","ipqc_flg","qty_rej","qty_rej_to_stocked","Xset_qty") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31,@P32,@P33,@P34,@P35,@P36,@P37,@P38); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 tinyint,@P14 int,@P15 varchar(1),@P16 tinyint,@P17 smallint,@P18 tinyint,@P19 bit,@P20 int,@P21 int,@P22 int,@P23 bit,@P24 int,@P25 int,@P26 int,@P27 int,@P28 int,@P29 datetime,@P30 varchar(1),@P31 varchar(1),@P32 float,@P33 int,@P34 float,@P35 bit,@P36 int,@P37 int,@P38 int',
16075,349,0,31,0,2,1000,21,'2013-06-03 15:48:24',0,NULL,NULL,0,NULL,'',0,0,0,0,NULL,NULL,NULL,1,NULL,247566,NULL,NULL,NULL,NULL,NULL,NULL,NULL,83,0,0,NULL,NULL,NULL
--新增134拆单表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0134"
 ("WO_PTR","TTYPE","FM_WO_PTR","TDATE","TRANS_PCS","TRANS_PNLS","EMPL_PTR") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 int,@P6 int,@P7 int',
 16075,1,16045,'2013-06-18 09:24:51',1000,21,1
--修改原工作单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0006" 
SET "QUAN_SCH"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
WHERE "RKEY"=@P4 AND "QUAN_SCH"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',
1400,29,117,16045,2400,50,200

--修改原WIP

exec sp_executesql N'UPDATE "SJ_V20_live".."data0056" 
SET "QTY_BACKLOG"=@P1,"PANELS"=@P2,"SETS_QTY"=@P3 
WHERE "RKEY"=@P4 AND "QTY_BACKLOG"=@P5 AND "PANELS"=@P6 AND "SETS_QTY"=@P7',
N'@P1 float,@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 int',
1400,29,117,22123,2400,50,200


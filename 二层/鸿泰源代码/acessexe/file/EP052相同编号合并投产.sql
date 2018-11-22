
--EP052相同编号合并投产
--相同型号在EP052合并投产，转入为负数，转出为正数,如果取消投产，这个待投产只会全部返加这个单，而不会回到合并另一个单
----to_be_planned=parts_order-QTY_PLANNNED-ppc_trans_qty(合并投产)

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0492" --增加配料单
("CUT_NO","SO_NO","BOM_PTR","PLANNED_QTY","ISSUED_QTY","SCH_COMPL_DATE","ISSUE_DATE","CREATED_BY_PTR","FM_WO_NUMBER","TO_WO_NUMBER","UPANEL1","PANEL_1_QTY","UPANEL2","PANEL_2_QTY","FG_QTY","WIP_QTY","ORD_REQ_QTY","UPANEL3","PANEL_3_QTY","UPANEL4","PANEL_4_QTY","pnl1_size","pnl2_size","pnl3_size","pnl4_size","CUSTOMER_PTR","Con_Flag","pcbcut_ptr","ref_scp_ratio","qty_allocated","REPUT_QTY") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30,@P31); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(20),@P2 varchar(12),@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 datetime,@P8 int,@P9 varchar(15),@P10 varchar(15),@P11 int,@P12 int,@P13 int,@P14 int,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 int,@P22 varchar(13),@P23 varchar(1),@P24 varchar(1),@P25 varchar(1),@P26 int,@P27 smallint,@P28 int,@P29 float,@P30 int,@P31 int',
'131205001-0         ','OC1231668-01',32227,80000,81900,'2013-06-14 00:00:00','2013-12-05 11:23:46',3,'131205001-0-4-1','131205001-0-4-4',180,455,0,0,0,0,190100,0,0,0,0,'415mm X 338mm','','','',468,0,26187,0,0,0

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0360" --只修改360表
SET "planned_qty"=@P1 WHERE "planned_qty"=@P2 AND "rkey"=@P3',
N'@P1 int,@P2 int,@P3 int',60000,0,149062

exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0004" --修改编号
SET "SEED_VALUE"=@P1 WHERE "RKEY"=@P2 AND "SEED_VALUE"=@P3',
N'@P1 varchar(9),@P2 int,@P3 varchar(9)','131205002',55,'131118117'

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0006" --增加工单
("WORK_ORDER_NUMBER","CUT_NO","PANEL_A_B","WHOUSE_PTR","BOM_PTR","PRIORITY_CODE","PROD_STATUS","QUAN_SCH","PANELS","ENT_DATETIME","SCH_COMPL_DATE","PARTS_PER_PANEL","pnl_size","SETS_QTY","parts_per_set") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(15),@P2 varchar(20),@P3 int,@P4 int,@P5 int,@P6 tinyint,@P7 smallint,@P8 float,@P9 int,@P10 datetime,@P11 datetime,@P12 float,@P13 varchar(13),@P14 int,@P15 int',
'131205001-0-4-1','131205001-0         ',0,2,32227,0,2,21600,120,'2013-12-05 11:23:46','2013-06-14 00:00:00',180,'415mm X 338mm',720,30
--修改两个60表
exec sp_executesql N'UPDATE "SJ_V20_Sample".."DATA0060" --转入订单，ppc_trans_qty为负数
SET "PROD_REL"=@P1,"TO_BE_PLANNED"=@P2,"QTY_PLANNNED"=@P3,"REPUT_QTY"=@P4,"ppc_trans_qty"=@P5 
WHERE "RKEY"=@P6 AND "PROD_REL"=@P7 AND "TO_BE_PLANNED"=@P8 AND "QTY_PLANNNED"=@P9 AND "REPUT_QTY" IS NULL AND "ppc_trans_qty" IS NULL; 
UPDATE "SJ_V20_Sample".."DATA0060"  --转出订单，ppc_trans_qty为正数
SET "PROD_REL"=@P10,"TO_BE_PLANNED"=@P11,"QTY_PLANNNED"=@P12,"REPUT_QTY"=@P13,"ppc_trans_qty"=@P14 
WHERE "RKEY"=@P15 AND "PROD_REL"=@P16 AND "TO_BE_PLANNED"=@P17 AND "QTY_PLANNNED"=@P18 AND "REPUT_QTY" IS NULL AND "ppc_trans_qty" IS NULL',
N'@P1 varchar(1),@P2 int,@P3 int,@P4 int,@P5 float,@P6 int,@P7 varchar(1),@P8 int,@P9 int,@P10 varchar(1),@P11 int,@P12 int,@P13 int,@P14 float,@P15 int,@P16 varchar(1),@P17 int,@P18 int',
'3',0,80000,0,-20000,143376,'2',60000,0,'3',0,0,0,20000,143377,'2',20000,0

这个合并，会碰到这样的情况 一个订单是1万，投了1.4万，还有待投3K，如果只有两个单合并可以通过PPC_TRANS_QTY＝查
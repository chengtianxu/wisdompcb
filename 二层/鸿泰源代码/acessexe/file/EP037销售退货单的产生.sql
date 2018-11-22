--销售退货、成品退货EP037


--增加98表 成品退货信息表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0098" 
("RMA_NUMBER","CUSTOMER_PART_PTR","AUTH_BY_EMPL_PTR","CSI_USER_PTR","CUSTOMER_PTR","SO_PTR","NOTE_PAD_PTR","RMA_DATE","QTY_AUTH","QTY_RECD","QTY_SCRAP","QTY_TO_BE_REWORKED","RMA_STATUS","QTY_TO_BE_REMAKED","QTY_TO_MOVE_FIN_GOOD","QTY_SHIP","sys_date","required_amount","Curr_ptr","Co_Price","ReDate","EXCH_RATE","REQUEST_D0050_RKEY","EFFECT_TP","WHSE_PTR","LOST_AMOUNT","actual_Retn_Qty","Re_purchase_order_ptr","Return_So_tp","LASTMOD_DATE")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(7),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 int,@P10 int,@P11 int,@P12 int,@P13 smallint,@P14 int,@P15 int,@P16 int,@P17 datetime,@P18 money,@P19 int,@P20 numeric(18,5),@P21 datetime,@P22 numeric(18,8),@P23 int,@P24 varchar(3),@P25 int,@P26 money,@P27 int,@P28 int,@P29 int,@P30 datetime',
 'RMA0245',11276,1,1,129,5449,0,'2013-05-30 16:33:04',30,0,0,0,0,0,0,30,'2013-05-30 16:32:59',$0.0000,1,15.00000,'2013-06-09 00:00:00',1.00000000,11276,'B  ',2,$0.0000,30,2651,0,'2013-05-30 16:32:59'
 
 update data0064 --成品装运指派表
set QUAN_CREDITED = QUAN_CREDITED+30 --已退货数量
where rkey= 5901


insert into data0120 --接收退货明细表
(rma_ptr,  --98表指针
ship_ptr,   --64表指针
qty_send) --退货数量
values (246,5901,30)

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011"  --系统操作日志
("FILE_POINTER","SOURCE_TYPE","memo_text") --98表指针，表标识
VALUES (@P1,@P2,@P3); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 smallint,@P3 text',
246,98,'dsf
'

--全局控制码表
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_VALUE"=@P3 AND "SEED_FLAG"=@P4',N'@P1 varchar(7),@P2 smallint,@P3 varchar(7),@P4 tinyint','RMA0246',10,'RMA0245',4

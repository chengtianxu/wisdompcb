exec sp_executesql N'select data0064.rkey,shipment_no,date_shipped,
       quan_shipped=quan_shipped+ovsh_qty,quan_credited,
       quan_shipped+ovsh_qty-quan_credited as qty_aval,
       data0005.employee_name
from data0064 inner join data0005 on
     data0064.ENT_EMPL_PTR=data0005.rkey
where so_ptr=@P1 and
      PACKING_SLIP_FLAG=''1'' and
      quan_shipped-quan_credited>0
order by shipment_no

 
 
',N'@P1 int',7607
--增加退货单
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0098"
 ("RMA_NUMBER","CUSTOMER_PART_PTR","AUTH_BY_EMPL_PTR","CSI_USER_PTR","CUSTOMER_PTR","SO_PTR","NOTE_PAD_PTR","RMA_DATE","QTY_AUTH","QTY_RECD","QTY_SCRAP","QTY_TO_BE_REWORKED","RMA_STATUS","QTY_TO_BE_REMAKED","QTY_TO_MOVE_FIN_GOOD","QTY_SHIP","sys_date","required_amount","Curr_ptr","Co_Price","ref_number","ReDate","EXCH_RATE","REQUEST_D0050_RKEY","WHSE_PTR","LOST_AMOUNT","actual_Retn_Qty","Re_purchase_order_ptr","Return_So_tp","LASTMOD_DATE") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28,@P29,@P30);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(7),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 int,@P10 int,@P11 int,@P12 int,@P13 smallint,@P14 int,@P15 int,@P16 int,@P17 datetime,@P18 money,@P19 int,@P20 numeric(18,5),@P21 varchar(3),@P22 datetime,@P23 numeric(18,8),@P24 int,@P25 int,@P26 money,@P27 int,@P28 int,@P29 int,@P30 datetime',
  'RMA0350',6634,1,1,61,7607,0,'2013-09-12 19:45:18',11,0,0,0,0,0,0,11,'2013-09-12 19:44:51',$0.0000,4,0.53000,'111','2013-09-22 00:00:00',1.25678664,6634,2,$0.0000,11,3779,0,'2013-09-12 19:44:51'
 --修改装箱单 
  update data0064
set QUAN_CREDITED = QUAN_CREDITED+11
where rkey= 8696
--退货单明细
insert into data0120 (rma_ptr,ship_ptr,qty_send)
values (351,8696,11)

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" 
("FILE_POINTER","SOURCE_TYPE","memo_text") 
VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 smallint,@P3 text',
351,98,'rr
'

exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_VALUE"=@P3 AND "SEED_FLAG"=@P4',
N'@P1 varchar(7),@P2 smallint,@P3 varchar(7),@P4 tinyint',
'RMA0351',10,'RMA0350',4







------------------------------------------------
--删除
update data0064
set QUAN_CREDITED=QUAN_CREDITED-data0120.qty_send
from data0120 inner join data0064
on data0120.ship_ptr=data0064.rkey
where data0120.rma_ptr=354


delete from data0098
where rkey=354






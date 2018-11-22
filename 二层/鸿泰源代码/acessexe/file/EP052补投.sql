--补投
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0060" 
SET "status"=@P1,"qty_reput"=@P2,"reput_qty"=@P3,"reput_appr_by"=@P4,"reput_remark"=@P5 
WHERE "status"=@P6 AND "qty_reput"=@P7 AND "reput_qty"=@P8 AND "reput_appr_by" IS NULL AND "reput_remark" IS NULL AND "RKEY"=@P9',
N'@P1 tinyint,@P2 int,@P3 int,@P4 int,@P5 varchar(3),@P6 tinyint,@P7 int,@P8 int,@P9 int',
1,300,300,0,'adt',1,0,0,15562


--退货订单不能补投，不然在投产安排出不来数据
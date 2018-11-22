--EP085货币
--查询
select * from Data0001

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0001" 
SET "CURR_NAME"=@P1,"TDATE"=@P2,"QTE_EXCH_RATE"=@P3,"QTE_BASE_TO_OTHER"=@P4
 WHERE "RKEY"=@P5 AND "CURR_NAME"=@P6 AND "TDATE"=@P7 AND "QTE_EXCH_RATE"=@P8 AND "QTE_BASE_TO_OTHER"=@P9',
 N'@P1 varchar(6),@P2 datetime,@P3 float,@P4 float,@P5 int,@P6 varchar(6),@P7 datetime,@P8 float,@P9 float',
 '人民币','2013-11-04 00:00:00',1,1,
 1,'人民币','2013-11-04 00:00:00',1,1
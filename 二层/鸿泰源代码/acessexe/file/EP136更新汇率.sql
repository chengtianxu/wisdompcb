
--EP136更新汇率
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0001"
 SET "CURR_NAME"=@P1,"EXCH_RATE"=@P2,"TDATE"=@P3,"BASE_TO_OTHER"=@P4 
 WHERE "RKEY"=@P5 AND "CURR_NAME"=@P6 AND "EXCH_RATE"=@P7 AND "TDATE"=@P8 AND "BASE_TO_OTHER"=@P9',
 N'@P1 varchar(6),@P2 float,@P3 datetime,@P4 float,@P5 int,@P6 varchar(6),@P7 float,@P8 datetime,@P9 float',
 '人民币',1,'2013-07-03 00:00:00',1,1,'人民币',1,'2013-07-03 00:00:00',1

exec sp_executesql N'UPDATE "SJ_V20_live".."data0003" SET "exch_rate"=@P1,"base_to_other"=@P2,"last_modified_by_ptr"=@P3,"last_modified_date"=@P4,"memo_text"=@P5 WHERE "RKEY"=@P6 AND "exch_rate"=@P7 AND "base_to_other"=@P8 AND "last_modified_by_ptr"=@P9 AND "last_modified_date"=@P10 AND "memo_text"=@P11',N'@P1 float,@P2 float,@P3 int,@P4 datetime,@P5 varchar(209),@P6 int,@P7 float,@P8 float,@P9 int,@P10 datetime,@P11 varchar(94)',1,1,1,'2013-07-10 16:18:57','2013-03-19 18:30:27:钱记全 由更改为1.0000000 2013-07-10 16:15:57:系统管理员 由更改为1.0000000 2013-07-10 16:16:02:系统管理员 由1.000000更改为2.000000 2013-07-10 16:18:57:系统管理员 由2.000000更改为1.0000000',87,1,1,1,'2013-07-10 16:16:00','2013-03-19 18:30:27:钱记全 由更改为1.0000000 2013-07-10 16:15:57:系统管理员 由更改为1.0000000'
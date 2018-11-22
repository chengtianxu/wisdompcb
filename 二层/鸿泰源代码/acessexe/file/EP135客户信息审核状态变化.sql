EP135客户信息审核状态变化
--cust_active_flag 审核 0未审核1退回，2待审，3已审
--CUSTOMER_TYPE 状态1正常,2试用,3保留,4作废

--退回
exec sp_executesql N'UPDATE "SJ_V20_live".."data0010" 
SET "CUSTOMER_TYPE"=@P1,"d0010audited_by_ptr"=@P2,"d0010audited_date"=@P3,"cust_active_flag"=@P4
WHERE "RKEY"=@P5 AND "CUSTOMER_TYPE"=@P6 AND "d0010audited_by_ptr"=@P7 AND "d0010audited_date"=@P8 AND "cust_active_flag"=@P9',
N'@P1 int,@P2 int,@P3 datetime,@P4 tinyint,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 tinyint',
3,1,'2013-11-26 00:00:00',1,354,1,888,'2012-12-25 00:00:00',3

--提交
exec sp_executesql N'UPDATE "SJ_V20_live".."data0010" 
SET "d0010audited_by_ptr"=@P1,"d0010audited_date"=@P2,"cust_active_flag"=@P3
 WHERE "RKEY"=@P4 AND "d0010audited_by_ptr"=@P5 AND "d0010audited_date"=@P6 AND "cust_active_flag"=@P7',
 N'@P1 int,@P2 datetime,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 tinyint',
 1,'2013-11-26 00:00:00', 2,354,1,'2013-11-26 00:00:00',1
 --审核
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0010" 
 SET "CUSTOMER_TYPE"=@P1,"d0010audited_by_ptr"=@P2,"d0010audited_date"=@P3,"cust_active_flag"=@P4 
 WHERE "RKEY"=@P5 AND "CUSTOMER_TYPE"=@P6 AND "d0010audited_by_ptr"=@P7 AND "d0010audited_date"=@P8 AND "cust_active_flag"=@P9',
 N'@P1 int,@P2 int,@P3 datetime,@P4 tinyint,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 tinyint',
 1,1,'2013-11-26 00:00:00',3,354,3,1,'2013-11-26 00:00:00',2
 --报废
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0010" 
 SET "CUSTOMER_TYPE"=@P1,"d0010audited_by_ptr"=@P2,"d0010audited_date"=@P3,"cust_active_flag"=@P4 
WHERE "RKEY"=@P5 AND "CUSTOMER_TYPE"=@P6 AND "d0010audited_by_ptr"=@P7 AND "d0010audited_date"=@P8 AND "cust_active_flag"=@P9',
N'@P1 int,@P2 int,@P3 datetime,@P4 tinyint,@P5 int,@P6 int,@P7 int,@P8 datetime,@P9 tinyint',
4,1,'2013-11-26 00:00:00',3,354,1,1,'2013-11-26 00:00:00',3
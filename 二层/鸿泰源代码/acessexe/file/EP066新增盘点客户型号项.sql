--新增盘点客户型号项
--增加53表数据
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_live".."data0053" 
("WHSE_PTR","LOC_PTR","CUST_PART_PTR","QUANTITY","QTY_ON_HAND","MFG_DATE","REFERENCE_NUMBER","customer_ptr") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 float,@P5 float,@P6 datetime,@P7 varchar(20),@P8 int',
 2,16,11001,50,0,'2013-06-21 19:18:11','                    ',61
 
--增加盘点明细表数据 
 exec sp_executesql N'SET NOCOUNT OFF; 
 INSERT INTO "SJ_V20_live".."data0215"
  ("FG_LIST_PTR","CUSTPART_PTR","CUSTPART_BATCH_PTR","location_ptr","QUANTITY") 
  VALUES (@P1,@P2,@P3,@P4,@P5); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 float',
  16,11001,21814,16,-2
  
--修改盘点明细表数据  
  exec sp_executesql N'UPDATE "SJ_V20_live".."data0215"
   SET "QUANTITY"=@P1,"ENTERED_BY_PTR"=@P2,"ENTERED_BY_USER_PTR"=@P3,"COUNTED_BY_EMPL_PTR"=@P4,"status"=@P5,"check_no"=@P6 
   WHERE "RKEY"=@P7 AND "QUANTITY"=@P8 AND "ENTERED_BY_PTR" IS NULL AND "ENTERED_BY_USER_PTR" IS NULL AND "COUNTED_BY_EMPL_PTR" IS NULL AND "status"=@P9 AND "check_no" IS NULL',N'
   @P1 float,@P2 int,@P3 int,@P4 int,@P5 tinyint,@P6 varchar(1),@P7 int,@P8 float,@P9 tinyint',
   30,1,1,1,1,'',37742,-2,0
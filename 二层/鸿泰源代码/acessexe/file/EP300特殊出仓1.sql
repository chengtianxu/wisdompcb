--EP300特殊出仓
正常重检MRB
出仓
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" SET "SEED_VALUE"=@P1 WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_MEAN"=@P3 AND "BIG5_SEED_MEAN"=@P4 AND "SEED_VALUE"=@P5 AND "SEED_FLAG"=@P6 AND "table_name"=@P7 AND "rkey_ref"=@P8 AND "rkey"=@P9 AND "BillType" IS NULL',N'@P1 varchar(6),@P2 smallint,@P3 varchar(12),@P4 varchar(1),@P5 varchar(6),@P6 tinyint,@P7 varchar(8),@P8 int,@P9 int','TR0502',15,'特殊出仓编号','','TR0501',2,'data0415',6,6
主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0415"
 ("number","type","status","empl_ptr","custpart_ptr","sys_date","quantity","reference","CUSTOMER_PTR","TYPECLASS","Use_REMARK") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 varchar(6),@P2 tinyint,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 int,@P8 varchar(4),@P9 int,@P10 tinyint,@P11 varchar(1)','TR0501',
  4,1,1,11319,'2013-08-23 12:23:56',12,'test',309,0,''
明细
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0465" 
("D0053_PTR","QUANTITY","REFERENCE","heard_ptr") VALUES (@P1,@P2,@P3,@P4); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 varchar(1),@P4 int',
9643,12,'',2033
改库存
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" SET "qty_alloc"=@P1 WHERE "rkey"=@P2 AND "qty_alloc"=@P3',N'@P1 float,@P2 int,@P3 float',12,9643,0

注意本厂编号不能为报价
SELECT distinct top 100 PERCENT Data0050.RKEY,  --不可随便移动行数 
      Data0050.CUSTOMER_PART_NUMBER, data0059.customer_part_desc,
      Data0050.CP_REV, data0059.customer_ptr,data0050.QTY_ON_HAND,
      Data0050.CATALOG_NUMBER, Data0010.CUST_CODE,
      Data0010.ABBR_NAME,data0279.parameter_value
FROM Data0010 RIGHT OUTER JOIN
      data0059 ON
      Data0010.RKEY = data0059.customer_ptr RIGHT OUTER JOIN
      Data0050 ON data0059.cust_part_ptr = Data0050.RKEY  inner join
     Data0053 on Data0050.rkey=data0053.cust_part_ptr  and ((data0010.rkey=data0053.customer_ptr)  or (isnull(data0053.customer_ptr,0)=0))   --加客户指针或为空
    left join data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 left join  
     data0279 on Data0025.rkey=Data0279.source_ptr and Data0279.parameter_ptr=441   
  WHERE (Data0050.TTYPE < 2) 0量1样2报价
  and data0053.QTY_ON_HAND>0
and data0059.customer_ptr=61

ORDER BY Data0050.CUSTOMER_PART_NUMBER

提交
SELECT USER_PTR,seq_no FROM data0077 WHERE  ttype=7 
ORDER BY SEQ_NO

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" 
("user_ptr","ranking","D415_ptr") VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 tinyint,@P3 int',
1,1,2033

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0415" 
SET "status"=@P1,"Ranking"=@P2 
WHERE "status"=@P3 AND "rkey"=@P4 AND "Ranking"=@P5',
N'@P1 tinyint,@P2 int,@P3 tinyint,@P4 int,@P5 int',
2,1,1,2033,1
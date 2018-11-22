--特殊出仓
--增加主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0415" 
("number","type","status","empl_ptr","custpart_ptr","sys_date","quantity","reference","CUSTOMER_PTR","TYPECLASS","Use_REMARK") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN'
,N'@P1 varchar(6),@P2 tinyint,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 int,@P8 varchar(3),@P9 int,@P10 tinyint,@P11 varchar(4)',
'TR0499',1,1,1,11389,'2013-06-20 12:33:53',2,'sdf',377,0,'备品'
--修改编号
select * from data0004
where rkey=6

exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 
WHERE "CONTROL_NO_LENGTH"=@P2 AND "SEED_MEAN"=@P3 AND "BIG5_SEED_MEAN"=@P4 AND "SEED_VALUE"=@P5 AND "SEED_FLAG"=@P6 AND "table_name"=@P7 AND "rkey_ref"=@P8 AND "rkey"=@P9 AND "BillType" IS NULL',
N'@P1 varchar(6),@P2 smallint,@P3 varchar(12),@P4 varchar(1),@P5 varchar(6),@P6 tinyint,@P7 varchar(8),@P8 int,@P9 int',
'TR0500',15,'特殊出仓编号','','TR0499',2,'data0415',6,6
--增加明细表

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0465" 
("D0053_PTR","QUANTITY","REFERENCE","heard_ptr") VALUES (@P1,@P2,@P3,@P4); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 varchar(1),@P4 int',
10537,2,'',2029
--修改库存占用量

exec sp_executesql N'UPDATE "SJ_V20_live".."Data0053" 
SET "qty_alloc"=@P1 
WHERE "rkey"=@P2 AND "qty_alloc"=@P3',
N'@P1 float,@P2 int,@P3 float',
2,10537,0

--查询
exec sp_executesql N'SELECT data0415.number,data0415.type,data0415.status,data0415.rkey,data0060.sales_order,data0060.rkey as rkey60,
       Data0050.CUSTOMER_PART_NUMBER, Data0059.CUSTOMER_PART_DESC,
       Data0050.CP_REV,Data0005.EMPLOYEE_NAME,data0415.sys_date,case data0415.typeclass when 0 then ''正常出仓'' when 1 then ''转移到AS'' end as typeclass,
       data0415.quantity,data0415.reference,Data0010.ABBR_NAME as abbr_name10,
       data0010.cust_code,data0010.CUSTOMER_NAME,data0415.custpart_ptr AS RKEY415,
       data0415.Rma_ptr,data0059.customer_matl_desc,data0415.cost_flag,data0415.Ranking
FROM Data0415 left JOIN
     Data0010 on Data0415.CUSTOMER_PTR=Data0010.Rkey inner join
     Data0050 ON data0415.custpart_ptr = Data0050.RKEY left JOIN
     Data0005 ON data0415.empl_ptr = Data0005.RKEY left join
     Data0059 ON data0415.CUSTOMER_PTR = data0059.customer_ptr
             AND data0415.custpart_ptr = data0059.cust_part_ptr left join Data0060 on Data0415.so_ptr=Data0060.rkey
where data0415.sys_date >= @P1 and data0415.sys_date <= @P2

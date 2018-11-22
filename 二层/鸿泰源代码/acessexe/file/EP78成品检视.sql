--EP78成品检视
--可用的出仓单号
exec sp_executesql N'SELECT data0415.rkey,data0415.number,data0415.sys_date,
      data0415.quantity,data0415.qty_received,data0415.reference,
      Data0050.CUSTOMER_PART_NUMBER,area_handle=convert(decimal(20,4),data0415.qty_received*data0047.parameter_value),
      Data0059.CUSTOMER_PART_DESC,area=convert(decimal(20,4),data0415.quantity*data0047.parameter_value),
      Data0050.CP_REV, data0415.custpart_ptr,Data0050.Layers,Data0005.EMPLOYEE_NAME,data0415.type,
      Data0010.ABBR_NAME as abbr_name10,
      data0010.cust_code,data0010.CUSTOMER_NAME,Data0008.Product_Name,
      data0415.rma_ptr,type_desc=case when data0415.type=3 then ''退货重检'' when data0415.type=4 then ''正常重检'' end
      ,Data0025.rkey as rkey25
FROM data0415 
     INNER JOIN Data0050 ON data0415.custpart_ptr = Data0050.RKEY 
     INNER JOIN data0025 on data0050.rkey=data0025.ancestor_ptr and data0025.parent_ptr=0 
     LEFT JOIN  Data0005 ON data0415.empl_ptr = Data0005.RKEY 
     LEFT JOIN  Data0010 ON data0415.CUSTOMER_PTR = Data0010.RKEY 
     LEFT JOIN  data0059 ON data0415.custpart_ptr = data0059.cust_part_ptr AND data0415.CUSTOMER_PTR = data0059.customer_ptr 
     LEFT join Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey 
     left join
      (select data0047.source_pointer,data0047.parameter_value 
         from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
         where data0278.spec_rkey=''L'') data0047 on data0025.rkey=data0047.source_pointer
WHERE (data0415.type = 3 OR
      data0415.type = 4) AND (data0415.status = 3)  and (data0415.sys_date>=@P1) and (data0415.sys_date<=@P2)  
     and  (data0415.type=@P3 or data0415.type=@P4)   
ORDER BY data0415.number
',N'@P1 datetime,@P2 datetime,@P3 int,@P4 int','2013-12-15 00:00:00','2014-01-15 00:00:00',3,4


---------------------------------------
--新建--
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" 
SET "SEED_VALUE"=@P1 WHERE "SEED_VALUE"=@P2 AND "rkey"=@P3',
N'@P1 varchar(10),@P2 varchar(10),@P3 int','MRB0000004','MRB0000003',45

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0414" 
("number","empl_ptr","d415_ptr","qty_rece","qty_to_be_reworked","qty_to_be_remaked","reference","status","sys_date","QTY_REWORKED","QTY_REMAKED","qty_to_be_stocked","qty_stocked","rma_ptr","sys_id","sys_rq") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(15),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 text,@P8 tinyint,@P9 datetime,@P10 int,@P11 int,@P12 int,@P13 int,@P14 int,@P15 varchar(16),@P16 datetime',
'MRB0000003',1,2789,23,3,5,'test',1,'2014-01-14 16:06:54',0,0,15,0,NULL,'ADMIN','2014-01-14 16:06:54'
--1未提交,2CASE WHEN ep078_audit_flag = 0 THEN '已检视' ELSE '待处理' ,3已完成,4 待审核,5 '被退回

--只插入报废明细表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0058" 
("MRB_NO","REJECT_PTR","QTY_ORG_REJ","QTY_REJECT","PANELS","EMPL_PTR","TDATETIME","REFERENCE","TTYPE","mrb_ptr","d25_rkey") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(10),@P2 int,@P3 int,@P4 float,@P5 int,@P6 int,@P7 datetime,@P8 varchar(30),@P9 smallint,@P10 int,@P11 int',
'2014-01-14',154,5,5,0,1,'2014-01-14 16:18:02','t1                            ',10,3,1645

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0057"
 ("MRB_NO","TRAN_PTR","REJECT_PTR","QTY_REJECT","EMPL_PTR","TDATETIME","REFERENCE","mrb_ptr","d25_rkey")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 varchar(10),@P2 int,@P3 int,@P4 float,@P5 int,@P6 datetime,@P7 varchar(30),@P8 int,@P9 int',
  '2014-01-14',-1,256,3,1,'2014-01-14 16:18:15','t2                            ',3,1645
  
  exec sp_executesql N'UPDATE "SJ_V20_live".."data0415" 
  SET "qty_received"=@P1,"status"=@P2 
  WHERE "qty_received"=@P3 AND "status"=@P4 AND "rkey"=@P5',--状态1,2,3,4,5待提交,待出仓,已出仓,已重检,被退回
  N'@P1 int,@P2 tinyint,@P3 int,@P4 tinyint,@P5 int',
  23,4,0,3,2789

//415.STATUS=3,

-------------------------------------------------------------
SELECT rkey,v_STATUS,number414,sys_date414,EMPLOYEE_NAME,type_desc,reference,status,sys_id,sys_rq,mod_rq,CUSTOMER_PART_NUMBER,CUSTOMER_PART_DESC,CP_REV,cust_code,abbr_name10,Layers,Product_Name,qty_rece,qty_to_be_reworked,GrossArea_Badness,NetArea_Badness,QTY_REWORKED,qty_to_be_remaked,GrossArea_Scrap,NetArea_Scrap,QTY_REMAKED,qty_to_be_stocked,qty_stocked,number415,ranking,custpart_ptr,type,quantity,qty_received,area,qty_ship 
FROM vData0414_1 
WHERE  sys_date414>='2014-01-12 00:00:00' and sys_date414<='2014-01-15 00:00:00' 
and type in (3,4)  Order by number414 DESC


--vData0414_1
SELECT     dbo.data0414.rkey, dbo.data0414.number AS number414, dbo.data0414.sys_date AS sys_date414, dbo.Data0005.EMPLOYEE_NAME, dbo.data0414.status, 
                      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0050.CP_REV, dbo.data0059.customer_part_desc, dbo.Data0010.ABBR_NAME AS abbr_name10, 
                      dbo.Data0010.CUST_CODE, dbo.data0414.qty_to_be_remaked, dbo.data0414.QTY_REMAKED, dbo.data0414.ranking, dbo.data0414.qty_rece, 
                      dbo.data0414.qty_to_be_reworked, dbo.data0414.QTY_REWORKED, dbo.data0414.qty_to_be_stocked, dbo.data0414.qty_stocked, 
                      dbo.data0415.number AS number415, dbo.data0415.custpart_ptr, dbo.data0415.type, dbo.data0415.quantity, dbo.data0415.qty_received, dbo.Data0050.LAYERS, 
                      Data0047_1.PARAMETER_VALUE AS area, Data0047_2.PARAMETER_VALUE AS gross_area, CONVERT(varchar(5000), dbo.data0414.reference) AS reference, 
                      ISNULL(dbo.Data0098.QTY_SHIP, - 1) AS qty_ship, dbo.Data0008.PRODUCT_NAME, ROUND(dbo.data0414.qty_to_be_remaked * Data0047_1.PARAMETER_VALUE, 2) 
                      AS NetArea_Scrap, ROUND(dbo.data0414.qty_to_be_reworked * Data0047_1.PARAMETER_VALUE, 2) AS NetArea_Badness, 
                      ROUND(dbo.data0414.qty_to_be_remaked * Data0047_2.PARAMETER_VALUE, 2) AS GrossArea_Scrap, 
                      ROUND(dbo.data0414.qty_to_be_reworked * Data0047_2.PARAMETER_VALUE, 2) AS GrossArea_Badness, dbo.data0414.sys_id, dbo.data0414.sys_rq, 
                      dbo.data0414.mod_rq, CASE WHEN data0415.type = 3 THEN '退货重检' WHEN data0415.type = 4 THEN '正常重检' END AS type_desc, 
                      CASE WHEN data0414.STATUS = 1 THEN '未提交' WHEN data0414.STATUS = 2 THEN CASE WHEN ep078_audit_flag = 0 THEN '已检视' ELSE '待处理' END WHEN data0414.STATUS
                       = 3 THEN '已完成' WHEN data0414.STATUS = 4 THEN '待审核' WHEN data0414.STATUS = 5 THEN '被退回' END AS v_STATUS
FROM         dbo.data0415 INNER JOIN
                      dbo.Data0050 ON dbo.data0415.custpart_ptr = dbo.Data0050.RKEY INNER JOIN
                      dbo.data0414 ON dbo.data0415.rkey = dbo.data0414.d415_ptr INNER JOIN
                      dbo.Data0005 ON dbo.data0414.empl_ptr = dbo.Data0005.RKEY LEFT OUTER JOIN
                      dbo.data0059 ON dbo.data0415.CUSTOMER_PTR = dbo.data0059.customer_ptr AND dbo.data0415.custpart_ptr = dbo.data0059.cust_part_ptr LEFT OUTER JOIN
                      dbo.Data0010 ON dbo.data0415.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN
                      dbo.Data0098 ON dbo.data0414.rma_ptr = dbo.Data0098.RKEY LEFT OUTER JOIN
                      dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_PTR AND dbo.Data0025.PARENT_PTR = 0 LEFT OUTER JOIN
                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY LEFT OUTER JOIN
                      dbo.Data0195 ON 1 = 1 LEFT OUTER JOIN
                          (SELECT     t1.RKEY, t1.SOURCE_POINTER, t1.PARAMETER_PTR, t1.PARAMETER_VALUE
                            FROM          dbo.Data0047 AS t1 INNER JOIN
                                                   dbo.Data0278 AS t2 ON t1.PARAMETER_PTR = t2.RKEY AND t2.SPEC_RKEY = 'L') AS Data0047_1 ON 
                      dbo.Data0025.RKEY = Data0047_1.SOURCE_POINTER LEFT OUTER JOIN
                          (SELECT     t3.RKEY, t3.SOURCE_POINTER, t3.PARAMETER_PTR, t3.PARAMETER_VALUE
                            FROM          dbo.Data0047 AS t3 INNER JOIN
                                                   dbo.Data0278 AS t4 ON t3.PARAMETER_PTR = t4.RKEY AND t4.SPEC_RKEY = 'D') AS Data0047_2 ON 
                      dbo.Data0025.RKEY = Data0047_2.SOURCE_POINTER

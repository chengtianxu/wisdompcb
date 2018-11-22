exec sp_executesql N'select data0150.*,case when data0150.ps_rej=1 then ''通过'' else case when data0150.ps_rej=0 then ''退回'' else ''暂缓'' end end as ctype,data0005.employee_name
from data0150,data0005 where data0150.empl_ptr=data0005.rkey and data0150.cust_alt_ptr=@P1
 
',N'@P1 int',1098


--退回
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0150" 
("TDATEtime","ttype","PS_REJ","EMPL_PTR","NOTE_INFO","cust_alt_ptr") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 datetime,@P2 int,@P3 tinyint,@P4 int,@P5 varchar(4),@P6 int','2013-06-14 16:31:39',1,2,1,'test',1099
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0054" SET "Tstatus"=@P1,"check_by_ptr"=@P2,"check_date"=@P3 WHERE "RKEY"=@P4 AND "Tstatus"=@P5 AND "check_by_ptr"=@P6 AND "check_date"=@P7',N'@P1 smallint,@P2 int,@P3 datetime,@P4 int,@P5 smallint,@P6 int,@P7 datetime',5,1,'2013-06-14 16:31:39',1099,1,1,'2013-06-14 16:24:12'


exec sp_executesql N'SELECT Data0050.RKEY, Data0050.CUSTOMER_PART_NUMBER,data0054.remark,
      Data0059.CUSTOMER_PART_DESC, Data0050.CP_REV,Data0054.bom_appr_by,Data0054.bom_appr_date,Data0054.BOM_STATUS,
      Data0059.CUSTOMER_PTR,Data0050.sub_flow_Num,
      Data0054.rkey as rkey_1,Data0054.cust_part_ptr,Data0054.flow_no,
      Data0054.Audited_by_ptr,Data0054.Audited_date,data0054.Tstatus,
      Data0054.MODIFIed_by_ptr,Data0054.MODIFIed_date,data0054.audited_by_ptr_2,
      data0054.audited_by_ptr_3,data0054.check_by_ptr,data0054.check_date,
      data0054.audited_date_2,data0054.audited_date_3
FROM Data0059,Data0050 INNER JOIN
      Data0054 ON Data0050.RKEY = Data0054.CUST_PART_PTR
where ((modified_date>=@P1 and modified_date<=@P2) or modified_date is null) and data0059.cust_part_ptr=data0050.rkey
ORDER BY Data0050.CUSTOMER_PART_NUMBER,Data0054.flow_no
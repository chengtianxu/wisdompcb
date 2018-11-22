exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0214" 
("FG_COUNT_CODE","DATE_CREATED","EMPLOYEE_PTR","USER_PTR","WAREHOUSE_PTR","BEG_LOCCODE_PTR","END_LOCCODE_PTR","BEG_CUST_PTR","END_CUST_PTR","BEG_CUSTPART_PTR","END_CUSTPART_PTR","STATUS","Last_code_ptr") VALUES 
(@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(2),@P2 datetime,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int,@P9 int,@P10 int,@P11 int,@P12 
varchar(1),@P13 int','tt',''2013-04-24 16:01:36:000'',3,294,2,8,28,109,146,0,0,'0',0


exec sp_executesql N'select data0053.rkey,data0053.loc_ptr,data0053.cust_part_ptr,data0053.QTY_ON_HAND,Data0416.Type
from data0053 left join
     Data0416 on Data0053.NPAD_Ptr=Data0416.Rkey left join
     data0016 on data0053.loc_ptr=data0016.rkey left join
     data0050 on data0053.cust_part_ptr=data0050.rkey left join
     data0025 on Data0050.RKEY=Data0025.ANCESTOR_PTR
             and Data0025.PARENT_PTR = 0 left join
     data0008 on Data0025.PROD_CODE_PTR = Data0008.RKEY
where data0016.code>=@P1
  and data0016.code<=@P2
  and data0053.whse_ptr=@P3
  and data0053.qty_on_hand>0

and data0008.PROD_CODE>=''D1''--产品类别范围
and data0008.PROD_CODE<=''WBB''
',N'@P1 varchar(10),@P2 varchar(10),@P3 int','ST001','ST017',2--仓库范围和15表厂指针



--查主表
select data0214.*,a.FG_COUNT_CODE as Last_fg_code,
       data0005.empl_code,data0005.employee_name,
       data0015.warehouse_code,data0015.warehouse_name
from   data0214 left join data0005 on data0214.employee_ptr=data0005.rkey
                inner join data0015  on data0214.warehouse_ptr=data0015.rkey
                left join Data0214 a on Data0214.Last_code_ptr=a.rkey
order by
    data0214.fg_count_code
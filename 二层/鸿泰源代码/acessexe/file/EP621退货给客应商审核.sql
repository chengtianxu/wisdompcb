--tstatus =5 未提交  0待审  1 通过  2退回

--exec ep621;1 '2013-05-01','2013-05-31',0,1
--查找待审
declare 
  @vdate1 varchar(12)='2013-05-01', --申请日期
  @vdate2 varchar(12)='2013-05-31',  --申请日期
  @vstatus int=0,  --状态
  @USER_PTR int=1
begin
  declare @isStockDataCtrls bit,
  @HoseList varchar(200)--仓库
  select @HoseList=dbo.sfGetUserWareHouse(@USER_PTR)
  select @isStockDataCtrls = isnull(isStockDataCtrls,0) from Data0192 
  if @isStockDataCtrls<>1 
  begin
    if @vstatus=3
    begin   
       SELECT  Data0096.RKEY,Data0096.REJ_NO, Data0096.INVT_PTR,Data0096.FinceCheck_ptr,data0073.user_full_name, 
            Data0096.REJ_PTR, Data0096.INV_TRAN_PTR, Data0096.EMPL_PTR, 
            Data0096.USER_PTR, Data0096.TDATE /*AS 申请日期*/, 
            Data0096.QUAN_REJD /*AS 申请数量*/, Data0096.FLAG /*AS 拒收退回标记*/, 
            Data0096.REFERENCE_NUMBER /*AS 参考号*/, Data0096.Tstatus /*AS 状态*/, 
            Data0096.Audited_By /*AS 审核人*/, Data0096.Audited_Date /*AS 审核日期*/, 
            Data0096.Req_Quan_REJD /*AS 提交退货数量*/, 
            Data0076.REJECT_DESCRIPTION /*AS 原因*/, 
            Data0017.INV_PART_NUMBER /*AS 材料代码*/, 
            Data0017.INV_NAME /*AS 材料名称*/, Data0017.INV_DESCRIPTION /*AS 材料规格*/, 
            Data0022.RKEY AS DATA0022RKEY, Data0022.QUAN_ON_HAND /*AS 库存量*/, 
            Data0022.QUAN_TO_BE_SHIPPED, Data0022.QUAN_TO_BE_STOCKED,data0456.locationptr,
            Data0022.price*(1+Data0022.tax_2/100) as tax_price,
            Data0022.price*(1+Data0022.tax_2/100)* Data0096.Req_Quan_REJD as tax_Amount, 
            Data0022.QUAN_RETURNED,Data0005.EMPLOYEE_NAME /*审请人名字*/,
            Data0005_1.EMPLOYEE_NAME AS AuditName,data0096.TRAN_TP,Data0496.ttype 
      FROM Data0096 LEFT OUTER JOIN
         Data0005 Data0005_1 ON Data0096.Audited_By = Data0005_1.RKEY LEFT OUTER JOIN
         Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
         Data0017 ON Data0096.INVT_PTR = Data0017.RKEY LEFT OUTER JOIN
         Data0076 ON Data0096.REJ_PTR = Data0076.RKEY LEFT OUTER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY LEFT OUTER JOIN
         Data0496  ON  Data0017.GROUP_PTR = Data0496.RKEY LEFT OUTER JOIN
         data0456 on data0022.GRN_PTR=data0456.rkey left join 
         data0073 on data0096.FinceCheck_ptr=data0073.rkey
      WHERE (Data0096.TDATE >= CONVERT(DATETIME, @vdate1+' 00:00:00', 102)) AND 
          (Data0096.TDATE <= CONVERT(DATETIME, @vdate2+' 23:59:59', 102))
          and ((QUAN_REJD>0) or (Data0096.Req_Quan_REJD>0)) and (data0096.flag=2)
      ORDER BY Data0022.RKEY  
    end
    else
    begin
      SELECT  Data0096.RKEY, Data0096.REJ_NO, Data0096.INVT_PTR,Data0096.FinceCheck_ptr,data0073.user_full_name,  
            Data0096.REJ_PTR, Data0096.INV_TRAN_PTR, Data0096.EMPL_PTR, 
            Data0096.USER_PTR, Data0096.TDATE /*AS 申请日期*/, 
            Data0096.QUAN_REJD /*AS 申请数量*/, Data0096.FLAG /*AS 拒收退回标记*/, 
            Data0096.REFERENCE_NUMBER /*AS 参考号*/, Data0096.Tstatus /*AS 状态*/, 
            Data0096.Audited_By /*AS 审核人*/, Data0096.Audited_Date /*AS 审核日期*/, 
            Data0096.Req_Quan_REJD /*AS 提交退货数量*/, 
            Data0076.REJECT_DESCRIPTION /*AS 原因*/, 
            Data0017.INV_PART_NUMBER /*AS 材料代码*/, 
            Data0017.INV_NAME /*AS 材料名称*/, Data0017.INV_DESCRIPTION /*AS 材料规格*/, 
            Data0022.RKEY AS DATA0022RKEY, Data0022.QUAN_ON_HAND /*AS 库存量*/, 
            Data0022.QUAN_TO_BE_SHIPPED, Data0022.QUAN_TO_BE_STOCKED,data0456.locationptr, 
            Data0022.price*(1+Data0022.tax_2/100) as tax_price,
            Data0022.price*(1+Data0022.tax_2/100)* Data0096.Req_Quan_REJD as tax_Amount,
            Data0022.QUAN_RETURNED,Data0005.EMPLOYEE_NAME /*审请人名字*/,
            Data0005_1.EMPLOYEE_NAME AS AuditName,data0096.TRAN_TP,Data0496.ttype  
      FROM Data0096 LEFT OUTER JOIN
         Data0005 Data0005_1 ON Data0096.Audited_By = Data0005_1.RKEY LEFT OUTER JOIN
         Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
         Data0017 ON Data0096.INVT_PTR = Data0017.RKEY LEFT OUTER JOIN
         Data0076 ON Data0096.REJ_PTR = Data0076.RKEY LEFT OUTER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY LEFT OUTER JOIN
         Data0496  ON  Data0017.GROUP_PTR = Data0496.RKEY LEFT OUTER JOIN
         data0456 on data0022.GRN_PTR=data0456.rkey left join 
         data0073 on data0096.FinceCheck_ptr=data0073.rkey
         
      WHERE (Data0096.TDATE >= CONVERT(DATETIME, @vdate1+' 00:00:00', 102)) AND 
          (Data0096.TDATE <= CONVERT(DATETIME, @vdate2+' 23:59:59', 102))
          and ((QUAN_REJD>0) or (Data0096.Req_Quan_REJD>0)) and (data0096.flag=2) 
          and (Data0096.Tstatus=@vstatus) 
      ORDER BY Data0022.RKEY
    end
  end
  else
  begin
    if @vstatus=3
    begin
       SELECT  Data0096.RKEY, Data0096.REJ_NO, Data0096.INVT_PTR,Data0096.FinceCheck_ptr,data0073.user_full_name, 
            Data0096.REJ_PTR, Data0096.INV_TRAN_PTR, Data0096.EMPL_PTR, 
            Data0096.USER_PTR, Data0096.TDATE /*AS 申请日期*/, 
            Data0096.QUAN_REJD /*AS 申请数量*/, Data0096.FLAG /*AS 拒收退回标记*/, 
            Data0096.REFERENCE_NUMBER /*AS 参考号*/, Data0096.Tstatus /*AS 状态*/, 
            Data0096.Audited_By /*AS 审核人*/, Data0096.Audited_Date /*AS 审核日期*/, 
            Data0096.Req_Quan_REJD /*AS 提交退货数量*/, 
            Data0076.REJECT_DESCRIPTION /*AS 原因*/, 
            Data0017.INV_PART_NUMBER /*AS 材料代码*/, 
            Data0017.INV_NAME /*AS 材料名称*/, Data0017.INV_DESCRIPTION /*AS 材料规格*/, 
            Data0022.RKEY AS DATA0022RKEY, Data0022.QUAN_ON_HAND /*AS 库存量*/, 
            Data0022.QUAN_TO_BE_SHIPPED, Data0022.QUAN_TO_BE_STOCKED,data0456.locationptr,
            Data0022.price*(1+Data0022.tax_2/100) as tax_price,
            Data0022.price*(1+Data0022.tax_2/100)* Data0096.Req_Quan_REJD as tax_Amount,  
            Data0022.QUAN_RETURNED,Data0005.EMPLOYEE_NAME /*审请人名字*/,
            Data0005_1.EMPLOYEE_NAME AS AuditName,data0096.TRAN_TP,Data0496.ttype 
      FROM Data0096 LEFT OUTER JOIN
         Data0005 Data0005_1 ON Data0096.Audited_By = Data0005_1.RKEY LEFT OUTER JOIN
         Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
         Data0017 ON Data0096.INVT_PTR = Data0017.RKEY LEFT OUTER JOIN
         Data0076 ON Data0096.REJ_PTR = Data0076.RKEY LEFT OUTER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY LEFT OUTER JOIN
         Data0496  ON  Data0017.GROUP_PTR = Data0496.RKEY LEFT OUTER JOIN
         data0456 on data0022.GRN_PTR=data0456.rkey  left join 
         data0073 on data0096.FinceCheck_ptr=data0073.rkey

      WHERE (Data0096.TDATE >= CONVERT(DATETIME, @vdate1+' 00:00:00', 102)) AND 
          (Data0096.TDATE <= CONVERT(DATETIME, @vdate2+' 23:59:59', 102))
          and ((QUAN_REJD>0) or (Data0096.Req_Quan_REJD>0)) and (data0096.flag=2)
          and dbo.WareHouseexist(Data0017.RKEY,data0017.GROUP_PTR,data0022.WHOUSE_PTR,@HoseList)>0
      ORDER BY Data0022.RKEY  
    end
    else
    begin
      SELECT  Data0096.RKEY, Data0096.REJ_NO, Data0096.INVT_PTR,Data0096.FinceCheck_ptr,data0073.user_full_name,
            Data0096.REJ_PTR, Data0096.INV_TRAN_PTR, Data0096.EMPL_PTR, 
            Data0096.USER_PTR, Data0096.TDATE /*AS 申请日期*/, 
            Data0096.QUAN_REJD /*AS 申请数量*/, Data0096.FLAG /*AS 拒收退回标记*/, 
            Data0096.REFERENCE_NUMBER /*AS 参考号*/, Data0096.Tstatus /*AS 状态*/, 
            Data0096.Audited_By /*AS 审核人*/, Data0096.Audited_Date /*AS 审核日期*/, 
            Data0096.Req_Quan_REJD /*AS 提交退货数量*/, 
            Data0076.REJECT_DESCRIPTION /*AS 原因*/, 
            Data0017.INV_PART_NUMBER /*AS 材料代码*/, 
            Data0017.INV_NAME /*AS 材料名称*/, Data0017.INV_DESCRIPTION /*AS 材料规格*/, 
            Data0022.RKEY AS DATA0022RKEY, Data0022.QUAN_ON_HAND /*AS 库存量*/, 
            Data0022.QUAN_TO_BE_SHIPPED, Data0022.QUAN_TO_BE_STOCKED,data0456.locationptr,
            Data0022.price*(1+Data0022.tax_2/100) as tax_price,
            Data0022.price*(1+Data0022.tax_2/100)* Data0096.Req_Quan_REJD as tax_Amount,  
            Data0022.QUAN_RETURNED,Data0005.EMPLOYEE_NAME /*审请人名字*/,
            Data0005_1.EMPLOYEE_NAME AS AuditName,data0096.TRAN_TP,Data0496.ttype  
      FROM Data0096 LEFT OUTER JOIN
         Data0005 Data0005_1 ON Data0096.Audited_By = Data0005_1.RKEY LEFT OUTER JOIN
         Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
         Data0017 ON Data0096.INVT_PTR = Data0017.RKEY LEFT OUTER JOIN
         Data0076 ON Data0096.REJ_PTR = Data0076.RKEY LEFT OUTER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY LEFT OUTER JOIN
         Data0496  ON  Data0017.GROUP_PTR = Data0496.RKEY LEFT OUTER JOIN
         data0456 on data0022.GRN_PTR=data0456.rkey left join 
         data0073 on data0096.FinceCheck_ptr=data0073.rkey
      WHERE (Data0096.TDATE >= CONVERT(DATETIME, @vdate1+' 00:00:00', 102)) AND 
          (Data0096.TDATE <= CONVERT(DATETIME, @vdate2+' 23:59:59', 102))
          and ((QUAN_REJD>0) or (Data0096.Req_Quan_REJD>0)) and (data0096.flag=2)
          and (Data0096.Tstatus=@vstatus) 
          and dbo.WareHouseexist(Data0017.RKEY,data0017.GROUP_PTR,data0022.WHOUSE_PTR,@HoseList)>0
      ORDER BY Data0022.RKEY
    end
  end
end




--审核通过

/* 
declare @p2 int
set @p2=0
exec ep621;4 33116,@p2 output
select @p2
*/
CREATE PROCEDURE ep621;4  --财务退货审核判断
@Data0022Rkey int,
@FinceCheckFlag int=0 out 
with encryption
AS
BEGIN
  declare @FinceCheck  int
  select @FinceCheck = isnull(FinceCheck,0) from Data0195
  if @FinceCheck=1 
  begin
     IF  EXISTS (SELECT quan_invoiced FROM DATA0022
       WHERE RKEY=@Data0022Rkey AND isnull(quan_invoiced,0)>0)
     BEGIN
       set @FinceCheckFlag=1
     END
  end
  
END
go

--产生退货单号
--exec ep621;3 100000
--CREATE PROCEDURE ep621;3  
declare  
@location_ptr int =0
--with encryption
--AS  --select * from data0004 set seed_value
begin   --select isnull(isStockDataCtrls,0) from Data0192 update Data0192 set isStockDataCtrls=0
  Declare @sn nvarchar(20),@sn2 nvarchar(20)
  Declare @curdate nvarchar(10)
  Declare @year  nvarchar(2)
  Declare @month nvarchar(2)
  Declare @location_code nvarchar(10)
  Declare @id int
  Declare @i int
  declare @isStockDataCtrls bit
  select @isStockDataCtrls =isnull(isStockDataCtrls,0) from Data0192 
  if @isStockDataCtrls=0 --按4表规则
  begin
    select @sn=seed_value from data0004  where  Table_name='D0096_T' --用在哪个表
    Select @sn2=substring(@sn,patindex(N'%[1234567890]%',@sn),len(@sn)- patindex(N'%[1234567890]%',@sn)+1- patindex(N'%[1234567890]%',reverse(@sn))+1)--取数字部分
    select @sn=substring(@sn,1,charindex(@sn2,@sn)-1)+convert(varchar,(convert(bigint ,@sn2)+1))--取新值
    while exists( select 1 from data0096 where REJ_No=@sn)
    begin
     -- select @sn=seed_value from data0004  where  Table_name='D0096_T'
      Select @sn2=substring(@sn,patindex(N'%[1234567890]%',@sn),len(@sn)- patindex(N'%[1234567890]%',@sn)+1- patindex(N'%[1234567890]%',reverse(@sn))+1)
      select @sn=substring(@sn,1,charindex(@sn2,@sn)-1)+convert(varchar,(convert(bigint ,@sn2)+1))
     -- update data0004 set seed_value=@sn where  Table_name='D0096_T'
    end
    update data0004 set seed_value=@sn where  Table_name='D0096_T'--更新4表
  end
  else--按日期规则
  begin -- select * from data0016 
    --select substring(convert(varchar(10),getdate(),120),6,2)
    select @curdate=convert(varchar(7),getdate(),120)
    if not exists (select 1 from data0016 where rkey=@location_ptr and Cur_date=@curdate)
      update data0016 set Cur_date=@curdate,REJ_NO=0,Scrap_NO=0 where rkey=@location_ptr 
    select @year=substring(@curdate,3,2)
    select @month=substring(@curdate,6,2)
    select @id=isnull(REJ_NO,0)+1,@location_code=code from data0016 where rkey=@location_ptr
    select @sn=ltrim(str(@id))
   -- print len(@id)
    while len(@sn)<4 
      select @sn='0'+@sn
    select @sn='R'+@year+@month+rtrim(ltrim(@location_code))+@sn 
    while EXISTS (select * from data0096 where REJ_NO=@sn)
    begin
      select @id=@id+1
      select @sn=ltrim(str(@id))
      while len(@sn)<4 
      select @sn='0'+@sn
      select @sn='R'+@year+@month+rtrim(ltrim(@location_code))+@sn
    end;
    update data0016 set REJ_NO=@id where rkey=@location_ptr 
  end
  select @sn
  print @sn
end
go

--修改相关记录
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0022" 
SET "quan_to_be_shipped"=@P1,"quan_on_hand"=@P2 
WHERE "quan_to_be_shipped"=@P3 AND "quan_on_hand"=@P4 AND "rkey"=@P5',
N'@P1 numeric(18,6),@P2 numeric(19,6),@P3 numeric(18,6),@P4 numeric(19,6),@P5 int',
35.000000,45.000000,0,80.000000,33116
go
exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0096" 
SET "REJ_NO"=@P1,"Tstatus"=@P2,"Audited_By"=@P3,"Audited_Date"=@P4,"Req_Quan_REJD"=@P5 
WHERE "RKEY"=@P6 AND "REJ_NO" IS NULL AND "Tstatus"=@P7 AND "Audited_By" IS NULL AND "Audited_Date" IS NULL AND "Req_Quan_REJD"=@P8',
N'@P1 varchar(13),@P2 tinyint,@P3 int,@P4 datetime,@P5 float,@P6 int,@P7 tinyint,@P8 float',
'RJ20120200358',1,1,'2013-05-24 22:24:31',0,1708,0,35
go

















--退货单退回
--原进货单情况查询

exec sp_executesql N'SELECT
 data0017.inv_part_number,data0022.BARCODE_ID,
 data0022.quantity,data0022.QUAN_IN_INSP,data0022.quan_stocked,data0016.code as Code16,data0016.location,
 data0022.quan_to_be_shipped,data0022.QUAN_RETURNED,data0022.QUAN_SCRAPPED,
 data0022.tdate,data0022.quan_on_hand,data0022.OccupyQty,data0022.quan_send,data0022.rkey,
 data0002.unit_code,data0022.inventory_ptr,data0017.inv_part_description,Data0022.QUAN_TO_BE_STOCKED,
 data0022.QUAN_IN_INSP1,data0022.quan_to_be_shipped1
from data0022
inner  join    data0017   on  data0022.INVENTORY_PTR = data0017.rkey
Left   join    data0002   on  data0017.stock_unit_ptr = data0002.rkey
left  join    data0016   on  data0022.location_ptr=data0016.rkey
 where --data0022.ttype=2  and
     data0022.rkey =@P1
 
',N'@P1 int',33116

exec sp_executesql N'UPDATE "SJ_V20_Sample".."Data0096" 
SET "REJ_NO"=@P1,"Tstatus"=@P2,"Audited_By"=@P3,"Audited_Date"=@P4 --Tstatus=2退回
WHERE "RKEY"=@P5 AND "REJ_NO" IS NULL AND "Tstatus"=@P6 AND "Audited_By" IS NULL AND "Audited_Date" IS NULL',
N'@P1 varchar(1),@P2 tinyint,@P3 int,@P4 datetime,@P5 int,@P6 tinyint',
'',2,1,'2013-05-24 22:24:31',1707,0
--提示选择删除 
delete from data0096 where rkey=1707 --最直接可以直接删除



--ep176原料盘点建立
--工厂
exec EP176;2 
REATE PROCEDURE EP176;2   --工厂
with encryption
AS
SELECT  a.RKEY, a.WAREHOUSE_CODE ,a.WAREHOUSE_NAME,a.warehouse_type 
FROM  Data0015 a
ORDER BY  a.WAREHOUSE_CODE
GO
--仓库
exec EP176;1 1,0,0,10000

CREATE PROCEDURE EP176;1
@USER_PTR INT = 1,
@whouse_ptr int =0,
@location_ptr1 int =0,
@location_ptr2 int=100000
with encryption
AS
begin
  declare @isStockDataCtrls  bit 
  select @isStockDataCtrls = isStockDataCtrls from Data0192 
  --不需要数据权限控制，全部显示出来
  if @isStockDataCtrls <> 1
  begin
    select a.rkey,a.code,a.location,a.* from data0016 a
    where (a.whouse_ptr=@whouse_ptr or @whouse_ptr=0)
    and (a.rkey>=@location_ptr1 or a.rkey<=@location_ptr2)
    and isnull(a.is_prod_store,0)<>1
  end
  else
  begin
    select distinct a.rkey,a.code,a.location from data0016 a
    inner join Data0810 b on a.rkey =b.Key16 and b.Key73=@USER_PTR
  end
END

--
exec EP176;3 1
--材料类别搜索
CREATE PROCEDURE EP176;3
@USER_PTR INT =1
with encryption
AS
begin
  declare @isStockDataCtrls  bit,
  @HoseList varchar(200)
  select @isStockDataCtrls = isStockDataCtrls from Data0192
  select @HoseList=dbo.sfGetUserWareHouse(@USER_PTR)
  --不需要数据权限控制，全部显示出来
  if @isStockDataCtrls <>1
  begin
    SELECT Data0496.RKEY,Data0496.GROUP_NAME,data0496.if_flag,data0496.mat_Len,
         Data0496.GROUP_DESC,Data0496.ttype,data0496.mask_inv_number,
         Data0019.inv_group_name,Data0019.inv_group_desc,data0496.gl_acct_ptr,data0496.gl_inv_ptr,
         data0496.req_inspect,data0496.WarnDay
    FROM Data0019 INNER JOIN
         Data0496 ON Data0019.rkey=Data0496.group_ptr
    order by data0496.group_name
  end
  else
  begin
    SELECT Data0496.RKEY, Data0496.GROUP_NAME, data0496.if_flag,
    Data0496.GROUP_DESC, Data0496.ttype, data0496.mask_inv_number,
    Data0019.inv_group_name,Data0019.inv_group_desc
    FROM Data0019
    INNER JOIN Data0496 ON Data0019.rkey = Data0496.group_ptr
    where Data0496.RKEY in ( select distinct key496 from data0838 where
          charindex(','+ltrim(rtrim(LOCATION_PTR1))+',',','+ltrim(rtrim(@HoseList))+',')>0 or
          charindex(','+ltrim(rtrim(LOCATION_PTR2))+',',','+ltrim(rtrim(@HoseList))+',')>0 or
          charindex(','+ltrim(rtrim(LOCATION_PTR3))+',',','+ltrim(rtrim(@HoseList))+',')>0 or
          charindex(','+ltrim(rtrim(LOCATION_PTR4))+',',','+ltrim(rtrim(@HoseList))+',')>0 or
          charindex(','+ltrim(rtrim(LOCATION_PTR5))+',',','+ltrim(rtrim(@HoseList))+',')>0 
          )
    order by data0496.group_name
  end
end
GO
--材料项目
SELECT
  Data0017.RKEY ,
  Data0017.INV_PART_NUMBER ,
  Data0017.INV_PART_DESCRIPTION ,isnull(data0017.SHELF_LIFE,0) as SHELF_LIFE ,
  manufacturer_name,data0017.GROUP_PTR,
  data0496.group_name,data0496.group_desc,
  Data0002.unit_Name
FROM Data0017 
inner join data0496 on data0017.group_ptr=data0496.rkey
left join Data0002 on Data0002.rkey=Data0017.STOCK_UNIT_PTR
WHERE Data0017.P_M = 'P' and isnull(Data0017.ALARM_FLAG,0)=0
ORDER BY INV_PART_NUMBER

--过滤库存
exec sp_executesql N'SELECT Data0022.RKEY,Data0022.INVENTORY_PTR,data0022.WHOUSE_PTR,data0022.LOCATION_PTR,data0022.DISCOUNT,data0022.TAX_2,data0022.PRICE,data0022.barcode_id,data0022.SUPPLIER2,data0022.REFERENCE_NUMBER,
case isnull(data0022.Tax_PRICE,0) when 0 then (1+data0022.TAX_2/100)*data0022.PRICE else data0022.Tax_PRICE end as Tax_PRICE,data0022.EXCHANGE_RATE,data0022.CURRENCY_PTR,data0022.SUPPLIER_PTR,data0022.EXPIRE_DATE,data0022.Prod_Date, Data0022.LOCATION_PTR,data0022.QUAN_ON_HAND
FROM dbo.Data0022 
INNER JOIN  dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY 
INNER JOIN  dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY 
INNER JOIN  dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY
WHERE (dbo.Data0022.QUAN_ON_HAND > 0) and
             data0016.code>=@P1 and
             data0016.code<=@P2 and
             data0022.whouse_ptr=@P3 
 
and data0496.group_name>=''1A0A''
and data0496.group_name<=''wfzk3_b''
order by Data0496.GROUP_NAME,Data0017.INV_PART_NUMBER
',N'@P1 nvarchar(10),@P2 nvarchar(10),@P3 int',N'st002',N'ST013',2
--增加盘点表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0092" 
("PHY_COUNT_NO","TDATE","EMPLOYEE_PTR","USER_PTR","WHOUSE_PTR","BEG_LOC_PTR","END_LOC_PTR","BEG_CYCLE_ptr","END_CYCLE_ptr","STATUS","BEG_INVT_PTR","END_INVT_PTR","Last_PHY_RKEY") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 nvarchar(8),@P2 datetime,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 int,@P9 int,@P10 varchar(1),@P11 int,@P12 int,@P13 int',
N'20140124','2014-01-24 13:47:11',1,1,2,2,16,84,167,'0',0,0,0

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0093" 
("PHY_LIST_PTR","INVENTORY_PTR","INV_TRAN_PTR","OLD_QUANTITY","LOCATION_PTR","EXPIRE_DATE","Prod_Date","WHOUSE_PTR","DISCOUNT","TAX_2","PRICE","Tax_PRICE","EXCHANGE_RATE","CURRENCY_PTR","SUPPLIER_PTR","BarCode_ID","SUPPLIER2","RackNo","serno") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int,@P4 numeric(19,4),@P5 int,@P6 datetime,@P7 datetime,@P8 int,@P9 float,@P10 float,@P11 float,@P12 float,@P13 float,@P14 int,@P15 int,@P16 varchar(12),@P17 varchar(10),@P18 nvarchar(30),@P19 int',
684,24,21650,165.0000,2,'2014-07-20 00:00:00','2013-07-20 00:00:00',2,0,17,57.264957264956998,67,1,1,178,'100000021216','          ',N'                              ',1

--

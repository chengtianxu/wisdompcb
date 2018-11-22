EP125直接收货
CREATE PROCEDURE EP125;14
  @dt_begin datetime=null,
  @dt_end  datetime=null, 
  @USER_PTR INT = 1
with encryption
AS
begin
  declare @isStockDataCtrls  bit
  declare @HoseList varchar(200)
  select @HoseList=dbo.sfGetUserWareHouse(@USER_PTR)
  select @isStockDataCtrls = isStockDataCtrls from Data0192 
  if @isStockDataCtrls <> 1 
  begin
    select data0022.quantity,data0022.rkey as rkey22,data0022.barcode_id,data0022.quan_in_insp,data0022.quan_on_hand,
       data0022.quan_to_be_stocked,data0022.price,data0022.grn_ptr,data0022.inventory_ptr,data0022.tdate,data0022.currency_ptr,
       isnull((select inv_part_number from data0017 where data0017.rkey=data0022.inventory_ptr),'') AS Inv_NO,
       isnull((select INV_PART_DESCRIPTION from data0017 where data0017.rkey=data0022.inventory_ptr),'')as INV_desc,
       isnull((select INSPECT from data0017 where data0017.rkey=data0022.inventory_ptr),'N') as CheckYN,
       isnull((select max(data0002.unit_name) from data0002  where data0002.rkey in
         (select data0017.stock_unit_ptr from data0017 where data0017.rkey=data0022.inventory_ptr) ),'') as unit_name,
       data0022.tax_2, data0022.quan_stocked,data0456.grn_number,data0456.rkey
    from data0022
      inner  join  data0456   on   data0456.rkey=data0022.grn_ptr
    where data0022.ttype=3 and data0022.quan_on_hand>0 --旧程序有一个库存大于0
    and Data0022.quan_invoiced=0 
       and isnull(data0022.cost_flag,0)=0 and data0456.status=0 
       and data0022.tdate>=@dt_begin and data0022.Tdate<=@dt_end
     
  end
  else
  begin
   
    select data0022.quantity,data0022.rkey as rkey22,data0022.barcode_id,data0022.quan_in_insp,data0022.quan_on_hand,
       data0022.quan_to_be_stocked,data0022.price,data0022.grn_ptr,data0022.inventory_ptr,data0022.tdate,data0022.currency_ptr,
       isnull((select inv_part_number from data0017 where data0017.rkey=data0022.inventory_ptr),'') AS Inv_NO,
       isnull((select INV_PART_DESCRIPTION from data0017 where data0017.rkey=data0022.inventory_ptr),'')as INV_desc,
       isnull((select INSPECT from data0017 where data0017.rkey=data0022.inventory_ptr),'N') as CheckYN,
       isnull((select max(data0002.unit_name) from data0002  where data0002.rkey in
         (select data0017.stock_unit_ptr from data0017 where data0017.rkey=data0022.inventory_ptr) ),'') as unit_name,
       data0022.tax_2, data0022.quan_stocked,data0456.grn_number,data0456.rkey
    from data0022
      inner  join  data0456   on   data0022.grn_ptr=data0456.rkey
      inner join data0017  on data0022.INVENTORY_PTR=data0017.rkey
      -- inner join Data0810 on  Data0022.LOCATION_PTR = Data0810.Key16 and Data0810.Key73=@USER_PTR
    where data0022.ttype=3 
    and data0022.quan_on_hand>0
     and Data0022.quan_invoiced=0  --旧程序有一个库存大于0
       and isnull(data0022.cost_flag,0)=0 and data0456.status=0 
       and data0022.tdate>=@dt_begin and data0022.Tdate<=@dt_end
       and dbo.WareHouseexist(Data0017.RKEY,data0017.GROUP_PTR,data0022.WHOUSE_PTR,@HoseList)>0
  end
end
go
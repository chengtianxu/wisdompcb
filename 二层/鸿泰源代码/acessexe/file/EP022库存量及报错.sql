EP022库存量及报错
--分配不了可能是数据过期  、?????
订单搜索现有库存
exec ep022;9 'H1E00080',0,1

--CREATE PROCEDURE ep022;9  --显示仓库数量  2006-3-2
declare
        @customer_part_number nvarchar(30),
        @rkey16 int,
        @r INT
   SELECT @customer_part_number='H1E00080',@rkey16=0,@r=1
--with encryption
--AS
  declare @cond varchar(8000)
  declare @jh_price_flag int
  select @jh_price_flag=jh_price_flag from data0195
  set @cond=''
  --20130604 
  set @cond='SELECT isnull(SUM(isnull(Data0053.QTY_ON_HAND,0)-isnull(data0053.qty_alloc,0)),0)  AS sumQTY_ON_HAND  
  FROM Data0053 INNER JOIN
      Data0050 ON Data0053.CUST_PART_PTR = Data0050.RKEY inner join 
      data0016 on data0053.LOC_PTR=data0016.rkey '
  set @cond=@cond+' WHERE (isnull(Data0053.QTY_ON_HAND,0)>0) and (Data0050.customer_part_number ='''+ @customer_part_number+''')'   --20130604 
   +' and ('+cast(@rkey16 as varchar(10))+' =0 or Data0053.loc_ptr='+cast(@rkey16 as varchar(10))+')'
  if (@jh_price_flag=1) and (@r=1)
  set @cond=@cond + ' and data0016.ishub<>1 '
  if (@jh_price_flag=1) and (@r<>1)
  set @cond=@cond + ' and data0016.ishub=1 '
  if @jh_price_flag<>1
  set @cond=@cond
  exec (@cond)

GO

--------------
指派

同一大版本其它小版本库存
SELECT qty_other_total = SUM(Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC)
FROM   Data0053
       INNER JOIN Data0050
            ON  Data0053.cust_part_ptr = Data0050.Rkey
       INNER JOIN Data0016
            ON  Data0053.LOC_PTR = Data0016.Rkey
       LEFT JOIN Data0416
            ON  Data0053.npad_ptr = Data0416.Rkey
WHERE  (Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC) > 0
       AND Data0016.IsHub = 0
       AND data0416.type <> 4
       AND data0050.customer_part_number = 'H1E00080'
       AND SUBSTRING(data0050.cp_rev, 1, 1) = 'A'
       AND data0050.cp_rev <> 'A0'
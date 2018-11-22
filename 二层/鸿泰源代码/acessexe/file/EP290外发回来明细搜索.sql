EP290外发回来明细搜索
exec EP290;3 0,'''0''',N'2013-09-26 00:00:00',N'2013-12-25 23:59:59',2,5

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0908"
 ("RC_NUMBER","SUPP_PTR","TTYPE","CREATE_DATE","CREATE_BY","REF_NUMBER","PRINTED","TDATE","CURRENCY_PTR","whouse_ptr","sys_id","sys_rq")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 varchar(11),@P2 int,@P3 smallint,@P4 datetime,@P5 int,@P6 varchar(2),@P7 varchar(1),@P8 datetime,@P9 int,@P10 int,@P11 varchar(5),@P12 datetime',
  'RC100000008',420,1,'2013-12-25 17:42:35',1,'ss','N','2013-12-25 17:42:35',1,2,'ADMIN','2013-12-25 17:42:35'
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0909" 
("TTYPE","INVENTORY_PTR","RC_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","DISCOUNT","QUAN_TO_BE_STOCKED","TDATE","EXPIRE_DATE","TAX_2","Prod_Date","tax_price","conversion_factor","IF_NSPARE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 float,@P13 numeric(18,6),@P14 datetime,@P15 datetime,@P16 float,@P17 datetime,@P18 float,@P19 float,@P20 nvarchar(1)',
2,5462,7,18496,2,NULL,420,2,1,1,11.650485436893204,0,2.000000,'2013-12-25 17:42:35','2014-12-20 00:00:00',3,'2013-12-25 00:00:00',12,1,N'Y'
go
update data0071 
set quan_recd=isnull(a.quan_recd,0)+isnull(b.quantity,0)/isnull(a.conversion_factor,1) 
from data0071 a,(select data0909.source_ptr,sum(quantity) as quantity from data0909 where data0909.rc_ptr=7 group by data0909.source_ptr) b 
where a.rkey=b.source_ptr

go

--采购明细搜索
exec EP290;3 0,'''0''',N'2010-11-13 00:00:00',N'2014-02-11 23:59:59',2,5

Create PROCEDURE EP290;3 --新版本程序物料收货选择订购材料
    @VPTR2 int,
    @HoseList varchar(200)='0',
    @begindate nvarchar(20)='1900-01-01 00:00:00',
    @enddate nvarchar(20)='2090-01-01 23:59:59',
    @whouse_ptr int =0,
    @status int =0
    with encryption
    AS
begin
      declare @isStockDataCtrls  bit
      declare @LRExchangeRate int
      
      select isnull(Data0192.isStockDataCtrls,0),
          isnull(data0195.LRExchangeRate,0)  from Data0192,data0195 
      select @isStockDataCtrls = isnull(Data0192.isStockDataCtrls,0),
          @LRExchangeRate=isnull(data0195.LRExchangeRate,0)
     from Data0192,data0195 
     if @isStockDataCtrls<>1 
     begin 
          SELECT Data0017.RKEY AS rkey17, Data0017.INV_PART_NUMBER, 
              Data0017.INV_PART_DESCRIPTION, Data0017.INSPECT, Data0017.SHELF_LIFE,data0017.CONF_FLAG, 
              Data0002.UNIT_NAME, Data0070.PO_DATE, Data0070.CURRENCY_PTR,
              case @LRExchangeRate when 0 then Data0070.EXCHANGE_RATE
              else isnull(Data0001.exch_rate,0) end as EXCHANGE_RATE,
              Data0070.SUPPLIER_POINTER,Data0071.rkey,Data0071.INVT_PTR,
              Data0071.QUAN_ORD,Data0071.QUAN_RECD,Data0071.QUAN_RETN,Data0071.PRICE,Data0071.TAX_2,
              Data0071.DISCOUNT,Data0071.REQ_DATE,data0071.CONVERSION_FACTOR,data0071.tax_price,
              data0071.extra_req,data0071.SUPP_PART_NO, 
              Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN AS Quan_to_be_received,
              Data0002_1.UNIT_NAME AS PO_UNIT_NAME, 
              Data0071.QUAN_ORD * Data0071.CONVERSION_FACTOR AS PO_QUAN_ORD,
              RecentRate=isnull(EXCH_RATE,0),
              isnull(Data0071.STATUS,1)  AS LINESTATUS, --added by wang tie min 2011-02-23
              data0017.RackNo,data0070.po_number,data0023.code,data0023.ABBR_NAME,data0023.SUPPLIER_NAME,data0070.po_type,
              'Y' as IF_NSPARE,data0496.ifprod_date
          FROM Data0017 
          inner join Data0071 ON Data0017.RKEY = Data0071.INVT_PTR 
          inner join data0496 on data0017.group_ptr=data0496.rkey
          inner join Data0070 ON Data0071.PO_PTR = Data0070.RKEY 
          inner join Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY
          inner join Data0002 Data0002_1 ON Data0071.PURCHASE_UNIT_PTR = Data0002_1.RKEY
          inner join Data0023 on Data0023.rkey=Data0070.SUPPLIER_POINTER
          left  join Data0001 ON Data0070.CURRENCY_PTR = Data0001.RKEY
          where (DATA0071.PO_ptr=@VPTR2 or @VPTR2=0) and (Data0070.status=@status or @status=0)
          and (Data0070.PO_DATE>=@begindate and Data0070.PO_DATE<=@enddate) 
          and (Data0070.WAREHOUSE_POINTER=@whouse_ptr or @whouse_ptr=0) and isnull(Data0071.STATUS,1)>0
          and data0070.po_type in ('N','T')
          union 
          SELECT Data0017.RKEY AS rkey17, Data0017.INV_PART_NUMBER, 
              Data0017.INV_PART_DESCRIPTION, Data0017.INSPECT, Data0017.SHELF_LIFE,data0017.CONF_FLAG, 
              Data0002.UNIT_NAME, Data0070.PO_DATE, Data0070.CURRENCY_PTR,
              case @LRExchangeRate when 0 then Data0070.EXCHANGE_RATE
              else isnull(Data0001.exch_rate,0) end as EXCHANGE_RATE,
              Data0070.SUPPLIER_POINTER,Data0071.rkey,Data0071.INVT_PTR,
              Data0071.QUAN_ORD,Data0071.QUAN_RECD,Data0071.QUAN_RETN,0 as PRICE,Data0071.TAX_2,
              Data0071.DISCOUNT,Data0071.REQ_DATE,data0071.CONVERSION_FACTOR,0 as tax_price,
              data0071.extra_req,data0071.SUPP_PART_NO, 
             -- Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN AS Quan_to_be_received,
              isnull(Data0071.QUAN_SPARE,0)-isnull(Data0071.QUAN_RECD_SPARE,0)+isnull(Data0071.QUAN_RETN_SPARE,0) AS Quan_to_be_received,
              Data0002_1.UNIT_NAME AS PO_UNIT_NAME, 
              Data0071.QUAN_SPARE * Data0071.CONVERSION_FACTOR AS PO_QUAN_ORD,
              RecentRate=isnull(EXCH_RATE,0),
              isnull(Data0071.STATUS,1)  AS LINESTATUS, --added by wang tie min 2011-02-23
              data0017.RackNo,data0070.po_number,data0023.code,data0023.ABBR_NAME,data0023.SUPPLIER_NAME,data0070.po_type,
              'N' as IF_NSPARE,data0496.ifprod_date
          FROM Data0017 
          inner join Data0071 ON Data0017.RKEY = Data0071.INVT_PTR 
          inner join data0496 on data0017.group_ptr=data0496.rkey
          inner join Data0070 ON Data0071.PO_PTR = Data0070.RKEY 
          inner join Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY
          inner join Data0002 Data0002_1 ON Data0071.PURCHASE_UNIT_PTR = Data0002_1.RKEY
          inner join Data0023 on Data0023.rkey=Data0070.SUPPLIER_POINTER
          left  join Data0001 ON Data0070.CURRENCY_PTR = Data0001.RKEY
          where isnull(Data0071.QUAN_SPARE,0)-isnull(Data0071.QUAN_RECD_SPARE,0)+isnull(Data0071.QUAN_RETN_SPARE,0)>0 
          and (DATA0071.PO_ptr=@VPTR2 or @VPTR2=0) and (Data0070.status=@status or @status=0)
          and (Data0070.PO_DATE>=@begindate and Data0070.PO_DATE<=@enddate) 
          and (Data0070.WAREHOUSE_POINTER=@whouse_ptr or @whouse_ptr=0) and isnull(Data0071.STATUS,1)>0
          and data0070.po_type in ('N','T')
          
     end
     else
     begin
        SELECT Data0017.RKEY AS rkey17, Data0017.INV_PART_NUMBER, 
              Data0017.INV_PART_DESCRIPTION, Data0017.INSPECT, Data0017.SHELF_LIFE,data0017.CONF_FLAG, 
              Data0002.UNIT_NAME, Data0070.PO_DATE, Data0070.CURRENCY_PTR,
              case @LRExchangeRate when 0 then Data0070.EXCHANGE_RATE
              else Data0001.exch_rate end as EXCHANGE_RATE, 
              Data0070.SUPPLIER_POINTER, Data0071.*, 
              Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN AS Quan_to_be_received,
              Data0002_1.UNIT_NAME AS PO_UNIT_NAME, 
              Data0071.QUAN_ORD * Data0071.CONVERSION_FACTOR AS PO_QUAN_ORD,
              RecentRate=isnull(EXCH_RATE,0),
              isnull(Data0071.STATUS,1)  AS LINESTATUS, --added by wang tie min 2011-02-23
              data0017.RackNo,data0070.po_number,data0023.code,data0023.ABBR_NAME,data0023.SUPPLIER_NAME,data0070.po_type
          FROM Data0017 
          inner join Data0071 ON Data0017.RKEY = Data0071.INVT_PTR 
          inner join Data0070 ON Data0071.PO_PTR = Data0070.RKEY 
          inner join Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY
          inner join Data0002 Data0002_1 ON Data0071.PURCHASE_UNIT_PTR = Data0002_1.RKEY
          inner join Data0023 on Data0023.rkey=Data0070.SUPPLIER_POINTER
          left  join Data0001 ON Data0070.CURRENCY_PTR = Data0001.RKEY
          where (DATA0071.PO_ptr=@VPTR2 or @VPTR2=0) and (Data0070.status=@status or @status=0)
          and (Data0070.PO_DATE>=@begindate and Data0070.PO_DATE<=@enddate) 
          and (Data0070.WAREHOUSE_POINTER=@whouse_ptr or @whouse_ptr=0) and isnull(Data0071.STATUS,1)>0
          and data0070.po_type in ('N','T')
          and dbo.WareHouseexist(Data0017.RKEY,data0017.GROUP_PTR,Data0070.WAREHOUSE_POINTER,@HoseList)>0
     end
 end
go

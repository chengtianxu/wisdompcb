--EP6001查看已经有外发对帐单看不到规格
--因为EP017没办法设置具体的规格 在外发时通DATA0071.EXTRA_REQ补充信息来说明
--这样在新增时调用EP0882;1可以调
--但在查看时调用EP0882;2只查17表的DATA0017.INV_DESCRIPTION
--查询对账单
--
SELECT * FROM data0882
Create Procedure Ep0882;2
@Rkey int=0  --对账单Rkey
As
begin
  CREATE TABLE #tmp(
    [Checked] [bit] NULL, --对帐否
	[CheckQnty] [decimal](18, 6) NULL, --对帐数量
	[oldCheckFlag] [bit] NULL, -- 已对帐完成
	[PONo] [varchar](20) NULL,--采购单号
	[GRN_NUMBER] [varchar](20) NULL, --收货单号
	[ABBR_NAME] [varchar](100) NULL, --供应商简称
	[Inv_Part_Number] [varchar](50) NULL,--料号
	[Inv_Part_Description] [varchar](255) NULL,--物料描述
	[INV_NAME] [varchar](255) NULL, --物料名称
	[INV_DESCRIPTION] [varchar](255) NULL, --物料描述
	[Stock_Date] [datetime] NULL, --入库日期
	[QUANTITY] [decimal](18, 4) NULL,--数量
	[Price] [float] NULL, --不含税价
	[Tax] [decimal](4, 2) NULL, --税率
	[Inventory_ptr] [int] NOT NULL,--物料指针
	[grn_ptr] [int] NULL,--收货指针
	[UnitCode] [varchar](20) NULL,--单位代码
	[curr_code] [varchar](5) NULL,--币别代码
	[rate] [float] NULL, --汇率
	[TotalAmount] [float] NULL,--含税金额
	[STATUS] [smallint] NULL,--收货单状态
	[HSPrice] [float] NULL, --含税价格
	[HSPrice_bk] [float] NULL, --含税价格
	[QUAN_RETURNED] [decimal](18, 6) NULL,--退货数量
	[RKEY] [int] NULL,--收货指针
	[APCheckQnty] [decimal](18, 6) NULL, --已对帐数量
	[type] [int] NULL,
	[ref_number] varchar(200) null,--收货参考号
	[CUSTOMER_NAME] varchar(100) null,--供应商名称
	[NoTotalAmount] [float] NULL --不含税金额
  )

  /********************************************采购订单入库***********************************************/
  insert into #tmp
  select Checked=1,CheckQnty=data0883.qnty,IsNull(Data0022.APCheckFlag,0) oldCheckFlag,a.PONo,
    Data0456.GRN_NUMBER,DATA0023.ABBR_NAME,Data0017.Inv_Part_Number,Data0017.Inv_Part_Description,Data0017.INV_NAME,
    Data0017.INV_DESCRIPTION,Stock_Date=Case When data0882.datetype=0 then Data0022.TDATE Else Data0022.Stock_Date End,
    QUANTITY=data0883.actty,data0883.Price,data0883.Tax,
    data0022.Inventory_ptr,data0022.grn_ptr,a.UnitCode,Data0001.curr_code,data0022.exchange_rate rate,
    TotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),4),
    data0456.STATUS,HSPrice=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),HSPrice_bk=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),
    QUAN_RETURNED=-1*isnull(data0022.QUAN_RETURNED,0),data0022.RKEY,
    APCheckQnty=ISNULL(data0022.APCheckQnty,0)-isnull(data0883.qnty,0),type=1,data0456.ref_number,data0023.supplier_name,
    NoTotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*data0883.Price,4)
  from data0022
  inner Join data0456 on data0022.GRN_PTR=data0456.RKey
  inner Join Data0023 on data0456.Supp_ptr=Data0023.RKey
  inner Join Data0017 on Data0022.INVENTORY_PTR=data0017.RKey
  inner join data0883 on data0022.rkey=data0883.rkey_ptr
  inner join data0882 on data0883.Rkey882=data0882.rkey
  Left Join viewRecAPCheck a on a.KeyID=Data0456.PO_PTR and Data0022.SOURCE_PTR=a.KeyDet
  Left Join data0001 on data0001.RKey=Data0022.Currency_ptr
  Where Data0022.TType=2 and data0883.[type]=1 and data0882.rkey=@Rkey
 -- Data0866

  insert into #tmp
  select Checked=1,CheckQnty=data0883.qnty,
    IsNull(Data0866.APCheckFlag,0) oldCheckFlag,a.PONo,Data0456.GRN_NUMBER,DATA0023.ABBR_NAME,
    Data0017.Inv_Part_Number,Data0017.Inv_Part_Description,Data0017.INV_NAME,Data0017.INV_DESCRIPTION,
    Stock_Date=Data0866.tran_date,QUANTITY=data0883.actty,data0883.Price,
    data0883.Tax,data0022.Inventory_ptr,data0022.grn_ptr,a.UnitCode,
    Data0001.curr_code,data0022.exchange_rate rate,
    TotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),4),
    data0456.STATUS,HSPrice=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),HSPrice_bk=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),
    QUAN_RETURNED=-1*data0022.QUAN_RETURNED,Data0866.RKEY,
    APCheckQnty=ISNULL(Data0866.APCheckQnty,0)-isnull(data0883.qnty,0),type=2,data0456.ref_number,data0023.supplier_name,
    NoTotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*data0883.Price,4)
    from data0022
    inner Join Data0866 on data0022.RKEY=Data0866.D0022_Ptr
    inner Join data0456 on data0022.GRN_PTR=data0456.RKey
    inner Join Data0023 on data0456.Supp_ptr=Data0023.RKey
    inner Join Data0017 on Data0022.INVENTORY_PTR=data0017.RKey
    inner join data0883 on Data0866.rkey=data0883.rkey_ptr
    inner join data0882 on data0883.Rkey882=data0882.rkey
    Left Join viewRecAPCheck a on a.KeyID=Data0456.PO_PTR and Data0022.SOURCE_PTR=a.KeyDet
    Left Join data0001 on data0001.RKey=Data0022.Currency_ptr
    Where Data0022.TType=2 and data0883.[type]=2 and data0882.rkey=@Rkey


  /********************************************采购订单退货***********************************************/

  insert into #tmp
  select Checked=1,CheckQnty=data0883.qnty,
  IsNull(Data0096.APCheckFlag,0) oldCheckFlag,a.PONo,GRN_NUMBER='退货扣款',DATA0023.ABBR_NAME,
  Data0017.Inv_Part_Number,Data0017.Inv_Part_Description,Data0017.INV_NAME,Data0017.INV_DESCRIPTION,
  Stock_Date=Data0096.Audited_Date,QUANTITY=data0883.actty,
  data0883.Price,data0883.Tax,data0022.Inventory_ptr,data0022.grn_ptr,a.UnitCode,
  Data0001.curr_code,data0022.exchange_rate rate,
  TotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),4),
  data0456.STATUS,HSPrice=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),HSPrice_bk=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),
  QUAN_RETURNED=0,Data0096.RKEY,
  APCheckQnty=ISNULL(Data0096.APCheckQnty,0)-isnull(data0883.qnty,0),type=5,data0456.ref_number,data0023.supplier_name,
  NoTotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*data0883.Price,4)
  from data0022
  inner Join Data0096 on data0022.RKEY=Data0096.INV_TRAN_PTR 
  inner Join data0456 on data0022.GRN_PTR=data0456.RKey
  inner Join Data0023 on data0456.Supp_ptr=Data0023.RKey
  inner Join Data0017 on Data0022.INVENTORY_PTR=data0017.RKey
  inner join data0883 on Data0096.rkey=data0883.rkey_ptr
  inner join data0882 on data0883.Rkey882=data0882.rkey
  Left Join viewRecAPCheck a on a.KeyID=Data0456.PO_PTR and Data0022.SOURCE_PTR=a.KeyDet
  Left Join data0001 on data0001.RKey=Data0022.Currency_ptr
  Where Data0022.TType=2 and data0096.flag=2 and Data0096.TRAN_TP in (20,38) and Data0096.tstatus in(1,3)
  and data0883.[type]=5 and data0882.rkey=@Rkey

 /********************************************采购订单非标收货**********************************************/
  
  insert into #tmp
  select Checked=1,CheckQnty=data0883.qnty,
  IsNull(Data0235.APCheckFlag,0) oldCheckFlag,a.PONo,Data0456.GRN_NUMBER,DATA0023.ABBR_NAME,
  a.PartNo as Inv_Part_Number,a.Part_Desc as Inv_Part_Description, a.INV_NAME, a.INV_DESCRIPTION,
  Data0235.DATE_RECD as Stock_Date,QUANTITY=data0883.actty,
  price=Round(data0883.Price,6),data0883.Tax,
  '' Inventory_ptr,data0235.grn_ptr,a.UnitCode,Data0001.curr_code,a.exchange_rate rate,
 TotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),4)
 ,data0456.STATUS,HSPrice=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),HSPrice_bk=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),
  QUAN_RETURNED=-1*data0235.quan_returned,data0235.RKEY,
  APCheckQnty=ISNULL(data0235.APCheckQnty,0)-isnull(data0883.qnty,0),
  type=3,data0456.ref_number,data0023.supplier_name,
  NoTotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*data0883.Price,4)
  from data0235
  inner Join data0456 on data0235.GRN_PTR=data0456.RKey
  inner Join Data0023 on data0456.Supp_ptr=Data0023.RKey
  inner join data0883 on data0235.rkey=data0883.rkey_ptr
  inner join data0882 on data0883.Rkey882=data0882.rkey
  Left Join viewRecAPCheck a on a.KeyID=Data0456.PO_PTR and Data0235.d0072_ptr=a.KeyDet
  Left Join data0001 on data0001.RKey=a.Currency_ptr
  Where data0883.[type]=3 and data0882.rkey=@Rkey and data0883.qnty>0
/********************************************采购订单非标退货*************************************/
  
  insert into #tmp    
  select Checked=1,CheckQnty=data0883.qnty,0,data0070.po_number,GRN_NUMBER='退货扣款',DATA0023.ABBR_NAME,'','' Inv_Part_Number,data0072.description  as INV_DESCRIPTION,    
  data0072.gui_ge as INV_DESCRIPTION,data0621.tdate as Stock_Date,QUANTITY=data0883.actty,
  price=Round(data0883.Price,6),data0883.Tax,
'' Inventory_ptr, data0235.grn_ptr,data0002.unit_code as UnitCode,Data0001.curr_code,data0070.exchange_rate as rate,
  TotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),4),    
  0,HSPrice=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),HSPrice_bk=Round(data0883.Price*(1+data0883.Tax*1.000000/100),4),0,'',0,type=3,'',data0023.supplier_name,
  NoTotalAmount=Round(Convert(Decimal(18,4),(isnull(data0883.qnty,0)))*data0883.Price,4)
  FROM Data0072 
  RIGHT OUTER JOIN Data0235 ON Data0072.RKEY = Data0235.D0072_PTR     
  RIGHT OUTER JOIN Data0621 on Data0235.RKEY = Data0621.INV_TRAN_PTR    
  left join data0070 on data0072.poptr=data0070.rkey    
  left join data0023 on data0023.rkey=data0070.SUPPLIER_POINTER  
  inner join data0883 on data0235.rkey=data0883.rkey_ptr
  inner join data0882 on data0883.Rkey882=data0882.rkey  
  left join data0001 on data0070.CURRENCY_PTR=data0001.rkey    
  left join data0002 on data0002.rkey=data0072.UNIT_PTR    
  Where data0883.[type]=3 and data0882.rkey=@Rkey and data0883.qnty<0  

/********************************************预付帐款,贷项备忘*****************************/
  
  insert into #tmp
  select Checked=1,0,
  IsNull(Data0132.APCheckFlag,0) oldCheckFlag,
   MEMO_NUMBER PONO,
   Case Memo_TP
    When 4 then '预付帐款'
    else '其他扣款' END GRN_NUMBER,DATA0023.ABBR_NAME,'' Inv_Part_Number,'',
    '',DATA0132.REF_NUMBER,
  data0132.ENT_DATE as Stock_Date,0 as QUANTITY,Round(data0132.amount,6),
  0 Tax,'' Inventory_ptr,'0' grn_ptr,'' UnitCode,data0001.curr_code,data0132.Ex_Rate rate,
  TotalAmount=-1*Round(data0132.amount,4),0,HSPrice=Round(data0132.amount,4),HSPrice_bk=Round(data0132.amount,4),0,data0132.RKEY,0,type=4,'',data0023.supplier_name,
  NoTotalAmount=-1*Round(data0132.amount,4)
  from data0132
  left join data0023 on data0132.SUPP_PTR=DATA0023.RKEY
  inner join data0883 on data0132.rkey=data0883.rkey_ptr
  inner join data0882 on data0883.Rkey882=data0882.rkey 
  Left join data0001 on data0132.Currency_ptr=data0001.RKey
  Where data0883.[type]=4 and data0882.rkey=@Rkey  
  
  select * from #tmp order by Stock_Date
  DROP TABLE #tmp
end
Go


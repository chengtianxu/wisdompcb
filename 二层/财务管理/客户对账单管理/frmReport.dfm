object Form_Report: TForm_Report
  Left = 370
  Top = 139
  Width = 441
  Height = 342
  Caption = 'Form_Report'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 33
    Top = 89
    object Aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object Aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object Aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object Aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object Aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object Aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object Aqwz236: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 200
      end>
    SQL.Strings = (
      'Select data0236.*,data0010.cust_code,'
      'data0010.customer_name,data0010.abbr_name,'
      'data0001.curr_code,data0001.curr_name,'
      
        'd05_1.employee_name as ent_name,d05_2.employee_name as audit_nam' +
        'e'
      'from data0236'
      'inner join data0010 on data0236.CUSTOMER_PTR=data0010.rkey'
      'inner join data0001 on data0236.CURRENCY_PTR=data0001.rkey'
      
        'left join data0005 d05_1 on data0236.ENTERED_BY_EMPL_PTR=d05_1.r' +
        'key'
      
        'left join data0005 d05_2 on data0236.AUDITED_BY_EMPL_PTR=d05_2.r' +
        'key'
      ' where data0236.rkey=:rkey')
    Left = 33
    Top = 34
    object Aqwz236RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz236VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object Aqwz236ENTERED_BY_EMPL_PTR: TIntegerField
      FieldName = 'ENTERED_BY_EMPL_PTR'
    end
    object Aqwz236AUDITED_BY_EMPL_PTR: TIntegerField
      FieldName = 'AUDITED_BY_EMPL_PTR'
    end
    object Aqwz236ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object Aqwz236CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object Aqwz236CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Aqwz236STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object Aqwz236EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object Aqwz236BATCH_NUMBER: TStringField
      FieldName = 'BATCH_NUMBER'
      Size = 16
    end
    object Aqwz236FYEAR: TIntegerField
      FieldName = 'FYEAR'
    end
    object Aqwz236PERIOD: TSmallintField
      FieldName = 'PERIOD'
    end
    object Aqwz236TOOL_AMOUNT: TBCDField
      FieldName = 'TOOL_AMOUNT'
      Precision = 19
    end
    object Aqwz236OTHERS_AMOUNT: TBCDField
      FieldName = 'OTHERS_AMOUNT'
      Precision = 19
    end
    object Aqwz236SHIP_AMOUNT: TBCDField
      FieldName = 'SHIP_AMOUNT'
      Precision = 19
    end
    object Aqwz236TAX_AMOUNT: TBCDField
      FieldName = 'TAX_AMOUNT'
      Precision = 19
    end
    object Aqwz236RECEIVABLE_AMOUNT: TBCDField
      FieldName = 'RECEIVABLE_AMOUNT'
      Precision = 19
    end
    object Aqwz236cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object Aqwz236customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object Aqwz236abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object Aqwz236curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object Aqwz236curr_name: TStringField
      FieldName = 'curr_name'
    end
    object Aqwz236ent_name: TStringField
      FieldName = 'ent_name'
      Size = 16
    end
    object Aqwz236audit_name: TStringField
      FieldName = 'audit_name'
      Size = 16
    end
  end
  object Aqwz237: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0237.*,case when data0237.so_shp_ptr>0 then data0439.' +
        'delivery_no when data0237. rma_ptr>0  then data0098.rma_number'
      ' else '#39#39' end as delivery_no,'
      
        'case when data0237.so_shp_ptr>0 then data0439.date_sailing when ' +
        'data0237.rma_ptr>0 then CONVERT(VARCHAR(10),data0098.rma_date,12' +
        '0)'
      'when data0237.invoice_ptr>0 then data0112.invoice_date'
      'else data0116.rma_date end as date_sailing,'
      'case when data0237.so_shp_ptr>0 then D60_1.SALES_ORDER'
      'when data0237.rma_ptr>0 then D60_2.SALES_ORDER '
      
        'when data0237.invoice_ptr>0 then D60_3.SALES_ORDER else '#39#39' end a' +
        's '#38144#21806#35746#21333','
      'case when data0237.so_shp_ptr>0 then D25_1.MANU_PART_NUMBER'
      'when data0237.rma_ptr>0 then D25_2.MANU_PART_NUMBER'
      'when data0237.invoice_ptr>0 then D25_3.MANU_PART_NUMBER  '
      'else '#39#39' end as '#26412#21378#32534#21495','
      'case when data0237.so_shp_ptr>0 then D25_1.MANU_PART_DESC'
      'when data0237.rma_ptr>0 then D25_2.MANU_PART_DESC '
      'when data0237.invoice_ptr>0 then D25_3.MANU_PART_DESC'
      'else '#39#39' end as '#23458#25143#22411#21495','
      'case when data0237.so_shp_ptr>0 then D97_1.PO_NUMBER'
      'when data0237.rma_ptr>0 then D97_2.PO_NUMBER'
      'when data0237.invoice_ptr>0 then D97_3.PO_NUMBER  '
      'else '#39#39' end as '#23458#25143#35746#21333#21495','
      'case when data0237.so_shp_ptr>0 then D15_1.abbr_name'
      'when data0237.rma_ptr>0 then D15_2.abbr_name'
      'when data0237.invoice_ptr>0 then D15_3.abbr_name '
      'else D15_4.abbr_name end as '#24037#21378#21517#31216','
      'case when data0237.so_shp_ptr>0 then D60_1.PART_PRICE'
      'when data0237.rma_ptr>0 then D60_2.PART_PRICE'
      'else 0 end as '#38144#21806#20215#26684','
      'case when data0237.so_shp_ptr>0 then D60_1.RUSH_CHARGE'
      'when data0237.rma_ptr>0 then D60_2.RUSH_CHARGE'
      'when data0237.invoice_ptr>0 then D60_3.RUSH_CHARGE     '
      'else 0 end as '#22686#20540#31246#29575','
      'case when data0237.invoice_ptr>0 then Data0112.invoice_number'
      'when data0237.DEBIT_PTR>0 then data0116.MEMO_NUMBER'
      'else '#39#39' end as '#20837#24080#32534#21495','
      
        'case WHEN data0112.INVOICE_TYPE=2 THEN data0112.TOOLING_CHARGES ' +
        ' '
      'else 0 end as '#24037#20855#36153#29992','
      'case WHEN data0112.INVOICE_TYPE=2 THEN 0'
      'WHEN data0112.INVOICE_TYPE=3 then data0112.ship_amount'
      
        'when data0237.DEBIT_PTR>0 then (data0116.GOODS_AMT+data0116.SHIP' +
        'PING+data0116.TOOLING_CHARGE )'
      'else 0 end as '#26434#39033#36153#29992','
      'case when data0237.invoice_ptr>0 then Data0112.FED_TAX_AMOUNT'
      'when data0237.debit_ptr>0 then data0116.FED_TAX'
      'else 0 end as '#22686#20540#31246#37329','
      'case when data0237.invoice_ptr>0 then Data0112.ship_amount'
      
        'when data0237.debit_ptr>0 then (data0116.GOODS_AMT+data0116.SHIP' +
        'PING+data0116.TOOLING_CHARGE)'
      'else 0 end as '#20215#27454','
      'case when data0237.invoice_ptr>0 then Data0112.INVOICE_TOTAL'
      'when data0237.debit_ptr>0 then data0116.AMOUNT'
      'else 0 end as '#21457#31080#24635#37329#39069','
      
        'case when data0237.so_shp_ptr>0 then (data0237.quantity*d60_1.pa' +
        'rts_alloc)'
      
        'when data0237.rma_ptr>0 then ( -data0237.quantity*d60_2.parts_al' +
        'loc)'
      'when data0237.invoice_ptr>0 then data0237.recon_amount'
      
        'when (data0237.debit_ptr>0) and (data0116.MEMO_TP=1) then data02' +
        '37.recon_amount'
      'else (-data0237.recon_amount) end as '#23545#24080#37329#39069','
      'case when data0237.so_shp_ptr>0 then '#39#25351#27966#39
      'when data0237.rma_ptr>0 then '#39#36864#36135#39
      'when data0112.INVOICE_TYPE=1 THEN '#39#26631#20934#21457#31080#39
      'WHEN data0112.INVOICE_TYPE=2 THEN '#39#24037#20855#21457#31080#39' '
      'WHEN data0112.INVOICE_TYPE=3 THEN '#39#26434#39033#21457#31080#39
      'when data0116.MEMO_TP=1 THEN '#39#39044#25910#22791#24536#39
      'WHEN data0116.MEMO_TP=4 THEN '#39#36864#36135#22791#24536#39' '
      'WHEN data0116.MEMO_TP=3 THEN '#39#26080#36864#36135#39' END AS '#31867#22411
      'from data0237 '
      'left join data0064 on data0237.so_shp_ptr=data0064.rkey'
      'left join data0098 on data0237.rma_ptr=data0098.rkey    '
      'left join data0112 on data0237.invoice_ptr=data0112.rkey'
      'left join data0116 on data0237.debit_ptr=data0116.rkey'
      'left join data0060 d60_1 on data0064.SO_PTR=d60_1.rkey'
      'left join data0060 d60_2 on data0098.SO_PTR=d60_2.rkey'
      'left join data0060 d60_3 on data0112.sales_order_ptr=d60_3.rkey'
      'left join data0025 d25_1 on d60_1.CUST_PART_PTR=d25_1.rkey'
      
        'left join data0025 d25_2 on data0098.CUSTOMER_PART_PTR=d25_2.rke' +
        'y'
      'left join data0025 d25_3 on d60_3.CUST_PART_PTR=d25_3.rkey'
      'left join data0097 d97_1 on d60_1.PURCHASE_ORDER_PTR=d97_1.rkey'
      'left join data0097 d97_2 on d60_2.PURCHASE_ORDER_PTR=d97_2.rkey'
      'left join data0097 d97_3 on d60_3.PURCHASE_ORDER_PTR=d97_3.rkey'
      'left join data0439 on data0064.packing_list_ptr=data0439.rkey'
      'left join data0015 d15_1 on data0439.warehouse_ptr=d15_1.rkey'
      'left join data0015 d15_2 on d60_2.SHIP_REG_TAX_ID =d15_2.rkey'
      'left join data0015 d15_3 on data0112.warehouse_ptr=d15_3.rkey'
      'left join data0015 d15_4 on data0116.warehouse_ptr=d15_4.rkey'
      'where data0237.rkey236_ptr=:rkey')
    Left = 33
    Top = 61
    object Aqwz237rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz237rkey236_ptr: TIntegerField
      FieldName = 'rkey236_ptr'
    end
    object Aqwz237SO_SHP_PTR: TIntegerField
      FieldName = 'SO_SHP_PTR'
    end
    object Aqwz237RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object Aqwz237QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object Aqwz237DEBIT_PTR: TIntegerField
      FieldName = 'DEBIT_PTR'
    end
    object Aqwz237recon_amount: TBCDField
      FieldName = 'recon_amount'
      Precision = 19
    end
    object Aqwz237INVOICE_PTR: TIntegerField
      FieldName = 'INVOICE_PTR'
    end
    object Aqwz237delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object Aqwz237date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object Aqwz237DSDesigner: TStringField
      FieldName = #38144#21806#35746#21333
      ReadOnly = True
      Size = 12
    end
    object Aqwz237DSDesigner2: TStringField
      FieldName = #26412#21378#32534#21495
      ReadOnly = True
    end
    object Aqwz237DSDesigner3: TStringField
      FieldName = #23458#25143#22411#21495
      ReadOnly = True
      Size = 80
    end
    object Aqwz237DSDesigner4: TStringField
      FieldName = #23458#25143#35746#21333#21495
      ReadOnly = True
      Size = 25
    end
    object Aqwz237DSDesigner5: TStringField
      FieldName = #24037#21378#21517#31216
      ReadOnly = True
      Size = 10
    end
    object Aqwz237DSDesigner6: TFloatField
      FieldName = #38144#21806#20215#26684
      ReadOnly = True
    end
    object Aqwz237DSDesigner7: TBCDField
      FieldName = #22686#20540#31246#29575
      ReadOnly = True
      Precision = 5
      Size = 2
    end
    object Aqwz237DSDesigner8: TStringField
      FieldName = #20837#24080#32534#21495
      ReadOnly = True
      Size = 12
    end
    object Aqwz237DSDesigner9: TBCDField
      FieldName = #24037#20855#36153#29992
      ReadOnly = True
      Precision = 19
    end
    object Aqwz237DSDesigner10: TBCDField
      FieldName = #22686#20540#31246#37329
      ReadOnly = True
      Precision = 19
    end
    object Aqwz237DSDesigner11: TBCDField
      FieldName = #20215#27454
      ReadOnly = True
      Precision = 19
    end
    object Aqwz237DSDesigner12: TBCDField
      FieldName = #21457#31080#24635#37329#39069
      ReadOnly = True
      Precision = 19
    end
    object Aqwz237DSDesigner13: TFloatField
      FieldName = #23545#24080#37329#39069
      ReadOnly = True
    end
    object Aqwz237DSDesigner14: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object Aqwz237DSDesigner15: TBCDField
      FieldName = #26434#39033#36153#29992
      ReadOnly = True
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = Aqwz236
    Left = 62
    Top = 34
  end
  object DataSource2: TDataSource
    DataSet = Aqwz237
    Left = 62
    Top = 62
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 62
    Top = 90
  end
  object DB236: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB236'
    Left = 96
    Top = 32
    object DB236ppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB236ppField2: TppField
      FieldAlias = 'VOUCHER'
      FieldName = 'VOUCHER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB236ppField3: TppField
      FieldAlias = 'ENTERED_BY_EMPL_PTR'
      FieldName = 'ENTERED_BY_EMPL_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB236ppField4: TppField
      FieldAlias = 'AUDITED_BY_EMPL_PTR'
      FieldName = 'AUDITED_BY_EMPL_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB236ppField5: TppField
      FieldAlias = 'ENTERED_DT'
      FieldName = 'ENTERED_DT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB236ppField6: TppField
      FieldAlias = 'CUSTOMER_PTR'
      FieldName = 'CUSTOMER_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB236ppField7: TppField
      FieldAlias = 'CURRENCY_PTR'
      FieldName = 'CURRENCY_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB236ppField8: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB236ppField9: TppField
      FieldAlias = 'EXCHANGE_RATE'
      FieldName = 'EXCHANGE_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB236ppField10: TppField
      FieldAlias = 'BATCH_NUMBER'
      FieldName = 'BATCH_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB236ppField11: TppField
      FieldAlias = 'FYEAR'
      FieldName = 'FYEAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB236ppField12: TppField
      FieldAlias = 'PERIOD'
      FieldName = 'PERIOD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB236ppField13: TppField
      FieldAlias = 'TOOL_AMOUNT'
      FieldName = 'TOOL_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB236ppField14: TppField
      FieldAlias = 'OTHERS_AMOUNT'
      FieldName = 'OTHERS_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB236ppField15: TppField
      FieldAlias = 'SHIP_AMOUNT'
      FieldName = 'SHIP_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DB236ppField16: TppField
      FieldAlias = 'TAX_AMOUNT'
      FieldName = 'TAX_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DB236ppField17: TppField
      FieldAlias = 'RECEIVABLE_AMOUNT'
      FieldName = 'RECEIVABLE_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DB236ppField18: TppField
      FieldAlias = 'cust_code'
      FieldName = 'cust_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DB236ppField19: TppField
      FieldAlias = 'customer_name'
      FieldName = 'customer_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object DB236ppField20: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object DB236ppField21: TppField
      FieldAlias = 'curr_code'
      FieldName = 'curr_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object DB236ppField22: TppField
      FieldAlias = 'curr_name'
      FieldName = 'curr_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object DB236ppField23: TppField
      FieldAlias = 'ent_name'
      FieldName = 'ent_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object DB236ppField24: TppField
      FieldAlias = 'audit_name'
      FieldName = 'audit_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object DB493: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB493'
    Left = 96
    Top = 96
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 252
    Top = 48
  end
  object DB237: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB237'
    Left = 96
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB237
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #26631#20934#37319#36141#35746#21333
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\std_purchorder.rtm'
    Units = utMillimeters
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 213
    Top = 44
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'DB237'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 84402
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 7267
        mmLeft = 50536
        mmTop = 3704
        mmWidth = 45438
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 20373
        mmLeft = 10319
        mmTop = 2381
        mmWidth = 29898
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #33268#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2910
        mmTop = 52652
        mmWidth = 7056
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #32852#32476#20154'(ATTN):'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 70644
        mmWidth = 23019
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'supplier_name'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 12435
        mmTop = 52652
        mmWidth = 22931
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'SUPPIER_CONTACT'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 26988
        mmTop = 70379
        mmWidth = 26458
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #30005#35805'(TEL):'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 61648
        mmWidth = 17727
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20256#30495'(FAX):'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 65881
        mmWidth = 17727
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'phone'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 22225
        mmTop = 61648
        mmWidth = 62177
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'PUCHASE ORDER'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6350
        mmLeft = 76994
        mmTop = 42069
        mmWidth = 37571
        BandType = 1
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'address_line_1'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 61648
        mmTop = 19050
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = #37319'     '#36141'    '#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8043
        mmLeft = 69056
        mmTop = 33338
        mmWidth = 53763
        BandType = 1
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'phone'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 61648
        mmTop = 24077
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = #30005#35805':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50536
        mmTop = 24077
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = #20256#30495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 94192
        mmTop = 24077
        mmWidth = 7938
        BandType = 1
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'fax'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 103452
        mmTop = 24077
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = #26085#26399'(DATE)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 58208
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = #20132#36135#22320#28857'(DELIVERY TO)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 67204
        mmWidth = 40481
        BandType = 1
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = #35746#21333#21495'(P.O.NO)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 53181
        mmWidth = 28310
        BandType = 1
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = #36135#24065'(CURRENCY)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 62706
        mmWidth = 28310
        BandType = 1
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = #20184#27454#26041#24335'(PAYMENT)'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 72496
        mmWidth = 33602
        BandType = 1
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'PO_NUMBER'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 52917
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'po_date'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 57679
        mmWidth = 12435
        BandType = 1
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'SHIPTO_ADDRESS'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 67469
        mmWidth = 52388
        BandType = 1
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        DataField = 'curr_name'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 62442
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_5'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 72761
        mmWidth = 35454
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #22320#22336':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50536
        mmTop = 19050
        mmWidth = 7938
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 0
        mmTop = 29898
        mmWidth = 197300
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'TO'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 57150
        mmWidth = 7144
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'supplier_name'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 12435
        mmTop = 57150
        mmWidth = 22931
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 52123
        mmWidth = 10583
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 56356
        mmWidth = 10583
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 21960
        mmTop = 65352
        mmWidth = 37042
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'REF#PUR'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 77523
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'FOB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 77788
        mmWidth = 22225
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'WUZHOU CIRCUIT(HOLDINGS) CO.,LTD.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 50536
        mmTop = 11642
        mmWidth = 82021
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = #24320#31080#26041#24335':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 98161
        mmTop = 77788
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'ANALYSIS_CODE_4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 130969
        mmTop = 77523
        mmWidth = 41540
        BandType = 1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Visible = False
        mmHeight = 13229
        mmLeft = 150284
        mmTop = 3175
        mmWidth = 13229
        BandType = 1
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Visible = False
        mmHeight = 13229
        mmLeft = 150019
        mmTop = 19315
        mmWidth = 13229
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 11906
        mmLeft = 2117
        mmTop = 0
        mmWidth = 190236
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 5000
        mmLeft = 44450
        mmTop = 821
        mmWidth = 0
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 17198
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 103717
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 124090
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 87313
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = #39033#30446
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 7938
        mmTop = 1852
        mmWidth = 7056
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = #22411#21495'/'#35268#26684
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 35719
        mmTop = 1852
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = #20132#36135#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 106892
        mmTop = 1852
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = #25968#37327
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 1852
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = #21333#20215
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 1852
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'ITEM'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 7938
        mmTop = 6085
        mmWidth = 7056
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'DESCRIPTION'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 34660
        mmTop = 6085
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'QUANTITY'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 6085
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'DEL.DATE'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 106892
        mmTop = 6085
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'UNIT PRICE'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 125942
        mmTop = 6085
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25240#25187
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 1852
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'TOTAL AMOUNT'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 168540
        mmTop = 6085
        mmWidth = 21167
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 146579
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 11906
        mmLeft = 166688
        mmTop = 0
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 176213
        mmTop = 1852
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'DESCOUNT'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 149225
        mmTop = 6085
        mmWidth = 14023
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataPipeline = DB237
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'DB237'
        mmHeight = 4022
        mmLeft = 5027
        mmTop = 794
        mmWidth = 14224
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'inv_number'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'REQ_DATE'
        DisplayFormat = 'YYYY/MM/DD'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 104775
        mmTop = 2646
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'UNIT_NAME'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 4762
        mmWidth = 13229
        BandType = 4
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 17198
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 87313
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'QUAN_ORD'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'tax_price_dic'
        DisplayFormat = '#,0.000'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 2117
        mmWidth = 16404
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 2117
        mmTop = 0
        mmWidth = 189177
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line401'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 103717
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line402'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 2117
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 124090
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 146579
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'taxprice_total'
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 2646
        mmWidth = 19579
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 166688
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        BlankWhenZero = True
        DataField = 'DISCOUNT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150019
        mmTop = 2646
        mmWidth = 13229
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 192088
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'curr_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 124619
        mmTop = 2646
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'curr_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 166952
        mmTop = 3440
        mmWidth = 5556
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'invpart_desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 5292
        mmWidth = 68792
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 70379
      mmPrintPosition = 0
      object ppLabel62: TppLabel
        UserName = 'Label62'
        Caption = #20844#21496#30422#31456'/'#31614#32626
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 3969
        mmTop = 46038
        mmWidth = 27517
        BandType = 8
      end
      object ppLine53: TppLine
        UserName = 'Line49'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2910
        mmTop = 44979
        mmWidth = 31485
        BandType = 8
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = #21457#21333'ISSUED BY'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 129646
        mmTop = 29104
        mmWidth = 31750
        BandType = 8
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = 'employee_name'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 161925
        mmTop = 29104
        mmWidth = 24342
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'SELLER CO.CHOP&AUTHORIZED'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 4233
        mmTop = 51858
        mmWidth = 52917
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'SIGNATURE'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4798
        mmLeft = 3969
        mmTop = 57944
        mmWidth = 19050
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #23457#26680'CHECKED BY'#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 129646
        mmTop = 41804
        mmWidth = 33867
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #30830#35748
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 11642
        mmTop = 31485
        mmWidth = 8467
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'CONFIRMED BY:'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 11642
        mmTop = 36513
        mmWidth = 27517
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 42333
        mmTop = 41804
        mmWidth = 36248
        BandType = 8
      end
      object ppLine16: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 162454
        mmTop = 34925
        mmWidth = 26194
        BandType = 8
      end
      object ppLine18: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 47361
        mmWidth = 24871
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'CONFIRMATION_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4763
        mmLeft = 164042
        mmTop = 41804
        mmWidth = 25135
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 46302
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 146579
        mmTop = 0
        mmWidth = 1323
        BandType = 7
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = #24635#37329#39069#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 147373
        mmTop = 2646
        mmWidth = 14111
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 146579
        mmTop = 8202
        mmWidth = 46038
        BandType = 7
      end
      object ppLine12: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 166688
        mmTop = 0
        mmWidth = 2117
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'Label38'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 2117
        mmWidth = 13229
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #24635#37329#39069'('#22823#20889'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11113
        mmTop = 2117
        mmWidth = 23813
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '*'#35831#22312#21457#31080#21450#36865#36135#21333#19978#27880#26126#25949#21496'P/O NO.*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 8467
        mmWidth = 61913
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Please remark our P/O NO. on invoice and D/N.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 12965
        mmWidth = 78581
        BandType = 7
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 1852
        mmTop = 0
        mmWidth = 190765
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 192088
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3951
        mmLeft = 109802
        mmTop = 13494
        mmWidth = 17709
        BandType = 7
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'curr_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 167217
        mmTop = 2646
        mmWidth = 5556
        BandType = 7
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'sub_total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = -2147483640
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 172773
        mmTop = 2117
        mmWidth = 15610
        BandType = 7
      end
    end
  end
end

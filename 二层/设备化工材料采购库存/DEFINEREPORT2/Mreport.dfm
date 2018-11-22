object Form_Mreport: TForm_Mreport
  Left = 360
  Top = 257
  Width = 334
  Height = 342
  Caption = #33258#23450#20041#22810#20010#26495#21495#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ADO12: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'CUST_SHIP_ADDR_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,'
      
        '      dbo.Data0012.SHIP_TO_ADDRESS_1, dbo.Data0012.SHIP_TO_CONTA' +
        'CT, '
      
        '      dbo.Data0012.SHIP_TO_PHONE, dbo.Data0012.SHIP_TO_FAX, dbo.' +
        'Data0012.ZIP, '
      
        '      dbo.Data0012.SHIP_TO_ADDRESS_3, dbo.Data0012.SHP_ADDR2_FOR' +
        '_FORM, '
      
        '      dbo.Data0012.SHP_ADDR3_FOR_FORM, dbo.Data0012.EMAIL_FOR_CO' +
        'NTACT, '
      '      dbo.Data0012.SHIP_TO_ADDRESS_2'
      'FROM dbo.Data0010 INNER JOIN'
      
        '      dbo.Data0012 ON dbo.Data0010.RKEY = dbo.Data0012.CUSTOMER_' +
        'PTR'
      'where data0012.rkey=:CUST_SHIP_ADDR_PTR')
    Left = 80
    Top = 77
    object ADO12CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADO12CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 30
    end
    object ADO12SHIP_TO_ADDRESS_1: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object ADO12SHIP_TO_ADDRESS_2: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'SHIP_TO_ADDRESS_2'
      Size = 50
    end
    object ADO12SHIP_TO_ADDRESS_3: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'SHIP_TO_ADDRESS_3'
      Size = 30
    end
    object ADO12SHIP_TO_CONTACT: TStringField
      DisplayLabel = #32852#32476#20154
      FieldName = 'SHIP_TO_CONTACT'
    end
    object ADO12SHIP_TO_PHONE: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'SHIP_TO_PHONE'
    end
    object ADO12SHIP_TO_FAX: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'SHIP_TO_FAX'
    end
    object ADO12ZIP: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'ZIP'
      Size = 10
    end
    object ADO12SHP_ADDR2_FOR_FORM: TStringField
      DisplayLabel = #32435#31246#20154#30331#35760#21495
      FieldName = 'SHP_ADDR2_FOR_FORM'
      Size = 40
    end
    object ADO12SHP_ADDR3_FOR_FORM: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'SHP_ADDR3_FOR_FORM'
      Size = 40
    end
    object ADO12EMAIL_FOR_CONTACT: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO12
    Left = 112
    Top = 77
  end
  object DataSource2: TDataSource
    DataSet = ADO60
    Left = 112
    Top = 112
  end
  object ADO60: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'PURCHASE_ORDER_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'CUST_SHIP_ADDR_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0060.SALES_ORDER, Data0050.CUSTOMER_PART_NUMBER,'
      '      Data0050.CUSTOMER_PART_DESC, Data0050.CP_REV,'
      '      Data0050.ANALYSIS_CODE_1, Data0050.ANALYSIS_CODE_2,'
      '      Data0060.PARTS_ORDERED, Data0060.set_ordered,'
      '      Data0060.PART_PRICE, Data0060.set_price,'
      '      Data0060.TOTAL_ADD_L_PRICE, Data0060.EXCH_RATE,'
      '      Data0060.ORIG_SCHED_SHIP_DATE, Data0060.FOB,'
      '      Data0060.REFERENCE_NUMBER,'
      
        '      Data0060.PARTS_ORDERED*Data0060.PART_PRICE+Data0060.TOTAL_' +
        'ADD_L_PRICE as amount'
      'FROM dbo.Data0050 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0050.RKEY = dbo.Data0060.CUST_PART' +
        '_PTR'
      'where Data0060.PURCHASE_ORDER_PTR=:PURCHASE_ORDER_PTR  and'
      '      data0060.CUST_SHIP_ADDR_PTR=:CUST_SHIP_ADDR_PTR'
      'order by  dbo.Data0050.CUSTOMER_PART_DESC')
    Left = 80
    Top = 112
    object ADO60SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADO60CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO60CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #20135#21697#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ADO60CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADO60ANALYSIS_CODE_1: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADO60ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#20195#30721
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADO60PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327'pcs'
      FieldName = 'PARTS_ORDERED'
    end
    object ADO60set_ordered: TIntegerField
      DisplayLabel = #35746#21333#25968#37327'set'
      FieldName = 'set_ordered'
    end
    object ADO60PART_PRICE: TFloatField
      DisplayLabel = #21333#20215'pcs'
      FieldName = 'PART_PRICE'
    end
    object ADO60set_price: TFloatField
      DisplayLabel = #21333#20215'set'
      FieldName = 'set_price'
    end
    object ADO60TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #39069#22806#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADO60EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
    end
    object ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #23458#25143#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADO60FOB: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'FOB'
      Size = 50
    end
    object ADO60REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADO60amount: TFloatField
      DisplayLabel = #37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object DataSource3: TDataSource
    DataSet = DM.ADOdata0493
    Left = 112
    Top = 150
  end
  object DataSource4: TDataSource
    DataSet = ADO97
    Left = 112
    Top = 39
  end
  object ADO97: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'purchase_order_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from data0097'
      'where rkey=:purchase_order_ptr')
    Left = 80
    Top = 38
    object ADO97PO_NUMBER: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO97PO_DATE: TDateTimeField
      DisplayLabel = #21512#21516#26085#26399
      FieldName = 'PO_DATE'
    end
  end
  object ppDB97: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB97'
    Left = 152
    Top = 40
    object ppDB97ppField1: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB97ppField2: TppField
      FieldAlias = #21512#21516#26085#26399
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object ppDB12: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB12'
    Left = 152
    Top = 77
    object ppDB12ppField1: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField2: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField3: TppField
      FieldAlias = #22320#22336
      FieldName = 'SHIP_TO_ADDRESS_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField4: TppField
      FieldAlias = #32593#22336
      FieldName = 'SHIP_TO_ADDRESS_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField5: TppField
      FieldAlias = #38134#34892#24080#21495
      FieldName = 'SHIP_TO_ADDRESS_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField6: TppField
      FieldAlias = #32852#32476#20154
      FieldName = 'SHIP_TO_CONTACT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField7: TppField
      FieldAlias = #30005#35805
      FieldName = 'SHIP_TO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField8: TppField
      FieldAlias = #20256#30495
      FieldName = 'SHIP_TO_FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField9: TppField
      FieldAlias = #37038#32534
      FieldName = 'ZIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField10: TppField
      FieldAlias = #32435#31246#20154#30331#35760#21495
      FieldName = 'SHP_ADDR2_FOR_FORM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField11: TppField
      FieldAlias = #24320#25143#38134#34892
      FieldName = 'SHP_ADDR3_FOR_FORM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB12ppField12: TppField
      FieldAlias = #30005#23376#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object ppDB60: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB60'
    Left = 152
    Top = 112
    object ppDB60ppField1: TppField
      FieldAlias = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField2: TppField
      FieldAlias = #20135#21697#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField3: TppField
      FieldAlias = #20135#21697#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField4: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField5: TppField
      FieldAlias = #35268#26684
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField6: TppField
      FieldAlias = #23458#25143#29289#26009#20195#30721
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField7: TppField
      FieldAlias = #35746#21333#25968#37327'pcs'
      FieldName = 'PARTS_ORDERED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField8: TppField
      FieldAlias = #35746#21333#25968#37327'set'
      FieldName = 'set_ordered'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField9: TppField
      FieldAlias = #21333#20215'pcs'
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField10: TppField
      FieldAlias = #21333#20215'set'
      FieldName = 'set_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField11: TppField
      FieldAlias = #39069#22806#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField12: TppField
      FieldAlias = #27719#29575
      FieldName = 'EXCH_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField13: TppField
      FieldAlias = #23458#25143#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField14: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = 'FOB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField15: TppField
      FieldAlias = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField16: TppField
      FieldAlias = #37329#39069
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB493'
    Left = 151
    Top = 151
    object ppDB493ppField1: TppField
      FieldAlias = #20225#19994#21517#31216
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = #22320#22336
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = #22270#26631
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField7: TppField
      FieldAlias = #30005#35805
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'Company_name2'
      FieldName = 'Company_name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'Company_name3'
      FieldName = 'Company_name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB60
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\Mul_salesorder.rtm'
    Units = utMillimeters
    BeforePrint = ppReport1BeforePrint
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    Left = 192
    Top = 112
    Version = '6.03'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB60'
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 67469
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 37042
        mmLeft = 2381
        mmTop = 24871
        mmWidth = 190765
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB97
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB97'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 19315
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #21512#21516#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 19315
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CUSTOMER_NAME'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 26194
        mmWidth = 32544
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 17304
        mmTop = 26194
        mmWidth = 15240
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 20902
        mmTop = 31485
        mmWidth = 11642
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'SHIP_TO_CONTACT'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 31485
        mmWidth = 34131
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 58738
        mmTop = 31485
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SHIP_TO_PHONE'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 68792
        mmTop = 31485
        mmWidth = 29898
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 37571
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'SHIP_TO_ADDRESS_1'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 37571
        mmWidth = 38629
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #32435#31246#20154#30331#35745#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 2381
        mmTop = 43656
        mmWidth = 30163
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'SHP_ADDR2_FOR_FORM'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 43656
        mmWidth = 43392
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #24320#25143#38134#34892':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 50006
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'SHP_ADDR3_FOR_FORM'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 50006
        mmWidth = 43392
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #38134#34892#24080#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 56356
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'SHIP_TO_ADDRESS_3'
        DataPipeline = ppDB12
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB12'
        mmHeight = 4233
        mmLeft = 34396
        mmTop = 56356
        mmWidth = 38629
        BandType = 1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 36248
        mmWidth = 190765
        BandType = 1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 42598
        mmWidth = 190765
        BandType = 1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 48683
        mmWidth = 190765
        BandType = 1
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ReprintOnOverFlow = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 2381
        mmTop = 55033
        mmWidth = 190765
        BandType = 1
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 36777
        mmLeft = 109273
        mmTop = 24871
        mmWidth = 1588
        BandType = 1
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'ship_address'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4233
        mmLeft = 129117
        mmTop = 37571
        mmWidth = 21167
        BandType = 1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4233
        mmLeft = 129382
        mmTop = 26194
        mmWidth = 26458
        BandType = 1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'SITE_INFO_PHONE'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 31485
        mmWidth = 28575
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #38144#26041':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 120121
        mmTop = 26194
        mmWidth = 8202
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #24320#25143#38134#34892':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 112977
        mmTop = 50006
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #24080#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 120386
        mmTop = 56356
        mmWidth = 7938
        BandType = 1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #25552#36135#22320#28857':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 110067
        mmTop = 43656
        mmWidth = 18256
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 120121
        mmTop = 37571
        mmWidth = 8202
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #32852#31995#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 116681
        mmTop = 31485
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 31485
        mmWidth = 8202
        BandType = 1
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #24191#24030#22826#21644#30005#36335#26495#21378#35746#36135#21512#21516
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7747
        mmLeft = 58738
        mmTop = 3440
        mmWidth = 77724
        BandType = 1
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = #39029
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 156634
        mmTop = 19579
        mmWidth = 3556
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 161925
        mmTop = 19579
        mmWidth = 18161
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        ShiftWithParent = True
        Weight = 0.75
        mmHeight = 6879
        mmLeft = 2381
        mmTop = 60590
        mmWidth = 190765
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20135#21697#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 9525
        mmTop = 62442
        mmWidth = 14288
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20135#21697#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 38365
        mmTop = 62442
        mmWidth = 14288
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #35268#26684'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 69321
        mmTop = 62442
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #35746#21333#25968#37327'pcs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 93663
        mmTop = 62442
        mmWidth = 19844
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20215#26684'pcs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 125148
        mmTop = 62442
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #39069#22806#36153#29992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 152136
        mmTop = 62442
        mmWidth = 14288
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179123
        mmTop = 62442
        mmWidth = 7144
        BandType = 1
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 2381
        mmTop = 61913
        mmWidth = 4233
        BandType = 1
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 30163
        mmTop = 61913
        mmWidth = 265
        BandType = 1
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 65352
        mmTop = 61648
        mmWidth = 265
        BandType = 1
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 90223
        mmTop = 61648
        mmWidth = 265
        BandType = 1
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5556
        mmLeft = 119063
        mmTop = 61648
        mmWidth = 265
        BandType = 1
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5292
        mmLeft = 145786
        mmTop = 61913
        mmWidth = 1323
        BandType = 1
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5821
        mmLeft = 172773
        mmTop = 61648
        mmWidth = 2646
        BandType = 1
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 192882
        mmTop = 61119
        mmWidth = 2646
        BandType = 1
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 2381
        mmTop = 0
        mmWidth = 190765
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 1058
        mmWidth = 49022
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 34925
        mmTop = 1058
        mmWidth = 43656
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_1'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 69056
        mmTop = 1058
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'PARTS_ORDERED'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 1058
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'PART_PRICE'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 1058
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'TOTAL_ADD_L_PRICE'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 1058
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 178594
        mmTop = 1058
        mmWidth = 11906
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 2381
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 30163
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 65352
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 90223
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 119063
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 145786
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 172773
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 192882
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'Line16'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 2381
        mmTop = 0
        mmWidth = 190765
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'amount'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 2117
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #21512#35745#37329#39069#22823#20889':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 2646
        mmWidth = 22225
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #21512#35745#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153194
        mmTop = 2381
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 35719
        mmTop = 1588
        mmWidth = 2286
        BandType = 7
      end
      object ppLine25: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7938
        mmLeft = 2381
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 192882
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        TraverseAllData = False
        DataPipelineName = 'ppDB89'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 8996
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          Columns = 2
          ColumnPositions.Strings = (
            '6350'
            '105000')
          DataPipeline = ppDB89
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.FileName = 'New Report'
          Units = utMillimeters
          Version = '6.03'
          mmColumnWidth = 98650
          DataPipelineName = 'ppDB89'
          object ppColumnHeaderBand1: TppColumnHeaderBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = #21442#25968#25551#36848
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 32808
              mmTop = 2117
              mmWidth = 14288
              BandType = 2
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = #21442#25968#20540
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 67733
              mmTop = 2117
              mmWidth = 12965
              BandType = 2
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = #20135#21697#22411#21495
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2117
              mmWidth = 14288
              BandType = 2
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 26458
              mmTop = 7143
              mmWidth = 63236
              BandType = 2
            end
          end
          object ppDetailBand2: TppDetailBand
            ColumnTraversal = ctLeftToRight
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object ppLine28: TppLine
              UserName = 'Line28'
              ParentHeight = True
              Position = lpBottom
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 26458
              mmTop = 0
              mmWidth = 63500
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              AutoSize = True
              DataField = 'PARAMETER_DESC'
              DataPipeline = ppDB89
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB89'
              mmHeight = 4233
              mmLeft = 29633
              mmTop = 1588
              mmWidth = 34131
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              AutoSize = True
              DataField = 'tvalue'
              DataPipeline = ppDB89
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB89'
              mmHeight = 4233
              mmLeft = 69056
              mmTop = 1588
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              AutoSize = True
              DataField = 'CUSTOMER_PART_DESC'
              DataPipeline = ppDB89
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppDB89'
              mmHeight = 4191
              mmLeft = 0
              mmTop = 1588
              mmWidth = 43561
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 26458
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 89694
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppColumnFooterBand1: TppColumnFooterBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'CUSTOMER_PART_NUMBER'
            DataPipeline = ppDB89
            KeepTogether = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDB89'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ADO89: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'PURCHASE_ORDER_PTR'
        DataType = ftInteger
        Size = -1
        Value = 0
      end
      item
        Name = 'CUST_SHIP_ADDR_PTR'
        DataType = ftInteger
        Size = -1
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0050.CUSTOMER_PART_NUMBER, '
      '      dbo.Data0050.CUSTOMER_PART_DESC, dbo.Data0050.CP_REV, '
      '      dbo.Data0278.PARAMETER_DESC, dbo.data0089.tvalue'
      'FROM dbo.Data0050 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0050.RKEY = dbo.Data0060.CUST_PART' +
        '_PTR INNER JOIN'
      
        '      dbo.data0089 ON dbo.Data0050.RKEY = dbo.data0089.cust_part' +
        '_ptr INNER JOIN'
      
        '      dbo.Data0278 ON dbo.data0089.parameter_ptr = dbo.Data0278.' +
        'RKEY'
      'where Data0060.PURCHASE_ORDER_PTR=:PURCHASE_ORDER_PTR  and'
      '      data0060.CUST_SHIP_ADDR_PTR=:CUST_SHIP_ADDR_PTR'
      'GROUP BY dbo.Data0050.CUSTOMER_PART_NUMBER,'
      '      dbo.Data0050.CUSTOMER_PART_DESC, dbo.Data0050.CP_REV,'
      
        '      dbo.Data0278.PARAMETER_DESC, dbo.data0089.tvalue, dbo.data' +
        '0089.rkey'
      'ORDER BY dbo.Data0050.CUSTOMER_PART_DESC, dbo.data0089.rkey'
      '')
    Left = 79
    Top = 188
    object ADO89CUSTOMER_PART_NUMBER: TStringField
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADO89CUSTOMER_PART_DESC: TStringField
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ADO89CP_REV: TStringField
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADO89CAN_SHU: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'CAN_SHU'
      Size = 3000
      Calculated = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADO89
    Left = 113
    Top = 189
  end
  object ppDB89: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    UserName = 'DB89'
    Left = 150
    Top = 189
    object ppDB89ppField1: TppField
      FieldAlias = #29983#20135#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB89ppField2: TppField
      FieldAlias = #20135#21697#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppDB89ppField3: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDB89ppField4: TppField
      FieldAlias = #21442#25968#20869#23481
      FieldName = 'CAN_SHU'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
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
    Left = 192
    Top = 144
  end
end

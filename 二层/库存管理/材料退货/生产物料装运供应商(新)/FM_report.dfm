object Form_report: TForm_report
  Left = 849
  Top = 296
  Width = 378
  Height = 343
  Caption = 'REPORT_r'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO22: TADOQuery
    Connection = F_DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME, '
      
        '      dbo.Data0023.CONTACT_NAME_1, dbo.Data0023.BILLING_ADDRESS_' +
        '1, '
      
        '      dbo.Data0456.ship_DATE, Data0022.tax_PRICE as price, Data0' +
        '015.WAREHOUSE_CODE, '
      '      dbo.Data0015.WAREHOUSE_NAME, Data0022.QUAN_TO_BE_SHIPPED, '
      '      dbo.Data0022.QUAN_RETURNED, dbo.Data0022.BARCODE_ID, '
      
        '      dbo.Data0001.CURR_NAME, dbo.Data0022.QUANTITY, dbo.Data002' +
        '3.PHONE, '
      
        '      dbo.Data0023.FAX, dbo.Data0016.CODE AS loca_code, dbo.Data' +
        '0016.LOCATION, '
      
        '      dbo.Data0456.GRN_NUMBER, dbo.Data0022.RKEY, dbo.Data0022.T' +
        'AX_2, '
      '      ROUND(dbo.Data0022.PRICE, 2) AS tax_price, '
      
        '      dbo.Data0456.TTYPE,dbo.Data0096.SHIPPING_METHOD,dbo.Data00' +
        '96.reference_number as '#22791#27880#20449#24687'  '
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0096 ON dbo.Data0022.rkey=dbo.Data0096.inv_tran_pt' +
        'r INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.R' +
        'KEY'
      'where data0022.rkey=:rkey')
    Left = 40
    Top = 49
    object ADO22CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADO22SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADO22CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADO22BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADO22PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO22WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO22WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO22QUAN_TO_BE_SHIPPED: TBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object ADO22QUAN_RETURNED: TBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object ADO22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      FixedChar = True
      Size = 12
    end
    object ADO22QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO22PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
    end
    object ADO22FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
    end
    object ADO22TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object ADO22loca_code: TStringField
      FieldName = 'loca_code'
      FixedChar = True
      Size = 5
    end
    object ADO22LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADO22GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADO22RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO22CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADO22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO22tax_price: TFloatField
      FieldName = 'tax_price'
      ReadOnly = True
    end
    object ADO22ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ADO22SHIPPING_METHOD: TWideStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object ADO22DSDesigner: TStringField
      FieldName = #22791#27880#20449#24687
      FixedChar = True
    end
  end
  object DataSource1: TDataSource
    DataSet = F_DM.aq0493
    Left = 101
    Top = 26
  end
  object DataSource2: TDataSource
    DataSet = ADO22
    Left = 102
    Top = 73
  end
  object DataSource4: TDataSource
    DataSet = ADO95
    Left = 102
    Top = 162
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 148
    Top = 26
    object ppDB493ppField1: TppField
      FieldAlias = #20844#21496#21517#31216
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = #20844#21496#22320#22336
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField5: TppField
      FieldAlias = #22270#26631
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ppDB22: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB22'
    Left = 150
    Top = 73
    object ppDB22ppField3: TppField
      FieldAlias = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField4: TppField
      FieldAlias = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField5: TppField
      FieldAlias = #32852#31995#20154
      FieldName = 'CONTACT_NAME_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField6: TppField
      FieldAlias = #22320#22336
      FieldName = 'BILLING_ADDRESS_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField8: TppField
      FieldAlias = #21547#31246#20215#26684
      FieldName = 'PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField9: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField10: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField11: TppField
      FieldAlias = #24453#35013#36816#25968#37327
      FieldName = 'QUAN_TO_BE_SHIPPED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField12: TppField
      FieldAlias = #24635#36864#36135#25968#37327
      FieldName = 'QUAN_RETURNED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField13: TppField
      FieldAlias = #20837#20179#22791#27880
      FieldName = 'BARCODE_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField14: TppField
      FieldAlias = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField15: TppField
      FieldAlias = #30005#35805
      FieldName = 'PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField16: TppField
      FieldAlias = #20256#30495
      FieldName = 'FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField18: TppField
      FieldAlias = #20179#24211#20195#30721
      FieldName = 'loca_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField19: TppField
      FieldAlias = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField21: TppField
      FieldAlias = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField1: TppField
      FieldAlias = #36135#24065
      FieldName = 'CURR_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppDB22ppField2: TppField
      FieldAlias = #31246#29575'%'
      FieldName = 'TAX_2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDB22ppField17: TppField
      FieldAlias = #19981#21547#31246#20215
      FieldName = 'tax_price'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDB22ppField7: TppField
      FieldAlias = #20837#20179#26085#26399
      FieldName = 'ship_DATE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDB22ppField20: TppField
      FieldAlias = #22791#27880#20449#24687
      FieldName = #22791#27880#20449#24687
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppDB22ppField22: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
  end
  object ppDB95: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB95'
    Left = 150
    Top = 161
    object ppDB95ppField2: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField3: TppField
      FieldAlias = #29289#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField4: TppField
      FieldAlias = #29289#26009#21517#31216#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField5: TppField
      FieldAlias = #36864#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField6: TppField
      FieldAlias = #36864#36135#26085#26399
      FieldName = 'TRAN_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField7: TppField
      FieldAlias = #38468#21152#21442#32771
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField8: TppField
      FieldAlias = #35746#36141#25968#37327
      FieldName = 'QUAN_ORD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField10: TppField
      FieldAlias = #21333#20301
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField11: TppField
      FieldAlias = #36716#25442#29575
      FieldName = 'CONVERSION_FACTOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField12: TppField
      FieldAlias = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField13: TppField
      FieldAlias = #37319#36141#26085#26399
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField1: TppField
      FieldAlias = #36864#36135#25968#37327
      FieldName = #36864#36135#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB95ppField9: TppField
      FieldAlias = #36864#36135#37329#39069
      FieldName = #36864#36135#37329#39069
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDB95ppField14: TppField
      FieldAlias = #31246#37329
      FieldName = #31246#37329
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB95ppField15: TppField
      FieldAlias = 'QUAN_REJD'
      FieldName = 'QUAN_REJD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB22
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 5350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 215000
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = '..\NIERP\Report\RETUREN_SUPP_WZ.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 206
    Top = 162
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB22'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 92075
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 5842
        mmLeft = 73947
        mmTop = 1852
        mmWidth = 49488
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 15610
        mmLeft = 9525
        mmTop = 1323
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #36864#36135#35013#36816#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 83079
        mmTop = 10848
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379#24212#21830#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 18785
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'SUPPLIER_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4022
        mmLeft = 33338
        mmTop = 18785
        mmWidth = 29379
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #32852#31995#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 16140
        mmTop = 24342
        mmWidth = 14224
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CONTACT_NAME_1'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4233
        mmLeft = 33867
        mmTop = 24342
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #22320#22336#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 19579
        mmTop = 33338
        mmWidth = 10668
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'BILLING_ADDRESS_1'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4191
        mmLeft = 33867
        mmTop = 33602
        mmWidth = 37211
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #30005#35805#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 19844
        mmTop = 28840
        mmWidth = 10668
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PHONE'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4233
        mmLeft = 33867
        mmTop = 28840
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #25171#21360#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149754
        mmTop = 19579
        mmWidth = 17727
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 169069
        mmTop = 19579
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #37319#36141#35746#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 10054
        mmTop = 40481
        mmWidth = 21336
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 40481
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 40481
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #25910#36135#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 40481
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #37319#36141#35746#21333#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 45508
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'PO_DATE'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4022
        mmLeft = 34131
        mmTop = 45773
        mmWidth = 16425
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #35746#21333#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 51065
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'QUAN_ORD'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 51065
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #35746#36141#21333#20301#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 115888
        mmTop = 51065
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #26448#26009#20195#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 56621
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26448#26009#21517#31216#35268#26684#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 6615
        mmTop = 62177
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 56621
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'INV_PART_DESCRIPTION'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 62177
        mmWidth = 137319
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25509#25910#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 67733
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 67733
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25509#25910#21333#20215#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 115888
        mmTop = 67733
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'PRICE'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4163
        mmLeft = 136790
        mmTop = 67733
        mmWidth = 10724
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #25910#36135#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 72761
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'ship_DATE'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4163
        mmLeft = 34131
        mmTop = 72761
        mmWidth = 17921
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #36864#36135#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 77523
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #36864#36135#25968#37327
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 77523
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #36864#36135#37329#39069
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 136790
        mmTop = 77523
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #36864#36135#37329#39069#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 115623
        mmTop = 77523
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #35013#36816#26041#27861#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 82815
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #21442#32771#38468#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 87842
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'SHIPPING_METHOD'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4022
        mmLeft = 34131
        mmTop = 82815
        mmWidth = 33994
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'REFERENCE_NUMBER'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 87842
        mmWidth = 39423
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = #31246#29575'%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 116152
        mmTop = 56621
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'TAX_2'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4163
        mmLeft = 136790
        mmTop = 56621
        mmWidth = 10795
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #31246#37329#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 84138
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = #31246#37329
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4163
        mmLeft = 136790
        mmTop = 84138
        mmWidth = 7056
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 50800
        mmWidth = 20373
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppDBText25: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = #22791#27880#20449#24687
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 7673
        mmWidth = 164571
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #36864#36135#22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 7408
        mmWidth = 18785
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #21046#21333#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 10583
        mmTop = 2117
        mmWidth = 14224
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 2117
        mmWidth = 31485
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = #31614#25910#20154#65306'__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 139965
        mmTop = 2117
        mmWidth = 33867
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = #36864#36135#20154#65306'__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 73819
        mmTop = 2117
        mmWidth = 33867
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
    Left = 246
    Top = 164
  end
  object ADO95: TADOQuery
    Connection = F_DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADO95CalcFields
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
      
        'SELECT     dbo.Data0096.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.' +
        'Data0017.INV_PART_DESCRIPTION,'
      '           dbo.Data0071.QUAN_ORD, dbo.Data0002.UNIT_NAME, '
      
        '           dbo.Data0071.tax_price AS po_price, dbo.Data0071.CONV' +
        'ERSION_FACTOR, '
      
        '           dbo.Data0070.PO_NUMBER, dbo.Data0070.PO_DATE, dbo.Dat' +
        'a0022.tax_price AS price, '
      
        '           dbo.Data0022.TAX_2, dbo.Data0456.TTYPE,dbo.Data0005.E' +
        'MPLOYEE_NAME,'
      
        '           dbo.Data0210.QUANTITY,dbo.Data0096.SHIPPING_METHOD,db' +
        'o.Data0096.TRAN_DATE,'
      '           dbo.Data0096.REFERENCE_NUMBER, data0096.QUAN_REJD'
      'FROM         dbo.Data0017 INNER JOIN'
      
        '                      dbo.Data0096 ON dbo.Data0017.RKEY = dbo.Da' +
        'ta0096.INVT_PTR INNER JOIN'
      '                      dbo.Data0456 INNER JOIN'
      
        '                      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.Da' +
        'ta0022.GRN_PTR INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_' +
        'FROM = dbo.Data0002.RKEY ON dbo.Data0096.INV_TRAN_PTR = dbo.Data' +
        '0022.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0096.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0210 ON dbo.Data0022.RKEY = dbo.Da' +
        'ta0210.D0022_PTR LEFT OUTER JOIN'
      '                      dbo.Data0071 INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.' +
        'Data0070.RKEY ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY'
      'where data0096.rkey=:rkey'
      ' '
      ' ')
    Left = 48
    Top = 146
    object ADO95QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO95SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADO95INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADO95INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADO95EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO95TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object ADO95REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO95QUAN_ORD: TFloatField
      FieldName = 'QUAN_ORD'
    end
    object ADO95UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADO95CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object ADO95PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADO95PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO95TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADO95PRICE: TFloatField
      FieldName = 'PRICE'
    end
    object ADO95FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = #36864#36135#25968#37327
      Calculated = True
    end
    object ADO95FloatField2: TFloatField
      FieldKind = fkCalculated
      FieldName = #36864#36135#37329#39069
      Calculated = True
    end
    object ADO95Field: TFloatField
      FieldKind = fkCalculated
      FieldName = #31246#37329
      Calculated = True
    end
    object ADO95po_price: TFloatField
      FieldName = 'po_price'
    end
    object ADO95tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object ADO95rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO95QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
  end
end

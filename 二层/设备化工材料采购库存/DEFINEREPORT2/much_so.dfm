object Form3: TForm3
  Left = 448
  Top = 225
  Width = 286
  Height = 366
  Caption = #36830#32493#35746#21333#25253#34920#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'SO1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = '100011-001'
      end
      item
        Name = 'SO2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = '100022-001'
      end>
    SQL.Strings = (
      'SELECT dbo.Data0009.SALES_REP_NAME, dbo.Data0010.CUST_CODE, '
      
        '      dbo.Data0050.CUSTOMER_PART_NUMBER, dbo.Data0050.CUSTOMER_P' +
        'ART_DESC, '
      '      dbo.Data0060.SALES_ORDER, dbo.Data0050.CP_REV, '
      
        '      dbo.Data0060.ORIG_SCHED_SHIP_DATE, dbo.Data0060.PARTS_ORDE' +
        'RED, '
      '      dbo.Data0060.REFERENCE_NUMBER, dbo.Data0060.PART_PRICE, '
      '      dbo.Data0060.TOTAL_ADD_L_PRICE, dbo.Data0060.EXCH_RATE, '
      
        '      dbo.Data0060.PARTS_ORDERED * dbo.Data0050.unit_sq AS mian_' +
        'ji, '
      
        '      dbo.Data0050.unit_sq, dbo.Data0001.CURR_NAME, dbo.Data0008' +
        '.PRODUCT_NAME, '
      
        '      dbo.Data0060.QUOTE_PRICE, dbo.Data0060.FOB, dbo.Data0050.A' +
        'NALYSIS_CODE_1, '
      
        '      dbo.Data0050.ANALYSIS_CODE_2, dbo.Data0050.ANALYSIS_CODE_3' +
        ', '
      '      dbo.Data0097.PO_NUMBER,data0060.sch_date'
      'FROM dbo.Data0009 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0009.RKEY = dbo.Data0010.SALES_REP' +
        '_PTR INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060.CUSTOMER_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_' +
        'PTR INNER JOIN'
      '      dbo.Data0008 ON '
      '      dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'
      '      dbo.Data0097 ON '
      '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY'
      'WHERE (dbo.Data0025.PARENT_PTR = 0) AND'
      '      (dbo.Data0060.SALES_ORDER >= :SO1) AND'
      '      (dbo.Data0060.SALES_ORDER <= :SO2)'
      'ORDER BY dbo.Data0060.SALES_ORDER')
    Left = 56
    Top = 80
    object ADOQuery1SALES_REP_NAME: TStringField
      DisplayLabel = #38144#21806#20195#34920
      DisplayWidth = 25
      FieldName = 'SALES_REP_NAME'
    end
    object ADOQuery1CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 13
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      DisplayWidth = 30
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ADOQuery1CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      DisplayWidth = 48
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ADOQuery1CP_REV: TStringField
      DisplayLabel = #29256#26412
      DisplayWidth = 9
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ADOQuery1SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      DisplayWidth = 16
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField
      DisplayLabel = #35745#21010#20132#26399
      DisplayWidth = 27
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADOQuery1PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      DisplayWidth = 19
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery1REFERENCE_NUMBER: TStringField
      DisplayLabel = #21442#32771
      DisplayWidth = 36
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQuery1PART_PRICE: TFloatField
      DisplayLabel = #21333#20215
      DisplayWidth = 14
      FieldName = 'PART_PRICE'
    end
    object ADOQuery1TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      DisplayWidth = 10
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADOQuery1EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 13
      FieldName = 'EXCH_RATE'
    end
    object ADOQuery1mian_ji: TFloatField
      DisplayLabel = #38144#21806#38754#31215
      DisplayWidth = 12
      FieldName = 'mian_ji'
      ReadOnly = True
    end
    object ADOQuery1unit_sq: TFloatField
      DisplayLabel = 'pcs'#38754#31215
      DisplayWidth = 12
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ADOQuery1CURR_NAME: TStringField
      DisplayLabel = #36135#24065
      DisplayWidth = 24
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      DisplayWidth = 36
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1QUOTE_PRICE: TWordField
      FieldName = 'QUOTE_PRICE'
    end
    object ADOQuery1quote_auth: TStringField
      DisplayLabel = #35780#23457#26631#35760
      FieldKind = fkCalculated
      FieldName = 'quote_auth'
      Size = 6
      Calculated = True
    end
    object ADOQuery1fob: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'fob'
      Size = 50
    end
    object ADOQuery1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOQuery1ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      FixedChar = True
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
  end
  object DataSource2: TDataSource
    DataSet = DM.ADOdata0493
    Left = 88
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 88
    Top = 80
  end
  object ppDB60: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    UserName = 'DB60'
    Left = 122
    Top = 80
    object ppDBPipeline1ppField1: TppField
      FieldAlias = #38144#21806#20195#34920
      FieldName = 'SALES_REP_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = #35745#21010#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #21442#32771
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = #20215#26684
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = #27719#29575
      FieldName = 'EXCH_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = #38754#31215
      FieldName = 'mian_ji'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = #27599'PCS'#38754#31215
      FieldName = 'unit_sq'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = #36135#24065
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = #20135#31867#31867#22411
      FieldName = 'PRODUCT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = #35780#23457#29366#24577
      FieldName = 'quote_auth'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = 'fob'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDB60ppField1: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'PO_NUMBER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDB60ppField2: TppField
      FieldAlias = #20132#36135#26495#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object ppDB60ppField3: TppField
      FieldAlias = #23458#25143#29289#26009#32534#30721
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppDB60ppField4: TppField
      FieldAlias = #20135#21697#20998#26512#20195#30721'3'
      FieldName = 'ANALYSIS_CODE_3'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
    object ppDB60ppField5: TppField
      FieldAlias = #22238#22797#20132#26399
      FieldName = 'sch_date'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB60
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\much_soreport.rtm'
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
    Left = 162
    Top = 81
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB60'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'Company_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7938
        mmLeft = 100542
        mmTop = 3440
        mmWidth = 92604
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #29983#20135#36890#30693#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4798
        mmLeft = 137002
        mmTop = 14552
        mmWidth = 21167
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 14552
        mmLeft = 62971
        mmTop = 3969
        mmWidth = 29633
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #19994#21153#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 24077
        mmTop = 2117
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 53446
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35746#21333#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'SALES_ORDER'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 82815
        mmTop = 2910
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CUST_CODE'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 52917
        mmTop = 3175
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'SALES_REP_NAME'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 15610
        mmTop = 2910
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 115623
        mmTop = 2910
        mmWidth = 48683
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
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
        mmLeft = 145257
        mmTop = 2910
        mmWidth = 43127
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB493'
    Left = 120
    Top = 120
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField9: TppField
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
    Left = 200
    Top = 80
  end
end

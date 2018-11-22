object Form3: TForm3
  Left = 476
  Top = 275
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
    OnCalcFields = ADOQuery1CalcFields
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
      
        '      dbo.Data0060.SALES_ORDER, dbo.Data0060.ORIG_SCHED_SHIP_DAT' +
        'E, '
      
        '      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.REFERENCE_NUMBER,' +
        ' '
      '      dbo.Data0060.PART_PRICE, dbo.Data0060.TOTAL_ADD_L_PRICE, '
      '      dbo.Data0060.EXCH_RATE, dbo.Data0001.CURR_NAME,'
      '      Data0060.PARTS_ORDERED * Data0025.unit_sq AS mian_ji,'
      '      Data0008.PRODUCT_NAME, Data0060.QUOTE_PRICE, Data0060.FOB,'
      '      Data0097.PO_NUMBER, Data0060.SCH_DATE, Data0060.so_oldnew,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      '      Data0025.ANALYSIS_CODE_2, Data0025.ANALYSIS_CODE_3,'
      '      Data0025.ANALYSIS_CODE_1, Data0025.unit_sq,'
      '      case data0025.green_flag'
      '      when '#39'Y'#39' then '#39'ROHS'#39' WHEN '#39'N'#39' THEN '#39#38750'ROHS'#39' end AS rohs'
      'FROM dbo.Data0097 INNER JOIN'
      '      dbo.Data0009 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0009.RKEY = dbo.Data0010.SALES_REP' +
        '_PTR INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060.CUSTOMER_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY ON '
      
        '      dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR INNER ' +
        'JOIN'
      '      dbo.Data0025 INNER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
        'RKEY ON '
      '      dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY'
      'WHERE (dbo.Data0060.SALES_ORDER >= :SO1) AND'
      '      (dbo.Data0060.SALES_ORDER <= :SO2)'
      'ORDER BY Data0060.SALES_ORDER')
    Left = 56
    Top = 80
    object ADOQuery1SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object ADOQuery1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQuery1SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ADOQuery1PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object ADOQuery1REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQuery1PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object ADOQuery1TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADOQuery1EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ADOQuery1CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADOQuery1mian_ji: TFloatField
      FieldName = 'mian_ji'
      ReadOnly = True
    end
    object ADOQuery1PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQuery1QUOTE_PRICE: TWordField
      FieldName = 'QUOTE_PRICE'
    end
    object ADOQuery1FOB: TStringField
      FieldName = 'FOB'
      Size = 50
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object ADOQuery1so_oldnew: TStringField
      FieldName = 'so_oldnew'
      FixedChar = True
      Size = 4
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQuery1ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ADOQuery1ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object ADOQuery1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADOQuery1unit_sq: TFloatField
      FieldName = 'unit_sq'
    end
    object ADOQuery1rohs: TStringField
      FieldName = 'rohs'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1quote_auth: TStringField
      FieldKind = fkCalculated
      FieldName = 'quote_auth'
      Size = 6
      Calculated = True
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
    UserName = 'DB60'
    Left = 122
    Top = 80
    object ppDB60ppField1: TppField
      FieldAlias = #38144#21806#20195#34920
      FieldName = 'SALES_REP_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 0
    end
    object ppDB60ppField2: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB60ppField3: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object ppDB60ppField4: TppField
      FieldAlias = #35745#21010#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppDB60ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB60ppField6: TppField
      FieldAlias = #21442#32771#38468#27880
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object ppDB60ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #35746#21333#20215#26684
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB60ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB60ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = #27719#29575
      FieldName = 'EXCH_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB60ppField10: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDB60ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = #38144#21806#38754#31215
      FieldName = 'mian_ji'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDB60ppField12: TppField
      FieldAlias = #20135#21697#31867#22411
      FieldName = 'PRODUCT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object ppDB60ppField14: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'FOB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppDB60ppField15: TppField
      FieldAlias = #23458#25143#37319#36141#35746#21333
      FieldName = 'PO_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 13
    end
    object ppDB60ppField16: TppField
      FieldAlias = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object ppDB60ppField17: TppField
      FieldAlias = #26032#26087
      FieldName = 'so_oldnew'
      FieldLength = 4
      DisplayWidth = 4
      Position = 15
    end
    object ppDB60ppField18: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object ppDB60ppField19: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 17
    end
    object ppDB60ppField20: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 18
    end
    object ppDB60ppField21: TppField
      FieldAlias = #22823#26009#35268#26684
      FieldName = 'ANALYSIS_CODE_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object ppDB60ppField22: TppField
      FieldAlias = #20132#36135#23610#23544'SET'
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppDB60ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = #21333#21482#38754#31215
      FieldName = 'unit_sq'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppDB60ppField24: TppField
      FieldAlias = #29615#20445#26631#35782
      FieldName = 'rohs'
      FieldLength = 6
      DisplayWidth = 6
      Position = 22
    end
    object ppDB60ppField25: TppField
      FieldAlias = #35780#23457#29366#24577
      FieldName = 'quote_auth'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB60
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\much_Asoreport.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
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
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
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
        mmLeft = 135732
        mmTop = 14552
        mmWidth = 21167
        BandType = 1
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
        mmHeight = 14552
        mmLeft = 62971
        mmTop = 3969
        mmWidth = 29633
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 9790
        mmLeft = 7938
        mmTop = 0
        mmWidth = 268817
        BandType = 0
      end
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
        mmLeft = 12171
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
        mmLeft = 28575
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
        mmLeft = 56356
        mmTop = 529
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 85196
        mmTop = 2117
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 120386
        mmTop = 265
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20132#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 181769
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 200819
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #38754#31215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 216165
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #35780#23457#32467#26524
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 228336
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 254794
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 27781
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 84138
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 108479
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 173832
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 196586
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 212725
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 226484
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 243946
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #26495#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 5292
        mmWidth = 7144
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 148432
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #29615#20445#26631#35782
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8128
        mmLeft = 165100
        mmTop = 1058
        mmWidth = 7112
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 161925
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = #35746#21333#13#10#26032#26087#13#10
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #35746#21333
          #26032#26087)
        Transparent = True
        mmHeight = 7408
        mmLeft = 151871
        mmTop = 1058
        mmWidth = 7144
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #23458#25143#29289#26009#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 4763
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 7673
        mmTop = 0
        mmWidth = 268817
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 794
        mmWidth = 40217
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
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 29898
        mmTop = 2646
        mmWidth = 10848
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
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 2646
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3598
        mmLeft = 84931
        mmTop = 2646
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3260
        mmLeft = 115076
        mmTop = 1058
        mmWidth = 26882
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ORIG_SCHED_SHIP_DATE'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3969
        mmLeft = 174625
        mmTop = 2646
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'PARTS_ORDERED'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3969
        mmLeft = 198173
        mmTop = 2646
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'mian_ji'
        DataPipeline = ppDB60
        DisplayFormat = '#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3969
        mmLeft = 213519
        mmTop = 2646
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'quote_auth'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3969
        mmLeft = 227013
        mmTop = 2646
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_3'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 246063
        mmTop = 529
        mmWidth = 28840
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 7673
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 27781
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 84138
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 108479
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 173832
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 196586
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 212725
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 226484
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 243946
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 276226
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'ANALYSIS_CODE_3'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 5821
        mmWidth = 40217
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 148432
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'rohs'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3440
        mmLeft = 165365
        mmTop = 2910
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'SO_OLDNEW'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4064
        mmLeft = 149225
        mmTop = 2646
        mmWidth = 12435
        BandType = 4
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 161925
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_2'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 2910
        mmLeft = 116946
        mmTop = 6615
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 31485
        mmLeft = 7673
        mmTop = 1323
        mmWidth = 268817
        BandType = 8
      end
      object ppLine24: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7673
        mmTop = 8996
        mmWidth = 268817
        BandType = 8
      end
      object ppLine25: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31221
        mmLeft = 78317
        mmTop = 1323
        mmWidth = 265
        BandType = 8
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31221
        mmLeft = 153459
        mmTop = 1323
        mmWidth = 265
        BandType = 8
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #24066#22330#37096#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 9966
        mmTop = 3440
        mmWidth = 17639
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #35780#23457#37096#38376#20250#31614
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 81227
        mmTop = 3440
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #24076#26395#35843#25972#20869#23481
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 3440
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #21046#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13141
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #22797#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13229
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #23457#25209':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13229
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine27: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 16140
        mmWidth = 17727
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 23548
        mmWidth = 17727
        BandType = 8
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 30427
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 16140
        mmWidth = 17727
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 23548
        mmWidth = 17727
        BandType = 8
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 30427
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #24037#31243':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 85108
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #21697#36136':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 85372
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = #35745#21010':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116064
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #29983#20135':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116329
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = #26680#20934':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116593
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 94456
        mmTop = 16404
        mmWidth = 17727
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 94456
        mmTop = 23813
        mmWidth = 17727
        BandType = 8
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 16404
        mmWidth = 17727
        BandType = 8
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 23813
        mmWidth = 17727
        BandType = 8
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 30692
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #23458#25143#24847#35265':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4064
        mmLeft = 158422
        mmTop = 19579
        mmWidth = 16002
        BandType = 8
      end
      object ppLine35: TppLine
        UserName = 'Line25'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 175684
        mmTop = 23813
        mmWidth = 96838
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = #31614#21517'/'#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 26458
        mmWidth = 17639
        BandType = 8
      end
      object ppLine39: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 178065
        mmTop = 30692
        mmWidth = 31221
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #21463#25511'NO'#65306'IGS02001-003A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 235744
        mmTop = 34660
        mmWidth = 33782
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #38754#31215#21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 184680
        mmTop = 1588
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'mian_ji'
        DataPipeline = ppDB60
        DisplayFormat = '#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 204523
        mmTop = 1588
        mmWidth = 21336
        BandType = 7
      end
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

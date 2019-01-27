object Form_report: TForm_report
  Left = 416
  Top = 314
  Width = 536
  Height = 495
  Caption = 'Form_report'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ADOdata0493: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 33
    Top = 124
    object ADOdata0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADOdata0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADOdata0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADOdata0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADOdata0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOdata0493
    Left = 64
    Top = 124
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 97
    Top = 124
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Icon'
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
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object ppDB22: TppDBPipeline
    DataSource = Form4.DataSource1
    UserName = 'DB22'
    Left = 129
    Top = 90
    object ppDB22ppField1: TppField
      FieldAlias = 'inv_group_name'
      FieldName = 'inv_group_name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB22ppField2: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 25
      DisplayWidth = 29
      Position = 1
    end
    object ppDB22ppField3: TppField
      FieldAlias = 'inv_name'
      FieldName = 'inv_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 2
    end
    object ppDB22ppField4: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 70
      DisplayWidth = 100
      Position = 3
    end
    object ppDB22ppField5: TppField
      FieldAlias = 'GROUP_NAME'
      FieldName = 'GROUP_NAME'
      FieldLength = 10
      DisplayWidth = 15
      Position = 4
    end
    object ppDB22ppField6: TppField
      FieldAlias = 'UNIT_CODE'
      FieldName = 'UNIT_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDB22ppField7: TppField
      FieldAlias = 'ABBR_NAME23'
      FieldName = 'ABBR_NAME23'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDB22ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'quan_total'
      FieldName = 'quan_total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 7
    end
    object ppDB22ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'avl_price'
      FieldName = 'avl_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 8
    end
    object ppDB22ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 9
    end
    object ppDB22ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'amount_notax'
      FieldName = 'amount_notax'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDB22ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'STOCK_BASE'
      FieldName = 'STOCK_BASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDB22ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'STOCK_SELL'
      FieldName = 'STOCK_SELL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDB22ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_weigth'
      FieldName = 'total_weigth'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB22ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_area'
      FieldName = 'total_area'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB22ppField16: TppField
      FieldAlias = 'supplier2'
      FieldName = 'supplier2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object ppDB22ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_ON_HAND'
      FieldName = 'QUAN_ON_HAND'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 16
    end
    object ppDB22ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONSIGN_ONHAND_QTY'
      FieldName = 'CONSIGN_ONHAND_QTY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDB22ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'quan_allow'
      FieldName = 'quan_allow'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB22
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #21407#26448#26009#24211#23384
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\warehouse_lucre.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 164
    Top = 90
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB22'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40481
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 5821
        mmLeft = 529
        mmTop = 34660
        mmWidth = 195792
        BandType = 0
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 1
        CalcType = veReportStart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 52123
        mmTop = 6615
        mmWidth = 88106
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
        mmHeight = 13229
        mmLeft = 6350
        mmTop = 8731
        mmWidth = 17000
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 85195
        mmTop = 16140
        mmWidth = 21167
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 24871
        mmWidth = 184150
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 20108
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 25929
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26448#26009#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4304
        mmLeft = 23813
        mmTop = 35454
        mmWidth = 14111
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #26448#26009#31867#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 35454
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #24211#23384#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 141552
        mmTop = 35454
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #24179#22343#20215#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 159809
        mmTop = 35454
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #21512#35745#37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 177800
        mmTop = 35719
        mmWidth = 14288
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 15346
        mmTop = 34660
        mmWidth = 529
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 124354
        mmTop = 34660
        mmWidth = 1323
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 157427
        mmTop = 34660
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 175948
        mmTop = 34660
        mmWidth = 265
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 140229
        mmTop = 34660
        mmWidth = 265
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #23384#36135#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 125413
        mmTop = 35454
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 111125
        mmTop = 35454
        mmWidth = 11642
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 51858
        mmTop = 34660
        mmWidth = 1323
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 110067
        mmTop = 34660
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label6'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 69850
        mmTop = 35454
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3440
        mmLeft = 15875
        mmTop = 794
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'GROUP_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 529
        mmWidth = 6844
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'quan_total'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3316
        mmLeft = 154287
        mmTop = 265
        mmWidth = 1552
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'avl_price'
        DataPipeline = ppDB22
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3316
        mmLeft = 166846
        mmTop = 265
        mmWidth = 6985
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB22
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3316
        mmLeft = 186161
        mmTop = 529
        mmWidth = 6985
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 794
        mmTop = 3969
        mmWidth = 194469
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 529
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 15346
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 124354
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 157427
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 175948
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 196057
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 140229
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'UNIT_CODE'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3440
        mmLeft = 129117
        mmTop = 265
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText6'
        DataField = 'ABBR_NAME23'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3440
        mmLeft = 110331
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 51858
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 4498
        mmLeft = 110067
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText7'
        DataField = 'inv_description'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3440
        mmLeft = 74877
        mmTop = 265
        mmWidth = 33073
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'inv_name'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3457
        mmLeft = 52917
        mmTop = 265
        mmWidth = 21960
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'amount'
        DataPipeline = ppDB22
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 794
        mmWidth = 26988
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066870726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D207472696D2844423439335B
        27436F6D70616E795F4E616D65275D293B0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506095661726961626C6531094576656E744E616D6506064F6E
        43616C63074576656E74494402210000}
    end
  end
  object ppDB0022: TppDBPipeline
    DataSource = Form2.DataSource1
    UserName = 'DB0022'
    Left = 130
    Top = 122
    object ppDB0022ppField1: TppField
      FieldAlias = 'GRN_NUMBER'
      FieldName = 'GRN_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB0022ppField2: TppField
      FieldAlias = 'DELIVER_NUMBER'
      FieldName = 'DELIVER_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDB0022ppField3: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppDB0022ppField4: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppDB0022ppField5: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 30
      DisplayWidth = 15
      Position = 4
    end
    object ppDB0022ppField6: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 70
      DisplayWidth = 20
      Position = 5
    end
    object ppDB0022ppField7: TppField
      FieldAlias = 'group_desc'
      FieldName = 'group_desc'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppDB0022ppField8: TppField
      FieldAlias = 'code23'
      FieldName = 'code23'
      FieldLength = 10
      DisplayWidth = 11
      Position = 7
    end
    object ppDB0022ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 8
    end
    object ppDB0022ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'tax_PRICE'
      FieldName = 'tax_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB0022ppField11: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 5
      DisplayWidth = 9
      Position = 10
    end
    object ppDB0022ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_ON_HAND'
      FieldName = 'QUAN_ON_HAND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 11
    end
    object ppDB0022ppField13: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 5
      DisplayWidth = 9
      Position = 12
    end
    object ppDB0022ppField14: TppField
      FieldAlias = 'inv_group_name'
      FieldName = 'inv_group_name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDB0022ppField15: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 20
      DisplayWidth = 10
      Position = 14
    end
    object ppDB0022ppField16: TppField
      FieldAlias = 'PO_REV_NO'
      FieldName = 'PO_REV_NO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDB0022ppField17: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 16
      DisplayWidth = 10
      Position = 16
    end
    object ppDB0022ppField18: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDB0022ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 5
      Position = 18
    end
    object ppDB0022ppField20: TppField
      FieldAlias = 'ship_DATE'
      FieldName = 'ship_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 19
    end
    object ppDB0022ppField21: TppField
      FieldAlias = 'BARCODE_ID'
      FieldName = 'BARCODE_ID'
      FieldLength = 50
      DisplayWidth = 50
      Position = 20
    end
    object ppDB0022ppField22: TppField
      FieldAlias = 'SUPPLIER2'
      FieldName = 'SUPPLIER2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 21
    end
    object ppDB0022ppField23: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppDB0022ppField24: TppField
      FieldAlias = 'EXPIRE_DATE'
      FieldName = 'EXPIRE_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 23
    end
    object ppDB0022ppField25: TppField
      FieldAlias = 'CODE_23'
      FieldName = 'CODE_23'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppDB0022ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = #19981#21547#31246#20215
      FieldName = #19981#21547#31246#20215
      FieldLength = 12
      DataType = dtDouble
      DisplayWidth = 24
      Position = 25
    end
    object ppDB0022ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = #21407#24065#21547#31246#37329#39069
      FieldName = #21407#24065#21547#31246#37329#39069
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDB0022ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = #26412#24065#21547#31246#37329#39069
      FieldName = #26412#24065#21547#31246#37329#39069
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppDB0022ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = #26412#24065#19981#21547#31246#37329#39069
      FieldName = #26412#24065#19981#21547#31246#37329#39069
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppDB0022ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = #25509#25910#24635#37325
      FieldName = #25509#25910#24635#37325
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppDB0022ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = #25509#25910#38754#31215
      FieldName = #25509#25910#38754#31215
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object pfldDB0022ppField32: TppField
      FieldAlias = 'v_type'
      FieldName = 'v_type'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
  end
  object ppReport2: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'report2'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\SJSYS\NIERP\Report\received_inventory.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 164
    Top = 122
    Version = '7.01'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 51594
        mmTop = 2117
        mmWidth = 92340
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 8996
        mmTop = 6879
        mmWidth = 17000
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 6350
        mmTop = 22225
        mmWidth = 185738
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'BARCODE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 25400
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 62442
        mmTop = 25400
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 78581
        mmTop = 25400
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #25509#25910#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 96838
        mmTop = 25400
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #25509#25910#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 127000
        mmTop = 25400
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25910#26009#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 39158
        mmTop = 25400
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 17463
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 11906
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = #24050#25509#25910#30340#26448#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 85196
        mmTop = 10319
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #20215#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 155046
        mmTop = 25400
        mmWidth = 7056
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 183357
        mmTop = 25400
        mmWidth = 7056
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Label18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 127000
        mmTop = 16669
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Label19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 145521
        mmTop = 16404
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'BARCODE_ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 10319
        mmTop = 265
        mmWidth = 18034
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'code16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 62442
        mmTop = 265
        mmWidth = 9271
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'QUANTITY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 136726
        mmTop = 265
        mmWidth = 3133
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'code23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 79375
        mmTop = 265
        mmWidth = 14393
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'TDATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 97896
        mmTop = 265
        mmWidth = 9313
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 36513
        mmTop = 265
        mmWidth = 16129
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'hkd_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3246
        mmLeft = 147638
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'total_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 174361
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'GROUP_NAME'
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'GROUP_NAME'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3387
          mmLeft = 29898
          mmTop = 1852
          mmWidth = 20193
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = #26448#26009#31867#21035
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 11377
          mmTop = 1852
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'INV_PART_NUMBER'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'INV_PART_NUMBER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 29369
          mmTop = 794
          mmWidth = 35052
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = #26448#26009#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 11906
          mmTop = 794
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLine15: TppLine
          UserName = 'Line15'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 6350
          mmTop = 265
          mmWidth = 185738
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'QUANTITY'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 122502
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = #23567#35745':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 112713
          mmTop = 1323
          mmWidth = 6879
          BandType = 5
          GroupNo = 1
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 6350
          mmTop = 5556
          mmWidth = 185738
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'total_price'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 162984
          mmTop = 1323
          mmWidth = 28310
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365068A70726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A202020202020202020202020202020202020202020202020
        20202020202020200D0A202056616C7565203A3D207472696D28202044423439
        335B27436F6D70616E795F4E616D65275D293B0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506095661726961626C6532094576656E744E616D650606
        4F6E43616C63074576656E74494402210000}
    end
    object daDataModule1: TdaDataModule
    end
  end
  object ppDB207: TppDBPipeline
    DataSource = Form3.DataSource1
    UserName = 'DB207'
    Left = 131
    Top = 154
    object ppDB207ppField1: TppField
      FieldAlias = 'GON_NUMBER'
      FieldName = 'GON_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField2: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField3: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField4: TppField
      FieldAlias = 'inv_group_name'
      FieldName = 'inv_group_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField5: TppField
      FieldAlias = 'GROUP_DESC'
      FieldName = 'GROUP_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField6: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField7: TppField
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField8: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField9: TppField
      FieldAlias = 'tax_PRICE'
      FieldName = 'tax_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField10: TppField
      FieldAlias = 'STANDARD_COST'
      FieldName = 'STANDARD_COST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField11: TppField
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField12: TppField
      FieldAlias = 'total_price'
      FieldName = 'total_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField13: TppField
      FieldAlias = 'total_notaxprice'
      FieldName = 'total_notaxprice'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField14: TppField
      FieldAlias = 'CUT_NO'
      FieldName = 'CUT_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField15: TppField
      FieldAlias = 'SO_NO'
      FieldName = 'SO_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField16: TppField
      FieldAlias = 'BARCODE_ID'
      FieldName = 'BARCODE_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField17: TppField
      FieldAlias = 'REF457_NUMBER'
      FieldName = 'REF457_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField18: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField19: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField20: TppField
      FieldAlias = 'inv_name'
      FieldName = 'inv_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField21: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField22: TppField
      FieldAlias = 'TDATE'
      FieldName = 'TDATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField23: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField24: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField25: TppField
      FieldAlias = 'GRN_NUMBER'
      FieldName = 'GRN_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField26: TppField
      FieldAlias = 'RTN_QUANTITY'
      FieldName = 'RTN_QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField27: TppField
      FieldAlias = 'SUPPLIER2'
      FieldName = 'SUPPLIER2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField28: TppField
      FieldAlias = 'total_area'
      FieldName = 'total_area'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField29: TppField
      FieldAlias = 'total_Weight'
      FieldName = 'total_Weight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField30: TppField
      FieldAlias = 'note_info'
      FieldName = 'note_info'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField31: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField32: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField33: TppField
      FieldAlias = 'FL_EMPLOYEE'
      FieldName = 'FL_EMPLOYEE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField34: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField35: TppField
      FieldAlias = 'cut_no268'
      FieldName = 'cut_no268'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField36: TppField
      FieldAlias = 'v_type'
      FieldName = 'v_type'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField37: TppField
      FieldAlias = 'yf_remark'
      FieldName = 'yf_remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField38: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField39: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField40: TppField
      FieldAlias = #24211#23384#24037#21378
      FieldName = #24211#23384#24037#21378
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDB207
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #24050#21457#25918#30340#26448#26009
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 3350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 152
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\exhale_inventory.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport3PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 164
    Top = 154
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB207'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 51329
        mmTop = 2381
        mmWidth = 83344
        BandType = 0
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 80698
        mmTop = 8731
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 3704
        mmTop = 1058
        mmWidth = 16933
        BandType = 0
      end
      object pln1: TppLine
        UserName = 'pln1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3440
        mmTop = 14552
        mmWidth = 189177
        BandType = 0
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 174096
        mmTop = 2117
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 174096
        mmTop = 6879
        mmWidth = 17463
        BandType = 0
      end
      object pdbtxtABBR_NAME: TppDBText
        UserName = 'pdbtxtABBR_NAME'
        AutoSize = True
        DataField = 'ABBR_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3387
        mmLeft = 65617
        mmTop = 17463
        mmWidth = 17526
        BandType = 0
      end
      object plbl15: TppLabel
        UserName = 'plbl15'
        Caption = #20379#24212#21830#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 15081
        BandType = 0
      end
      object plbl14: TppLabel
        UserName = 'plbl14'
        Caption = #20379#24212#21830#20195#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 6350
        mmTop = 17463
        mmWidth = 15081
        BandType = 0
      end
      object pdbtxtcode: TppDBText
        UserName = 'pdbtxtcode'
        AutoSize = True
        DataField = 'code'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3387
        mmLeft = 26194
        mmTop = 17463
        mmWidth = 6265
        BandType = 0
      end
      object plbl16: TppLabel
        UserName = 'plbl16'
        Caption = #21457#25918#26399#38388#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 93663
        mmTop = 17463
        mmWidth = 20373
        BandType = 0
      end
      object plbl17: TppLabel
        UserName = 'plbl17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 116152
        mmTop = 17463
        mmWidth = 28840
        BandType = 0
      end
      object plbl21: TppLabel
        UserName = 'plbl21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 147638
        mmTop = 17463
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pdbtxtDEPT_NAME: TppDBText
        UserName = 'pdbtxtDEPT_NAME'
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 50271
        mmTop = 529
        mmWidth = 10848
        BandType = 4
      end
      object pdbtxtGON_NUMBER: TppDBText
        UserName = 'pdbtxtGON_NUMBER'
        AutoSize = True
        DataField = 'GON_NUMBER'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3260
        mmLeft = 62706
        mmTop = 529
        mmWidth = 16002
        BandType = 4
      end
      object pdbtxtTDATE: TppDBText
        UserName = 'pdbtxtTDATE'
        DataField = 'TDATE'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 84138
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object pdbtxtQUANTITY: TppDBText
        UserName = 'pdbtxtQUANTITY'
        DataField = 'QUANTITY'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 529
        mmWidth = 10319
        BandType = 4
      end
      object pdbtxttax_PRICE: TppDBText
        UserName = 'pdbtxttax_PRICE'
        DataField = 'tax_PRICE'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 529
        mmWidth = 11906
        BandType = 4
      end
      object pdbtxtTAX_2: TppDBText
        UserName = 'pdbtxtTAX_2'
        DataField = 'TAX_2'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 158221
        mmTop = 529
        mmWidth = 3440
        BandType = 4
      end
      object pdbtxttotal_price: TppDBText
        UserName = 'pdbtxttotal_price'
        DataField = 'total_price'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 138113
        mmTop = 529
        mmWidth = 14817
        BandType = 4
      end
      object plbl11: TppLabel
        UserName = 'plbl11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3429
        mmLeft = 5027
        mmTop = 529
        mmWidth = 17187
        BandType = 4
      end
      object pdbtxtnote_info: TppDBText
        UserName = 'pdbtxtnote_info'
        DataField = 'v_type'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 169598
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object pdbtxtPO_NUMBER: TppDBText
        UserName = 'pdbtxtPO_NUMBER'
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3175
        mmLeft = 24077
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
    end
    object pftrbnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object pgrp1: TppGroup
      BreakName = 'code'
      DataPipeline = ppDB207
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'pgrp1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB207'
      object pgrphdrbnd1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object pln4: TppLine
          UserName = 'pln4'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 3440
          mmTop = 0
          mmWidth = 190500
          BandType = 3
          GroupNo = 0
        end
        object plbl10: TppLabel
          UserName = 'plbl10'
          Caption = 'BARCODE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 6615
          mmTop = 1323
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object plbl5: TppLabel
          UserName = 'plbl5'
          Caption = #37319#36141#35746#21333
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 1323
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object plbl4: TppLabel
          UserName = 'plbl4'
          Caption = #39046#29992#37096#38376
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 48154
          mmTop = 1323
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object plbl1: TppLabel
          UserName = 'plbl1'
          Caption = #20986#20179#21333
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 66146
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object plbl2: TppLabel
          UserName = 'plbl2'
          Caption = #21457#25918#26085#26399
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 83608
          mmTop = 1323
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object plbl3: TppLabel
          UserName = 'plbl3'
          Caption = #21457#25918#25968#37327
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 103717
          mmTop = 1323
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object plbl6: TppLabel
          UserName = 'plbl6'
          Caption = #21547#31246#20215
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 123296
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object plbl8: TppLabel
          UserName = 'plbl8'
          Caption = #21547#31246#37329#39069
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 137584
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object plbl7: TppLabel
          UserName = 'plbl7'
          Caption = #31246#29575
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 157163
          mmTop = 1323
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object plbl9: TppLabel
          UserName = 'plbl9'
          Caption = #20837#20179#31867#22411
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 170657
          mmTop = 1323
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
      end
      object pgrpftrbnd1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'total_price'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3704
          mmLeft = 138377
          mmTop = 529
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'QUANTITY'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = pgrp1
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3440
          mmLeft = 109009
          mmTop = 529
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'plbl201'
          Caption = #24635#35745#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 94456
          mmTop = 0
          mmWidth = 10583
          BandType = 5
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 3440
          mmTop = 0
          mmWidth = 189177
          BandType = 5
          GroupNo = 0
        end
        object plbl13: TppLabel
          UserName = 'plbl13'
          Caption = #23457#26680#20154#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 165365
          mmTop = 6350
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object pln3: TppLine
          UserName = 'pln3'
          Weight = 0.750000000000000000
          mmHeight = 529
          mmLeft = 178065
          mmTop = 8996
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object pgrp2: TppGroup
      BreakName = 'INV_PART_NUMBER'
      DataPipeline = ppDB207
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'pgrp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB207'
      object pgrphdrbnd2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object pdbtxtINV_DESCRIPTION: TppDBText
          UserName = 'pdbtxtINV_DESCRIPTION'
          DataField = 'INV_DESCRIPTION'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3175
          mmLeft = 68527
          mmTop = 794
          mmWidth = 92869
          BandType = 3
          GroupNo = 1
        end
        object plbl18: TppLabel
          UserName = 'plbl18'
          Caption = #26448#26009#35268#26684
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 53975
          mmTop = 794
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object plbl19: TppLabel
          UserName = 'plbl19'
          Caption = #26448#26009#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3260
          mmLeft = 5027
          mmTop = 709
          mmWidth = 11515
          BandType = 3
          GroupNo = 1
        end
        object pdbtxtinv_name: TppDBText
          UserName = 'pdbtxtinv_name'
          DataField = 'inv_name'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3175
          mmLeft = 21696
          mmTop = 794
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object pln5: TppLine
          UserName = 'pln5'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 3440
          mmTop = 0
          mmWidth = 190500
          BandType = 3
          GroupNo = 1
        end
      end
      object pgrpftrbnd2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object pln6: TppLine
          UserName = 'pln6'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 3440
          mmTop = 0
          mmWidth = 189177
          BandType = 5
          GroupNo = 1
        end
        object plbl20: TppLabel
          UserName = 'plbl20'
          Caption = #23567#35745#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 94456
          mmTop = 211
          mmWidth = 10668
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'QUANTITY'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = pgrp2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3440
          mmLeft = 109009
          mmTop = 529
          mmWidth = 11113
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'total_price'
          DataPipeline = ppDB207
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = pgrp2
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDB207'
          mmHeight = 3175
          mmLeft = 138642
          mmTop = 529
          mmWidth = 14552
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65334F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066870726F636564757265205661726961
        626C65334F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D207472696D2844423439335B
        27436F6D70616E795F4E616D65275D293B0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506095661726961626C6533094576656E744E616D6506064F6E
        43616C63074576656E74494402210000}
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
    Left = 203
    Top = 90
  end
  object ppDesigner3: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport3
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 203
    Top = 157
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 201
    Top = 124
  end
  object ppReportCode: TppReport
    AutoStop = False
    DataPipeline = ppDBPipelineCode
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 30000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 152
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\IQCCode.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 184
    Top = 216
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'ppDBPipelineCode'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel237: TppLabel
        UserName = 'Label237'
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 7938
        mmTop = 1058
        mmWidth = 9991
        BandType = 4
      end
      object ppLabel241: TppLabel
        UserName = 'Label241'
        Caption = #21046#36896#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 7938
        mmTop = 15610
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = #21046#36896#26085#26399
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 15610
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel242: TppLabel
        UserName = 'Label242'
        Caption = #26448#26009#25551#36848
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 7938
        mmTop = 4498
        mmWidth = 10499
        BandType = 4
      end
      object ppLabel239: TppLabel
        UserName = 'Label239'
        Caption = #25209#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 12965
        mmTop = 11906
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = #25209#21495
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 11906
        mmWidth = 45773
        BandType = 4
      end
      object ppLabel238: TppLabel
        UserName = 'Label238'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 33602
        mmTop = 19315
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel240: TppLabel
        UserName = 'Label240'
        Caption = #26377#25928#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10583
        mmTop = 19315
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 40217
        mmTop = 19315
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = #26377#25928#26399
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 19315
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = #26448#26009#32534#30721
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2879
        mmLeft = 19579
        mmTop = 1058
        mmWidth = 46038
        BandType = 4
      end
      object ppLabel244: TppLabel
        UserName = 'Label244'
        Caption = #26465#30721#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 7673
        mmTop = 23019
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = #26465#30721#32534#21495
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19315
        mmTop = 23019
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel245: TppLabel
        UserName = 'Label245'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 33602
        mmTop = 15610
        mmWidth = 7493
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = #20379#24212#21830#31616#31216
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 42333
        mmTop = 15610
        mmWidth = 8467
        BandType = 4
      end
      object ppLabel246: TppLabel
        UserName = 'Label246'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 33602
        mmTop = 23019
        mmWidth = 4995
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = #21333#20301
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 40746
        mmTop = 23019
        mmWidth = 10054
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        mmHeight = 11377
        mmLeft = 52123
        mmTop = 15346
        mmWidth = 12965
        BandType = 4
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'DBMemo16'
        CharWrap = False
        DataField = #26448#26009#25551#36848
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 6879
        mmLeft = 19579
        mmTop = 4498
        mmWidth = 45773
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDBPipelineCode: TppDBPipeline
    DataSource = dsCode
    UserName = 'DBPipelineCode'
    OnNext = ppDBPipelineCodeNext
    Left = 136
    Top = 216
    object ppDBPipelineCodeppField2: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = #26448#26009#32534#30721
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object ppDBPipelineCodeppField3: TppField
      FieldAlias = #26448#26009#35268#26684
      FieldName = #26448#26009#35268#26684
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppDBPipelineCodeppField4: TppField
      FieldAlias = #26377#25928#26399
      FieldName = #26377#25928#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppDBPipelineCodeppField5: TppField
      FieldAlias = 'IQC'#32534#21495
      FieldName = 'IQC'#32534#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipelineCodeppField6: TppField
      FieldAlias = #37319#36141#21333#21495
      FieldName = #37319#36141#21333#21495
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppDBPipelineCodeppField7: TppField
      FieldAlias = #21333#20301
      FieldName = #21333#20301
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipelineCodeppField8: TppField
      FieldAlias = #35831#36141#21407#22240
      FieldName = #35831#36141#21407#22240
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppDBPipelineCodeppField9: TppField
      FieldAlias = #26448#26009#21517#31216
      FieldName = #26448#26009#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPipelineCodeppField10: TppField
      FieldAlias = #20379#24212#21830#20195#30721
      FieldName = #20379#24212#21830#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipelineCodeppField11: TppField
      FieldAlias = #20379#24212#21830#31616#31216
      FieldName = #20379#24212#21830#31616#31216
      FieldLength = 16
      DisplayWidth = 16
      Position = 9
    end
    object ppDBPipelineCodeppField12: TppField
      FieldAlias = #20379#24212#21830#22411#21495
      FieldName = #20379#24212#21830#22411#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppDBPipelineCodeppField13: TppField
      FieldAlias = 'SGS'#32534#21495
      FieldName = 'SGS'#32534#21495
      FieldLength = 25
      DisplayWidth = 25
      Position = 11
    end
    object ppDBPipelineCodeppField14: TppField
      FieldAlias = 'SGS'#26085#26399
      FieldName = 'SGS'#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDBPipelineCodeppField15: TppField
      Alignment = taRightJustify
      FieldAlias = #26469#26009#25968#37327
      FieldName = #26469#26009#25968#37327
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 14
      Position = 13
    end
    object ppDBPipelineCodeppField16: TppField
      Alignment = taRightJustify
      FieldAlias = #26816#26597#25968#37327
      FieldName = #26816#26597#25968#37327
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 14
      Position = 14
    end
    object ppDBPipelineCodeppField17: TppField
      FieldAlias = #25209#21495
      FieldName = #25209#21495
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
    object ppDBPipelineCodeppField18: TppField
      FieldAlias = #21046#36896#26085#26399
      FieldName = #21046#36896#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object ppDBPipelineCodeppField19: TppField
      FieldAlias = 'IQC'#26816#26597#26085#26399
      FieldName = 'IQC'#26816#26597#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object ppDBPipelineCodeppField20: TppField
      FieldAlias = 'IQC'#23457#26680#26085#26399
      FieldName = 'IQC'#23457#26680#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object ppDBPipelineCodeppField21: TppField
      FieldAlias = #26159#21542#26080#21348#32032
      FieldName = #26159#21542#26080#21348#32032
      FieldLength = 2
      DisplayWidth = 2
      Position = 19
    end
    object ppDBPipelineCodeppField22: TppField
      FieldAlias = #22806#35266
      FieldName = #22806#35266
      FieldLength = 100
      DisplayWidth = 100
      Position = 20
    end
    object ppDBPipelineCodeppField23: TppField
      FieldAlias = #20135#21697#23610#23544
      FieldName = #20135#21697#23610#23544
      FieldLength = 16
      DisplayWidth = 16
      Position = 21
    end
    object ppDBPipelineCodeppField24: TppField
      FieldAlias = #26495#26009#21402#24230
      FieldName = #26495#26009#21402#24230
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object ppDBPipelineCodeppField25: TppField
      Alignment = taRightJustify
      FieldAlias = #38108#31636#21402#24230
      FieldName = #38108#31636#21402#24230
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 23
    end
    object ppDBPipelineCodeppField26: TppField
      FieldAlias = #26159#21542#21547#38108
      FieldName = #26159#21542#21547#38108
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object ppDBPipelineCodeppField27: TppField
      FieldAlias = #26159#21542#31526#21512#26631#20934
      FieldName = #26159#21542#31526#21512#26631#20934
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object ppDBPipelineCodeppField28: TppField
      FieldAlias = #21028#23450#32467#26524
      FieldName = #21028#23450#32467#26524
      FieldLength = 8
      DisplayWidth = 8
      Position = 26
    end
    object ppDBPipelineCodeppField29: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 100
      DisplayWidth = 100
      Position = 27
    end
    object ppDBPipelineCodeppField30: TppField
      FieldAlias = #26159#21542'CAF'
      FieldName = #26159#21542'CAF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppDBPipelineCodeppField32: TppField
      FieldAlias = #21402#24230#20844#24046
      FieldName = #21402#24230#20844#24046
      FieldLength = 15
      DisplayWidth = 15
      Position = 29
    end
    object ppDBPipelineCodeppField1: TppField
      FieldAlias = #26465#30721#32534#21495
      FieldName = #26465#30721#32534#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppDBPipelineCodeppField31: TppField
      FieldAlias = #26448#26009#25551#36848
      FieldName = #26448#26009#25551#36848
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppDBPipelineCodeppField33: TppField
      FieldAlias = #21517#31216#22411#21495
      FieldName = #21517#31216#22411#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
  end
  object dsCode: TDataSource
    DataSet = qryCode
    Left = 88
    Top = 216
  end
  object qryCode: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey391'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 53094
      end>
    SQL.Strings = (
      
        'SELECT dbo.data0391.rkey as '#26465#30721#32534#21495',dbo.Data0017.INV_PART_NUMBER as' +
        ' '#26448#26009#32534#30721
      ',dbo.data0391.iqc_number AS IQC'#32534#21495
      
        ',dbo.Data0070.PO_NUMBER AS '#37319#36141#21333#21495',dbo.data0002.unit_name AS '#21333#20301',dbo' +
        '.data0071.reason AS '#35831#36141#21407#22240',dbo.Data0017.INV_NAME AS '#26448#26009#21517#31216
      ',dbo.Data0017.INV_PART_DESCRIPTION AS '#26448#26009#25551#36848
      
        ',dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684', dbo.Data0023.CODE AS '#20379#24212#21830#20195 +
        #30721', dbo.Data0023.ABBR_NAME AS '#20379#24212#21830#31616#31216
      
        ',dbo.data0391.supplier_model AS '#20379#24212#21830#22411#21495', dbo.Data0017.INV_NAME + '#39 +
        ' '#39' + dbo.data0391.supplier_model AS '#21517#31216#22411#21495
      
        ',dbo.data0391.sgs_no AS SGS'#32534#21495',dbo.data0391.sgs_date AS SGS'#26085#26399', db' +
        'o.data0391.rece_qty AS '#26469#26009#25968#37327
      ',dbo.data0391.iqc_qty AS '#26816#26597#25968#37327', dbo.data0391.barch_no AS '#25209#21495
      ',dbo.data0391.manufacture_TDATE AS '#21046#36896#26085#26399
      
        ',dbo.data0391.appr_date AS IQC'#26816#26597#26085#26399',dbo.data0391.auth_date AS IQC' +
        #23457#26680#26085#26399
      
        ',case data0391.if_halogen when 1 then '#39#26159#39' else '#39#21542#39' end as '#26159#21542#26080#21348#32032',' +
        'dbo.data0391.appearance AS '#22806#35266
      
        ',dbo.data0391.part_size AS '#20135#21697#23610#23544', dbo.data0391.part_thickness AS ' +
        #26495#26009#21402#24230', dbo.data0391.tong_thickness '#38108#31636#21402#24230
      
        ',dbo.data0391.thick_tolerance AS '#21402#24230#20844#24046', dbo.data0391.ht_remark '#26159#21542 +
        #21547#38108
      
        ',dbo.data0391.if_standard AS '#26159#21542#31526#21512#26631#20934', dbo.data0391.extrl_date AS ' +
        #26377#25928#26399', dbo.data0391.judge_result AS '#21028#23450#32467#26524
      ', dbo.data0391.remark AS '#22791#27880
      ',dbo.Data0071.IF_CAF AS '#26159#21542'CAF'#9
      'FROM  dbo.DATA0391 '
      
        #9'INNER JOIN dbo.Data0071 on dbo.DATA0391.rkey71 = dbo.Data0071.R' +
        'KEY'
      
        #9'INNER join dbo.Data0017 on dbo.DATA0391.rkey17 =  dbo.Data0017.' +
        'RKEY '
      
        #9'INNER JOIN dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.R' +
        'KEY'
      
        '                INNER JOIN dbo.Data0002 ON dbo.data0071.purchase' +
        '_unit_ptr = dbo.Data0002.RKEY'
      
        '               INNER JOIN dbo.Data0023 ON dbo.Data0070.SUPPLIER_' +
        'POINTER = dbo.Data0023.RKEY'
      'WHERE data0391.rkey =  :rkey391'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 216
    object qryCodeDSDesigner2: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object qryCodeDSDesigner3: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object qryCodeDSDesigner4: TDateTimeField
      FieldName = #26377#25928#26399
    end
    object qryCodeIQC: TStringField
      FieldName = 'IQC'#32534#21495
      Size = 10
    end
    object qryCodeDSDesigner5: TStringField
      FieldName = #37319#36141#21333#21495
      Size = 15
    end
    object qryCodeDSDesigner6: TStringField
      FieldName = #21333#20301
    end
    object qryCodeDSDesigner7: TStringField
      FieldName = #35831#36141#21407#22240
      Size = 60
    end
    object qryCodeDSDesigner8: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object qryCodeDSDesigner9: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object qryCodeDSDesigner10: TStringField
      FieldName = #20379#24212#21830#31616#31216
      Size = 16
    end
    object qryCodeDSDesigner11: TStringField
      FieldName = #20379#24212#21830#22411#21495
    end
    object qryCodeSGS: TStringField
      FieldName = 'SGS'#32534#21495
      Size = 25
    end
    object qryCodeSGS2: TDateTimeField
      FieldName = 'SGS'#26085#26399
    end
    object qryCodeDSDesigner12: TBCDField
      FieldName = #26469#26009#25968#37327
      Precision = 13
    end
    object qryCodeDSDesigner13: TBCDField
      FieldName = #26816#26597#25968#37327
      Precision = 13
    end
    object qryCodeDSDesigner14: TStringField
      FieldName = #25209#21495
      Size = 100
    end
    object qryCodeDSDesigner15: TDateTimeField
      FieldName = #21046#36896#26085#26399
    end
    object qryCodeIQC2: TDateTimeField
      FieldName = 'IQC'#26816#26597#26085#26399
    end
    object qryCodeIQC3: TDateTimeField
      FieldName = 'IQC'#23457#26680#26085#26399
    end
    object qryCodeDSDesigner16: TStringField
      FieldName = #26159#21542#26080#21348#32032
      ReadOnly = True
      Size = 2
    end
    object qryCodeDSDesigner17: TWideStringField
      FieldName = #22806#35266
      Size = 100
    end
    object qryCodeDSDesigner18: TStringField
      FieldName = #20135#21697#23610#23544
      Size = 16
    end
    object qryCodeDSDesigner19: TStringField
      FieldName = #26495#26009#21402#24230
      Size = 50
    end
    object qryCodeDSDesigner20: TBCDField
      FieldName = #38108#31636#21402#24230
      Precision = 5
      Size = 2
    end
    object qryCodeDSDesigner22: TWideStringField
      FieldName = #26159#21542#21547#38108
    end
    object qryCodeDSDesigner23: TWideStringField
      FieldName = #26159#21542#31526#21512#26631#20934
      Size = 4
    end
    object qryCodeDSDesigner24: TWideStringField
      FieldName = #21028#23450#32467#26524
      Size = 8
    end
    object qryCodeDSDesigner25: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object qryCodeCAF: TWideStringField
      FieldName = #26159#21542'CAF'
      FixedChar = True
      Size = 2
    end
    object qryCodeDSDesigner21: TStringField
      FieldName = #21402#24230#20844#24046
      Size = 15
    end
    object qryCodeDSDesigner: TAutoIncField
      FieldName = #26465#30721#32534#21495
      ReadOnly = True
    end
    object qryCodeDSDesigner26: TStringField
      FieldName = #26448#26009#25551#36848
      ReadOnly = True
      Size = 100
    end
    object qryCodeDSDesigner27: TStringField
      FieldName = #21517#31216#22411#21495
      ReadOnly = True
      Size = 51
    end
  end
  object ppDesignerCode: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReportCode
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 224
    Top = 216
  end
  object ppReportPO: TppReport
    AutoStop = False
    DataPipeline = DBPipelinePO
    PrinterSetup.BinName = #32487#32493#21367#21160
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 3350
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 45000
    PrinterSetup.mmPaperWidth = 95000
    PrinterSetup.PaperSize = 152
    Template.FileName = 'D:\sjsys\NIERP\Report\PoCodeprint22.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 344
    Top = 300
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'DBPipelinePO'
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLabel247: TppLabel
        UserName = 'Label247'
        Caption = #20116#26666'   '#29289#26009#26631#31614
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 1588
        mmWidth = 29898
        BandType = 4
      end
      object ppLine141: TppLine
        UserName = 'Line141'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 5027
        mmTop = 4763
        mmWidth = 76994
        BandType = 4
      end
      object ppLine143: TppLine
        UserName = 'Line143'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 5027
        mmTop = 13758
        mmWidth = 76994
        BandType = 4
      end
      object ppLine144: TppLine
        UserName = 'Line144'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 21167
        mmTop = 4763
        mmWidth = 529
        BandType = 4
      end
      object ppLabel249: TppLabel
        UserName = 'Label249'
        Caption = #29289#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 7144
        mmWidth = 14023
        BandType = 4
      end
      object ppLine145: TppLine
        UserName = 'Line145'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5027
        mmTop = 17992
        mmWidth = 76465
        BandType = 4
      end
      object ppLabel248: TppLabel
        UserName = 'Label248'
        Caption = #35268#26684#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 14023
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel250: TppLabel
        UserName = 'Label250'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 32279
        mmWidth = 7144
        BandType = 4
      end
      object ppLine148: TppLine
        UserName = 'Line148'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 25929
        mmWidth = 76994
        BandType = 4
      end
      object ppLine150: TppLine
        UserName = 'Line150'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5027
        mmTop = 30692
        mmWidth = 76994
        BandType = 4
      end
      object ppLabel252: TppLabel
        UserName = 'Label252'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 9525
        mmTop = 26723
        mmWidth = 10541
        BandType = 4
      end
      object ppLabel254: TppLabel
        UserName = 'Label254'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 19844
        mmWidth = 7144
        BandType = 4
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'INV_PART_NUMBER'
        DataPipeline = DBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 7938
        mmLeft = 23283
        mmTop = 5821
        mmWidth = 57415
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 3979
        mmLeft = 23283
        mmTop = 14288
        mmWidth = 58208
        BandType = 4
      end
      object ppDBBarCode2: TppDBBarCode
        UserName = 'DBBarCode2'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'QUAN_ON_HAND'
        DataPipeline = DBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 5821
        mmLeft = 23283
        mmTop = 31221
        mmWidth = 58738
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        AutoSize = True
        DataField = 'BARCODE_ID'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 3979
        mmLeft = 23283
        mmTop = 19050
        mmWidth = 58208
        BandType = 4
      end
      object ppLine142: TppLine
        UserName = 'Line142'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 4763
        mmTop = 4763
        mmWidth = 529
        BandType = 4
      end
      object ppLine146: TppLine
        UserName = 'Line146'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 81756
        mmTop = 5027
        mmWidth = 529
        BandType = 4
      end
      object ppLine147: TppLine
        UserName = 'Line1501'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 37041
        mmWidth = 76994
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        AutoSize = True
        DataField = 'code23'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 3979
        mmLeft = 23283
        mmTop = 26458
        mmWidth = 58462
        BandType = 4
      end
    end
  end
  object ppDesignerPO: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReportPO
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 432
    Top = 304
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 300
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey22'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ''
      '               '
      
        '               SELECT     TOP (100) PERCENT dbo.Data0017.INV_PAR' +
        'T_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, d' +
        'bo.Data0496.GROUP_DESC, '
      
        '                      dbo.Data0022.RKEY AS rkey22, dbo.Data0023.' +
        'ABBR_NAME AS code23, dbo.Data0022.QUAN_ON_HAND, dbo.Data0022.QUA' +
        'N_TO_BE_STOCKED,                       '
      
        '                       (case when dbo.Data0022.EXPIRE_DATE IS no' +
        't NULL  then  DATEDIFF(day, GETDATE(), dbo.Data0022.EXPIRE_DATE)' +
        ' else 0 end ) AS eff_day,        '
      
        '                       dbo.Data0016.LOCATION, dbo.Data0022.EXPIR' +
        'E_DATE,dbo.Data0022.BARCODE_ID, '
      
        '                      dbo.Data0022.cust_decl, dbo.Data0070.PO_RE' +
        'V_NO,dbo.Data0456.GRN_NUMBER,'
      
        '                      dbo.Data0022.rohs, dbo.Data0022.SUPPLIER2,' +
        ' '
      
        '                      ROUND(dbo.Data0022.QUAN_ON_HAND * dbo.Data' +
        '0017.STOCK_SELL, 4) AS total_area,'
      
        '                      dbo.Data0022.PACKING_SLIP_FLAG,           ' +
        '         '
      
        '                       dbo.Data0022.STOCK_BASE, dbo.Data0022.spe' +
        'c_place, '
      
        '                      dbo.Data0019.inv_group_name, dbo.Data0022.' +
        'STOCK_BASE * dbo.Data0022.QUAN_ON_HAND AS '#24211#23384#24635#37325', dbo.Data0070.PO_' +
        'NUMBER, '
      
        '                      dbo.Data0022.TDATE, dbo.Data0016.RKEY AS r' +
        'key16, '
      
        '                       dbo.Data0070.ANALYSIS_CODE_1,  Data0005_1' +
        '.EMPLOYEE_NAME, '
      
        '                      dbo.Data0070.CONFIRMATION_NUMBER, dbo.Data' +
        '0068.PO_REQ_NUMBER,'
      
        '                      DATEDIFF(day,dbo.Data0456.ship_date, GETDA' +
        'TE()) as InDays '
      '                    '
      'FROM      dbo.Data0005 AS Data0005_1 RIGHT OUTER JOIN'
      '               dbo.Data0070 RIGHT OUTER JOIN'
      #9#9'  dbo.Data0015 INNER JOIN'
      #9#9'  dbo.Data0023 INNER JOIN'
      #9#9'  dbo.Data0456 INNER JOIN'
      #9#9'  dbo.Data0022 INNER JOIN'
      
        #9#9'  dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RK' +
        'EY INNER JOIN'
      
        #9#9'  dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY O' +
        'N dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR INNER JOIN'
      
        #9#9'  dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data000' +
        '2.RKEY ON dbo.Data0023.RKEY = dbo.Data0456.SUPP_PTR INNER JOIN'
      
        #9#9'  dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKE' +
        'Y ON dbo.Data0015.RKEY = dbo.Data0456.warehouse_ptr INNER JOIN'
      
        #9#9'  dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKE' +
        'Y LEFT OUTER JOIN'
      
        #9#9'  dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY ' +
        'LEFT OUTER JOIN'
      
        #9#9'  dbo.Data0019 ON dbo.Data0496.group_ptr = dbo.Data0019.rkey L' +
        'EFT OUTER JOIN'
      
        #9#9'  dbo.DATA0391 ON dbo.Data0022.rkey391 = dbo.DATA0391.rkey LEF' +
        'T OUTER JOIN'
      
        #9#9'  dbo.Data0005 ON dbo.DATA0391.auth_user_ptr = dbo.Data0005.RK' +
        'EY ON dbo.Data0070.RKEY = dbo.Data0456.PO_PTR LEFT OUTER JOIN'
      
        #9#9'  dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY LEFT' +
        ' OUTER JOIN'
      
        #9#9'  dbo.Data0068 ON dbo.Data0069.PURCH_REQ_PTR = dbo.Data0068.RK' +
        'EY ON Data0005_1.RKEY = dbo.Data0070.EMPLOYEE_POINTER'
      ''
      'WHERE dbo.Data0022.RKEY=:rkey22')
    Left = 80
    Top = 300
    object ADOQuery1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOQuery1INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOQuery1INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOQuery1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOQuery1rkey22: TAutoIncField
      FieldName = 'rkey22'
      ReadOnly = True
    end
    object ADOQuery1code23: TStringField
      FieldName = 'code23'
      Size = 16
    end
    object ADOQuery1QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ADOQuery1QUAN_TO_BE_STOCKED: TBCDField
      FieldName = 'QUAN_TO_BE_STOCKED'
      Precision = 18
      Size = 6
    end
    object ADOQuery1eff_day: TIntegerField
      FieldName = 'eff_day'
      ReadOnly = True
    end
    object ADOQuery1LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ADOQuery1EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ADOQuery1BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 100
    end
    object ADOQuery1cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADOQuery1PO_REV_NO: TStringField
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object ADOQuery1GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADOQuery1rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ADOQuery1SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ADOQuery1total_area: TFloatField
      FieldName = 'total_area'
      ReadOnly = True
    end
    object ADOQuery1PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1STOCK_BASE: TBCDField
      FieldName = 'STOCK_BASE'
      Precision = 8
    end
    object ADOQuery1spec_place: TStringField
      FieldName = 'spec_place'
    end
    object ADOQuery1inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ADOQuery1DSDesigner: TBCDField
      FieldName = #24211#23384#24635#37325
      ReadOnly = True
      Precision = 28
      Size = 8
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ADOQuery1rkey16: TAutoIncField
      FieldName = 'rkey16'
      ReadOnly = True
    end
    object ADOQuery1ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object ADOQuery1PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADOQuery1InDays: TIntegerField
      FieldName = 'InDays'
      ReadOnly = True
    end
  end
  object ppReportNo: TppReport
    AutoStop = False
    DataPipeline = DBPipelinePO
    PrinterSetup.BinName = #32487#32493#21367#21160
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 3350
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 45000
    PrinterSetup.mmPaperWidth = 95000
    PrinterSetup.PaperSize = 152
    Template.FileName = 'D:\sjsys\NIERP\Report\PoCodeprintNo22.rtm'
    Units = utMillimeters
    BeforePrint = ppReportNoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 344
    Top = 380
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'DBPipelinePO'
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLabel251: TppLabel
        UserName = 'Label247'
        Caption = #20116#26666'   '#29289#26009#26631#31614
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 1588
        mmWidth = 29898
        BandType = 4
      end
      object ppLine149: TppLine
        UserName = 'Line141'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 5027
        mmTop = 4763
        mmWidth = 76994
        BandType = 4
      end
      object ppLine151: TppLine
        UserName = 'Line143'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 5027
        mmTop = 13758
        mmWidth = 76994
        BandType = 4
      end
      object ppLine152: TppLine
        UserName = 'Line144'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 21167
        mmTop = 4763
        mmWidth = 529
        BandType = 4
      end
      object ppLabel253: TppLabel
        UserName = 'Label249'
        Caption = #29289#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 7144
        mmWidth = 14023
        BandType = 4
      end
      object ppLine153: TppLine
        UserName = 'Line145'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5027
        mmTop = 20902
        mmWidth = 76465
        BandType = 4
      end
      object ppLabel255: TppLabel
        UserName = 'Label248'
        Caption = #35268#26684#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 14023
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel256: TppLabel
        UserName = 'Label250'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 32279
        mmWidth = 6879
        BandType = 4
      end
      object ppLine154: TppLine
        UserName = 'Line148'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 25929
        mmWidth = 76994
        BandType = 4
      end
      object ppLine155: TppLine
        UserName = 'Line150'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5027
        mmTop = 30692
        mmWidth = 76994
        BandType = 4
      end
      object ppLabel257: TppLabel
        UserName = 'Label252'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 9525
        mmTop = 26723
        mmWidth = 10541
        BandType = 4
      end
      object ppLabel258: TppLabel
        UserName = 'Label254'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 22225
        mmWidth = 7144
        BandType = 4
      end
      object ppDBBarCode3: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'INV_PART_NUMBER'
        DataPipeline = DBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 7938
        mmLeft = 23283
        mmTop = 5821
        mmWidth = 57679
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText75: TppDBText
        UserName = 'DBText73'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 6879
        mmLeft = 23283
        mmTop = 14288
        mmWidth = 57679
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText76'
        AutoSize = True
        DataField = 'BARCODE_ID'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 4022
        mmLeft = 23283
        mmTop = 21960
        mmWidth = 17780
        BandType = 4
      end
      object ppLine156: TppLine
        UserName = 'Line142'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 4763
        mmTop = 4763
        mmWidth = 529
        BandType = 4
      end
      object ppLine157: TppLine
        UserName = 'Line146'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 32279
        mmLeft = 81756
        mmTop = 5027
        mmWidth = 529
        BandType = 4
      end
      object ppLine158: TppLine
        UserName = 'Line1501'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 37041
        mmWidth = 76994
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText74'
        AutoSize = True
        DataField = 'code23'
        DataPipeline = DBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'DBPipelinePO'
        mmHeight = 4022
        mmLeft = 23283
        mmTop = 26458
        mmWidth = 10668
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label2501'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 32279
        mmWidth = 6879
        BandType = 4
      end
    end
  end
  object DBPipelinePO: TppDBPipeline
    DataSource = DataSource4
    UserName = 'ppDBPipeline1'
    Left = 252
    Top = 304
  end
end

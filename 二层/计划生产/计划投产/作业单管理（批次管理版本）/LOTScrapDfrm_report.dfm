object frm_LOTScrapD: Tfrm_LOTScrapD
  Left = 453
  Top = 321
  Width = 481
  Height = 442
  Caption = 'LOT'#25253#24223#26126#32454#28165#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ads493: TADODataSet
    Active = True
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 192
    Top = 192
    object ads493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ads493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ads493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ads493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ads493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ads493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ads493
    Left = 224
    Top = 192
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 256
    Top = 192
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB06
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 216000
    PrinterSetup.mmPaperWidth = 279000
    PrinterSetup.PaperSize = 1
    Template.FileName = '..\NIERP\Report\LOTScrap_Report_3.rtm'
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
    Left = 296
    Top = 160
    Version = '7.01'
    mmColumnWidth = 266300
    DataPipelineName = 'ppDB06'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'LOT'#25253#24223#26126#32454#28165#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 104246
        mmTop = 11906
        mmWidth = 41540
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
        mmHeight = 15081
        mmLeft = 4233
        mmTop = 1058
        mmWidth = 21696
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 1323
        mmWidth = 46228
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'Company_Name2'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4022
        mmLeft = 25665
        mmTop = 6085
        mmWidth = 66760
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 147902
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 44450
        mmTop = 2117
        mmWidth = 38523
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'WORK_ORDER_NUMBER'
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 105304
        mmTop = 2117
        mmWidth = 42926
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 1058
        mmWidth = 263790
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 147109
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 794
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 2117
        mmWidth = 18521
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 141288
        mmLeft = 23019
        mmTop = 7143
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 147373
        mmLeft = 42069
        mmTop = 1058
        mmWidth = 794
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 6879
        mmWidth = 264055
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 8880
        mmTop = 9525
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #22312#21046#24037#24207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 24871
        mmTop = 9525
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25253#24223#32570#38519
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 9525
        mmWidth = 17198
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 62971
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #36131#20219#24037#24207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 65352
        mmTop = 9525
        mmWidth = 17727
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 147109
        mmLeft = 83873
        mmTop = 1323
        mmWidth = 794
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20316#19994#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84931
        mmTop = 2117
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #25253#24223#25968#37327#65288'PCS'#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 86254
        mmTop = 7673
        mmWidth = 16933
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 147109
        mmLeft = 103981
        mmTop = 1323
        mmWidth = 794
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = #25253#24223#25968#37327#65288'SET'#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 106363
        mmTop = 7673
        mmWidth = 16933
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 124090
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #25253#24223#25968#37327#65288'PNL'#65289
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 126471
        mmTop = 7673
        mmWidth = 16933
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 147109
        mmLeft = 144198
        mmTop = 1323
        mmWidth = 794
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #21457#29616#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 145257
        mmTop = 9525
        mmWidth = 14552
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 147373
        mmLeft = 265113
        mmTop = 1058
        mmWidth = 794
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line101'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 159544
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'MRB'#25253#24223#30830#35748
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 160602
        mmTop = 7673
        mmWidth = 16669
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 177007
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #22806#23618'AOI ERP'#28040#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 178065
        mmTop = 7673
        mmWidth = 16140
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 193940
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #30005#27979#22238#25910#30830#35748
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 194998
        mmTop = 7673
        mmWidth = 16933
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 211667
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'MRB'#22238#25910#30830#35748
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 212725
        mmTop = 7673
        mmWidth = 16669
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 141552
        mmLeft = 229130
        mmTop = 6879
        mmWidth = 794
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 246349
        mmTop = 9525
        mmWidth = 7112
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 34925
        mmWidth = 263790
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 41275
        mmWidth = 263790
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 47361
        mmWidth = 263790
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 53446
        mmWidth = 263790
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 59796
        mmWidth = 263790
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 65881
        mmWidth = 263790
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 72496
        mmWidth = 263790
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 78846
        mmWidth = 263790
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 84667
        mmWidth = 263790
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 91017
        mmWidth = 263790
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 97102
        mmWidth = 263790
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 103188
        mmWidth = 263790
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 16669
        mmWidth = 263790
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 22754
        mmWidth = 263790
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 28840
        mmWidth = 263790
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 109538
        mmWidth = 263790
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 116152
        mmWidth = 263790
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 122502
        mmWidth = 263790
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 129117
        mmWidth = 263790
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 135467
        mmWidth = 263790
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 141817
        mmWidth = 263790
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 529
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 36248
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20638
        mmLeft = 1852
        mmTop = 0
        mmWidth = 794
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20638
        mmLeft = 265642
        mmTop = 0
        mmWidth = 794
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 20373
        mmWidth = 263790
        BandType = 8
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #35828#26126':'
          '1.'#23458#25143#25509#21463#21333#24223#26102#65292#21508#24037#24207#25253#24223#30830#35748#38656#35201#23558#21333'PCS'#25253#24223#25968#25454#19982#25972'SET'#25253#24223#25968#25454#20998#24320#32479#35745
          '2.ET'#24037#24207#38656#35201#30830#35748'LOT'#25253#24223#28165#21333#21333#24223#25968#25454#19982#23454#38469#27979#35797#20986#21069#24037#24207#21333#24223#25968#25454#19968#33268#65292#24182#23558#21333#24223#26495#30011#21449
          '3.ET'#24037#24207#38656#35201#30830#35748'LOT'#25253#24223#28165#21333#25972'SET'#25253#24223#25968#25454#19982#23454#38469#25361#36873#20986#21069#24037#24207#25972'SET'#25253#24223#25968#25454#19968#33268#65292#24182#23558#25972'SET'#25253#24223#36865'MRB'#22788#29702)
        Transparent = True
        mmHeight = 17727
        mmLeft = 2646
        mmTop = 1588
        mmWidth = 261144
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #21463#25511'NO. '#65306'DG-WI-QA-005-06/00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 211403
        mmTop = 20902
        mmWidth = 52652
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 194734
        mmTop = 25135
        mmWidth = 69056
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 0
        mmWidth = 263790
        BandType = 8
      end
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
    Left = 296
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADS06
    Left = 224
    Top = 152
  end
  object ADS06: TADODataSet
    Active = True
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0025.MANU_PAR' +
      'T_NUMBER, dbo.Data0006.BOM_PTR, dbo.Data0006.RKEY'#13#10'FROM         ' +
      'dbo.Data0006 INNER JOIN'#13#10'                      dbo.Data0025 ON d' +
      'bo.Data0006.BOM_PTR = dbo.Data0025.RKEY'#13#10'where data0006.rkey=:rk' +
      'ey06'
    Parameters = <
      item
        Name = 'rkey06'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 192
    Top = 152
    object ADS06WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADS06MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      Size = 30
    end
  end
  object ppDB06: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB06'
    Left = 264
    Top = 152
    object ppDB06ppField1: TppField
      FieldAlias = 'WORK_ORDER_NUMBER'
      FieldName = 'WORK_ORDER_NUMBER'
      FieldLength = 22
      DisplayWidth = 22
      Position = 0
    end
    object ppDB06ppField2: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
  end
end

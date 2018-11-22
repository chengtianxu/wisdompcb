object Report_Frm: TReport_Frm
  Left = 414
  Top = 251
  Width = 368
  Height = 196
  Caption = #25253#34920#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB268: TppDBPipeline
    DataSource = DS1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB268'
    Left = 152
    Top = 48
    object ppDB268ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField2: TppField
      FieldAlias = #30003#39046#21333#21495
      FieldName = #30003#39046#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField3: TppField
      FieldAlias = #30003#39046#26085#26399
      FieldName = #30003#39046#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField4: TppField
      FieldAlias = #30003#35831#20154
      FieldName = #30003#35831#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField5: TppField
      FieldAlias = #23457#25209#20154
      FieldName = #23457#25209#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField6: TppField
      FieldAlias = #23457#25209#26085#26399
      FieldName = #23457#25209#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField7: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField8: TppField
      FieldAlias = #37096#38376#21517#31216
      FieldName = #37096#38376#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField9: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = #24037#21378#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField10: TppField
      FieldAlias = #29983#20135#21333#21495
      FieldName = #29983#20135#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB268ppField11: TppField
      FieldAlias = #20135#21697#21517#31216
      FieldName = #20135#21697#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object ppDB468: TppDBPipeline
    DataSource = DS2
    UserName = 'DB468'
    Left = 152
    Top = 88
    MasterDataPipelineName = 'ppDB268'
    object ppDB468ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #30003#35831#25968#37327
      FieldName = #30003#35831#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppDB468ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = #21457#25918#25968#37327
      FieldName = #21457#25918#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDB468ppField3: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppDB468ppField4: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = #26448#26009#32534#30721
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppDB468ppField5: TppField
      FieldAlias = #21517#31216'/'#35268#26684
      FieldName = #21517#31216'/'#35268#26684
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDB468ppField6: TppField
      FieldAlias = #21333#20301
      FieldName = #21333#20301
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDB468ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #24635#24211#23384#21442#32771#25968#37327
      FieldName = #24635#24211#23384#21442#32771#25968#37327
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 6
    end
    object ppDB468ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLOW_NO'
      FieldName = 'FLOW_NO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB468ppField9: TppField
      FieldAlias = #20379#24212#21830
      FieldName = #20379#24212#21830
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB468
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 150000
    PrinterSetup.mmPaperWidth = 215000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\SJSYS\NIERP\Report\Rep268.rtm'
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
    Left = 232
    Top = 48
    Version = '7.01'
    mmColumnWidth = 202300
    DataPipelineName = 'ppDB468'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #23041#21147#22266#37096#38376#39046#26009#30003#35831#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7144
        mmLeft = 71438
        mmTop = 3969
        mmWidth = 67733
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #30003#39046#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 12965
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #30003#39046#21333#21495
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 26194
        mmTop = 12965
        mmWidth = 40217
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #30003#39046#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 24871
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #30003#39046#26085#26399
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 25929
        mmTop = 24342
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #30003#35831#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 19050
        mmWidth = 13758
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = #30003#35831#20154
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4498
        mmLeft = 25929
        mmTop = 18785
        mmWidth = 28840
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #37096#38376#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 142082
        mmTop = 19315
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = #37096#38376#21517#31216
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 161132
        mmTop = 19315
        mmWidth = 35454
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #24037#21378#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 13229
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = #24037#21378#21517#31216
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 161396
        mmTop = 13229
        mmWidth = 32808
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #20135#21697#32534#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 70115
        mmTop = 13494
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = #20135#21697#32534#30721
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4763
        mmLeft = 89165
        mmTop = 13494
        mmWidth = 37306
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #20135#21697#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 70115
        mmTop = 19315
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = #20135#21697#21517#31216
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 89165
        mmTop = 19315
        mmWidth = 49477
        BandType = 1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = #20379#24212#21830
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4022
        mmLeft = 161925
        mmTop = 5821
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 202300
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 47890
        mmTop = 0
        mmWidth = 2910
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 119856
        mmTop = 0
        mmWidth = 2646
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 138642
        mmTop = 0
        mmWidth = 3440
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 158750
        mmTop = 0
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #21517#31216'/'#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 75406
        mmTop = 1588
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 144198
        mmTop = 1588
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 172773
        mmTop = 1852
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #30003#35831#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 121179
        mmTop = 2117
        mmWidth = 16933
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 0
        mmTop = 0
        mmWidth = 202300
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 200290
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 0
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 47890
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 119856
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 138642
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 158750
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #26448#26009#32534#30721
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 1588
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = #21517#31216'/'#35268#26684
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4022
        mmLeft = 49742
        mmTop = 1852
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #21333#20301
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4763
        mmLeft = 142082
        mmTop = 1588
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #22791#27880
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4022
        mmLeft = 161132
        mmTop = 1588
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = #30003#35831#25968#37327
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 3969
        mmLeft = 123296
        mmTop = 2117
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #23457#25209#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 2910
        mmWidth = 13758
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #23457#25209#20154
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 17992
        mmTop = 2910
        mmWidth = 33338
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = #23457#25209#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 55298
        mmTop = 3175
        mmWidth = 17992
        BandType = 8
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = #23457#25209#26085#26399
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 74348
        mmTop = 3175
        mmWidth = 42863
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 124884
        mmTop = 3440
        mmWidth = 9525
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = #22791#27880
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 135732
        mmTop = 2910
        mmWidth = 61648
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
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
    Left = 232
    Top = 91
  end
  object DS1: TDataSource
    DataSet = ADS268
    Left = 112
    Top = 48
  end
  object DS2: TDataSource
    DataSet = ADS468
    Left = 112
    Top = 91
  end
  object ADS268: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#30003#39046#21333#21495', dbo.D' +
      'ATA0268.DATE AS '#30003#39046#26085#26399', dbo.Data0005.EMPLOYEE_NAME AS '#30003#35831#20154', '#13#10'     ' +
      '                 Data0005_1.EMPLOYEE_NAME AS '#23457#25209#20154', dbo.DATA0268.a' +
      'uth_date AS '#23457#25209#26085#26399', dbo.DATA0268.reference AS '#22791#27880', '#13#10'              ' +
      '        dbo.Data0034.DEPT_NAME AS '#37096#38376#21517#31216', dbo.Data0015.ABBR_NAME A' +
      'S '#24037#21378#21517#31216' ,dbo.data0268.CUT_NO as '#29983#20135#21333#21495', dbo.Data0008.PRODUCT_NAME A' +
      'S '#20135#21697#21517#31216#13#10'FROM         dbo.Data0008 INNER JOIN'#13#10'                  ' +
      '    dbo.data0492 ON dbo.Data0008.RKEY = dbo.data0492.BOM_PTR RIG' +
      'HT OUTER JOIN'#13#10'                      dbo.DATA0268 INNER JOIN'#13#10'  ' +
      '                    dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.' +
      'Data0034.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON ' +
      'dbo.DATA0268.EMPL_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN'#13#10'     ' +
      '                 dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth' +
      '_emplptr = Data0005_1.RKEY INNER JOIN'#13#10'                      dbo' +
      '.Data0015 ON dbo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY ON d' +
      'bo.data0492.CUT_NO = dbo.DATA0268.CUT_NO'#13#10#13#10'where dbo.DATA0268.r' +
      'key =:rkey268'#13#10#13#10
    IndexFieldNames = 'rkey'
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 48
    object ADS268rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS268DSDesigner: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object ADS268DSDesigner2: TDateTimeField
      FieldName = #30003#39046#26085#26399
    end
    object ADS268DSDesigner3: TStringField
      FieldName = #30003#35831#20154
      Size = 16
    end
    object ADS268DSDesigner4: TStringField
      FieldName = #23457#25209#20154
      Size = 16
    end
    object ADS268DSDesigner5: TDateTimeField
      FieldName = #23457#25209#26085#26399
    end
    object ADS268DSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ADS268DSDesigner7: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object ADS268DSDesigner8: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 10
    end
    object ADS268DSDesigner9: TStringField
      FieldName = #29983#20135#21333#21495
      FixedChar = True
      Size = 10
    end
    object ADS268DSDesigner10: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
  end
  object ADS468: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0468.FLOW_NO,dbo.Data0468.QUAN_BOM AS '#30003#35831#25968#37327', d' +
      'bo.Data0468.QUAN_ISSUED AS '#21457#25918#25968#37327', dbo.Data0468.VENDOR AS '#22791#27880', '#13#10'  ' +
      '                    dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.Da' +
      'ta0017.INV_PART_DESCRIPTION AS ['#21517#31216'/'#35268#26684'], dbo.Data0002.UNIT_NAME A' +
      'S '#21333#20301', dbo.Data0017.QUAN_ON_HAND AS '#24635#24211#23384#21442#32771#25968#37327#13#10'                    ' +
      '  ,dbo.Data0468.VENDOR as '#20379#24212#21830#13#10'FROM         dbo.Data0468 INNER J' +
      'OIN'#13#10'                      dbo.Data0017 ON dbo.Data0468.INVENT_P' +
      'TR = dbo.Data0017.RKEY INner join'#13#10'                      dbo.Dat' +
      'a0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'#13#10#13#10'WHER' +
      'E  dbo.Data0468.FLOW_NO=:rkey'
    DataSource = DS1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 57
      end>
    Left = 64
    Top = 88
    object ADS468DSDesigner: TFloatField
      FieldName = #30003#35831#25968#37327
    end
    object ADS468DSDesigner2: TFloatField
      FieldName = #21457#25918#25968#37327
    end
    object ADS468DSDesigner3: TStringField
      FieldName = #22791#27880
      Size = 15
    end
    object ADS468DSDesigner4: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADS468DSDesigner5: TStringField
      FieldName = #21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object ADS468DSDesigner6: TStringField
      FieldName = #21333#20301
    end
    object ADS468DSDesigner7: TBCDField
      FieldName = #24635#24211#23384#21442#32771#25968#37327
      Precision = 19
    end
    object ADS468FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADS468DSDesigner8: TStringField
      FieldName = #20379#24212#21830
      Size = 30
    end
  end
end

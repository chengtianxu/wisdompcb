object Form_report: TForm_report
  Left = 557
  Top = 295
  Width = 206
  Height = 263
  Caption = 'Form_report'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = DM.aq0493
    Left = 61
    Top = 34
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 92
    Top = 34
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
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB95
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
    Template.FileName = 'R:\NIERP\Report\returen_supp_WZ.rtm'
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
    Left = 134
    Top = 138
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB95'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 157692
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5842
        mmLeft = 57833
        mmTop = 1852
        mmWidth = 67691
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
        mmLeft = 9525
        mmTop = 1323
        mmWidth = 13229
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
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 11113
        mmWidth = 17727
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4498
        mmTop = 52123
        mmWidth = 185209
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
        mmHeight = 4191
        mmLeft = 16404
        mmTop = 24342
        mmWidth = 14224
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
        mmHeight = 4191
        mmLeft = 33338
        mmTop = 24342
        mmWidth = 30099
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
        mmTop = 30692
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
        mmHeight = 4191
        mmLeft = 33867
        mmTop = 30692
        mmWidth = 33274
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
        mmTop = 43127
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
        mmTop = 43392
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
        mmTop = 36513
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
        mmHeight = 4191
        mmLeft = 33867
        mmTop = 37042
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
        mmHeight = 4191
        mmLeft = 149754
        mmTop = 23548
        mmWidth = 17780
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
        mmHeight = 4191
        mmLeft = 169069
        mmTop = 23548
        mmWidth = 16510
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
        mmTop = 57944
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
        mmLeft = 103188
        mmTop = 59531
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
        mmHeight = 4191
        mmLeft = 34131
        mmTop = 57944
        mmWidth = 22606
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
        mmHeight = 4191
        mmLeft = 82550
        mmTop = 59531
        mmWidth = 17780
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
        mmTop = 64294
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 64558
        mmWidth = 16669
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
        mmTop = 72231
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
        mmTop = 72231
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
        mmHeight = 4191
        mmLeft = 82021
        mmTop = 73025
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB95
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 73025
        mmWidth = 20373
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
        mmTop = 79640
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
        mmTop = 86519
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 79640
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 86519
        mmWidth = 43656
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
        mmTop = 93663
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
        mmTop = 93663
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
        mmHeight = 4191
        mmLeft = 82286
        mmTop = 93927
        mmWidth = 17780
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
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 93927
        mmWidth = 10848
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
        mmTop = 101336
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'TDATE'
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
        mmTop = 101336
        mmWidth = 11377
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
        mmTop = 108744
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 108744
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 108479
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
        mmHeight = 4191
        mmLeft = 82021
        mmTop = 108479
        mmWidth = 17780
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
        mmTop = 116417
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
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 123561
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 116681
        mmWidth = 34396
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
        Transparent = True
        DataPipelineName = 'ppDB95'
        mmHeight = 4233
        mmLeft = 34131
        mmTop = 123825
        mmWidth = 39423
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
      mmHeight = 15875
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB2211
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB2211'
        mmHeight = 4191
        mmLeft = 33867
        mmTop = 2910
        mmWidth = 33274
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 20638
        mmTop = 2910
        mmWidth = 10668
        BandType = 8
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB2211
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB2211'
        mmHeight = 4191
        mmLeft = 34131
        mmTop = 8202
        mmWidth = 33274
        BandType = 8
      end
    end
  end
  object ADO22: TADOQuery
    Connection = DM.ADOConnection1
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
      '      dbo.Data0456.TTYPE,dbo.Data0096.reference_number as '#22791#27880#20449#24687
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
    Left = 32
    Top = 73
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
    object ADO22DSDesigner: TStringField
      FieldName = #22791#27880#20449#24687
      FixedChar = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO22
    Left = 62
    Top = 73
  end
  object ppDB22: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB22'
    Left = 94
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
  end
  object DataSource3: TDataSource
    DataSet = DM.ADO2211
    Left = 62
    Top = 107
  end
  object ppDB2211: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB2211'
    Left = 94
    Top = 106
    object ppDBPipeline1ppField23: TppField
      FieldAlias = 'NOTE_PAD_LINE_1'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = 'NOTE_PAD_LINE_2'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = 'NOTE_PAD_LINE_3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = 'NOTE_PAD_LINE_4'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
  end
  object ADO95: TADOQuery
    Connection = DM.ADOConnection1
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
      'SELECT dbo.Data0095.QUANTITY, dbo.Data0095.SHIPPING_METHOD, '
      
        '      dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRI' +
        'PTION, '
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0095.TRAN_DATE, '
      '      dbo.Data0095.REFERENCE_NUMBER, dbo.Data0071.QUAN_ORD, '
      
        '      dbo.Data0002.UNIT_NAME, dbo.Data0071.tax_PRICE AS po_price' +
        ', '
      '      dbo.Data0071.CONVERSION_FACTOR, dbo.Data0070.PO_NUMBER, '
      
        '      dbo.Data0070.PO_DATE, dbo.Data0022.tax_PRICE as price, dbo' +
        '.Data0022.TAX_2, '
      '      dbo.Data0456.TTYPE'
      'FROM dbo.Data0071 INNER JOIN'
      
        '      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY RI' +
        'GHT OUTER JOIN'
      '      dbo.Data0002 INNER JOIN'
      '      dbo.Data0456 INNER JOIN'
      '      dbo.Data0095 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0095.TRAN_BY = dbo.Data0005.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY ' +
        'ON '
      '      dbo.Data0456.RKEY = dbo.Data0022.GRN_PTR ON '
      '      dbo.Data0002.RKEY = dbo.Data0022.LOCATION_PTR_FROM ON '
      '      dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR'
      'where data0095.rkey=:rkey'
      ' '
      ' ')
    Left = 32
    Top = 138
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
  end
  object DataSource4: TDataSource
    DataSet = ADO95
    Left = 70
    Top = 138
  end
  object ppDB95: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB95'
    Left = 94
    Top = 137
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
    Left = 134
    Top = 172
  end
end

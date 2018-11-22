object FrmReport1: TFrmReport1
  Left = 404
  Top = 241
  Width = 194
  Height = 156
  Caption = 'FrmReport1'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOData0493: TADOQuery
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 14
    Top = 60
  end
  object DataSource1: TDataSource
    DataSet = Query60
    Left = 47
    Top = 20
  end
  object DataSource4: TDataSource
    DataSet = ADOData0493
    Left = 47
    Top = 60
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = SO_Info
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2540
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 10160
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\SJSYS\NIERP\Report\MKT_RPT_01.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 117
    Top = 23
    Version = '7.01'
    mmColumnWidth = 197379
    DataPipelineName = 'SO_Info'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #26410#23436#25104#38144#21806#35746#21333#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 16
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 6615
        mmLeft = 1588
        mmTop = 12171
        mmWidth = 58738
        BandType = 1
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'Company_Name'
        DataPipeline = Data0493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Courier New'
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Data0493'
        mmHeight = 7938
        mmLeft = 68263
        mmTop = 1588
        mmWidth = 128588
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #25253#34920#32534#21495#65306'S001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 13494
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #23458#25143#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 67998
        mmTop = 12700
        mmWidth = 10583
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #33267
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 101865
        mmTop = 12700
        mmWidth = 3440
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'fm_customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 80496
        mmTop = 12700
        mmWidth = 20249
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'to_customer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 107641
        mmTop = 12700
        mmWidth = 19403
        BandType = 1
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #19979#21333#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 137584
        mmTop = 12700
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = #33267
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 12700
        mmWidth = 3440
        BandType = 1
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'fm_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 157559
        mmTop = 12700
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'to_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 184706
        mmTop = 12700
        mmWidth = 11853
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label31'
        Caption = #25171#21360#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4304
        mmLeft = 218282
        mmTop = 3175
        mmWidth = 17639
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4304
        mmLeft = 237067
        mmTop = 3175
        mmWidth = 33443
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Color = clNavy
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 1588
        mmLeft = 529
        mmTop = 9260
        mmWidth = 281782
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #23458#25143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 3969
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53446
        mmTop = 3969
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 3969
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #37319#36141#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 3969
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 3969
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #35746#36135#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3703
        mmLeft = 135466
        mmTop = 3969
        mmWidth = 12964
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = #20132#36135#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 176477
        mmTop = 3969
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #25237#20135#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 148961
        mmTop = 3969
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #19979#21333#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 3969
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #20132#36135#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 3969
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = #27424#36135#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 204788
        mmTop = 3969
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #22791#27880#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 262996
        mmTop = 3704
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = #27424#36135
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 229923
        mmTop = 3704
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #38754#31215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237067
        mmTop = 3704
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #19994#21153#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3703
        mmLeft = 24605
        mmTop = 3969
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #24037#33402#20195#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 76994
        mmTop = 3969
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #24211#23384#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 216430
        mmTop = 3704
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = #27424#36135#22825#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 247121
        mmTop = 3704
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = #23458#25143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 176477
        mmTop = 529
        mmWidth = 12700
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'cust_code'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 44186
        mmTop = 1058
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MANU_PART_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 52917
        mmTop = 1058
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'MANU_PART_DESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 88106
        mmTop = 1058
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'po_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 116946
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'sales_order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 1058
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'parts_ordered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 135202
        mmTop = 1058
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'due_date'
        DisplayFormat = 'm/d'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 1058
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'qty_plannned'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 148961
        mmTop = 1058
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'ent_date'
        DisplayFormat = 'm/d'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 163777
        mmTop = 1058
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'parts_shipped'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 190236
        mmTop = 1058
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'parts_needed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 203200
        mmTop = 1058
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'REFERENCE_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 262996
        mmTop = 1058
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'sq_needed'
        DisplayFormat = '#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 229659
        mmTop = 1058
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'sales_rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 25135
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'prod_code'
        DataPipeline = SO_Info
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'SO_Info'
        mmHeight = 3175
        mmLeft = 77258
        mmTop = 1058
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'qty_on_hand'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 216165
        mmTop = 1058
        mmWidth = 11906
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 1323
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 24606
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 43127
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 52123
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 76729
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 87313
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 116152
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 134673
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 148432
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 162984
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 176213
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 189707
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 202936
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 215636
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 228865
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 245798
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 281253
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtInteger
        DisplayFormat = '#,0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 248180
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5556
        mmLeft = 262203
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Color = clGray
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 281782
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'TIMES NEW ROMAN'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 268871
        mmTop = 1323
        mmWidth = 14252
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        CalcOrder = 0
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 32544
        mmTop = 10848
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'Label32'
        Caption = #19968#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 18256
        mmTop = 10848
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable4: TppVariable
        UserName = 'Variable4'
        CalcOrder = 1
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 70115
        mmTop = 11113
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = #20108#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 54240
        mmTop = 11113
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable5: TppVariable
        UserName = 'Variable5'
        CalcOrder = 2
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 107950
        mmTop = 11113
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = #22235#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 92075
        mmTop = 11113
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable6: TppVariable
        UserName = 'Variable6'
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 141288
        mmTop = 11113
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = #20845#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 125413
        mmTop = 11113
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable7: TppVariable
        UserName = 'Variable7'
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 175419
        mmTop = 11113
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = #20843#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 159544
        mmTop = 11113
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable8: TppVariable
        UserName = 'Variable8'
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 207963
        mmTop = 11113
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = #21313#23618#24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 192088
        mmTop = 11113
        mmWidth = 14023
        BandType = 7
      end
      object ppVariable9: TppVariable
        UserName = 'Variable9'
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 247386
        mmTop = 10848
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = #24635#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'ARIAL'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 237067
        mmTop = 11113
        mmWidth = 8467
        BandType = 7
      end
      object ppLine26: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 227278
        mmTop = 9260
        mmWidth = 2910
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'layers'
      DataPipeline = SO_Info
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'SO_Info'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'sq_needed'
          DataPipeline = SO_Info
          DisplayFormat = '#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'ARIAL'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'SO_Info'
          mmHeight = 3175
          mmLeft = 229394
          mmTop = 1058
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'layers'
          DataPipeline = SO_Info
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'ARIAL'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'SO_Info'
          mmHeight = 3175
          mmLeft = 196321
          mmTop = 1058
          mmWidth = 4763
          BandType = 5
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = #21512#35745#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'ARIAL'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 206111
          mmTop = 1058
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = #23618#25968#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'ARIAL'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 186267
          mmTop = 1058
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLine23: TppLine
          UserName = 'Line11'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 1323
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'Line24'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 281253
          mmTop = 0
          mmWidth = 265
          BandType = 5
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line22'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 184415
          mmTop = 5027
          mmWidth = 65617
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066670726F636564757265205661726961
        626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A76616C75653A3D43757272656E74446174652D534F5F496E
        666F5B276475655F64617465275D3B0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506095661726961626C6531094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060F5661726961626C65334F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506877072
        6F636564757265205661726961626C65334F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A69662020534F5F496E666F
        5B276C6179657273275D3D31207468656E0D0A202056616C7565203A3D207661
        6C7565202B200D0A534F5F496E666F5B2773715F6E6565646564275D3B0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C65330945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060F5661726961
        626C65344F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F75726365068770726F636564757265205661726961626C65344F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A69662020534F5F496E666F5B276C6179657273275D3D32207468656E0D
        0A202056616C7565203A3D2076616C7565202B200D0A534F5F496E666F5B2773
        715F6E6565646564275D3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        6506095661726961626C6534094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060F5661726961626C65354F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F75726365068770726F636564
        757265205661726961626C65354F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A69662020534F5F496E666F5B276C61
        79657273275D3D34207468656E0D0A202056616C7565203A3D2076616C756520
        2B200D0A534F5F496E666F5B2773715F6E6565646564275D3B0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D6506095661726961626C6535094576656E74
        4E616D6506064F6E43616C63074576656E74494402210001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060F5661726961626C6536
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068770726F636564757265205661726961626C65364F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A69
        662020534F5F496E666F5B276C6179657273275D3D36207468656E0D0A202056
        616C7565203A3D2076616C7565202B200D0A534F5F496E666F5B2773715F6E65
        65646564275D3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060956
        61726961626C6536094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060F5661726961626C65374F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F75726365068770726F63656475726520
        5661726961626C65374F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A69662020534F5F496E666F5B276C6179657273
        275D3D38207468656E0D0A202056616C7565203A3D2076616C7565202B200D0A
        534F5F496E666F5B2773715F6E6565646564275D3B0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6537094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060F5661726961626C65384F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365068870726F636564757265205661726961626C65384F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A6966202053
        4F5F496E666F5B276C6179657273275D3D3130207468656E0D0A202056616C75
        65203A3D2076616C7565202B200D0A534F5F496E666F5B2773715F6E65656465
        64275D3B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060956617269
        61626C6538094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F5661726961626C65394F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365066B70726F63656475726520566172
        6961626C65394F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D2076616C7565202B200D
        0A534F5F496E666F5B2773715F6E6565646564275D3B0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D6506095661726961626C6539094576656E744E616D
        6506064F6E43616C63074576656E74494402210000}
    end
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    UserName = 'Data0493'
    Left = 80
    Top = 60
    object Data0493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object Data0493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object Data0493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object Data0493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object Data0493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object Data0493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object Data0493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object Data0493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object Data0493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object Query60: TADOQuery
    Connection = DM.Conn
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'SELECT DISTINCT '
      
        '      data0010.cust_code, data0010.customer_name, data0025.ANALY' +
        'SIS_CODE_2, '
      '      data0025.MANU_PART_NUMBER, data0025.MANU_PART_DESC, '
      
        '      data0060.to_be_planned, data0008.product_name, data0097.po' +
        '_number, '
      '      data0060.sales_order, data0060.orig_request_date , '
      
        '    data0025.layers, data0060.orig_sched_ship_date , data0023.ab' +
        'br_name,'
      
        '      data0060.qty_plannned, data0060.prod_rel, data0060.rkey, d' +
        'ata0008.prod_code,'
      
        '     data0025.qty_on_hand, data0060.so_tp, data0009.SALES_REP_NA' +
        'ME,'
      
        '      data0001.curr_code, data0060.part_price, data0060.exch_rat' +
        'e, data0060.ent_date, '
      
        '      data0060.status, data0060.REFERENCE_NUMBER, data0060.parts' +
        '_ordered, '
      
        '      data0060.parts_shipped, data0060.parts_returned, data0060.' +
        'parts_invoiced,'
      'data0060.ISSUED_QTY, '
      
        '     CASE WHEN data0060.parts_ordered - data0060.parts_shipped >' +
        ' 0 THEN data0060.parts_ordered'
      '       - data0060.parts_shipped ELSE 0 END AS parts_needed,'
      '          (SELECT SUM(free_amount)'
      '         FROM data0062'
      '         WHERE so_ptr = data0060.rkey'
      '         GROUP BY so_ptr) AS free_amount, data0060.sch_date , '
      '      data0060.total_add_l_price, data0060.returned_ship, '
      '      data0025.unit_sq AS parameter_value, '
      '      data0060.parts_ordered * data0025.unit_sq AS sq_parts, '
      
        '      (data0060.parts_returned - data0060.returned_ship)  AS sq_' +
        'needed1, '
      
        '      CASE WHEN data0060.parts_ordered - data0060.parts_shipped ' +
        '> 0 THEN (data0060.parts_ordered'
      
        '       - data0060.parts_shipped) * data0025.unit_sq ELSE 0 END A' +
        'S sq_needed'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0097 ON       dbo.Data0060.PURCHASE_ORDER_PTR = db' +
        'o.Data0097.RKEY INNER JOIN'
      
        '      dbo.Data0008 ON       dbo.Data0025.PROD_CODE_PTR = dbo.Dat' +
        'a0008.RKEY INNER JOIN'
      
        '      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0009 ON       dbo.Data0010.SALES_REP_PTR = dbo.Dat' +
        'a0009.RKEY left outer join '
      '       data0023  on data0060.supplier_ptr=data0023.rkey      '
      '')
    Left = 14
    Top = 20
    object Query60cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object Query60customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object Query60ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object Query60MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Query60MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Query60to_be_planned: TIntegerField
      FieldName = 'to_be_planned'
    end
    object Query60product_name: TStringField
      FieldName = 'product_name'
      Size = 30
    end
    object Query60po_number: TStringField
      FieldName = 'po_number'
      Size = 25
    end
    object Query60sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object Query60orig_request_date: TDateTimeField
      FieldName = 'orig_request_date'
    end
    object Query60layers: TWordField
      FieldName = 'layers'
    end
    object Query60orig_sched_ship_date: TDateTimeField
      FieldName = 'orig_sched_ship_date'
    end
    object Query60qty_plannned: TIntegerField
      FieldName = 'qty_plannned'
    end
    object Query60prod_rel: TStringField
      FieldName = 'prod_rel'
      FixedChar = True
      Size = 1
    end
    object Query60rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Query60prod_code: TStringField
      FieldName = 'prod_code'
      Size = 10
    end
    object Query60qty_on_hand: TIntegerField
      FieldName = 'qty_on_hand'
    end
    object Query60so_tp: TWordField
      FieldName = 'so_tp'
    end
    object Query60SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object Query60curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object Query60part_price: TFloatField
      FieldName = 'part_price'
    end
    object Query60exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object Query60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object Query60status: TWordField
      FieldName = 'status'
    end
    object Query60REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object Query60parts_ordered: TFloatField
      FieldName = 'parts_ordered'
    end
    object Query60parts_shipped: TFloatField
      FieldName = 'parts_shipped'
    end
    object Query60parts_returned: TFloatField
      FieldName = 'parts_returned'
    end
    object Query60parts_invoiced: TFloatField
      FieldName = 'parts_invoiced'
    end
    object Query60ISSUED_QTY: TIntegerField
      FieldName = 'ISSUED_QTY'
    end
    object Query60parts_needed: TFloatField
      FieldName = 'parts_needed'
      ReadOnly = True
    end
    object Query60free_amount: TFloatField
      FieldName = 'free_amount'
      ReadOnly = True
    end
    object Query60sch_date: TDateTimeField
      FieldName = 'sch_date'
    end
    object Query60total_add_l_price: TFloatField
      FieldName = 'total_add_l_price'
    end
    object Query60returned_ship: TIntegerField
      FieldName = 'returned_ship'
    end
    object Query60parameter_value: TFloatField
      FieldName = 'parameter_value'
    end
    object Query60sq_parts: TFloatField
      FieldName = 'sq_parts'
      ReadOnly = True
    end
    object Query60sq_needed1: TFloatField
      FieldName = 'sq_needed1'
      ReadOnly = True
    end
    object Query60sq_needed: TFloatField
      FieldName = 'sq_needed'
      ReadOnly = True
    end
    object Query60abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
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
    Left = 113
    Top = 60
  end
  object SO_Info: TppDBPipeline
    DataSource = DataSource1
    UserName = 'SO_Info'
    Left = 83
    Top = 21
  end
end

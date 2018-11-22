object Form_Report: TForm_Report
  Left = 453
  Top = 190
  Width = 452
  Height = 259
  Caption = #25171#21360#31383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB530
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\Invoice529_6.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 143
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'DB530'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40217
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'Company_Name3'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 5556
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'ship_address'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 3704
        mmLeft = 139171
        mmTop = 794
        mmWidth = 18785
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = DB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'DB493'
        mmHeight = 10054
        mmLeft = 529
        mmTop = 265
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 794
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label51'
        Caption = 'Tel: 0755-27507238'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 4763
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label52'
        Caption = 'FAX: 0755-27507715'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 4763
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label53'
        Caption = 'E-MAIL:marketing@zhhdi.com'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 8731
        mmWidth = 43127
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label54'
        Caption = 'Invoice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 91281
        mmTop = 8996
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label55'
        Caption = '(Made in china)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 83079
        mmTop = 14552
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label57'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 36513
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label58'
        Caption = 'TEL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 59531
        mmTop = 31750
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label59'
        Caption = 'ATTN:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 31750
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label60'
        Caption = 'INVOICE_NO:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 12700
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label61'
        Caption = 'DATE:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 16933
        mmWidth = 9260
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'shipadvice_no'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3704
        mmLeft = 152136
        mmTop = 12700
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText39'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 22225
        mmWidth = 22754
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 141288
        mmTop = 16933
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText50'
        AutoSize = True
        DataField = 'SHIP_TO_CONTACT'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3662
        mmLeft = 10583
        mmTop = 31750
        mmWidth = 30755
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText51'
        AutoSize = True
        DataField = 'ship_to_phone'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3662
        mmLeft = 66675
        mmTop = 31750
        mmWidth = 20743
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#33521#25991#21517#31216
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3704
        mmLeft = 14552
        mmTop = 26988
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'FAX:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 31750
        mmWidth = 7144
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'SHIP_TO_FAX'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3662
        mmLeft = 124354
        mmTop = 31750
        mmWidth = 21527
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label5'
        Caption = #35746#36135#20844#21496':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3662
        mmLeft = 794
        mmTop = 22225
        mmWidth = 13589
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label3'
        Caption = #20184#27454#36174#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 31750
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20184#27454#26041#24335
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 31750
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #23458#25143#35814#32454#22320#22336
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3662
        mmLeft = 8467
        mmTop = 36513
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label4'
        Caption = 'CURRENCY:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 36513
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'curr_code'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3704
        mmLeft = 177271
        mmTop = 36513
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label6'
        Caption = 'Addr:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 131498
        mmTop = 794
        mmWidth = 7673
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 41010
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 63500
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 96838
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 135467
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 156104
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 175684
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3239
        mmLeft = 1058
        mmTop = 2381
        mmWidth = 17844
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3175
        mmLeft = 42333
        mmTop = 2117
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = #25968#37327
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3239
        mmLeft = 138642
        mmTop = 2117
        mmWidth = 17082
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'PART_PRICE'
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3239
        mmLeft = 156898
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = #37329#39069
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3239
        mmLeft = 177007
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #23458#25143#22411#21495
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 7144
        mmLeft = 64558
        mmTop = 529
        mmWidth = 31221
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #23458#25143#29289#26009#21495
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 7144
        mmLeft = 97896
        mmTop = 529
        mmWidth = 36248
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 0
        mmTop = 8202
        mmWidth = 197300
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label8'
        Caption = #24635#24037#20855#36153#29992'(Tool fee ):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 9260
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'other_total'
        DataPipeline = DB530
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB530'
        mmHeight = 3598
        mmLeft = 177007
        mmTop = 9260
        mmWidth = 15113
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'rkey529'
      DataPipeline = DB530
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DB530'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          ParentWidth = True
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 41010
          mmTop = 0
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 63500
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 96838
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 135467
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 156104
          mmTop = 0
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11377
          mmLeft = 175684
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = #21512#21516#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 12965
          mmTop = 1588
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'P/O No.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 12435
          mmTop = 5821
          mmWidth = 11303
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = #36135#21495
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 47361
          mmTop = 1588
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = 'Art no'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 46567
          mmTop = 5821
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = #21697#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 74348
          mmTop = 1588
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'Description'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 70908
          mmTop = 5821
          mmWidth = 15833
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = #29289#26009#32534#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 107950
          mmTop = 1588
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'Material NO.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 106627
          mmTop = 5821
          mmWidth = 17801
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = #25968#37327'(PCS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 136790
          mmTop = 1588
          mmWidth = 14986
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label41'
          Caption = 'Quantity'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 139436
          mmTop = 5821
          mmWidth = 11769
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label42'
          Caption = #21333#20215
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 157427
          mmTop = 1588
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          Caption = 'Unit Price'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 158221
          mmTop = 5821
          mmWidth = 13737
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          Caption = #24635#20540
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 178065
          mmTop = 1588
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'Amount'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3662
          mmLeft = 180182
          mmTop = 5821
          mmWidth = 10922
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'curr_code'
          DataPipeline = DB529
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DB529'
          mmHeight = 3704
          mmLeft = 164042
          mmTop = 1588
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'curr_code'
          DataPipeline = DB529
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'DB529'
          mmHeight = 3704
          mmLeft = 184415
          mmTop = 1588
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'TOTAL:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115094
          mmTop = 794
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = #24635#20215
          DataPipeline = DB530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'DB530'
          mmHeight = 4128
          mmLeft = 177271
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = #25968#37327
          DataPipeline = DB530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          Transparent = True
          DataPipelineName = 'DB530'
          mmHeight = 4233
          mmLeft = 137584
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label1'
          Caption = 'QTY:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4128
          mmLeft = 129117
          mmTop = 529
          mmWidth = 8446
          BandType = 5
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label7'
          Caption = 'Amount:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4128
          mmLeft = 163248
          mmTop = 529
          mmWidth = 14542
          BandType = 5
          GroupNo = 0
        end
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
    Left = 172
    Top = 56
  end
  object Aqwz529: TADOQuery
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
      
        'SELECT'#9'data0529.rkey ,data0529.shipadvice_no,data0529.ship_addr_' +
        'ptr,data0529.empl_ptr,data0529.ORIG_CUSTOMER,'
      
        '        data0529.attn,data0529.attn1,data0529.attn_cc,data0529.a' +
        'dv_from,data0529.adv_from_cc,'
      
        '        data0529.ship_from,data0529.to_port,data0529.fax_no,data' +
        '0529.ship_to_phone,data0529.fax_to,'
      
        '        data0529.tdate,data0529.mawb_no,data0529.hawb_no,data052' +
        '9.flight_no,data0529.depa_date,data0529.tstatus,'
      
        '        data0010.cust_code,data0010.customer_name,data0010.APPLY' +
        '_IN_TRANSIT,data0010.BILLING_ADDRESS_4 as '#39#23458#25143#33521#25991#21517#31216#39','
      
        '        data0010.FED_TAX_ID_NO as '#39#20184#27454#26041#24335#39',data0012.ship_to_contac' +
        't as '#39#19994#21153#32852#31995#20154#39',data0012.ship_to_phone  as '#39#19994#21153#32852#31995#20154#30005#35805#39',data0012.ship_' +
        'to_fax as '#39#20256#30495#39','
      
        '        data0012.location,data0012.SHIP_TO_CONTACT,data0010.cod_' +
        'flag,data0012.ship_to_address_1 as '#39#23458#25143#35814#32454#22320#22336#39',data0001.curr_code,'
      '        data0005.employee_name,data0012.SHIP_TO_FAX'
      '  from  data0529  '
      
        '        inner join data0012 on data0529.ship_addr_ptr=data0012.r' +
        'key'
      '        inner join data0005 on data0529.empl_ptr=data0005.rkey '
      
        '        inner join data0010 on data0012.CUSTOMER_PTR=data0010.rk' +
        'ey'
      
        '        inner join data0001 on data0010.CURRENCY_PTR=data0001.rk' +
        'ey'
      ' where data0529.rkey=:rkey')
    Left = 25
    Top = 34
    object Aqwz529rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz529shipadvice_no: TStringField
      FieldName = 'shipadvice_no'
      Size = 10
    end
    object Aqwz529ship_addr_ptr: TIntegerField
      FieldName = 'ship_addr_ptr'
    end
    object Aqwz529empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object Aqwz529attn: TStringField
      FieldName = 'attn'
      Size = 50
    end
    object Aqwz529attn1: TStringField
      FieldName = 'attn1'
      Size = 50
    end
    object Aqwz529attn_cc: TStringField
      FieldName = 'attn_cc'
      Size = 50
    end
    object Aqwz529adv_from: TStringField
      FieldName = 'adv_from'
      Size = 50
    end
    object Aqwz529adv_from_cc: TStringField
      FieldName = 'adv_from_cc'
      Size = 50
    end
    object Aqwz529ship_from: TStringField
      FieldName = 'ship_from'
      Size = 80
    end
    object Aqwz529to_port: TStringField
      FieldName = 'to_port'
      Size = 100
    end
    object Aqwz529fax_no: TStringField
      FieldName = 'fax_no'
    end
    object Aqwz529ship_to_phone: TStringField
      FieldName = 'ship_to_phone'
    end
    object Aqwz529fax_to: TStringField
      FieldName = 'fax_to'
      Size = 80
    end
    object Aqwz529tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object Aqwz529mawb_no: TStringField
      FieldName = 'mawb_no'
    end
    object Aqwz529hawb_no: TStringField
      FieldName = 'hawb_no'
    end
    object Aqwz529flight_no: TStringField
      FieldName = 'flight_no'
    end
    object Aqwz529depa_date: TDateTimeField
      FieldName = 'depa_date'
    end
    object Aqwz529tstatus: TWordField
      FieldName = 'tstatus'
    end
    object Aqwz529cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object Aqwz529customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object Aqwz529APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object Aqwz529DSDesigner: TStringField
      FieldName = #20184#27454#26041#24335
      Size = 50
    end
    object Aqwz529DSDesigner2: TStringField
      FieldName = #19994#21153#32852#31995#20154
      FixedChar = True
    end
    object Aqwz529DSDesigner3: TStringField
      FieldName = #19994#21153#32852#31995#20154#30005#35805
      FixedChar = True
      Size = 14
    end
    object Aqwz529location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object Aqwz529SHIP_TO_CONTACT: TStringField
      FieldName = 'SHIP_TO_CONTACT'
    end
    object Aqwz529cod_flag: TStringField
      FieldName = 'cod_flag'
      FixedChar = True
      Size = 1
    end
    object Aqwz529employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object Aqwz529SHIP_TO_FAX: TStringField
      FieldName = 'SHIP_TO_FAX'
    end
    object Aqwz529DSDesigner4: TStringField
      FieldName = #23458#25143#35814#32454#22320#22336
      Size = 100
    end
    object Aqwz529DSDesigner5: TStringField
      FieldName = #23458#25143#33521#25991#21517#31216
      Size = 100
    end
    object Aqwz529DSDesigner6: TStringField
      FieldName = #20256#30495
    end
    object Aqwz529curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object Aqwz529ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
  end
  object Aqwz530: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = Aqwz530CalcFields
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
      'SELECT'
      
        '      Distinct Data0025.MANU_PART_DESC AS '#39#23458#25143#22411#21495#39',Data0064.PART_P' +
        'RICE,'
      
        '      Data0025.MANU_PART_NUMBER, Data0025.ANALYSIS_CODE_2 AS  '#39#23458 +
        #25143#29289#26009#21495#39','
      
        '      Data0025.ANALYSIS_CODE_5 as '#39#21333#21482#23610#23544#39',data0025.layers as '#39#23618#25968#39 +
        ' ,data0530.rkey529_ptr,'
      
        '      Data0064.REPORT_UNIT_VALUE1,Data0064.REPORT_UNIT_VALUE1*0.' +
        '001 as '#39#21333'PCS'#37325#37327#39','
      '      Data0530.REFERENCE_NUMBER as '#39#21253#35013#31665#23610#23544#39','
      '      Data0530.REMARK1,Data0530.REMARK2,'
      '      Data0097.PO_NUMBER,'
      '      Data0001.CURR_CODE,Data0001.CURR_NAME,Data0001.EXCH_RATE'
      'FROM Data0530 INNER JOIN '
      '      Data0064 ON Data0064.RKEY=Data0530.RKEY64_PTR  INNER JOIN'
      '      Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      
        '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER J' +
        'OIN'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      
        '      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY IN' +
        'NER JOIN'
      '      Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY '
      'where data0530.rkey529_ptr=:rkey'
      'order by data0025.manu_part_desc')
    Left = 24
    Top = 60
    object Aqwz530PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Aqwz530MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqwz530DSDesigner: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 80
    end
    object Aqwz530DSDesigner2: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 80
    end
    object Aqwz530DSDesigner3: TStringField
      FieldName = #21333#21482#23610#23544
      Size = 30
    end
    object Aqwz530DSDesigner4: TWordField
      FieldName = #23618#25968
    end
    object Aqwz530rkey529_ptr: TIntegerField
      FieldName = 'rkey529_ptr'
    end
    object Aqwz530PCS: TBCDField
      FieldName = #21333'PCS'#37325#37327
      ReadOnly = True
      Precision = 13
      Size = 7
    end
    object Aqwz530PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object Aqwz530CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz530CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz530Quan_declare: TIntegerField
      FieldKind = fkCalculated
      FieldName = #25968#37327
      Calculated = True
    end
    object Aqwz530Cartons_no: TIntegerField
      FieldKind = fkCalculated
      FieldName = #31665#25968
      Calculated = True
    end
    object Aqwz530Amount: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20215
      Calculated = True
    end
    object Aqwz530Weight: TFloatField
      FieldKind = fkCalculated
      FieldName = #20928#37325
      Calculated = True
    end
    object Aqwz530mWeight: TFloatField
      FieldKind = fkCalculated
      FieldName = #27611#37325
      Calculated = True
    end
    object Aqwz530No: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24207#21495
      Calculated = True
    end
    object Aqwz530DSDesigner5: TStringField
      FieldName = #21253#35013#31665#23610#23544
      Size = 50
    end
    object Aqwz530REMARK1: TStringField
      FieldName = 'REMARK1'
      Size = 50
    end
    object Aqwz530EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Aqwz530REMARK2: TStringField
      FieldName = 'REMARK2'
      Size = 50
    end
    object Aqwz530REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object Aqwz530FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = 'other_total'
      currency = True
      Calculated = True
    end
    object Aqwz530CurrencyField: TFloatField
      FieldKind = fkCalculated
      FieldName = #37329#39069
      Calculated = True
    end
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 24
    Top = 90
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
  object DataSource1: TDataSource
    DataSet = Aqwz529
    Left = 55
    Top = 30
  end
  object DataSource2: TDataSource
    DataSet = Aqwz530
    Left = 55
    Top = 58
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 55
    Top = 86
  end
  object DB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 84
    Top = 86
    object DB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object DB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object DB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object DB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object DB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object DB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object DB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object DB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object DB529: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB529'
    Left = 84
    Top = 32
    object DB529ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object DB529ppField2: TppField
      FieldAlias = 'shipadvice_no'
      FieldName = 'shipadvice_no'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object DB529ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ship_addr_ptr'
      FieldName = 'ship_addr_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object DB529ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'empl_ptr'
      FieldName = 'empl_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object DB529ppField5: TppField
      FieldAlias = 'attn'
      FieldName = 'attn'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object DB529ppField6: TppField
      FieldAlias = 'attn1'
      FieldName = 'attn1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object DB529ppField7: TppField
      FieldAlias = 'attn_cc'
      FieldName = 'attn_cc'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object DB529ppField8: TppField
      FieldAlias = 'adv_from'
      FieldName = 'adv_from'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object DB529ppField9: TppField
      FieldAlias = 'adv_from_cc'
      FieldName = 'adv_from_cc'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object DB529ppField10: TppField
      FieldAlias = 'ship_from'
      FieldName = 'ship_from'
      FieldLength = 80
      DisplayWidth = 80
      Position = 9
    end
    object DB529ppField11: TppField
      FieldAlias = 'to_port'
      FieldName = 'to_port'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object DB529ppField12: TppField
      FieldAlias = 'fax_no'
      FieldName = 'fax_no'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object DB529ppField13: TppField
      FieldAlias = 'ship_to_phone'
      FieldName = 'ship_to_phone'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object DB529ppField14: TppField
      FieldAlias = 'fax_to'
      FieldName = 'fax_to'
      FieldLength = 80
      DisplayWidth = 80
      Position = 13
    end
    object DB529ppField15: TppField
      FieldAlias = 'tdate'
      FieldName = 'tdate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object DB529ppField16: TppField
      FieldAlias = 'mawb_no'
      FieldName = 'mawb_no'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object DB529ppField17: TppField
      FieldAlias = 'hawb_no'
      FieldName = 'hawb_no'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object DB529ppField18: TppField
      FieldAlias = 'flight_no'
      FieldName = 'flight_no'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object DB529ppField19: TppField
      FieldAlias = 'depa_date'
      FieldName = 'depa_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object DB529ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'tstatus'
      FieldName = 'tstatus'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 19
    end
    object DB529ppField21: TppField
      FieldAlias = 'cust_code'
      FieldName = 'cust_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object DB529ppField22: TppField
      FieldAlias = 'customer_name'
      FieldName = 'customer_name'
      FieldLength = 100
      DisplayWidth = 100
      Position = 21
    end
    object DB529ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'APPLY_IN_TRANSIT'
      FieldName = 'APPLY_IN_TRANSIT'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 22
    end
    object DB529ppField24: TppField
      FieldAlias = #20184#27454#26041#24335
      FieldName = #20184#27454#26041#24335
      FieldLength = 50
      DisplayWidth = 50
      Position = 23
    end
    object DB529ppField25: TppField
      FieldAlias = #19994#21153#32852#31995#20154
      FieldName = #19994#21153#32852#31995#20154
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object DB529ppField26: TppField
      FieldAlias = #19994#21153#32852#31995#20154#30005#35805
      FieldName = #19994#21153#32852#31995#20154#30005#35805
      FieldLength = 14
      DisplayWidth = 14
      Position = 25
    end
    object DB529ppField32: TppField
      FieldAlias = #23458#25143#35814#32454#22320#22336
      FieldName = #23458#25143#35814#32454#22320#22336
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object DB529ppField28: TppField
      FieldAlias = 'SHIP_TO_CONTACT'
      FieldName = 'SHIP_TO_CONTACT'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object DB529ppField29: TppField
      FieldAlias = 'cod_flag'
      FieldName = 'cod_flag'
      FieldLength = 1
      DisplayWidth = 1
      Position = 28
    end
    object DB529ppField27: TppField
      FieldAlias = 'location'
      FieldName = 'location'
      FieldLength = 80
      DisplayWidth = 80
      Position = 29
    end
    object DB529ppField30: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 30
    end
    object DB529ppField31: TppField
      FieldAlias = 'SHIP_TO_FAX'
      FieldName = 'SHIP_TO_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 31
    end
    object DB529ppField33: TppField
      FieldAlias = #23458#25143#33521#25991#21517#31216
      FieldName = #23458#25143#33521#25991#21517#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object DB529ppField34: TppField
      FieldAlias = #20256#30495
      FieldName = #20256#30495
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
    object DB529ppField35: TppField
      FieldAlias = 'curr_code'
      FieldName = 'curr_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object DB529ppField36: TppField
      FieldAlias = 'ORIG_CUSTOMER'
      FieldName = 'ORIG_CUSTOMER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey529'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'str1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end
      item
        Name = 'str2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end
      item
        Name = 'str3'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 80
        Value = Null
      end
      item
        Name = 'str4'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 80
        Value = Null
      end
      item
        Name = 'str5'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'layers'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'str6'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'str7'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'str8'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'part_price'
        Size = -1
        Value = Null
      end
      item
        Name = 'unit_value'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 9
        Size = 19
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        '   select sum(data0530.quan_declare) as total_quan,sum(isnull(da' +
        'ta0530.total_amount,0)) as other_amount,'
      
        '   sum(data0530.cartons_no) as total_cartons,sum(data0530.nweigh' +
        't) as total_nweight,'
      '   round(sum(data0530.weight),3) as total_mweight,'
      
        '   round(sum(data0530.quan_declare*data0064.part_price),3) as am' +
        'ount,'
      
        '   round(sum(data0530.quan_declare*data0064.report_unit_value1*0' +
        '.001),3) as total_weight'
      '   from data0530 inner join data0064'
      '   on data0530.rkey64_ptr=data0064.rkey inner join'
      '   Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      '   Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
      
        '   Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER' +
        ' JOIN'
      '   Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY'
      '  where data0530.rkey529_ptr=:rkey529'
      '  and data0097.po_number=:str1'
      '  and data0025.manu_part_number=:str2'
      '  and data0025.manu_part_desc=:str3'
      '  and isnull(Data0025.ANALYSIS_CODE_2,'#39#39')=:str4'
      '  and isnull(Data0025.ANALYSIS_CODE_5,'#39#39')=:str5'
      '  and data0025.layers=:layers'
      '  and isnull(data0530.remark1,'#39#39')=:str6'
      '  and isnull(data0530.remark2,'#39#39')=:str7'
      '  and isnull(data0530.reference_number,'#39#39')=:str8'
      '  and data0064.part_price=:part_price'
      '  and Data0064.REPORT_UNIT_VALUE1=:unit_value'
      '')
    Left = 189
    Top = 130
    object ADOQuery1total_quan: TIntegerField
      FieldName = 'total_quan'
      ReadOnly = True
    end
    object ADOQuery1total_cartons: TIntegerField
      FieldName = 'total_cartons'
      ReadOnly = True
    end
    object ADOQuery1total_mweight: TBCDField
      FieldName = 'total_mweight'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADOQuery1amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOQuery1other_amount: TBCDField
      FieldName = 'other_amount'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADOQuery1total_nweight: TBCDField
      FieldName = 'total_nweight'
      ReadOnly = True
      Precision = 32
      Size = 3
    end
  end
  object DB530: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB530'
    Left = 88
    Top = 56
    object DB530ppField1: TppField
      FieldAlias = 'PART_PRICE'
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB530ppField2: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB530ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB530ppField4: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB530ppField5: TppField
      FieldAlias = #21333#21482#23610#23544
      FieldName = #21333#21482#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB530ppField6: TppField
      FieldAlias = #23618#25968
      FieldName = #23618#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB530ppField7: TppField
      FieldAlias = 'rkey529_ptr'
      FieldName = 'rkey529_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB530ppField8: TppField
      FieldAlias = #21333'PCS'#37325#37327
      FieldName = #21333'PCS'#37325#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB530ppField9: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB530ppField10: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB530ppField11: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB530ppField12: TppField
      FieldAlias = #25968#37327
      FieldName = #25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB530ppField13: TppField
      FieldAlias = #31665#25968
      FieldName = #31665#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB530ppField14: TppField
      FieldAlias = #24635#20215
      FieldName = #24635#20215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB530ppField15: TppField
      FieldAlias = #20928#37325
      FieldName = #20928#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DB530ppField16: TppField
      FieldAlias = #27611#37325
      FieldName = #27611#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DB530ppField17: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DB530ppField19: TppField
      FieldAlias = 'REMARK1'
      FieldName = 'REMARK1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DB530ppField20: TppField
      FieldAlias = 'REMARK2'
      FieldName = 'REMARK2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object DB530ppField21: TppField
      FieldAlias = 'EXCH_RATE'
      FieldName = 'EXCH_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object DB530ppField18: TppField
      FieldAlias = #21253#35013#31665#23610#23544
      FieldName = #21253#35013#31665#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object DB530ppField22: TppField
      FieldAlias = 'REPORT_UNIT_VALUE1'
      FieldName = 'REPORT_UNIT_VALUE1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object DB530ppField23: TppField
      FieldAlias = 'other_total'
      FieldName = 'other_total'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object DB530ppField24: TppField
      FieldAlias = #37329#39069
      FieldName = #37329#39069
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
  end
end

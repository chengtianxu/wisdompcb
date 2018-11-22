object Form_Report: TForm_Report
  Left = 476
  Top = 198
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
    PrinterSetup.Collation = False
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 200000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 150
    Template.FileName = 'D:\SJSYS\NIERP\Report\wzpr529_1.rtm'
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
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 54504
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = DB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'DB493'
        mmHeight = 19315
        mmLeft = 7144
        mmTop = 1852
        mmWidth = 26723
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 8202
        mmLeft = 72496
        mmTop = 1588
        mmWidth = 61383
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name3'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4763
        mmLeft = 85990
        mmTop = 10583
        mmWidth = 34131
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #35746#36135#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 33338
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 40481
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #36135#20179#32852#32476#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 47625
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #30005#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 61648
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 33338
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #21457#31080#21495#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 40481
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20184#27454#36174#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 47625
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #35013#31665#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 94721
        mmTop = 15610
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Packing  List'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 87048
        mmTop = 22490
        mmWidth = 32015
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 4064
        mmLeft = 23019
        mmTop = 33338
        mmWidth = 25379
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'location'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 4064
        mmLeft = 14023
        mmTop = 40481
        mmWidth = 12192
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
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 33338
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'shipadvice_no'
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 40481
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #19994#21153#32852#31995#20154
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 4064
        mmLeft = 27781
        mmTop = 47625
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #19994#21153#32852#31995#20154#30005#35805
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 4064
        mmLeft = 73554
        mmTop = 47625
        mmWidth = 24892
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #20184#27454#26041#24335
        DataPipeline = DB529
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB529'
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 47625
        mmWidth = 21696
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 1588
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 6615
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4064
        mmLeft = 2117
        mmTop = 11642
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PO_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 16669
        mmWidth = 22490
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 0
        mmTop = 0
        mmWidth = 134938
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'QUAN_SHIPPED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 42863
        mmTop = 10848
        mmWidth = 12435
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 38629
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #21333'PCS'#37325#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 67469
        mmTop = 4233
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #20928#37325
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 67469
        mmTop = 12700
        mmWidth = 7144
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 59267
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #27611#37325
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 8731
        mmWidth = 7144
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 93398
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #31665#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4064
        mmLeft = 139436
        mmTop = 3175
        mmWidth = 7112
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = #21253#35013#31665#23610#23544
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4064
        mmLeft = 135467
        mmTop = 12435
        mmWidth = 17780
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 124884
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = #21333#21482#23610#23544
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4064
        mmLeft = 176477
        mmTop = 8996
        mmWidth = 14224
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 168540
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109802
        mmTop = 8731
        mmWidth = 5101
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'kg/pcs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 79640
        mmTop = 4233
        mmWidth = 10245
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'KG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 79640
        mmTop = 12700
        mmWidth = 5101
        BandType = 4
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 0
        mmTop = 21167
        mmWidth = 203300
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 21696
        mmLeft = 0
        mmTop = 0
        mmWidth = 203300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'rkey529_ptr'
      DataPipeline = DB530
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DB530'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          ParentWidth = True
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 203300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'DESCRIPTION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 6615
          mmTop = 3440
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'QTY  (PCS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 39688
          mmTop = 3440
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'NET WEIGNT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 64823
          mmTop = 3440
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'GROSS WEIGHT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 95515
          mmTop = 3440
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'CARTONS (CTN)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 132821
          mmTop = 3440
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'PCS  SIZE (PCS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 172244
          mmTop = 3440
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10054
          mmLeft = 38629
          mmTop = 0
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 93398
          mmTop = 0
          mmWidth = 1588
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 59267
          mmTop = 0
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 124884
          mmTop = 0
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 168540
          mmTop = 0
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine13: TppLine
          UserName = 'Line13'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 6879
          mmLeft = 0
          mmTop = 0
          mmWidth = 203300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'QUAN_SHIPPED'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          mmHeight = 4551
          mmLeft = 31485
          mmTop = 1058
          mmWidth = 41529
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = #27611#37325
          DataPipeline = DB530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB530'
          mmHeight = 4551
          mmLeft = 101865
          mmTop = 1058
          mmWidth = 18817
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = #31665#25968
          DataPipeline = DB530
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB530'
          mmHeight = 4551
          mmLeft = 165894
          mmTop = 1058
          mmWidth = 18817
          BandType = 5
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4551
          mmLeft = 529
          mmTop = 1058
          mmWidth = 12912
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'QTY:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 20902
          mmTop = 1058
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'GROSS WEIGHT:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 69586
          mmTop = 1058
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'CARTONS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4498
          mmLeft = 144727
          mmTop = 1058
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          Caption = '(PCS)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4551
          mmLeft = 47625
          mmTop = 1058
          mmWidth = 10541
          BandType = 5
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'Label48'
          Caption = '(KG)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4551
          mmLeft = 120386
          mmTop = 1058
          mmWidth = 8382
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
        'ptr,data0529.empl_ptr,'
      
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
    Left = 29
    Top = 35
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
      
        '      Data0025.MANU_PART_NUMBER, Data0025.ANALYSIS_CODE_2  AS  '#39 +
        #23458#25143#29289#26009#21495#39','
      
        '      Data0025.ANALYSIS_CODE_5 as '#39#21333#21482#23610#23544#39',data0025.layers as '#39#23618#25968#39 +
        ' ,data0530.rkey529_ptr,'
      '      Data0064.REPORT_UNIT_VALUE1*0.001 as '#39#21333'PCS'#37325#37327#39','
      '      Data0530.REFERENCE_NUMBER as '#39#21253#35013#31665#23610#23544#39','
      '      Data0530.REMARK1,Data0530.REMARK2,'
      '      Data0097.PO_NUMBER,'
      '      Data0001.CURR_CODE,Data0001.CURR_NAME,Data0001.exch_rate'
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
    object Aqwz530DSDesigner5: TStringField
      FieldName = #21253#35013#31665#23610#23544
      Size = 50
    end
    object Aqwz530REMARK1: TStringField
      FieldName = 'REMARK1'
      Size = 50
    end
    object Aqwz530REMARK2: TStringField
      FieldName = 'REMARK2'
      Size = 50
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
    object Aqwz530exch_rate: TFloatField
      FieldName = 'exch_rate'
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
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 25
    Top = 91
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
    object DB529ppField28: TppField
      FieldAlias = 'SHIP_TO_CONTACT'
      FieldName = 'SHIP_TO_CONTACT'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
    object DB529ppField29: TppField
      FieldAlias = 'cod_flag'
      FieldName = 'cod_flag'
      FieldLength = 1
      DisplayWidth = 1
      Position = 27
    end
    object DB529ppField27: TppField
      FieldAlias = 'location'
      FieldName = 'location'
      FieldLength = 80
      DisplayWidth = 80
      Position = 28
    end
    object DB529ppField30: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 29
    end
    object DB529ppField31: TppField
      FieldAlias = 'SHIP_TO_FAX'
      FieldName = 'SHIP_TO_FAX'
      FieldLength = 20
      DisplayWidth = 20
      Position = 30
    end
    object DB529ppField32: TppField
      FieldAlias = #23458#25143#35814#32454#22320#22336
      FieldName = #23458#25143#35814#32454#22320#22336
      FieldLength = 10
      DisplayWidth = 10
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
  end
  object DB530: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB530'
    Left = 83
    Top = 61
    MasterDataPipelineName = 'DB529'
    object DB530ppField2: TppField
      FieldAlias = 'PART_PRICE'
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB530ppField3: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB530ppField4: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB530ppField5: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB530ppField6: TppField
      FieldAlias = #21333#21482#23610#23544
      FieldName = #21333#21482#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB530ppField7: TppField
      FieldAlias = #23618#25968
      FieldName = #23618#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB530ppField8: TppField
      FieldAlias = 'rkey529_ptr'
      FieldName = 'rkey529_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB530ppField9: TppField
      FieldAlias = #21333'PCS'#37325#37327
      FieldName = #21333'PCS'#37325#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB530ppField10: TppField
      FieldAlias = #21253#35013#31665#23610#23544
      FieldName = #21253#35013#31665#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB530ppField11: TppField
      FieldAlias = 'REMARK1'
      FieldName = 'REMARK1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB530ppField12: TppField
      FieldAlias = 'REMARK2'
      FieldName = 'REMARK2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB530ppField13: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB530ppField14: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB530ppField15: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB530ppField16: TppField
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DB530ppField17: TppField
      FieldAlias = #25968#37327
      FieldName = #25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DB530ppField18: TppField
      FieldAlias = #31665#25968
      FieldName = #31665#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DB530ppField19: TppField
      FieldAlias = #24635#20215
      FieldName = #24635#20215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DB530ppField20: TppField
      FieldAlias = #20928#37325
      FieldName = #20928#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object DB530ppField21: TppField
      FieldAlias = #27611#37325
      FieldName = #27611#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object DB530ppField22: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
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
        Name = 'price'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      '   select sum(data0530.quan_declare) as total_quan,'
      '   sum(data0530.cartons_no) as total_cartons,'
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
      '  and Data0025.ANALYSIS_CODE_2=:str4'
      '  and Data0025.ANALYSIS_CODE_5=:str5'
      '  and data0025.layers=:layers'
      '  and data0530.remark1=:str6'
      '  and data0530.remark2=:str7'
      '  and data0530.reference_number=:str8'
      '  and data0064.part_price=:price')
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
    object ADOQuery1total_weight: TBCDField
      FieldName = 'total_weight'
      ReadOnly = True
      Precision = 32
      Size = 7
    end
  end
end

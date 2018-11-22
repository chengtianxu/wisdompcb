object Form_Report: TForm_Report
  Left = 300
  Top = 222
  Width = 496
  Height = 308
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
    DataPipeline = ppDBPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8.5x11 '#33521#23544
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\vss_xiaowenju\'#21407#31243#24207#20195#30721'\'#20154#20107#31649#29702'\'#22522#30784#36164#26009'\'#21592#24037#20449#24687'\hrinfo.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 208
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline2'
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        DirectDraw = True
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        DataField = 'Company_Icon'
        DataPipeline = ppDBPipeline3
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 20902
        mmLeft = 0
        mmTop = 0
        mmWidth = 45508
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Company_Name'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 6615
        mmLeft = 51065
        mmTop = 529
        mmWidth = 102923
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Company_Name3'
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 7673
        mmWidth = 59002
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #21592#24037#23653#21382#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 86254
        mmTop = 13229
        mmWidth = 30427
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #25171#21360#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 21431
        mmWidth = 19315
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 21431
        mmWidth = 19050
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 120650
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5821
        mmTop = 0
        mmWidth = 191294
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 5821
        mmTop = 6879
        mmWidth = 160867
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5821
        mmTop = 13494
        mmWidth = 160867
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5821
        mmTop = 20373
        mmWidth = 160867
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5556
        mmTop = 26988
        mmWidth = 161132
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5556
        mmTop = 34131
        mmWidth = 191559
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5556
        mmTop = 50271
        mmWidth = 191294
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 17198
        mmTop = 55827
        mmWidth = 180182
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 17198
        mmTop = 61383
        mmWidth = 180182
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5556
        mmTop = 66146
        mmWidth = 191823
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 120121
        mmLeft = 5556
        mmTop = 0
        mmWidth = 529
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 120386
        mmLeft = 190765
        mmTop = 0
        mmWidth = 6615
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line29'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 39952
        mmLeft = 25665
        mmTop = 0
        mmWidth = 2646
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20373
        mmLeft = 45773
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20373
        mmLeft = 65881
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13758
        mmLeft = 85990
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 13758
        mmLeft = 106098
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 27252
        mmLeft = 126207
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20373
        mmLeft = 146315
        mmTop = 0
        mmWidth = 1852
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 33602
        mmLeft = 166688
        mmTop = 0
        mmWidth = 2117
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'photo'
        DataPipeline = ppDBPipeline4
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline4'
        mmHeight = 29633
        mmLeft = 168805
        mmTop = 1852
        mmWidth = 25929
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 65617
        mmLeft = 17463
        mmTop = 50271
        mmWidth = 1588
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 15875
        mmLeft = 45773
        mmTop = 50536
        mmWidth = 2117
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 45773
        mmLeft = 65881
        mmTop = 20638
        mmWidth = 2117
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16140
        mmLeft = 85990
        mmTop = 50271
        mmWidth = 2117
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 12965
        mmLeft = 106098
        mmTop = 20638
        mmWidth = 2117
        BandType = 0
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 33602
        mmWidth = 2117
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 146315
        mmTop = 33602
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #22995'  '#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 6350
        mmTop = 8202
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #20986#29983#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 6879
        mmTop = 15346
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #25991#21270#31243#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 6350
        mmTop = 21960
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #31821'  '#36143
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 67204
        mmTop = 21960
        mmWidth = 18521
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 5556
        mmTop = 39688
        mmWidth = 191559
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = #37096#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 86784
        mmTop = 1588
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #36523#20221#35777#21495#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 46302
        mmTop = 15346
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = #24615' '#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 47096
        mmTop = 1588
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #20837#32844#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 46831
        mmTop = 8202
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #27665' '#26063
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 127265
        mmTop = 8202
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #25919#27835#38754#35980
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 127000
        mmTop = 1588
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #32844' '#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 86784
        mmTop = 8202
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #23130#23035#29366#20917
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 127529
        mmTop = 15346
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #23703#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 66675
        mmTop = 28310
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #25143#31821#25152#22312#22320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 106098
        mmTop = 21960
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = #32852#31995#30005#35805
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 5292
        mmTop = 34925
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #24037#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 1588
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #32039#24613#36890#30693#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 25135
        mmTop = 40746
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #32039#24613#36890#30693#20154#22320#22336
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 143934
        mmTop = 40746
        mmWidth = 35454
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = #20854#20182#32852#31995#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 65881
        mmTop = 34925
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = #32039#24613#36890#30693#20154#32852#31995#30005#35805
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 73819
        mmTop = 40746
        mmWidth = 47625
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = #22806#35821#35821#31181
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 125942
        mmTop = 34925
        mmWidth = 20373
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 26988
        mmLeft = 126207
        mmTop = 39158
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = #27605#19994#26102#38388
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 17727
        mmTop = 51329
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = #25945' '#32946
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 5821
        mmTop = 53711
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = #32463' '#21382
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 5821
        mmTop = 58738
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = #24037#20316
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 5821
        mmTop = 80169
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = #32463' '#21382
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 5821
        mmTop = 85196
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = #23398#21382
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 47096
        mmTop = 51329
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #19987' '#19994
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 66675
        mmTop = 51329
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = #23398#26657#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 95515
        mmTop = 51329
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = #27605#19994'/'#32467#19994
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 126471
        mmTop = 51329
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = #20854' '#23427
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4191
        mmLeft = 160602
        mmTop = 51329
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = #26143#32423
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 6350
        mmTop = 28310
        mmWidth = 18521
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19315
        mmLeft = 85990
        mmTop = 20373
        mmWidth = 2117
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #24037#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 1588
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = #24615#21035
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 1588
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = #37096#38376
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6615
        mmLeft = 106363
        mmTop = 1323
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #25919#27835#38754#35980
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 1588
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #22995#21517
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 8202
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #20837#32844#26085#26399
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 8202
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = #32844#20301
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 6615
        mmLeft = 106363
        mmTop = 8202
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = #27665#26063
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 8202
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = #20986#29983#24180#26376
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 26194
        mmTop = 15346
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = #36523#20221#35777#21495#30721
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 66940
        mmTop = 15346
        mmWidth = 58738
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = #23130#23035#29366#20917
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3979
        mmLeft = 146315
        mmTop = 15346
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = #23398#21382
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 27252
        mmTop = 21960
        mmWidth = 37306
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = #31821#36143
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 85990
        mmTop = 21960
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = #25143#31821#25152#22312#22320
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 21960
        mmWidth = 37835
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = #26143#32423
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 28310
        mmWidth = 37571
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = #23703#20301
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5027
        mmLeft = 85990
        mmTop = 28310
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = #32852#31995#30005#35805
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 34925
        mmWidth = 37571
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = #20854#20182#32852#31995#26041#24335
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 5821
        mmLeft = 86519
        mmTop = 34131
        mmWidth = 39158
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = #22806#35821#35821#31181
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 34925
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = #32039#24613#36890#30693#20154
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 46038
        mmWidth = 58208
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = #36890#30693#20154#32852#31995#30005#35805
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3704
        mmLeft = 67733
        mmTop = 46038
        mmWidth = 56092
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = #36890#30693#20154#22320#22336
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 126736
        mmTop = 46038
        mmWidth = 69321
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = #27605#19994#26102#38388
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 18256
        mmTop = 56886
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = #23398#21382
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 46038
        mmTop = 56886
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = #19987#19994
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 65881
        mmTop = 56886
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = #27605#19994#23398#26657
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3598
        mmLeft = 86519
        mmTop = 56886
        mmWidth = 39158
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = #31616#21382
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 35729
        mmLeft = 18256
        mmTop = 67204
        mmWidth = 178065
        BandType = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDBPipeline5'
        mmHeight = 17727
        mmLeft = 0
        mmTop = 102923
        mmWidth = 203200
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBPipeline5
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Letter 8.5x11 '#33521#23544
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Version = '7.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBPipeline5'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14288
            mmPrintPosition = 0
            object ppLine63: TppLine
              UserName = 'Line63'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 5556
              mmTop = 0
              mmWidth = 529
              BandType = 1
            end
            object ppLine64: TppLine
              UserName = 'Line64'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 17463
              mmTop = 0
              mmWidth = 1588
              BandType = 1
            end
            object ppLine65: TppLine
              UserName = 'Line402'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 45773
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine66: TppLine
              UserName = 'Line66'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 65881
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine67: TppLine
              UserName = 'Line67'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 85990
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine68: TppLine
              UserName = 'Line68'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 106363
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine69: TppLine
              UserName = 'Line502'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 126736
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine70: TppLine
              UserName = 'Line70'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 146315
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine71: TppLine
              UserName = 'Line71'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 167482
              mmTop = 0
              mmWidth = 2117
              BandType = 1
            end
            object ppLine72: TppLine
              UserName = 'Line301'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 14023
              mmLeft = 190765
              mmTop = 0
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label47'
              AutoSize = False
              Caption = #35760#24405
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 5821
              mmTop = 8467
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              AutoSize = False
              Caption = #21464#21160
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 6085
              mmTop = 2117
              mmWidth = 11642
              BandType = 1
            end
            object ppLine73: TppLine
              UserName = 'Line73'
              Weight = 0.750000000000000000
              mmHeight = 1852
              mmLeft = 5556
              mmTop = 0
              mmWidth = 191823
              BandType = 1
            end
            object ppLine74: TppLine
              UserName = 'Line74'
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 16933
              mmTop = 0
              mmWidth = 180182
              BandType = 1
            end
            object ppLine75: TppLine
              UserName = 'Line101'
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 5556
              mmTop = 7144
              mmWidth = 191823
              BandType = 1
            end
            object ppLine77: TppLine
              UserName = 'Line77'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 45773
              mmTop = 7144
              mmWidth = 2117
              BandType = 1
            end
            object ppLine82: TppLine
              UserName = 'Line82'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 5556
              mmTop = 12171
              mmWidth = 191823
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              AutoSize = False
              Caption = #21464#21160#26085#26399
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 106627
              mmTop = 2381
              mmWidth = 21167
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              AutoSize = False
              Caption = #21407#37096#38376
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 168011
              mmTop = 2381
              mmWidth = 28046
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label501'
              AutoSize = False
              Caption = #26032#37096#38376
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 17463
              mmTop = 2381
              mmWidth = 27781
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'Label502'
              AutoSize = False
              Caption = #21407#32844#21153
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 147638
              mmTop = 2381
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label503'
              AutoSize = False
              Caption = #26032#32844#21153
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 66675
              mmTop = 2381
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label504'
              AutoSize = False
              Caption = #21464#21160#31867#22411
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 46567
              mmTop = 2381
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label505'
              AutoSize = False
              Caption = #21407#34218#36164#31867#22411
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 127000
              mmTop = 2381
              mmWidth = 20373
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label506'
              AutoSize = False
              Caption = #26032#34218#36164#31867#22411
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4191
              mmLeft = 86519
              mmTop = 2381
              mmWidth = 20108
              BandType = 1
            end
            object ppDBText47: TppDBText
              UserName = 'DBText47'
              DataField = 'employeeid'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              Visible = False
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3969
              mmLeft = 18256
              mmTop = 8996
              mmWidth = 17198
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLine79: TppLine
              UserName = 'Line79'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6614
              mmLeft = 45773
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine80: TppLine
              UserName = 'Line80'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 65881
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine84: TppLine
              UserName = 'Line84'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 85990
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine85: TppLine
              UserName = 'Line801'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 106363
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine86: TppLine
              UserName = 'Line86'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 126736
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine87: TppLine
              UserName = 'Line802'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 146315
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine88: TppLine
              UserName = 'Line88'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 167482
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine89: TppLine
              UserName = 'Line803'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 17463
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine81: TppLine
              UserName = 'Line81'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 2117
              mmLeft = 17463
              mmTop = 4763
              mmWidth = 179652
              BandType = 4
            end
            object ppLine78: TppLine
              UserName = 'Line78'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 5556
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine83: TppLine
              UserName = 'Line83'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 197115
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppDBText40: TppDBText
              UserName = 'DBText40'
              DataField = 'item'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 46038
              mmTop = 1323
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText401'
              DataField = 'dpt1'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 168805
              mmTop = 1323
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText42: TppDBText
              UserName = 'DBText402'
              DataField = 'dpt2'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 17992
              mmTop = 1323
              mmWidth = 27517
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'DBText405'
              DataField = 'acc1'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 127000
              mmTop = 1323
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText406'
              DataField = 'acc2'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 85725
              mmTop = 1323
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'dt'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 106627
              mmTop = 1323
              mmWidth = 20902
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'DBText403'
              DataField = 'pos1'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 146844
              mmTop = 1323
              mmWidth = 20108
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText404'
              DataField = 'pos2'
              DataPipeline = ppDBPipeline5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDBPipeline5'
              mmHeight = 3598
              mmLeft = 65881
              mmTop = 1323
              mmWidth = 20108
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup2: TppGroup
            BreakName = 'ppDBText47'
            BreakType = btCustomField
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object ppLine76: TppLine
                UserName = 'Line76'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 5556
                mmTop = 0
                mmWidth = 2117
                BandType = 5
                GroupNo = 0
              end
              object ppLine90: TppLine
                UserName = 'Line90'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 17463
                mmTop = 0
                mmWidth = 2117
                BandType = 5
                GroupNo = 0
              end
              object ppLine91: TppLine
                UserName = 'Line91'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 45773
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine92: TppLine
                UserName = 'Line92'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 65881
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine93: TppLine
                UserName = 'Line93'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 85990
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine94: TppLine
                UserName = 'Line94'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 106363
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine95: TppLine
                UserName = 'Line95'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 126736
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine96: TppLine
                UserName = 'Line96'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 146315
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine97: TppLine
                UserName = 'Line97'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 167482
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
              object ppLine98: TppLine
                UserName = 'Line98'
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 197115
                mmTop = 0
                mmWidth = 2910
                BandType = 5
                GroupNo = 0
              end
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppLine60: TppLine
        UserName = 'Line60'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 5027
        mmTop = 45508
        mmWidth = 191294
        BandType = 0
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 16140
        mmLeft = 146844
        mmTop = 50536
        mmWidth = 2117
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = #23703#20301#25216#33021
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4498
        mmLeft = 105569
        mmTop = 28575
        mmWidth = 63500
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 0
        mmWidth = 191823
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 17463
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 146315
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 45773
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine54: TppLine
        UserName = 'Line54'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 65881
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 85990
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 5556
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine58: TppLine
        UserName = 'Line58'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6615
        mmLeft = 197115
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'chinesename'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 1588
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'relationship'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 45773
        mmTop = 1588
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'birth'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 65881
        mmTop = 1323
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'workplace'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 86254
        mmTop = 1588
        mmWidth = 59531
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'remark'
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 1323
        mmWidth = 48154
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
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'employeeid'
      DataPipeline = ppDBPipeline2
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline2'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLabel34: TppLabel
          UserName = 'Label34'
          AutoSize = False
          Caption = #23478' '#24237
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 5556
          mmTop = 529
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          AutoSize = False
          Caption = #24773' '#20917
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 5556
          mmTop = 5292
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          AutoSize = False
          Caption = #22995' '#21517
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 17727
          mmTop = 3704
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          AutoSize = False
          Caption = #20851' '#31995
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 46038
          mmTop = 3704
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          AutoSize = False
          Caption = #24180#40836
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 66411
          mmTop = 3704
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          AutoSize = False
          Caption = #24037#20316#24773#20917
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 87048
          mmTop = 3704
          mmWidth = 58208
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          AutoSize = False
          Caption = #32852#31995#30005#35805
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4191
          mmLeft = 150548
          mmTop = 3704
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'Line55'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10319
          mmLeft = 146315
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11642
          mmLeft = 85990
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine16: TppLine
          UserName = 'Line16'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11642
          mmLeft = 65881
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine11: TppLine
          UserName = 'Line401'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11642
          mmLeft = 45773
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line15'
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 5292
          mmTop = 0
          mmWidth = 192088
          BandType = 3
          GroupNo = 0
        end
        object ppLine61: TppLine
          UserName = 'Line61'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 10583
          mmLeft = 17463
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine62: TppLine
          UserName = 'Line62'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11642
          mmLeft = 5556
          mmTop = 0
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine17: TppLine
          UserName = 'Line17'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 11113
          mmLeft = 197115
          mmTop = 0
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 39952
        mmPrintPosition = 0
        object ppLine21: TppLine
          UserName = 'Line21'
          Weight = 0.753120005130767900
          mmHeight = 2117
          mmLeft = 5556
          mmTop = 6879
          mmWidth = 191823
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          Weight = 0.753120005130767900
          mmHeight = 2117
          mmLeft = 5556
          mmTop = 12435
          mmWidth = 192088
          BandType = 5
          GroupNo = 0
        end
        object ppLine52: TppLine
          UserName = 'Line52'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 25665
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 65881
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 105569
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 125677
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line501'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 165629
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine56: TppLine
          UserName = 'Line56'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 38100
          mmLeft = 5556
          mmTop = 0
          mmWidth = 1588
          BandType = 5
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'Label41'
          AutoSize = False
          Caption = #24405#29992#26469#28304
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4022
          mmLeft = 5821
          mmTop = 1323
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 45773
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'Line11'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 7144
          mmLeft = 146315
          mmTop = 0
          mmWidth = 2117
          BandType = 5
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'Label42'
          AutoSize = False
          Caption = #34218#36164
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4022
          mmLeft = 46302
          mmTop = 1588
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          AutoSize = False
          Caption = #32844#33021#31867#22411
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4022
          mmLeft = 105834
          mmTop = 1323
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'Label44'
          AutoSize = False
          Caption = #20303#23487
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4022
          mmLeft = 146050
          mmTop = 1323
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          AutoSize = False
          Caption = #22791#27880
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4022
          mmLeft = 87577
          mmTop = 7673
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppLine59: TppLine
          UserName = 'Line59'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 38100
          mmLeft = 197115
          mmTop = 0
          mmWidth = 1323
          BandType = 5
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          Weight = 0.753120005130767900
          mmHeight = 265
          mmLeft = 5556
          mmTop = 0
          mmWidth = 191823
          BandType = 5
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = #32844#33021#31867#22411
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 125942
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = #20303#23487
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 167217
          mmTop = 1323
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText32'
          DataField = #22791#27880
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 22225
          mmLeft = 7673
          mmTop = 14288
          mmWidth = 188119
          BandType = 5
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = #24212#32856#26469#28304
          DataPipeline = ppDBPipeline1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 3969
          mmLeft = 25929
          mmTop = 1323
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppLine22: TppLine
          UserName = 'Line22'
          Weight = 0.753120005130767900
          mmHeight = 2117
          mmLeft = 5556
          mmTop = 37835
          mmWidth = 192088
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 264
    Top = 104
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBPipeline3'
    Left = 144
    Top = 199
    object ppDBPipeline3ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline3ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline3ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline3ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline3ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline3ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline3ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline3ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
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
      'select employeecode as '#24037#21495',chinesename as '#22995#21517','
      'case sex when 0 then '#39#22899#39' else '#39#30007#39' end as '#24615#21035','
      'nation as '#27665#26063','
      'd0.departmentname as '#37096#38376','
      'd1.item  as  '#25919#27835#38754#35980','
      'convert(nvarchar(20),birthday,23) as '#20986#29983#24180#26376','
      'convert(nvarchar(20),ondutytime,23) as '#20837#32844#26085#26399','
      'phone as '#32852#31995#30005#35805','
      'roomcode as '#20303#23487','
      'd2.item  as  '#32844#20301','
      'd3.item  as  '#23703#20301','
      'd4.item  as  '#32844#33021#31867#22411','
      'd5.item  as  '#25991#21270#31243#24230', '
      'idcard   as  '#36523#20221#35777#21495#30721','
      'addr     as  '#36523#20221#35777#22320#22336','
      'd6.item  as  '#23130#23035#29366#20917','
      'province as  '#31821#36143','
      'd7.memo  as  '#25143#31821#25152#22312#22320','
      'd8.item  as  '#23398#21382','
      'd9.item  as  '#24212#32856#26469#28304','
      'multi_ability as '#23703#20301#25216#33021','
      'case isnull(starlevel,0) when 0 then '#39#39
      '               when 1 then '#39#9733#39
      '               when 2 then '#39#9733#9733#39
      '               when 3 then '#39#9733#9733#9733#39
      '               when 4 then '#39#9733#9733#9733#9733#39
      '               when 5 then '#39#9733#9733#9733#9733#9733#39
      '               when 6 then '#39#9733#9733#9733#9733#9733#9733#39
      '               when 7 then '#39#9733#9733#9733#9733#9733#9733#9733#39
      '                      else '#39#9733#9733#9733#9733#9733#9733#9733#9733#39' end  as '#26143#32423','
      'graduatedschool as '#27605#19994#23398#26657','
      'majorsubject as '#19987#19994','
      'graduatetime as '#27605#19994#26102#38388','
      ' contactpersonname as '#32039#24613#36890#30693#20154','
      'contactpersontel as '#36890#30693#20154#32852#31995#30005#35805','
      'contactpersonaddr as '#36890#30693#20154#22320#22336','
      'Others_contacts as '#20854#20182#32852#31995#26041#24335','
      'languages as '#22806#35821#35821#31181','
      'remark as '#22791#27880','
      'resume as '#31616#21382','
      'e.rkey'
      ' from employeemsg e'
      'left join datadepartment d0 on e.departmentid=d0.rkey'
      'left join datadetail d1 on e.politics_face=d1.rkey'
      'left join datadetail d2 on e.position=d2.rkey'
      'left join datadetail d3 on e.station=d3.rkey'
      'left join datadetail d4 on e.rank=d4.rkey'
      'left join datadetail d5 on e.education =d5.rkey'
      'left join datadetail d6 on e.marriage =d6.rkey'
      'left join datadetail d7 on e.province_ptr =d7.rkey'
      'left join datadetail d8 on e.education=d8.rkey'
      'left join datadetail d9 on e.source=d9.rkey'
      'where e.rkey=:rkey')
    Left = 48
    Top = 40
    object ADOQuery1DSDesigner: TWideStringField
      FieldName = #22995#21517
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #24615#21035
      ReadOnly = True
      Size = 2
    end
    object ADOQuery1DSDesigner3: TWideStringField
      FieldName = #27665#26063
    end
    object ADOQuery1DSDesigner4: TWideStringField
      FieldName = #37096#38376
    end
    object ADOQuery1DSDesigner5: TWideStringField
      FieldName = #25919#27835#38754#35980
    end
    object ADOQuery1DSDesigner6: TWideStringField
      FieldName = #20986#29983#24180#26376
      ReadOnly = True
    end
    object ADOQuery1DSDesigner7: TWideStringField
      FieldName = #20837#32844#26085#26399
      ReadOnly = True
    end
    object ADOQuery1DSDesigner8: TWideStringField
      FieldName = #32852#31995#30005#35805
    end
    object ADOQuery1DSDesigner9: TWideStringField
      FieldName = #32844#20301
    end
    object ADOQuery1DSDesigner10: TWideStringField
      FieldName = #23703#20301
    end
    object ADOQuery1DSDesigner11: TWideStringField
      FieldName = #32844#33021#31867#22411
    end
    object ADOQuery1DSDesigner12: TWideStringField
      FieldName = #25991#21270#31243#24230
    end
    object ADOQuery1DSDesigner13: TWideStringField
      FieldName = #36523#20221#35777#21495#30721
    end
    object ADOQuery1DSDesigner14: TWideStringField
      FieldName = #36523#20221#35777#22320#22336
      Size = 80
    end
    object ADOQuery1DSDesigner15: TWideStringField
      FieldName = #23130#23035#29366#20917
    end
    object ADOQuery1DSDesigner16: TWideStringField
      FieldName = #31821#36143
    end
    object ADOQuery1DSDesigner17: TWideStringField
      FieldName = #25143#31821#25152#22312#22320
      Size = 200
    end
    object ADOQuery1DSDesigner18: TWideStringField
      FieldName = #23398#21382
    end
    object ADOQuery1DSDesigner20: TStringField
      FieldName = #26143#32423
      ReadOnly = True
      Size = 16
    end
    object ADOQuery1DSDesigner21: TWideStringField
      FieldName = #27605#19994#23398#26657
    end
    object ADOQuery1DSDesigner22: TWideStringField
      FieldName = #19987#19994
    end
    object ADOQuery1DSDesigner23: TWideStringField
      FieldName = #27605#19994#26102#38388
    end
    object ADOQuery1DSDesigner24: TWideStringField
      FieldName = #32039#24613#36890#30693#20154
    end
    object ADOQuery1DSDesigner25: TWideStringField
      FieldName = #36890#30693#20154#32852#31995#30005#35805
    end
    object ADOQuery1DSDesigner26: TWideStringField
      FieldName = #36890#30693#20154#22320#22336
    end
    object ADOQuery1DSDesigner27: TWideStringField
      FieldName = #20854#20182#32852#31995#26041#24335
      Size = 50
    end
    object ADOQuery1DSDesigner28: TWideStringField
      FieldName = #22806#35821#35821#31181
      Size = 10
    end
    object ADOQuery1DSDesigner29: TWideStringField
      FieldName = #22791#27880
      Size = 200
    end
    object ADOQuery1DSDesigner30: TMemoField
      FieldName = #31616#21382
      BlobType = ftMemo
    end
    object ADOQuery1DSDesigner31: TWideStringField
      FieldName = #24037#21495
    end
    object ADOQuery1DSDesigner32: TWideStringField
      FieldName = #20303#23487
    end
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1DSDesigner19: TWideStringField
      FieldName = #24212#32856#26469#28304
    end
    object ADOQuery1DSDesigner33: TWideStringField
      FieldName = #23703#20301#25216#33021
      Size = 50
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'select * from dbo.employeeFamilyrelationship '
      'where employeeid=:rkey')
    Left = 48
    Top = 92
    object ADOQuery2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery2employeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOQuery2relationship: TWideStringField
      FieldName = 'relationship'
      Size = 50
    end
    object ADOQuery2chinesename: TWideStringField
      FieldName = 'chinesename'
      Size = 50
    end
    object ADOQuery2birth: TWideStringField
      FieldName = 'birth'
      Size = 50
    end
    object ADOQuery2addr: TWideStringField
      FieldName = 'addr'
      Size = 50
    end
    object ADOQuery2workplace: TWideStringField
      FieldName = 'workplace'
      Size = 50
    end
    object ADOQuery2remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOQuery2inputdate: TWideStringField
      FieldName = 'inputdate'
      FixedChar = True
      Size = 10
    end
    object ADOQuery2opration_person: TWideStringField
      FieldName = 'opration_person'
      FixedChar = True
      Size = 10
    end
  end
  object ADOQuery3: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 48
    Top = 199
    object ADOQuery3Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADOQuery3Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADOQuery3Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADOQuery3ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADOQuery3Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADOQuery3SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADOQuery3SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADOQuery3SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADOQuery3SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 104
    Top = 40
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 104
    Top = 92
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 96
    Top = 199
  end
  object ADOQuery4: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'select photo from employeemsg'
      'where rkey=:rkey'
      'and photo is not null ')
    Left = 48
    Top = 239
    object ADOQuery4photo: TBlobField
      FieldName = 'photo'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery4
    Left = 96
    Top = 239
  end
  object ppDBPipeline4: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBPipeline4'
    Left = 144
    Top = 239
    MasterDataPipelineName = 'ppDBPipeline1'
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DBPipeline1'
    Left = 160
    Top = 40
    object ppDBPipeline1ppField1: TppField
      FieldAlias = #22995#21517
      FieldName = #22995#21517
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = #24615#21035
      FieldName = #24615#21035
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = #27665#26063
      FieldName = #27665#26063
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = #37096#38376
      FieldName = #37096#38376
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = #25919#27835#38754#35980
      FieldName = #25919#27835#38754#35980
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = #20986#29983#24180#26376
      FieldName = #20986#29983#24180#26376
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = #20837#32844#26085#26399
      FieldName = #20837#32844#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #32852#31995#30005#35805
      FieldName = #32852#31995#30005#35805
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #32844#20301
      FieldName = #32844#20301
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = #23703#20301
      FieldName = #23703#20301
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = #32844#33021#31867#22411
      FieldName = #32844#33021#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = #25991#21270#31243#24230
      FieldName = #25991#21270#31243#24230
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = #36523#20221#35777#21495#30721
      FieldName = #36523#20221#35777#21495#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = #36523#20221#35777#22320#22336
      FieldName = #36523#20221#35777#22320#22336
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = #23130#23035#29366#20917
      FieldName = #23130#23035#29366#20917
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = #31821#36143
      FieldName = #31821#36143
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = #25143#31821#25152#22312#22320
      FieldName = #25143#31821#25152#22312#22320
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = #23398#21382
      FieldName = #23398#21382
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = #26143#32423
      FieldName = #26143#32423
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField21: TppField
      FieldAlias = #27605#19994#23398#26657
      FieldName = #27605#19994#23398#26657
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField22: TppField
      FieldAlias = #19987#19994
      FieldName = #19987#19994
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField23: TppField
      FieldAlias = #27605#19994#26102#38388
      FieldName = #27605#19994#26102#38388
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField24: TppField
      FieldAlias = #32039#24613#36890#30693#20154
      FieldName = #32039#24613#36890#30693#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField25: TppField
      FieldAlias = #36890#30693#20154#32852#31995#30005#35805
      FieldName = #36890#30693#20154#32852#31995#30005#35805
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField26: TppField
      FieldAlias = #36890#30693#20154#22320#22336
      FieldName = #36890#30693#20154#22320#22336
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField27: TppField
      FieldAlias = #20854#20182#32852#31995#26041#24335
      FieldName = #20854#20182#32852#31995#26041#24335
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField28: TppField
      FieldAlias = #22806#35821#35821#31181
      FieldName = #22806#35821#35821#31181
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField29: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField30: TppField
      FieldAlias = #31616#21382
      FieldName = #31616#21382
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField31: TppField
      FieldAlias = #24037#21495
      FieldName = #24037#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField32: TppField
      FieldAlias = #20303#23487
      FieldName = #20303#23487
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField33: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = #24212#32856#26469#28304
      FieldName = #24212#32856#26469#28304
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object ppDBPipeline1ppField34: TppField
      FieldAlias = #23703#20301#25216#33021
      FieldName = #23703#20301#25216#33021
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DBPipeline2'
    Left = 152
    Top = 96
    MasterDataPipelineName = 'ppDBPipeline1'
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'employeeid'
      FieldName = 'employeeid'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'relationship'
      FieldName = 'relationship'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'chinesename'
      FieldName = 'chinesename'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'birth'
      FieldName = 'birth'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'addr'
      FieldName = 'addr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'workplace'
      FieldName = 'workplace'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'inputdate'
      FieldName = 'inputdate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField10: TppField
      FieldAlias = 'opration_person'
      FieldName = 'opration_person'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object ADOQuery5: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select convert(nvarchar(20),a.alterdate,23) as dt, f.item,d0.dep' +
        'artmentname as dpt1,d1.departmentname as dpt2,'
      
        'd2.item as pos1,d3.item as pos2,d4.accountname as acc1,d5.accoun' +
        'tname as acc2,employeeid'
      'from employee_alteration a '
      'left join datadepartment d0 on a.orginal_departmentid=d0.rkey'
      'left join datadepartment d1 on a.new_departmentid=d1.rkey'
      'left join datadetail d2 on a.orginal_position=d2.rkey'
      'left join datadetail d3 on a.new_position=d3.rkey'
      'left join salaryaccount d4 on a.orginal_accountid=d4.rkey'
      'left join salaryaccount d5 on a.new_accountid=d5.rkey'
      'join employeemsg e on a.employeeid=e.rkey'
      'join datadetail f on a.type=f.rkey'
      'where a.type in '
      '(select rkey from datadetail '
      'where dictid=7 )'
      'and employeeid=:rkey'
      'and f.item not like '#39'%'#22797#32844'%'#39
      'and active=1'
      'and alterdate>=e.ondutytime'
      'order by alterdate')
    Left = 48
    Top = 136
    object ADOQuery5dt: TWideStringField
      FieldName = 'dt'
      ReadOnly = True
    end
    object ADOQuery5item: TWideStringField
      FieldName = 'item'
    end
    object ADOQuery5dpt1: TWideStringField
      FieldName = 'dpt1'
    end
    object ADOQuery5dpt2: TWideStringField
      FieldName = 'dpt2'
    end
    object ADOQuery5pos1: TWideStringField
      FieldName = 'pos1'
    end
    object ADOQuery5pos2: TWideStringField
      FieldName = 'pos2'
    end
    object ADOQuery5acc1: TWideStringField
      FieldName = 'acc1'
      Size = 50
    end
    object ADOQuery5acc2: TWideStringField
      FieldName = 'acc2'
      Size = 50
    end
    object ADOQuery5employeeid: TIntegerField
      FieldName = 'employeeid'
    end
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery5
    Left = 104
    Top = 136
  end
  object ppDBPipeline5: TppDBPipeline
    DataSource = DataSource5
    UserName = 'DBPipeline5'
    Left = 152
    Top = 136
    MasterDataPipelineName = 'ppDBPipeline1'
    object ppDBPipeline5ppField1: TppField
      FieldAlias = 'dt'
      FieldName = 'dt'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField2: TppField
      FieldAlias = 'item'
      FieldName = 'item'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField3: TppField
      FieldAlias = 'dpt1'
      FieldName = 'dpt1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField4: TppField
      FieldAlias = 'dpt2'
      FieldName = 'dpt2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField5: TppField
      FieldAlias = 'pos1'
      FieldName = 'pos1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField6: TppField
      FieldAlias = 'pos2'
      FieldName = 'pos2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField7: TppField
      FieldAlias = 'acc1'
      FieldName = 'acc1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField8: TppField
      FieldAlias = 'acc2'
      FieldName = 'acc2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline5ppField9: TppField
      FieldAlias = 'employeeid'
      FieldName = 'employeeid'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
end

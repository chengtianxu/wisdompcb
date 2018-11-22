object frmReporter: TfrmReporter
  Left = 491
  Top = 295
  Width = 651
  Height = 442
  Caption = #25253#34920#25171#21360
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport391: TppReport
    AutoStop = False
    DataPipeline = ppDB392
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.FileName = '..\NIERP\Report\IQCCheckReport.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 264
    Top = 8
    Version = '7.01'
    mmColumnWidth = 203200
    DataPipelineName = 'ppDB392'
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 173038
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 152136
        mmLeft = 9525
        mmTop = 20902
        mmWidth = 183886
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 20902
        mmWidth = 183621
        BandType = 1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 29898
        mmWidth = 183621
        BandType = 1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 28840
        mmLeft = 33602
        mmTop = 21167
        mmWidth = 33073
        BandType = 1
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 29104
        mmLeft = 66411
        mmTop = 20902
        mmWidth = 19315
        BandType = 1
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 38100
        mmLeft = 85461
        mmTop = 21167
        mmWidth = 53975
        BandType = 1
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 38100
        mmLeft = 138377
        mmTop = 21167
        mmWidth = 29633
        BandType = 1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 47096
        mmLeft = 9260
        mmTop = 21167
        mmWidth = 23813
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #20379#24212#21830#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 9790
        mmTop = 23548
        mmWidth = 23019
        BandType = 1
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 41010
        mmWidth = 183621
        BandType = 1
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9790
        mmTop = 50006
        mmWidth = 183621
        BandType = 1
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 59267
        mmWidth = 183621
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 11113
        mmTop = 33073
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #26469#26009#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 12435
        mmTop = 42333
        mmWidth = 17463
        BandType = 1
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 68527
        mmWidth = 183621
        BandType = 1
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 78052
        mmWidth = 183621
        BandType = 1
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 33338
        mmTop = 91546
        mmWidth = 160073
        BandType = 1
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 104511
        mmWidth = 183621
        BandType = 1
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 80433
        mmLeft = 14288
        mmTop = 78052
        mmWidth = 18785
        BandType = 1
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 80433
        mmLeft = 33338
        mmTop = 77788
        mmWidth = 52123
        BandType = 1
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 71173
        mmLeft = 138642
        mmTop = 87048
        mmWidth = 29369
        BandType = 1
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9790
        mmTop = 122502
        mmWidth = 183621
        BandType = 1
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 131498
        mmWidth = 183621
        BandType = 1
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9525
        mmTop = 140229
        mmWidth = 183621
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #20179#24211#39564#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 12700
        mmTop = 52652
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #25910#36135#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 13229
        mmTop = 62177
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 69850
        mmTop = 23548
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 71438
        mmTop = 32544
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #25209#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 71702
        mmTop = 42333
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #25253#21578#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 143404
        mmTop = 23548
        mmWidth = 18256
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #30003#35831#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 144463
        mmTop = 32279
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = #25277#26816#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 143934
        mmTop = 42333
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 146050
        mmTop = 52388
        mmWidth = 13758
        BandType = 1
      end
      object ppLine33: TppLine
        UserName = 'Line11'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 19844
        mmTop = 67998
        mmWidth = 13229
        BandType = 1
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 72231
        mmTop = 59002
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #25910#36135#26102#38388
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 66146
        mmTop = 62177
        mmWidth = 19050
        BandType = 1
      end
      object ppLine45: TppLine
        UserName = 'Line45'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 52917
        mmTop = 67998
        mmWidth = 13229
        BandType = 1
      end
      object ppLine46: TppLine
        UserName = 'Line46'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 52917
        mmTop = 59002
        mmWidth = 13229
        BandType = 1
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 72231
        mmTop = 68263
        mmWidth = 13229
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = #26080#21348#32032#29289#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 141552
        mmTop = 70379
        mmWidth = 24871
        BandType = 1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'RoHS'#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 66675
        mmTop = 70908
        mmWidth = 17992
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'RoHS'#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 10848
        mmTop = 70908
        mmWidth = 19050
        BandType = 1
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = #26816#27979#39033#30446
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 12965
        mmTop = 80169
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = #22806#35266
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 15875
        mmTop = 98161
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = #35201#27714#21450#20844#24046
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 46831
        mmTop = 80169
        mmWidth = 23813
        BandType = 1
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = #26816#27979#24773#20917
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 103452
        mmTop = 80698
        mmWidth = 19579
        BandType = 1
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = #26816#27979#32467#26524
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 156634
        mmTop = 78317
        mmWidth = 19050
        BandType = 1
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'ACC/REJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 156898
        mmTop = 82815
        mmWidth = 19315
        BandType = 1
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #26495#26009#23610#23544
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 11906
        mmTop = 120650
        mmWidth = 19579
        BandType = 1
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = #38108#31636#21402#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 12700
        mmTop = 133350
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #28909#24212#21147
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 14552
        mmTop = 142875
        mmWidth = 13494
        BandType = 1
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = '+5/-0mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 64558
        mmTop = 121179
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = #177'10%um'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 65088
        mmTop = 133879
        mmWidth = 16140
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = '1)'#12289#19981#20998#23618
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 35454
        mmTop = 142346
        mmWidth = 22490
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = '2)'#12289#19981#36215#27873
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 62442
        mmTop = 142346
        mmWidth = 22490
        BandType = 1
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#26080#21348#32032
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6085
        mmLeft = 169069
        mmTop = 69850
        mmWidth = 5292
        BandType = 1
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = #24212#26377#30456#20851#26816#27979#25968#25454#65292#21253#25324#24615#33021#35201#27714#65292#23454#39564#32467#26524#31561#65292#23454#29289#26631#35782#30456#24212#35268#26684#22411#21495#12289#29983#20135#26085#26399#12289#29615#20445#26631#35782#31561#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Lines.Strings = (
          #24212#26377#30456#20851#26816#27979#25968#25454#65292#21253#25324#24615#33021#35201#27714#65292#23454#39564#32467#26524#31561#65292#23454#29289#26631#35782#30456#24212#35268#26684#22411#21495#12289#29983#20135#26085#26399#12289#29615#20445#26631#35782#31561)
        Transparent = True
        mmHeight = 10319
        mmLeft = 33867
        mmTop = 89429
        mmWidth = 50800
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Lines.Strings = (
          #34920#38754#26080#40635#28857#12289#20985#22353#12289#36215#30385#12289#25830#33457#21450#27687#21270#31561#65292#34432#21435#38108#31636#21518#22522#26448#26080#24322#29289#65292#32455#32441#26174#38706#31561#29616#35937)
        Transparent = True
        mmHeight = 9525
        mmLeft = 34660
        mmTop = 102394
        mmWidth = 48948
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #25253#21578#32534#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 172921
        mmTop = 22754
        mmWidth = 15579
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4498
        mmLeft = 38365
        mmTop = 42333
        mmWidth = 15610
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = #26816#27979#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 168540
        mmTop = 41540
        mmWidth = 24077
        BandType = 1
      end
      object ppLabel75: TppLabel
        UserName = 'Label73'
        Caption = #25968#37327#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 35719
        mmTop = 52917
        mmWidth = 18256
        BandType = 1
      end
      object ppLabel76: TppLabel
        UserName = 'Label74'
        AutoSize = False
        Caption = #21253#35013#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 66146
        mmTop = 52652
        mmWidth = 17992
        BandType = 1
      end
      object ppLabel77: TppLabel
        UserName = 'Label75'
        Caption = #26377#20986#36135#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 96838
        mmTop = 52388
        mmWidth = 22754
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #35746#21333#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 174605
        mmTop = 51858
        mmWidth = 11684
        BandType = 1
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'SGS'#27979#35797#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 100415
        mmTop = 69850
        mmWidth = 21421
        BandType = 1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #26495#26009#23610#23544
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4498
        mmLeft = 44715
        mmTop = 121179
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #38108#31636#21402#24230
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4498
        mmLeft = 44450
        mmTop = 133879
        mmWidth = 15875
        BandType = 1
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #35268#26684
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8467
        mmLeft = 85990
        mmTop = 30427
        mmWidth = 52917
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #29289#26009#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8202
        mmLeft = 34131
        mmTop = 30692
        mmWidth = 30956
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = #22411#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8467
        mmLeft = 85725
        mmTop = 21431
        mmWidth = 50006
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'DBMemo6'
        CharWrap = False
        DataField = #22806#35266#26816#27979#24773#20917
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 12171
        mmLeft = 85990
        mmTop = 87842
        mmWidth = 52388
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 27517
        mmTop = 165365
        mmWidth = 5292
        BandType = 1
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 46302
        mmTop = 165365
        mmWidth = 5292
        BandType = 1
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 65088
        mmTop = 165629
        mmWidth = 5292
        BandType = 1
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 85725
        mmTop = 165365
        mmWidth = 5292
        BandType = 1
      end
      object ppLine52: TppLine
        UserName = 'Line52'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7408
        mmLeft = 105834
        mmTop = 165629
        mmWidth = 5292
        BandType = 1
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 124884
        mmTop = 165629
        mmWidth = 5292
        BandType = 1
      end
      object ppLine54: TppLine
        UserName = 'Line54'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 145521
        mmTop = 165365
        mmWidth = 5292
        BandType = 1
      end
      object ppLine55: TppLine
        UserName = 'Line55'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 166159
        mmTop = 165629
        mmWidth = 5292
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #27979#37327#20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 12700
        mmTop = 167217
        mmWidth = 15875
        BandType = 1
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = #9312
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 40217
        mmTop = 166952
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = #9313
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 58738
        mmTop = 166952
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = #9314
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 167217
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = #9315
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 98690
        mmTop = 166952
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = #9316
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 118269
        mmTop = 167217
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel54: TppLabel
        UserName = 'Label701'
        Caption = #9317
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 138113
        mmTop = 166952
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel55: TppLabel
        UserName = 'Label55'
        Caption = #9318
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 159015
        mmTop = 166952
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = #9319
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 180711
        mmTop = 167217
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #35206#38108#26495#26469#26009#26816#39564#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7144
        mmLeft = 72496
        mmTop = 8996
        mmWidth = 57415
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Incoming Testing Report of CCL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76465
        mmTop = 16933
        mmWidth = 49477
        BandType = 1
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 80433
        mmLeft = 85196
        mmTop = 77523
        mmWidth = 54240
        BandType = 1
      end
      object ppLine39: TppLine
        UserName = 'Line39'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 9790
        mmTop = 157692
        mmWidth = 183621
        BandType = 1
      end
      object ppLine37: TppLine
        UserName = 'Line202'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 9790
        mmTop = 148961
        mmWidth = 183621
        BandType = 1
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = #20379#24212#21830#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8731
        mmLeft = 33073
        mmTop = 21431
        mmWidth = 33602
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        mmLeft = 9525
        mmTop = 0
        mmWidth = 25135
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Company_Name2'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 3969
        mmLeft = 34660
        mmTop = 5027
        mmWidth = 73819
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4763
        mmLeft = 34660
        mmTop = 0
        mmWidth = 74348
        BandType = 1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #21402#24230#20844#24046
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4498
        mmLeft = 55827
        mmTop = 151871
        mmWidth = 15875
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 73290
        mmTop = 151342
        mmWidth = 8202
        BandType = 1
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #26495#26009#21402#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 12171
        mmTop = 152136
        mmWidth = 17992
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #27979#37327#26495#26009#21402#24230#25968#25454
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 80433
        mmTop = 160073
        mmWidth = 42069
        BandType = 1
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = #26159
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 175419
        mmTop = 70379
        mmWidth = 4233
        BandType = 1
      end
      object myDBCheckBox3: TmyDBCheckBox
        UserName = 'DBCheckBox3'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = #26159#21542#26080#21348#32032
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 180975
        mmTop = 69850
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel51: TppLabel
        UserName = 'Label58'
        Caption = #21542
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 187855
        mmTop = 70379
        mmWidth = 4233
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #30003#35831#20154
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 3969
        mmLeft = 40746
        mmTop = 62442
        mmWidth = 17198
        BandType = 1
      end
      object ppLine44: TppLine
        UserName = 'Line44'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 126207
        mmTop = 68263
        mmWidth = 13229
        BandType = 1
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        DisplayFormat = 'yyyy-MM-dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4498
        mmLeft = 170392
        mmTop = 32279
        mmWidth = 20373
        BandType = 1
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 121179
        mmTop = 61383
        mmWidth = 15579
        BandType = 1
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'SGS'#32534#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8467
        mmLeft = 35454
        mmTop = 68527
        mmWidth = 27252
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object myDBCheckBox14: TmyDBCheckBox
        UserName = 'DBCheckBox14'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #25968#37327#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 55298
        mmTop = 52123
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox15: TmyDBCheckBox
        UserName = 'DBCheckBox15'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #21253#35013#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 86254
        mmTop = 51594
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox16: TmyDBCheckBox
        UserName = 'DBCheckBox16'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#26377#20986#36135#25253#21578
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 121444
        mmTop = 51594
        mmWidth = 6350
        BandType = 1
      end
      object ppDBText44: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #21333#20301
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 3969
        mmLeft = 55827
        mmTop = 42333
        mmWidth = 8467
        BandType = 1
      end
      object ppDBMemo15: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = False
        DataField = #25209#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 10319
        mmLeft = 86519
        mmTop = 39423
        mmWidth = 51858
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'Line36'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 9790
        mmTop = 1058
        mmWidth = 183621
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 9525
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'sr_no'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 18521
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 38365
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 57150
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 86784
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 106892
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 123825
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 137584
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 180182
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'value_1'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 39423
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'value_2'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 57415
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'value_3'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 77258
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'value_4'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 5027
        mmLeft = 97102
        mmTop = 1588
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'value_5'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 116946
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'value_6'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 138907
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'value_7'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 158221
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'value_8'
        DataPipeline = ppDB392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB392'
        mmHeight = 4498
        mmLeft = 178330
        mmTop = 1852
        mmWidth = 5027
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line301'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 164836
        mmTop = 0
        mmWidth = 6615
        BandType = 4
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8202
        mmLeft = 27517
        mmTop = 0
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel57: TppLabel
        UserName = 'Label51'
        Caption = #31532
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 13229
        mmTop = 1852
        mmWidth = 3969
        BandType = 4
      end
      object ppLabel58: TppLabel
        UserName = 'Label54'
        Caption = #24352
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 24871
        mmTop = 1852
        mmWidth = 3969
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #21463#25511'No.'#65306'DG-WI-QA-004-06/01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 129646
        mmTop = 529
        mmWidth = 64029
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 122238
        mmTop = 6085
        mmWidth = 71438
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 41804
      mmPrintPosition = 0
      object ppLine58: TppLine
        UserName = 'Line58'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 41804
        mmLeft = 189442
        mmTop = 0
        mmWidth = 3969
        BandType = 7
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 9790
        mmTop = 22225
        mmWidth = 147373
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = #26816#26597#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 14288
        mmTop = 24871
        mmWidth = 13494
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = #26816#26597#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 12435
        mmTop = 34131
        mmWidth = 18256
        BandType = 7
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = #23457#26680#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 93134
        mmTop = 24077
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = #23457#26680#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 91811
        mmTop = 34131
        mmWidth = 18256
        BandType = 7
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 9790
        mmTop = 265
        mmWidth = 183886
        BandType = 7
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 9790
        mmTop = 13494
        mmWidth = 147373
        BandType = 7
      end
      object ppLine48: TppLine
        UserName = 'Line48'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 32015
        mmLeft = 20108
        mmTop = 9260
        mmWidth = 13758
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = #26368#32456#21028#23450
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 12700
        mmTop = 13494
        mmWidth = 19050
        BandType = 7
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 95515
        mmTop = 13758
        mmWidth = 9525
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = #26377#25928#26399#20026
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 92340
        mmTop = 2381
        mmWidth = 18256
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 41540
        mmLeft = 85461
        mmTop = 0
        mmWidth = 5556
        BandType = 7
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 41540
        mmLeft = 103981
        mmTop = 0
        mmWidth = 7144
        BandType = 7
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = #26377#25928#26399#26159#21542#31526#21512#35201#27714#35268#33539
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 26723
        mmTop = 2910
        mmWidth = 50271
        BandType = 7
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = #9312
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 163248
        mmTop = 10848
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = #9313
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 174096
        mmTop = 10583
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = #9314
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 184415
        mmTop = 11113
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = #9319
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 184680
        mmTop = 22754
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = #9316
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 163248
        mmTop = 35719
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = #9317
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 174096
        mmTop = 35719
        mmWidth = 3969
        BandType = 7
      end
      object ppLabel71: TppLabel
        UserName = 'Label71'
        Caption = #9318
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 184680
        mmTop = 35454
        mmWidth = 3969
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 19050
        mmLeft = 169069
        mmTop = 15610
        mmWidth = 14552
        BandType = 7
      end
      object ppLabel68: TppLabel
        UserName = 'Label601'
        Caption = #9315
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 162984
        mmTop = 22754
        mmWidth = 3969
        BandType = 7
      end
      object ppLine34: TppLine
        UserName = 'Line401'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 41540
        mmLeft = 143404
        mmTop = 0
        mmWidth = 13758
        BandType = 7
      end
      object ppLine56: TppLine
        UserName = 'Line56'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 9790
        mmTop = 38894
        mmWidth = 183621
        BandType = 7
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 41804
        mmLeft = 9525
        mmTop = 0
        mmWidth = 7144
        BandType = 7
      end
      object ppLabel59: TppLabel
        UserName = 'Label57'
        Caption = #27979#37327#20301#32622#22914#19979#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 159544
        mmTop = 2381
        mmWidth = 32279
        BandType = 7
      end
      object myDBCheckBox2: TmyDBCheckBox
        UserName = 'DBCheckBox2'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#31526#21512#26631#20934
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6085
        mmLeft = 19844
        mmTop = 1852
        mmWidth = 5821
        BandType = 7
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = #26368#32456#21028#23450
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 47096
        mmTop = 12435
        mmWidth = 22225
        BandType = 7
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = #22791#27880
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 11377
        mmLeft = 112184
        mmTop = 9790
        mmWidth = 44715
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = #26816#26597#21592
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 47096
        mmTop = 23813
        mmWidth = 20902
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = #26816#26597#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 38894
        mmTop = 33602
        mmWidth = 40746
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = #23457#26680#20154
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 122502
        mmTop = 24077
        mmWidth = 20902
        BandType = 7
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = #23457#26680#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 113771
        mmTop = 33602
        mmWidth = 40746
        BandType = 7
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = #26377#25928#26399#33267
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 118798
        mmTop = 2117
        mmWidth = 28575
        BandType = 7
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = ado391
    Left = 96
    Top = 76
  end
  object ado391: TADOQuery
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
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0391.rkey, dbo.data0391.iqc_number as '#25253#21578#32534#21495', d' +
        'bo.Data0070.PO_NUMBER as '#35746#21333#21495',dbo.Data0017.INV_NAME as '#29289#26009#21517#31216', dbo.' +
        'Data0017.INV_DESCRIPTION as '#35268#26684', '
      
        '                      dbo.Data0023.CODE as '#20379#24212#21830#20195#30721', dbo.Data0023.A' +
        'BBR_NAME as '#20379#24212#21830#21517#31216',dbo.data0391.supplier_model as '#22411#21495','
      
        '                     dbo.data0391.sgs_no as SGS'#32534#21495',  dbo.data0391' +
        '.sgs_date SGS'#27979#35797#26085#26399', dbo.data0391.rece_qty as '#26469#26009#25968#37327', dbo.data0391.i' +
        'qc_qty  as '#26816#27979#25968#37327', dbo.data0391.barch_no as '#25209#21495', '
      
        #9'  dbo.data0391.appl_date as '#30003#35831#26085#26399',dbo.data0005.employee_name as ' +
        #30003#35831#20154', dbo.data0391.if_halogen,case  dbo.data0391.rece_qty-dbo.dat' +
        'a0391.iqc_qty when 0  then '#39'True'#39' else '#39'False'#39' end as '#25277#26816','
      
        '                      case data0391.if_halogen when 1 then '#39'True' +
        #39' else '#39'False'#39' end as '#26159#21542#26080#21348#32032',  dbo.data0391.appearance as '#22806#35266#26816#27979#24773#20917',' +
        ' '
      
        '                      dbo.data0391.part_size as '#26495#26009#23610#23544', dbo.data03' +
        '91.part_thickness as '#26495#26009#21402#24230', dbo.data0391.tong_thickness as '#38108#31636#21402#24230', ' +
        'dbo.data0391.thick_tolerance as '#21402#24230#20844#24046', dbo.data0391.ht_remark ,'
      
        #9#9'dbo.data0391.if_standard,case dbo.data0391.if_standard when '#39#26159 +
        #39' then '#39'True'#39' else '#39'False'#39' end as '#26159#21542#31526#21512#26631#20934','
      
        #9#9'dbo.data0391.extrl_date as '#26377#25928#26399#33267',judge_result as '#26368#32456#21028#23450',dbo.data0' +
        '391.remark as '#22791#27880',D05_appr.employee_name as '#26816#26597#21592',dbo.data0391.appr' +
        '_date as '#26816#26597#26085#26399','
      
        #9#9'  D05_auth.employee_name as '#23457#26680#20154',dbo.data0391.auth_date as '#23457#26680#26085#26399 +
        ', case when dbo.data0391.sgs_no='#39#39' then '#39'False'#39' else '#39'True'#39' end ' +
        'as SGS ,'
      
        '                       case data0391.qty_qualified when 1 then '#39 +
        'True'#39' when 0 then '#39'False'#39'  end as '#25968#37327#26159#21542#21512#26684', case data0391.package_' +
        'qualified when 1 then '#39'True'#39'  when 0 then '#39'False'#39'  end as '#21253#35013#26159#21542#21512#26684 +
        ','
      
        '                       case data0391.hasheepreport  when 1 then ' +
        #39'True'#39'  when 0 then '#39'False'#39'  end as '#26159#21542#26377#20986#36135#25253#21578',dbo.data0002.unit_na' +
        'me as '#21333#20301
      'FROM         dbo.data0391 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.data0391.rkey17 = dbo.' +
        'Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0071 ON dbo.data0391.rkey71 = dbo.' +
        'Data0071.RKEY INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.' +
        'Data0070.RKEY INNER JOIN'
      
        '                     dbo.Data0002 ON dbo.data0071.purchase_unit_' +
        'ptr = dbo.Data0002.RKEY inner join'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY inner join '
      
        #9#9#9#9#9'  dbo.data0005 ON dbo.data0391.appl_user_ptr = dbo.Data0005' +
        '.rkey left join '
      
        #9#9#9#9#9'  dbo.data0005 as D05_appr ON dbo.data0391.appr_user_ptr = ' +
        'D05_appr.rkey left join'
      
        #9#9#9#9#9'  dbo.data0005 as D05_auth ON dbo.data0391.auth_user_ptr = ' +
        'D05_auth.rkey'
      'where dbo.data0391.rkey=:rkey')
    Left = 40
    Top = 72
    object ado391rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado391DSDesigner: TStringField
      FieldName = #25253#21578#32534#21495
      Size = 10
    end
    object ado391DSDesigner2: TStringField
      FieldName = #35746#21333#21495
      Size = 15
    end
    object ado391DSDesigner3: TStringField
      FieldName = #29289#26009#21517#31216
      Size = 30
    end
    object ado391DSDesigner4: TStringField
      FieldName = #35268#26684
      Size = 70
    end
    object ado391DSDesigner5: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object ado391DSDesigner6: TStringField
      FieldName = #20379#24212#21830#21517#31216
      Size = 16
    end
    object ado391DSDesigner7: TStringField
      FieldName = #22411#21495
    end
    object ado391SGS: TStringField
      FieldName = 'SGS'#32534#21495
      Size = 25
    end
    object ado391SGS2: TDateTimeField
      FieldName = 'SGS'#27979#35797#26085#26399
    end
    object ado391DSDesigner8: TBCDField
      FieldName = #26469#26009#25968#37327
      Precision = 13
    end
    object ado391DSDesigner9: TBCDField
      FieldName = #26816#27979#25968#37327
      Precision = 13
    end
    object ado391DSDesigner10: TStringField
      FieldName = #25209#21495
      Size = 100
    end
    object ado391DSDesigner11: TDateTimeField
      FieldName = #30003#35831#26085#26399
    end
    object ado391DSDesigner12: TStringField
      FieldName = #30003#35831#20154
      Size = 16
    end
    object ado391if_halogen: TWideStringField
      FieldName = 'if_halogen'
      Size = 16
    end
    object ado391DSDesigner14: TWideStringField
      FieldName = #22806#35266#26816#27979#24773#20917
      Size = 100
    end
    object ado391DSDesigner15: TStringField
      FieldName = #26495#26009#23610#23544
      Size = 16
    end
    object ado391DSDesigner16: TBCDField
      FieldName = #38108#31636#21402#24230
      Precision = 5
      Size = 2
    end
    object ado391ht_remark: TWideStringField
      FieldName = 'ht_remark'
    end
    object ado391if_standard: TWideStringField
      FieldName = 'if_standard'
      Size = 4
    end
    object ado391DSDesigner19: TDateTimeField
      FieldName = #26377#25928#26399#33267
    end
    object ado391DSDesigner20: TWideStringField
      FieldName = #26368#32456#21028#23450
      Size = 8
    end
    object ado391DSDesigner21: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ado391DSDesigner22: TStringField
      FieldName = #26816#26597#21592
      Size = 16
    end
    object ado391DSDesigner23: TDateTimeField
      FieldName = #26816#26597#26085#26399
    end
    object ado391DSDesigner24: TStringField
      FieldName = #23457#26680#20154
      Size = 16
    end
    object ado391DSDesigner25: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object ado391DSDesigner17: TStringField
      FieldName = #26495#26009#21402#24230
      Size = 50
    end
    object ado391DSDesigner26: TStringField
      FieldName = #21402#24230#20844#24046
      Size = 15
    end
    object ado391DSDesigner28: TStringField
      FieldName = #26159#21542#31526#21512#26631#20934
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner13: TStringField
      FieldName = #26159#21542#26080#21348#32032
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner18: TStringField
      FieldName = #25277#26816
      ReadOnly = True
      Size = 5
    end
    object ado391SGS3: TStringField
      FieldName = 'SGS'
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner27: TStringField
      FieldName = #25968#37327#26159#21542#21512#26684
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner29: TStringField
      FieldName = #21253#35013#26159#21542#21512#26684
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner30: TStringField
      FieldName = #26159#21542#26377#20986#36135#25253#21578
      ReadOnly = True
      Size = 5
    end
    object ado391DSDesigner31: TStringField
      FieldName = #21333#20301
    end
  end
  object ADO493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Company_Name,Company_Name2, Company_Name3,Company_Icon  F' +
        'ROM DATA0493')
    Left = 40
    Top = 24
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADO493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO493
    Left = 108
    Top = 28
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 184
    Top = 12
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
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
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
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
  object ado392: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey391'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select top 5  rkey391, sr_no, value_1, value_2, value_3, value_4' +
        ', value_5, value_6, value_7, value_8 from data0392 where rkey391' +
        '=:rkey391')
    Left = 44
    Top = 120
  end
  object DataSource3: TDataSource
    DataSet = ado392
    Left = 112
    Top = 120
  end
  object ppDB392: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB392'
    Left = 180
    Top = 128
    object ppDB392ppField1: TppField
      FieldAlias = 'rkey391'
      FieldName = 'rkey391'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField2: TppField
      FieldAlias = 'sr_no'
      FieldName = 'sr_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField3: TppField
      FieldAlias = 'value_1'
      FieldName = 'value_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField4: TppField
      FieldAlias = 'value_2'
      FieldName = 'value_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField5: TppField
      FieldAlias = 'value_3'
      FieldName = 'value_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField6: TppField
      FieldAlias = 'value_4'
      FieldName = 'value_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField7: TppField
      FieldAlias = 'value_5'
      FieldName = 'value_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField8: TppField
      FieldAlias = 'value_6'
      FieldName = 'value_6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField9: TppField
      FieldAlias = 'value_7'
      FieldName = 'value_7'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB392ppField10: TppField
      FieldAlias = 'value_8'
      FieldName = 'value_8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object ppDesigner391: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport391
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 380
    Top = 8
  end
  object ppDB391: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB391'
    Left = 184
    Top = 72
    object ppDB391ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField2: TppField
      FieldAlias = #25253#21578#32534#21495
      FieldName = #25253#21578#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField3: TppField
      FieldAlias = #35746#21333#21495
      FieldName = #35746#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField4: TppField
      FieldAlias = #29289#26009#21517#31216
      FieldName = #29289#26009#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField5: TppField
      FieldAlias = #35268#26684
      FieldName = #35268#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField6: TppField
      FieldAlias = #20379#24212#21830#20195#30721
      FieldName = #20379#24212#21830#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField7: TppField
      FieldAlias = #20379#24212#21830#21517#31216
      FieldName = #20379#24212#21830#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField8: TppField
      FieldAlias = #22411#21495
      FieldName = #22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField9: TppField
      FieldAlias = 'SGS'#32534#21495
      FieldName = 'SGS'#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField10: TppField
      FieldAlias = 'SGS'#27979#35797#26085#26399
      FieldName = 'SGS'#27979#35797#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField11: TppField
      FieldAlias = #26469#26009#25968#37327
      FieldName = #26469#26009#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField12: TppField
      FieldAlias = #26816#27979#25968#37327
      FieldName = #26816#27979#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField13: TppField
      FieldAlias = #25209#21495
      FieldName = #25209#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField14: TppField
      FieldAlias = #30003#35831#26085#26399
      FieldName = #30003#35831#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField15: TppField
      FieldAlias = #30003#35831#20154
      FieldName = #30003#35831#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField16: TppField
      FieldAlias = 'if_halogen'
      FieldName = 'if_halogen'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField18: TppField
      FieldAlias = #22806#35266#26816#27979#24773#20917
      FieldName = #22806#35266#26816#27979#24773#20917
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField19: TppField
      FieldAlias = #26495#26009#23610#23544
      FieldName = #26495#26009#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField21: TppField
      FieldAlias = #38108#31636#21402#24230
      FieldName = #38108#31636#21402#24230
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField23: TppField
      FieldAlias = 'ht_remark'
      FieldName = 'ht_remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField24: TppField
      FieldAlias = 'if_standard'
      FieldName = 'if_standard'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField25: TppField
      FieldAlias = #26159#21542#31526#21512#26631#20934
      FieldName = #26159#21542#31526#21512#26631#20934
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField26: TppField
      FieldAlias = #26377#25928#26399#33267
      FieldName = #26377#25928#26399#33267
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField27: TppField
      FieldAlias = #26368#32456#21028#23450
      FieldName = #26368#32456#21028#23450
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField28: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField29: TppField
      FieldAlias = #26816#26597#21592
      FieldName = #26816#26597#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField30: TppField
      FieldAlias = #26816#26597#26085#26399
      FieldName = #26816#26597#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField31: TppField
      FieldAlias = #23457#26680#20154
      FieldName = #23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField32: TppField
      FieldAlias = #23457#26680#26085#26399
      FieldName = #23457#26680#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB391ppField20: TppField
      FieldAlias = #26495#26009#21402#24230
      FieldName = #26495#26009#21402#24230
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppDB391ppField22: TppField
      FieldAlias = #21402#24230#20844#24046
      FieldName = #21402#24230#20844#24046
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppDB391ppField17: TppField
      FieldAlias = #26159#21542#26080#21348#32032
      FieldName = #26159#21542#26080#21348#32032
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppDB391ppField33: TppField
      FieldAlias = #25277#26816
      FieldName = #25277#26816
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
    object ppDB391ppField34: TppField
      FieldAlias = 'SGS'
      FieldName = 'SGS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 33
    end
    object ppDB391ppField35: TppField
      FieldAlias = #25968#37327#26159#21542#21512#26684
      FieldName = #25968#37327#26159#21542#21512#26684
      FieldLength = 10
      DisplayWidth = 10
      Position = 34
    end
    object ppDB391ppField36: TppField
      FieldAlias = #21253#35013#26159#21542#21512#26684
      FieldName = #21253#35013#26159#21542#21512#26684
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object ppDB391ppField37: TppField
      FieldAlias = #26159#21542#26377#20986#36135#25253#21578
      FieldName = #26159#21542#26377#20986#36135#25253#21578
      FieldLength = 10
      DisplayWidth = 10
      Position = 36
    end
    object ppDB391ppField38: TppField
      FieldAlias = #21333#20301
      FieldName = #21333#20301
      FieldLength = 10
      DisplayWidth = 10
      Position = 37
    end
  end
  object ppReport391_nomal: TppReport
    AutoStop = False
    DataPipeline = ppDB391
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
    Template.FileName = '..\NIERP\Report\IQCCHECKREPORT_NOMAL.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 280
    Top = 124
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB391'
    object ppTitleBand2: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 114300
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 14552
        mmLeft = 16933
        mmTop = 1323
        mmWidth = 22490
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4445
        mmLeft = 39952
        mmTop = 2381
        mmWidth = 23876
        BandType = 1
      end
      object ppDBText31: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name2'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4445
        mmLeft = 39688
        mmTop = 7144
        mmWidth = 25866
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label1'
        Caption = #29289#26009#26816#39564#36890#30693#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6435
        mmLeft = 75936
        mmTop = 14817
        mmWidth = 39709
        BandType = 1
      end
      object ppLabel60: TppLabel
        UserName = 'Label2'
        Caption = 'Material Inspection Notification Form '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4022
        mmLeft = 66940
        mmTop = 22225
        mmWidth = 69173
        BandType = 1
      end
      object ppLabel61: TppLabel
        UserName = 'Label3'
        Caption = #33268#65306#21697#36136#37096'/IQC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 16933
        mmTop = 27781
        mmWidth = 27263
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'Label4'
        Caption = #20170#26377#20179#24211#22312
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 31221
        mmTop = 34396
        mmWidth = 19473
        BandType = 1
      end
      object ppLabel63: TppLabel
        UserName = 'Label5'
        Caption = #25910#21040#19979#21015#29289#26009#19968#25209#65292#35831#21697#36136#37096'/IQC'#25910#21333#21518#20110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 81756
        mmTop = 34396
        mmWidth = 76465
        BandType = 1
      end
      object ppLabel64: TppLabel
        UserName = 'Label6'
        Caption = #26102#20043#20869#23545#35813#25209#29289#26009#36827#34892#36136#37327#26816#39564#65292#20197#20415#25105#37096#38376#21450#26102#20837#24211#12290
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 16933
        mmTop = 40217
        mmWidth = 97367
        BandType = 1
      end
      object ppLine59: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 53446
        mmTop = 35190
        mmWidth = 26194
        BandType = 1
      end
      object ppLine60: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 35190
        mmWidth = 16140
        BandType = 1
      end
      object ppLine61: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 60854
        mmWidth = 162984
        BandType = 1
      end
      object ppLine62: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 69056
        mmWidth = 162984
        BandType = 1
      end
      object ppLine63: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3440
        mmLeft = 105040
        mmTop = 52652
        mmWidth = 74613
        BandType = 1
      end
      object ppLine64: TppLine
        UserName = 'Line6'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 26723
        mmLeft = 39688
        mmTop = 45773
        mmWidth = 4233
        BandType = 1
      end
      object ppLine65: TppLine
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 25929
        mmLeft = 101071
        mmTop = 46567
        mmWidth = 4233
        BandType = 1
      end
      object ppLine66: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 25929
        mmLeft = 125677
        mmTop = 46567
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel73: TppLabel
        UserName = 'Label7'
        Caption = #20179#24211#39564#25910#35760#24405#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 17992
        mmTop = 75671
        mmWidth = 27263
        BandType = 1
      end
      object ppLabel74: TppLabel
        UserName = 'Label8'
        Caption = '1'#12289#25968#37327#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 18785
        mmTop = 84138
        mmWidth = 21421
        BandType = 1
      end
      object ppLabel78: TppLabel
        UserName = 'Label9'
        Caption = '2'#12289#21253#35013#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 18785
        mmTop = 92604
        mmWidth = 21421
        BandType = 1
      end
      object ppLabel79: TppLabel
        UserName = 'Label10'
        Caption = '3'#12289#26377#20986#36135#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 18521
        mmTop = 101336
        mmWidth = 25315
        BandType = 1
      end
      object ppLabel80: TppLabel
        UserName = 'Label11'
        Caption = #25910#36135#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 19050
        mmTop = 108215
        mmWidth = 15579
        BandType = 1
      end
      object myDBCheckBox4: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #25968#37327#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 57150
        mmTop = 83608
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox5: TmyDBCheckBox
        UserName = 'DBCheckBox2'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #21253#35013#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 57150
        mmTop = 91811
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox6: TmyDBCheckBox
        UserName = 'DBCheckBox3'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#26377#20986#36135#25253#21578
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 57150
        mmTop = 100806
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel81: TppLabel
        UserName = 'Label12'
        Caption = #19981#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 83873
        mmTop = 84138
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel82: TppLabel
        UserName = 'Label13'
        Caption = #19981#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 83608
        mmTop = 92340
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel83: TppLabel
        UserName = 'Label14'
        Caption = #26080#20986#36135#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 83344
        mmTop = 101336
        mmWidth = 19473
        BandType = 1
      end
      object myDBCheckBox7: TmyDBCheckBox
        UserName = 'DBCheckBox4'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = #25968#37327#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 108215
        mmTop = 83344
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox8: TmyDBCheckBox
        UserName = 'DBCheckBox5'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = #21253#35013#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 108215
        mmTop = 91811
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox9: TmyDBCheckBox
        UserName = 'DBCheckBox6'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = #26159#21542#26377#20986#36135#25253#21578
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 108215
        mmTop = 100542
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel84: TppLabel
        UserName = 'Label15'
        Caption = 'IQC'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 81227
        mmTop = 108215
        mmWidth = 9737
        BandType = 1
      end
      object ppLabel85: TppLabel
        UserName = 'Label16'
        Caption = #26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 134144
        mmTop = 108479
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel86: TppLabel
        UserName = 'Label19'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 23019
        mmTop = 54240
        mmWidth = 15579
        BandType = 1
      end
      object ppLabel87: TppLabel
        UserName = 'Label20'
        Caption = #25910#36135#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 23019
        mmTop = 65881
        mmWidth = 15579
        BandType = 1
      end
      object ppLabel88: TppLabel
        UserName = 'Label21'
        Caption = #35268#26684#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 108744
        mmTop = 49477
        mmWidth = 15579
        BandType = 1
      end
      object ppLabel89: TppLabel
        UserName = 'Label22'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 110331
        mmTop = 57944
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel90: TppLabel
        UserName = 'Label23'
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 110861
        mmTop = 66411
        mmWidth = 11684
        BandType = 1
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #29289#26009#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 13758
        mmLeft = 51329
        mmTop = 48683
        mmWidth = 46831
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 67204
        mmTop = 66146
        mmWidth = 15579
        BandType = 1
      end
      object ppDBText34: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20379#24212#21830#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 142346
        mmTop = 57944
        mmWidth = 19473
        BandType = 1
      end
      object ppDBText35: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #35746#21333#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 146579
        mmTop = 66146
        mmWidth = 11684
        BandType = 1
      end
      object ppDBMemo14: TppDBMemo
        UserName = 'DBMemo14'
        CharWrap = False
        DataField = #35268#26684
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8467
        mmLeft = 131763
        mmTop = 47096
        mmWidth = 46831
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine105: TppLine
        UserName = 'Line105'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 42598
        mmWidth = 162984
        BandType = 1
      end
      object ppLine106: TppLine
        UserName = 'Line106'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 67998
        mmLeft = 12700
        mmTop = 46038
        mmWidth = 4233
        BandType = 1
      end
      object ppLine104: TppLine
        UserName = 'Line104'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 16933
        mmTop = 112977
        mmWidth = 162984
        BandType = 1
      end
      object ppLine107: TppLine
        UserName = 'Line107'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 67733
        mmLeft = 175684
        mmTop = 46038
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel187: TppLabel
        UserName = 'Label187'
        Caption = #23567
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 175419
        mmTop = 34925
        mmWidth = 3969
        BandType = 1
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = #30003#35831#20154
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 36777
        mmTop = 108215
        mmWidth = 11684
        BandType = 1
      end
      object ppDBText46: TppDBText
        UserName = 'DBText46'
        DataField = #21333#20301
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 3969
        mmLeft = 91017
        mmTop = 66411
        mmWidth = 12171
        BandType = 1
      end
      object ppDBText81: TppDBText
        UserName = 'DBText81'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        DisplayFormat = 'yyyy-MM-dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 147638
        mmTop = 108479
        mmWidth = 15579
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLabel91: TppLabel
        UserName = 'Label17'
        Caption = #21463#25511'NO.'#65306'DG-WI-PMC-012-09/00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 116417
        mmTop = 794
        mmWidth = 65352
        BandType = 8
      end
      object ppLabel92: TppLabel
        UserName = 'Label18'
        Caption = #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 110861
        mmTop = 5821
        mmWidth = 71438
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppReport_rb: TppReport
    AutoStop = False
    DataPipeline = ppDB391
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
    Template.FileName = '..\NIERP\Report\IQCCheckReport_Rb.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 260
    Top = 64
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB391'
    object ppTitleBand3: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 263526
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape1'
        mmHeight = 239184
        mmLeft = 9525
        mmTop = 23813
        mmWidth = 175948
        BandType = 1
      end
      object ppDBText36: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4022
        mmLeft = 32808
        mmTop = 0
        mmWidth = 21336
        BandType = 1
      end
      object ppDBText37: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name2'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4022
        mmLeft = 32808
        mmTop = 4233
        mmWidth = 23114
        BandType = 1
      end
      object ppLabel93: TppLabel
        UserName = 'Label1'
        Caption = #26469#26009#26816#39564#27979#35797#35760#24405
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6435
        mmLeft = 75671
        mmTop = 8467
        mmWidth = 45381
        BandType = 1
      end
      object ppLabel94: TppLabel
        UserName = 'Label2'
        Caption = 'Incoming inspection test records'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4826
        mmLeft = 65352
        mmTop = 15081
        mmWidth = 69088
        BandType = 1
      end
      object ppLabel95: TppLabel
        UserName = 'Label3'
        Caption = 'Number:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 9790
        mmTop = 19315
        mmWidth = 14817
        BandType = 1
      end
      object ppLabel96: TppLabel
        UserName = 'Label4'
        Caption = #26816#39564#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 141817
        mmTop = 19315
        mmWidth = 21167
        BandType = 1
      end
      object ppLine67: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 30956
        mmWidth = 175684
        BandType = 1
      end
      object ppLine68: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 38365
        mmWidth = 175684
        BandType = 1
      end
      object ppLine69: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 9525
        mmTop = 48948
        mmWidth = 175948
        BandType = 1
      end
      object ppLine70: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 58473
        mmWidth = 175684
        BandType = 1
      end
      object ppLine71: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9525
        mmTop = 70115
        mmWidth = 175684
        BandType = 1
      end
      object ppLine72: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9525
        mmTop = 79640
        mmWidth = 175684
        BandType = 1
      end
      object ppLine73: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9525
        mmTop = 88900
        mmWidth = 175684
        BandType = 1
      end
      object ppLine74: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 113242
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel97: TppLabel
        UserName = 'Label5'
        Caption = #26469#26009#21378#21830#26377#26080#25552#20379#20986#36135#26816#39564#25253#21578':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 25400
        mmWidth = 61383
        BandType = 1
      end
      object myCheckBox1: TmyCheckBox
        UserName = 'CheckBox1'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 75671
        mmTop = 24342
        mmWidth = 5556
        BandType = 1
      end
      object ppLabel98: TppLabel
        UserName = 'Label6'
        Caption = #26377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 80433
        mmTop = 25400
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel99: TppLabel
        UserName = 'Label7'
        Caption = #26080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 89165
        mmTop = 25400
        mmWidth = 4233
        BandType = 1
      end
      object myCheckBox2: TmyCheckBox
        UserName = 'CheckBox2'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 84402
        mmTop = 24342
        mmWidth = 5556
        BandType = 1
      end
      object ppLabel100: TppLabel
        UserName = 'Label8'
        Caption = #26469#26009#21378#21830#26377#26080#25552#20379'ROHS'#25253#21578#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 105834
        mmTop = 25400
        mmWidth = 55033
        BandType = 1
      end
      object ppLabel101: TppLabel
        UserName = 'Label9'
        Caption = #26377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 168275
        mmTop = 25400
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel102: TppLabel
        UserName = 'Label10'
        Caption = #26080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 177007
        mmTop = 25400
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel103: TppLabel
        UserName = 'Label11'
        Caption = #26469#26009#20135#21697#26159#21542#25110#28385#36275#26080#21348':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 9790
        mmTop = 32808
        mmWidth = 48683
        BandType = 1
      end
      object ppLabel104: TppLabel
        UserName = 'Label101'
        Caption = #26080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 75671
        mmTop = 33073
        mmWidth = 4233
        BandType = 1
      end
      object myDBCheckBox10: TmyDBCheckBox
        UserName = 'DBCheckBox3'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = #26159#21542#26080#21348#32032
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 70644
        mmTop = 32015
        mmWidth = 5292
        BandType = 1
      end
      object ppLabel105: TppLabel
        UserName = 'Label13'
        Caption = #26377
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 66940
        mmTop = 33073
        mmWidth = 4233
        BandType = 1
      end
      object myDBCheckBox11: TmyDBCheckBox
        UserName = 'DBCheckBox4'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#26080#21348#32032
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 62177
        mmTop = 32015
        mmWidth = 5292
        BandType = 1
      end
      object ppLabel106: TppLabel
        UserName = 'Label12'
        Caption = 'ROHS'#25253#21578#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 106098
        mmTop = 32808
        mmWidth = 29633
        BandType = 1
      end
      object ppLabel107: TppLabel
        UserName = 'Label14'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 39688
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel108: TppLabel
        UserName = 'Label16'
        Caption = 'MaterialCode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 10054
        mmTop = 54769
        mmWidth = 21336
        BandType = 1
      end
      object ppLabel109: TppLabel
        UserName = 'Label17'
        Caption = #25910#36135#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 73554
        mmTop = 39423
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel110: TppLabel
        UserName = 'Label18'
        Caption = 'QTY.Received'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 73554
        mmTop = 43921
        mmWidth = 21336
        BandType = 1
      end
      object ppLabel111: TppLabel
        UserName = 'Label19'
        Caption = #20135#21697#25209#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 135202
        mmTop = 39952
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel112: TppLabel
        UserName = 'Label20'
        Caption = 'LOT.NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 135202
        mmTop = 44715
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel113: TppLabel
        UserName = 'Label21'
        Caption = #29289#26009#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 49742
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel114: TppLabel
        UserName = 'Label22'
        Caption = 'MaterialName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 10319
        mmTop = 44450
        mmWidth = 21336
        BandType = 1
      end
      object ppLabel115: TppLabel
        UserName = 'Label23'
        Caption = 'Receiving date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 73290
        mmTop = 54240
        mmWidth = 24892
        BandType = 1
      end
      object ppLabel116: TppLabel
        UserName = 'Label24'
        Caption = #25910#36135#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 73290
        mmTop = 49477
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel117: TppLabel
        UserName = 'Label25'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 134938
        mmTop = 49742
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel118: TppLabel
        UserName = 'Label26'
        Caption = 'Supplier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 134938
        mmTop = 54240
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel119: TppLabel
        UserName = 'Label27'
        Caption = #29289#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 60325
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel120: TppLabel
        UserName = 'Label28'
        Caption = 'MaterialSpec'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 10319
        mmTop = 65617
        mmWidth = 21336
        BandType = 1
      end
      object ppLabel121: TppLabel
        UserName = 'Label29'
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 73554
        mmTop = 60325
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel122: TppLabel
        UserName = 'Label30'
        Caption = 'P.O.NO.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 73554
        mmTop = 66146
        mmWidth = 13631
        BandType = 1
      end
      object ppLabel123: TppLabel
        UserName = 'Label31'
        Caption = #25910#36135#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 135202
        mmTop = 60325
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel124: TppLabel
        UserName = 'Label32'
        Caption = 'Receiver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 135202
        mmTop = 65881
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel125: TppLabel
        UserName = 'Label33'
        Caption = #25277#26679#26041#24335#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 70908
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel126: TppLabel
        UserName = 'Label34'
        Caption = 'Sampling Method 100% Inpecgion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 10054
        mmTop = 75936
        mmWidth = 53340
        BandType = 1
      end
      object ppLabel127: TppLabel
        UserName = 'Label35'
        Caption = #20840#26816
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 40746
        mmTop = 70908
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel128: TppLabel
        UserName = 'Label36'
        Caption = #25277#26816
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 59531
        mmTop = 71173
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel129: TppLabel
        UserName = 'Label15'
        Caption = #25353'(Control)C=0  AQL=0.65'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 107686
        mmTop = 70644
        mmWidth = 50800
        BandType = 1
      end
      object myCheckBox6: TmyCheckBox
        UserName = 'CheckBox5'
        Checked = False
        Transparent = True
        mmHeight = 6085
        mmLeft = 170392
        mmTop = 69850
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel130: TppLabel
        UserName = 'Label37'
        Caption = #38543#26426#25277#26816' Random Sampling'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 107950
        mmTop = 75142
        mmWidth = 50800
        BandType = 1
      end
      object myCheckBox7: TmyCheckBox
        UserName = 'CheckBox6'
        Checked = False
        Transparent = True
        mmHeight = 6085
        mmLeft = 170392
        mmTop = 74348
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel131: TppLabel
        UserName = 'Label39'
        Caption = #25277#26679#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 80169
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel132: TppLabel
        UserName = 'Label40'
        Caption = 'Sampling Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 9790
        mmTop = 85196
        mmWidth = 30226
        BandType = 1
      end
      object ppLabel133: TppLabel
        UserName = 'Label41'
        Caption = #26377#25928#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 107421
        mmTop = 80433
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel134: TppLabel
        UserName = 'Label401'
        Caption = 'Useful-life'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 107421
        mmTop = 85196
        mmWidth = 19558
        BandType = 1
      end
      object ppLabel135: TppLabel
        UserName = 'Label38'
        Caption = #27979#35797#39033#30446
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 90223
        mmWidth = 16933
        BandType = 1
      end
      object ppMemo3: TppMemo
        UserName = 'Memo1'
        Caption = #35201#27714#20381#25454#12298#26469#26009#26816#39564#35268#31243#12299'According as'#12298'Incoming test rules'#12299#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Lines.Strings = (
          #35201#27714#20381#25454#12298#26469#26009#26816#39564#35268#31243#12299'According as'#12298'Incoming test rules'#12299)
        Transparent = True
        mmHeight = 12171
        mmLeft = 70908
        mmTop = 100806
        mmWidth = 35190
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel136: TppLabel
        UserName = 'Label42'
        Caption = #26816#39564#35760#24405
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 107421
        mmTop = 89694
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel137: TppLabel
        UserName = 'Label43'
        Caption = 'TestItem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 10054
        mmTop = 95250
        mmWidth = 15579
        BandType = 1
      end
      object ppLabel138: TppLabel
        UserName = 'Label44'
        Caption = 'Test Record'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 107421
        mmTop = 94721
        mmWidth = 23283
        BandType = 1
      end
      object ppLabel139: TppLabel
        UserName = 'Label45'
        Caption = #21028#23450'Judgement'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 157163
        mmTop = 89959
        mmWidth = 25315
        BandType = 1
      end
      object ppLabel140: TppLabel
        UserName = 'Label46'
        Caption = 'ACC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 159809
        mmTop = 95515
        mmWidth = 5334
        BandType = 1
      end
      object ppLabel141: TppLabel
        UserName = 'Label47'
        Caption = 'REJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 176742
        mmTop = 95515
        mmWidth = 5334
        BandType = 1
      end
      object ppLabel142: TppLabel
        UserName = 'Label48'
        Caption = #22806#35266
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 106627
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel143: TppLabel
        UserName = 'Label49'
        Caption = 'Face'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 20373
        mmTop = 106627
        mmWidth = 7789
        BandType = 1
      end
      object ppLine75: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9525
        mmTop = 100013
        mmWidth = 175684
        BandType = 1
      end
      object ppMemo4: TppMemo
        UserName = 'Memo2'
        Caption = #26080#25758#20260'/'#30385#25240'/'#27687#21270'/'#33394#24046'/'#28322#33014'/'#25830#33457'/'#27833#27745'/'#26434#29289'/'#20992#21475#30165'/'#26410#20914#36879'/'#32570#33014'/'#27611#21050'/'#20985#20984#31561#22806#35266#19981#33391#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Lines.Strings = (
          #26080#25758#20260'/'#30385#25240'/'#27687#21270'/'#33394#24046'/'#28322#33014'/'#25830#33457'/'#27833#27745'/'#26434#29289'/'#20992#21475#30165'/'#26410#20914#36879'/'#32570#33014'/'#27611#21050'/'#20985#20984#31561#22806#35266#19981#33391)
        Transparent = True
        mmHeight = 15875
        mmLeft = 70908
        mmTop = 113771
        mmWidth = 35190
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine76: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9525
        mmTop = 129911
        mmWidth = 175684
        BandType = 1
      end
      object ppLine77: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 138377
        mmWidth = 175684
        BandType = 1
      end
      object ppLine78: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 9790
        mmTop = 146315
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel144: TppLabel
        UserName = 'Label50'
        Caption = #23610#23544'Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 119592
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel145: TppLabel
        UserName = 'Label51'
        Caption = #21402#24230'Thickness'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 132292
        mmWidth = 27517
        BandType = 1
      end
      object ppLabel146: TppLabel
        UserName = 'Label52'
        Caption = #21093#31163#24378#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 140229
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel147: TppLabel
        UserName = 'Label53'
        Caption = 'Peel Off Intensity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 28310
        mmTop = 140494
        mmWidth = 35052
        BandType = 1
      end
      object ppLine79: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 154252
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel148: TppLabel
        UserName = 'Label56'
        Caption = 'Soldering Tin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 32808
        mmTop = 148167
        mmWidth = 25315
        BandType = 1
      end
      object ppLabel149: TppLabel
        UserName = 'Label57'
        Caption = #28938#38177#32784#28909#24615
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 147638
        mmWidth = 21167
        BandType = 1
      end
      object ppLine80: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 161925
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel150: TppLabel
        UserName = 'Label58'
        Caption = 'Chemical resistance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 28575
        mmTop = 155575
        mmWidth = 36999
        BandType = 1
      end
      object ppLabel151: TppLabel
        UserName = 'Label59'
        Caption = #32784#21270#23398#24615
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 155575
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel152: TppLabel
        UserName = 'Label60'
        Caption = #28322#33014#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 162984
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel153: TppLabel
        UserName = 'Label61'
        Caption = 'Overflow Glue Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 23548
        mmTop = 162984
        mmWidth = 33105
        BandType = 1
      end
      object ppLine81: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 169334
        mmWidth = 175684
        BandType = 1
      end
      object ppLine82: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 177271
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel154: TppLabel
        UserName = 'Label62'
        Caption = 'Resistance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 35719
        mmTop = 170657
        mmWidth = 19473
        BandType = 1
      end
      object ppLabel155: TppLabel
        UserName = 'Label601'
        Caption = #23637#38754#23548#36890#30005#38459
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 170392
        mmWidth = 25400
        BandType = 1
      end
      object ppLine83: TppLine
        UserName = 'Line17'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 184944
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel156: TppLabel
        UserName = 'Label64'
        Caption = #38468#30528#21147
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 178594
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel157: TppLabel
        UserName = 'Label65'
        Caption = 'Adsorbability'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 23019
        mmTop = 178859
        mmWidth = 25315
        BandType = 1
      end
      object ppLabel158: TppLabel
        UserName = 'Label66'
        Caption = #37325#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 186532
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel159: TppLabel
        UserName = 'Label67'
        Caption = 'Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 20373
        mmTop = 186532
        mmWidth = 11684
        BandType = 1
      end
      object ppLine84: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 192882
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel160: TppLabel
        UserName = 'Label68'
        Caption = 'Proportion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 19315
        mmTop = 194205
        mmWidth = 19473
        BandType = 1
      end
      object ppLabel161: TppLabel
        UserName = 'Label69'
        Caption = #27604#37325
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 193940
        mmWidth = 8467
        BandType = 1
      end
      object ppLine85: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 208492
        mmWidth = 175684
        BandType = 1
      end
      object ppLine86: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9525
        mmTop = 200555
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel162: TppLabel
        UserName = 'Label70'
        Caption = 'Content'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 19315
        mmTop = 201877
        mmWidth = 13631
        BandType = 1
      end
      object ppLabel163: TppLabel
        UserName = 'Label71'
        Caption = #21547#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 201877
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel164: TppLabel
        UserName = 'Label701'
        Caption = 'Concentration'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 18521
        mmTop = 209815
        mmWidth = 25315
        BandType = 1
      end
      object ppLabel165: TppLabel
        UserName = 'Label73'
        Caption = #27987#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 209550
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel166: TppLabel
        UserName = 'Label801'
        Caption = 'Judgement '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 20902
        mmTop = 255588
        mmWidth = 19473
        BandType = 1
      end
      object ppLabel167: TppLabel
        UserName = 'Label83'
        Caption = #21028#23450' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 255323
        mmWidth = 10583
        BandType = 1
      end
      object ppLabel168: TppLabel
        UserName = 'Label80'
        Caption = 'Failure/Defective Description'#65306' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 10319
        mmTop = 248973
        mmWidth = 56854
        BandType = 1
      end
      object ppLabel169: TppLabel
        UserName = 'Label81'
        Caption = #19981#21512#26684#32570#38519#25551#36848#65306' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10319
        mmTop = 243946
        mmWidth = 35983
        BandType = 1
      end
      object ppLabel170: TppLabel
        UserName = 'Label79'
        Caption = 'Other '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 19844
        mmTop = 237067
        mmWidth = 11684
        BandType = 1
      end
      object ppLabel171: TppLabel
        UserName = 'Label78'
        Caption = #20854#23427
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 237067
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel172: TppLabel
        UserName = 'Label76'
        Caption = 'ROHS halogen free test '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 10054
        mmTop = 230717
        mmWidth = 44789
        BandType = 1
      end
      object ppLabel173: TppLabel
        UserName = 'Label77'
        Caption = 'ROHS'#26080#21348#26816#27979
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 10054
        mmTop = 225955
        mmWidth = 25400
        BandType = 1
      end
      object ppLine87: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 252942
        mmWidth = 175684
        BandType = 1
      end
      object ppLine88: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 243153
        mmWidth = 175684
        BandType = 1
      end
      object ppLine89: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 235480
        mmWidth = 175684
        BandType = 1
      end
      object ppLine90: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 225425
        mmWidth = 175684
        BandType = 1
      end
      object ppLine91: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 9790
        mmTop = 216694
        mmWidth = 175684
        BandType = 1
      end
      object ppLabel174: TppLabel
        UserName = 'Label74'
        Caption = #22238#27969#28938#27979#35797
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 10054
        mmTop = 218811
        mmWidth = 19473
        BandType = 1
      end
      object ppLabel175: TppLabel
        UserName = 'Label75'
        Caption = 'Reflow soldering test'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 219075
        mmWidth = 38365
        BandType = 1
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 9790
        mmTop = 0
        mmWidth = 23019
        BandType = 1
      end
      object ppDBText38: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'SGS'#32534#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4022
        mmLeft = 148961
        mmTop = 32808
        mmWidth = 12361
        BandType = 1
      end
      object ppDBText39: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4763
        mmLeft = 109273
        mmTop = 41804
        mmWidth = 14552
        BandType = 1
      end
      object ppDBText40: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        DisplayFormat = 'yyyy-MM-dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 112051
        mmTop = 52123
        mmWidth = 16933
        BandType = 1
      end
      object ppDBText41: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #35746#21333#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 114168
        mmTop = 62442
        mmWidth = 12700
        BandType = 1
      end
      object ppDBText42: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #30003#35831#20154
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 164174
        mmTop = 61648
        mmWidth = 12700
        BandType = 1
      end
      object ppLine92: TppLine
        UserName = 'Line24'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 32015
        mmLeft = 29633
        mmTop = 38365
        mmWidth = 3969
        BandType = 1
      end
      object ppLine93: TppLine
        UserName = 'Line27'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 31485
        mmLeft = 66146
        mmTop = 38629
        mmWidth = 3969
        BandType = 1
      end
      object ppLine94: TppLine
        UserName = 'Line28'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 204788
        mmLeft = 102923
        mmTop = 38365
        mmWidth = 3969
        BandType = 1
      end
      object ppLine95: TppLine
        UserName = 'Line29'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 32015
        mmLeft = 130440
        mmTop = 38365
        mmWidth = 3969
        BandType = 1
      end
      object ppLine96: TppLine
        UserName = 'Line30'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 31485
        mmLeft = 150019
        mmTop = 38629
        mmWidth = 3969
        BandType = 1
      end
      object ppLine97: TppLine
        UserName = 'Line31'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 183357
        mmLeft = 66675
        mmTop = 79640
        mmWidth = 3969
        BandType = 1
      end
      object ppDBMemo9: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #29289#26009#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 10054
        mmLeft = 33867
        mmTop = 38894
        mmWidth = 35719
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo10: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #22411#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8467
        mmLeft = 33867
        mmTop = 49477
        mmWidth = 35719
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo11: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = #35268#26684
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 10848
        mmLeft = 33602
        mmTop = 59002
        mmWidth = 35983
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine98: TppLine
        UserName = 'Line301'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 154252
        mmLeft = 151077
        mmTop = 88900
        mmWidth = 3969
        BandType = 1
      end
      object ppLine99: TppLine
        UserName = 'Line33'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 148432
        mmLeft = 167217
        mmTop = 94986
        mmWidth = 3969
        BandType = 1
      end
      object ppLine100: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 155046
        mmTop = 94721
        mmWidth = 30163
        BandType = 1
      end
      object ppLine101: TppLine
        UserName = 'Line302'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 130969
        mmTop = 79640
        mmWidth = 3969
        BandType = 1
      end
      object ppMemo5: TppMemo
        UserName = 'Memo3'
        Caption = #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391)
        Transparent = True
        mmHeight = 7673
        mmLeft = 70644
        mmTop = 146579
        mmWidth = 35983
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo6: TppMemo
        UserName = 'Memo4'
        Caption = #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391)
        Transparent = True
        mmHeight = 7408
        mmLeft = 70644
        mmTop = 154517
        mmWidth = 35983
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel176: TppLabel
        UserName = 'Label82'
        Caption = '0.08-0.12MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 77523
        mmTop = 163513
        mmWidth = 19558
        BandType = 1
      end
      object ppMemo7: TppMemo
        UserName = 'Memo5'
        Caption = #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #26080#20998#23618#65292#26080#36215#27873#65292#26080#33394#24046#31561#19981#33391)
        Transparent = True
        mmHeight = 7673
        mmLeft = 70908
        mmTop = 217223
        mmWidth = 35454
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo8: TppMemo
        UserName = 'Memo6'
        Caption = #20381#25454#29615#22659#31649#29702#29289#36136#26631#20934#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #20381#25454#29615#22659#31649#29702#29289#36136#26631#20934)
        Transparent = True
        mmHeight = 9260
        mmLeft = 70908
        mmTop = 225955
        mmWidth = 33602
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel177: TppLabel
        UserName = 'Label84'
        Caption = #35265#38468#39029
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 121444
        mmTop = 228600
        mmWidth = 10541
        BandType = 1
      end
      object myCheckBox8: TmyCheckBox
        UserName = 'CheckBox7'
        Checked = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 76994
        mmTop = 255323
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel178: TppLabel
        UserName = 'Label85'
        Caption = #21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 83608
        mmTop = 256117
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel179: TppLabel
        UserName = 'Label91'
        Caption = #19981#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 104511
        mmTop = 256117
        mmWidth = 12700
        BandType = 1
      end
      object myCheckBox9: TmyCheckBox
        UserName = 'CheckBox8'
        Checked = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 97896
        mmTop = 255323
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel180: TppLabel
        UserName = 'Label92'
        Caption = #25361#36873#20351#29992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 146050
        mmTop = 256382
        mmWidth = 16933
        BandType = 1
      end
      object myCheckBox10: TmyCheckBox
        UserName = 'CheckBox9'
        Checked = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 139965
        mmTop = 255588
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel181: TppLabel
        UserName = 'Label93'
        Caption = #29305#37319
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 127000
        mmTop = 256382
        mmWidth = 8467
        BandType = 1
      end
      object myCheckBox11: TmyCheckBox
        UserName = 'CheckBox10'
        Checked = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 120386
        mmTop = 255588
        mmWidth = 5821
        BandType = 1
      end
      object myCheckBox12: TmyCheckBox
        UserName = 'CheckBox101'
        Checked = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 166952
        mmTop = 255588
        mmWidth = 5821
        BandType = 1
      end
      object ppLabel182: TppLabel
        UserName = 'Label94'
        Caption = #25209#36864
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 172773
        mmTop = 256382
        mmWidth = 8467
        BandType = 1
      end
      object ppDBMemo12: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = #25209#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 9790
        mmLeft = 154252
        mmTop = 38894
        mmWidth = 30427
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo13: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = #20379#24212#21830#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 8731
        mmLeft = 157163
        mmTop = 49477
        mmWidth = 23548
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object myDBCheckBox12: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'True'
        BooleanTrue = 'False'
        DataPipeline = ppDB391
        DataField = 'SGS'
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 171980
        mmTop = 24871
        mmWidth = 6350
        BandType = 1
      end
      object myDBCheckBox13: TmyDBCheckBox
        UserName = 'DBCheckBox2'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = 'SGS'
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 163248
        mmTop = 24871
        mmWidth = 6350
        BandType = 1
      end
      object ppDBText43: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #26377#25928#26399#33267
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 147616
        mmTop = 82021
        mmWidth = 16933
        BandType = 1
      end
      object myCheckBox13: TmyCheckBox
        UserName = 'CheckBox3'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 50800
        mmTop = 70115
        mmWidth = 6350
        BandType = 1
      end
      object myCheckBox14: TmyCheckBox
        UserName = 'CheckBox4'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 70115
        mmTop = 70115
        mmWidth = 6350
        BandType = 1
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = #21333#20301
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4763
        mmLeft = 124090
        mmTop = 41804
        mmWidth = 9260
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel183: TppLabel
        UserName = 'Label54'
        Caption = #26816#39564#21592#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 14552
        mmTop = 1588
        mmWidth = 15579
        BandType = 8
      end
      object ppLabel184: TppLabel
        UserName = 'Label55'
        Caption = #23457#26680#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 105834
        mmTop = 1588
        mmWidth = 11684
        BandType = 8
      end
      object ppLabel185: TppLabel
        UserName = 'Label63'
        Caption = #21463#25511'No:DG-FPC-WI-IQC-001-01/00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 119856
        mmTop = 8202
        mmWidth = 65088
        BandType = 8
      end
      object ppLabel186: TppLabel
        UserName = 'Label72'
        Caption = #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 118269
        mmTop = 12965
        mmWidth = 66675
        BandType = 8
      end
      object ppLine102: TppLine
        UserName = 'Line34'
        Weight = 0.750000000000000000
        mmHeight = 2646
        mmLeft = 30692
        mmTop = 6085
        mmWidth = 30692
        BandType = 8
      end
      object ppLine103: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 118004
        mmTop = 6085
        mmWidth = 30692
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object ppDesigner_rb: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport_rb
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 388
    Top = 72
  end
  object ppDesigner_nomal: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport391_nomal
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 396
    Top = 128
  end
  object ppDock: TppReport
    AutoStop = False
    DataPipeline = ppDB391
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
    Template.FileName = '..\NIERP\Report\IQCCHECKREPORT_DOCK.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 276
    Top = 176
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB391'
    object ppTitleBand4: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 260880
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'DBImage4'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 15875
        mmLeft = 12700
        mmTop = 2381
        mmWidth = 29633
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4826
        mmLeft = 42863
        mmTop = 3175
        mmWidth = 25400
        BandType = 1
      end
      object ppDBText47: TppDBText
        UserName = 'DBText47'
        AutoSize = True
        DataField = 'Company_Name2'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4826
        mmLeft = 42863
        mmTop = 8467
        mmWidth = 27517
        BandType = 1
      end
      object ppLabel188: TppLabel
        UserName = 'Label188'
        Caption = #38075#21632#38179#20992#26816#39564#27979#37327#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7239
        mmLeft = 66464
        mmTop = 17463
        mmWidth = 63923
        BandType = 1
      end
      object ppLabel189: TppLabel
        UserName = 'Label189'
        Caption = 'Incoming Testing Report of Drilling Bit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 63987
        mmTop = 26194
        mmWidth = 70993
        BandType = 1
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 227542
        mmLeft = 12700
        mmTop = 33338
        mmWidth = 171450
        BandType = 1
      end
      object ppLine108: TppLine
        UserName = 'Line108'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 81227
        mmWidth = 171450
        BandType = 1
      end
      object ppLine109: TppLine
        UserName = 'Line109'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 47361
        mmWidth = 171450
        BandType = 1
      end
      object ppLine110: TppLine
        UserName = 'Line110'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 61119
        mmWidth = 171450
        BandType = 1
      end
      object ppLine111: TppLine
        UserName = 'Line111'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 71173
        mmWidth = 171450
        BandType = 1
      end
      object ppLine112: TppLine
        UserName = 'Line112'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 131234
        mmWidth = 171450
        BandType = 1
      end
      object ppLine113: TppLine
        UserName = 'Line113'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 91281
        mmWidth = 171450
        BandType = 1
      end
      object ppLine114: TppLine
        UserName = 'Line114'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 101071
        mmWidth = 171450
        BandType = 1
      end
      object ppLine115: TppLine
        UserName = 'Line115'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 111125
        mmWidth = 171450
        BandType = 1
      end
      object ppLine116: TppLine
        UserName = 'Line116'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 141023
        mmWidth = 171450
        BandType = 1
      end
      object ppLine117: TppLine
        UserName = 'Line117'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 151077
        mmWidth = 171450
        BandType = 1
      end
      object ppLine118: TppLine
        UserName = 'Line118'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 161132
        mmWidth = 171450
        BandType = 1
      end
      object ppLine119: TppLine
        UserName = 'Line119'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 171186
        mmWidth = 171450
        BandType = 1
      end
      object ppLine120: TppLine
        UserName = 'Line120'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 181240
        mmWidth = 171450
        BandType = 1
      end
      object ppLine121: TppLine
        UserName = 'Line121'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 191030
        mmWidth = 171450
        BandType = 1
      end
      object ppLine122: TppLine
        UserName = 'Line122'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 201084
        mmWidth = 171450
        BandType = 1
      end
      object ppLine123: TppLine
        UserName = 'Line123'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 211138
        mmWidth = 171450
        BandType = 1
      end
      object ppLine124: TppLine
        UserName = 'Line124'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 251355
        mmWidth = 171450
        BandType = 1
      end
      object ppLine125: TppLine
        UserName = 'Line125'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 12700
        mmTop = 241036
        mmWidth = 171450
        BandType = 1
      end
      object ppLine126: TppLine
        UserName = 'Line126'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 178065
        mmLeft = 36248
        mmTop = 33338
        mmWidth = 3969
        BandType = 1
      end
      object ppLine127: TppLine
        UserName = 'Line127'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 37835
        mmLeft = 67998
        mmTop = 33602
        mmWidth = 3969
        BandType = 1
      end
      object ppLine128: TppLine
        UserName = 'Line128'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 38100
        mmLeft = 89165
        mmTop = 33338
        mmWidth = 3969
        BandType = 1
      end
      object ppLine129: TppLine
        UserName = 'Line129'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 47890
        mmLeft = 134938
        mmTop = 33602
        mmWidth = 3969
        BandType = 1
      end
      object ppLine130: TppLine
        UserName = 'Line130'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 47890
        mmLeft = 154782
        mmTop = 33602
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel192: TppLabel
        UserName = 'Label192'
        Caption = #20379#24212#21830#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 14288
        mmTop = 38629
        mmWidth = 21167
        BandType = 1
      end
      object ppLabel193: TppLabel
        UserName = 'Label193'
        Caption = #22411#21495#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 70115
        mmTop = 38100
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel194: TppLabel
        UserName = 'Label194'
        Caption = #25253#21578#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 136790
        mmTop = 38629
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel195: TppLabel
        UserName = 'Label195'
        Caption = #22806#35266
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 19315
        mmTop = 118534
        mmWidth = 8467
        BandType = 1
      end
      object ppLine131: TppLine
        UserName = 'Line131'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 36248
        mmTop = 241036
        mmWidth = 3969
        BandType = 1
      end
      object ppLine132: TppLine
        UserName = 'Line132'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 110067
        mmLeft = 89165
        mmTop = 81227
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel196: TppLabel
        UserName = 'Label196'
        Caption = #19981#20801#35768#26377#26029#12289#23849#20992#20995#12289#22278#35282#12289#37325#21472#12289#22823#23567#36793#12289#20998#31163#12289#20559#22823#35282#12289#20559#23567#35282#31561#29616#35937#65292#22871#29615#39068#33394#26159#21542#27491#24120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 17780
        mmLeft = 38894
        mmTop = 112448
        mmWidth = 46736
        BandType = 1
      end
      object ppLine133: TppLine
        UserName = 'Line133'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20108
        mmLeft = 67998
        mmTop = 81227
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel197: TppLabel
        UserName = 'Label197'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 15133
        mmTop = 52123
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel198: TppLabel
        UserName = 'Label198'
        Caption = #26469#26009#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 15346
        mmTop = 64029
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel199: TppLabel
        UserName = 'Label199'
        Caption = #20179#24211#39564#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 15843
        mmTop = 73819
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel200: TppLabel
        UserName = 'Label200'
        Caption = #25910#36135#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 15875
        mmTop = 84402
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel201: TppLabel
        UserName = 'Label201'
        Caption = 'RoHS'#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 16140
        mmTop = 94192
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel202: TppLabel
        UserName = 'Label202'
        Caption = #25209#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 74400
        mmTop = 52123
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel203: TppLabel
        UserName = 'Label203'
        Caption = #25277#26816#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 70431
        mmTop = 64029
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel204: TppLabel
        UserName = 'Label204'
        Caption = #30003#35831#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 136758
        mmTop = 52388
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel205: TppLabel
        UserName = 'Label205'
        Caption = #39564#25910#27700#24179
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 136758
        mmTop = 64294
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel206: TppLabel
        UserName = 'Label206'
        Caption = #25910#36135#26102#38388
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 69637
        mmTop = 83873
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel207: TppLabel
        UserName = 'Label207'
        Caption = 'RoHS'#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 69638
        mmTop = 93927
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel208: TppLabel
        UserName = 'Label208'
        Caption = #26816#39564#39033#30446
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 15398
        mmTop = 104511
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel209: TppLabel
        UserName = 'Label209'
        Caption = #26631#20934#35201#27714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 52388
        mmTop = 104246
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel210: TppLabel
        UserName = 'Label210'
        Caption = #23454#27979#25968#25454
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 112713
        mmTop = 103981
        mmWidth = 16933
        BandType = 1
      end
      object ppLine134: TppLine
        UserName = 'Line134'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 90223
        mmLeft = 154782
        mmTop = 101071
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel211: TppLabel
        UserName = 'Label211'
        Caption = #21028#23450'  ACC/REJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9652
        mmLeft = 163248
        mmTop = 101600
        mmWidth = 14817
        BandType = 1
      end
      object ppLabel212: TppLabel
        UserName = 'Label212'
        Caption = #24635#38271#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 17515
        mmTop = 134144
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel213: TppLabel
        UserName = 'Label213'
        Caption = #26564#30452#24452
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 18044
        mmTop = 143934
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel214: TppLabel
        UserName = 'Label214'
        Caption = #30452#24452
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 19976
        mmTop = 154252
        mmWidth = 8467
        BandType = 1
      end
      object ppLabel215: TppLabel
        UserName = 'Label215'
        Caption = #20995#38271#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 18563
        mmTop = 164571
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel216: TppLabel
        UserName = 'Label216'
        Caption = #39564#35777#21253#35013#26631#35782
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 15081
        mmTop = 192088
        mmWidth = 19050
        BandType = 1
      end
      object ppLabel217: TppLabel
        UserName = 'Label217'
        Caption = #32467#35770
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 20638
        mmTop = 203730
        mmWidth = 8467
        BandType = 1
      end
      object ppLine135: TppLine
        UserName = 'Line135'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59796
        mmLeft = 101865
        mmTop = 131498
        mmWidth = 3969
        BandType = 1
      end
      object ppLine136: TppLine
        UserName = 'Line136'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59796
        mmLeft = 114565
        mmTop = 131234
        mmWidth = 3969
        BandType = 1
      end
      object ppLine137: TppLine
        UserName = 'Line137'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59796
        mmLeft = 127265
        mmTop = 131234
        mmWidth = 3969
        BandType = 1
      end
      object ppLine138: TppLine
        UserName = 'Line138'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 59796
        mmLeft = 140759
        mmTop = 131234
        mmWidth = 3969
        BandType = 1
      end
      object ppLine139: TppLine
        UserName = 'Line139'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 89165
        mmTop = 241036
        mmWidth = 3969
        BandType = 1
      end
      object ppLine140: TppLine
        UserName = 'Line140'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 114565
        mmTop = 241036
        mmWidth = 3969
        BandType = 1
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        Caption = #26816#26597#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 19050
        mmTop = 244475
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel219: TppLabel
        UserName = 'Label219'
        Caption = #26816#26597#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 17463
        mmTop = 254001
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel220: TppLabel
        UserName = 'Label220'
        Caption = #23457#26680#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 95779
        mmTop = 244211
        mmWidth = 12700
        BandType = 1
      end
      object ppLabel221: TppLabel
        UserName = 'Label221'
        Caption = #23457#26680#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 94456
        mmTop = 253736
        mmWidth = 16933
        BandType = 1
      end
      object ppLabel222: TppLabel
        UserName = 'Label222'
        Caption = 'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 133879
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel223: TppLabel
        UserName = 'Label223'
        Caption = 'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 143669
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel224: TppLabel
        UserName = 'Label224'
        Caption = 'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 153723
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel225: TppLabel
        UserName = 'Label225'
        Caption = 'mm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 81227
        mmTop = 163777
        mmWidth = 4233
        BandType = 1
      end
      object ppLabel226: TppLabel
        UserName = 'Label226'
        Caption = #35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 138907
        mmTop = 74083
        mmWidth = 12700
        BandType = 1
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
        DataField = #35268#26684
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB391'
        mmHeight = 12965
        mmLeft = 89959
        mmTop = 33867
        mmWidth = 44186
        BandType = 1
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = #20379#24212#21830#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB391'
        mmHeight = 11377
        mmLeft = 37042
        mmTop = 34925
        mmWidth = 30427
        BandType = 1
      end
      object ppDBText50: TppDBText
        UserName = 'DBText50'
        DataField = #29289#26009#21517#31216
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB391'
        mmHeight = 11642
        mmLeft = 36777
        mmTop = 48948
        mmWidth = 30956
        BandType = 1
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = #25209#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB391'
        mmHeight = 12965
        mmLeft = 89959
        mmTop = 47890
        mmWidth = 44186
        BandType = 1
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        AutoSize = True
        DataField = #25253#21578#32534#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4445
        mmLeft = 161412
        mmTop = 38894
        mmWidth = 15579
        BandType = 1
      end
      object ppDBText53: TppDBText
        UserName = 'DBText53'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        DisplayFormat = 'yyyy-MM-dd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 161264
        mmTop = 52917
        mmWidth = 16933
        BandType = 1
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        AutoSize = True
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 38497
        mmTop = 64294
        mmWidth = 16933
        BandType = 1
      end
      object ppDBText55: TppDBText
        UserName = 'DBText55'
        AutoSize = True
        DataField = #21333#20301
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 57546
        mmTop = 64294
        mmWidth = 8467
        BandType = 1
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        AutoSize = True
        DataField = #26816#27979#25968#37327
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 103849
        mmTop = 64294
        mmWidth = 16933
        BandType = 1
      end
      object ppDBText57: TppDBText
        UserName = 'DBText57'
        AutoSize = True
        DataField = #21333#20301
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 123825
        mmTop = 64294
        mmWidth = 8467
        BandType = 1
      end
      object myDBCheckBox17: TmyDBCheckBox
        UserName = 'DBCheckBox17'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #26159#21542#26377#20986#36135#25253#21578
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 123825
        mmTop = 73025
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel227: TppLabel
        UserName = 'Label227'
        Caption = #26377#20986#36135#25253#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 99219
        mmTop = 73819
        mmWidth = 19473
        BandType = 1
      end
      object myDBCheckBox18: TmyDBCheckBox
        UserName = 'DBCheckBox18'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #21253#35013#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 88636
        mmTop = 73025
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel228: TppLabel
        UserName = 'Label228'
        AutoSize = False
        Caption = #21253#35013#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 68527
        mmTop = 74083
        mmWidth = 17992
        BandType = 1
      end
      object myDBCheckBox19: TmyDBCheckBox
        UserName = 'DBCheckBox19'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = ppDB391
        DataField = #25968#37327#26159#21542#21512#26684
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 6350
        mmLeft = 57679
        mmTop = 73554
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel229: TppLabel
        UserName = 'Label229'
        Caption = #25968#37327#21512#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 38100
        mmTop = 74348
        mmWidth = 15579
        BandType = 1
      end
      object ppDBText58: TppDBText
        UserName = 'DBText58'
        AutoSize = True
        DataField = #35746#21333#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4022
        mmLeft = 164857
        mmTop = 74083
        mmWidth = 10541
        BandType = 1
      end
      object ppDBText59: TppDBText
        UserName = 'DBText59'
        AutoSize = True
        DataField = #30003#35831#20154
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4763
        mmLeft = 45773
        mmTop = 84138
        mmWidth = 12700
        BandType = 1
      end
      object ppDBText60: TppDBText
        UserName = 'DBText60'
        AutoSize = True
        DataField = #30003#35831#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 123561
        mmTop = 84138
        mmWidth = 16933
        BandType = 1
      end
      object ppDBText61: TppDBText
        UserName = 'DBText61'
        AutoSize = True
        DataField = 'SGS'#27979#35797#26085#26399
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 42069
        mmTop = 93927
        mmWidth = 23283
        BandType = 1
      end
      object ppDBText62: TppDBText
        UserName = 'DBText62'
        AutoSize = True
        DataField = 'SGS'#32534#21495
        DataPipeline = ppDB391
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB391'
        mmHeight = 4826
        mmLeft = 127265
        mmTop = 93927
        mmWidth = 14817
        BandType = 1
      end
      object myCheckBox3: TmyCheckBox
        UserName = 'CheckBox1'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 43392
        mmTop = 193675
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel230: TppLabel
        UserName = 'Label230'
        Caption = #31526#21512#35201#27714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 51875
        mmTop = 194469
        mmWidth = 15579
        BandType = 1
      end
      object myCheckBox4: TmyCheckBox
        UserName = 'CheckBox2'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 73025
        mmTop = 193675
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel231: TppLabel
        UserName = 'Label2301'
        Caption = #19981#31526#21512#35201#27714
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 80963
        mmTop = 194469
        mmWidth = 19473
        BandType = 1
      end
      object myCheckBox5: TmyCheckBox
        UserName = 'CheckBox3'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 43392
        mmTop = 203200
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel232: TppLabel
        UserName = 'Label232'
        Caption = #25509#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 51329
        mmTop = 203994
        mmWidth = 7673
        BandType = 1
      end
      object ppLabel233: TppLabel
        UserName = 'Label233'
        Caption = #35753#27493#25509#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 72496
        mmTop = 203994
        mmWidth = 15610
        BandType = 1
      end
      object myCheckBox15: TmyCheckBox
        UserName = 'CheckBox15'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 64294
        mmTop = 203200
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel234: TppLabel
        UserName = 'Label234'
        Caption = #25361#36873
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 100277
        mmTop = 203730
        mmWidth = 7789
        BandType = 1
      end
      object myCheckBox16: TmyCheckBox
        UserName = 'CheckBox16'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 92340
        mmTop = 202936
        mmWidth = 6350
        BandType = 1
      end
      object ppLabel235: TppLabel
        UserName = 'Label235'
        Caption = '0 '#25910' 1 '#36864
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 161133
        mmTop = 64029
        mmWidth = 19050
        BandType = 1
      end
      object ppLabel236: TppLabel
        UserName = 'Label236'
        Caption = #22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 14288
        mmTop = 212461
        mmWidth = 12700
        BandType = 1
      end
    end
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel190: TppLabel
        UserName = 'Label190'
        Caption = #21463#25511'No.:DG-WI-QA-004-05/01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 128323
        mmTop = 794
        mmWidth = 55033
        BandType = 8
      end
      object ppLabel191: TppLabel
        UserName = 'Label191'
        Caption = #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 114168
        mmTop = 6350
        mmWidth = 69850
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDesigner_Dock: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppDock
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 412
    Top = 180
  end
  object ppReportCode: TppReport
    AutoStop = False
    DataPipeline = DBPipelineCode
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
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'D:\sjsys\NIERP\Report\IQCCode.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 264
    Top = 224
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'DBPipelineCode'
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
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 15610
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel242: TppLabel
        UserName = 'Label242'
        Caption = #26448#26009#21517#31216
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
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 11906
        mmWidth = 30692
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
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 40217
        mmTop = 19315
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = #26377#25928#26399
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 19315
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = #26448#26009#32534#30721
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
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
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
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
        mmLeft = 32544
        mmTop = 15610
        mmWidth = 7493
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = #20379#24212#21830#31616#31216
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2879
        mmLeft = 40746
        mmTop = 15610
        mmWidth = 9790
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
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 40217
        mmTop = 23019
        mmWidth = 10319
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        mmHeight = 13494
        mmLeft = 51329
        mmTop = 12171
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText68'
        DataField = #21517#31216#22411#21495
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 19844
        mmTop = 4498
        mmWidth = 45773
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText69'
        DataField = #26448#26009#35268#26684
        DataPipeline = DBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 8202
        mmWidth = 46038
        BandType = 4
      end
      object ppLabel243: TppLabel
        UserName = 'Label243'
        Caption = #26448#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 7938
        mmTop = 7938
        mmWidth = 10499
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DBPipelineCode: TppDBPipeline
    DataSource = dsCode
    UserName = 'DBPipelineCode'
    OnNext = DBPipelineCodeNext
    Left = 180
    Top = 192
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
    Left = 340
    Top = 232
  end
  object dsCode: TDataSource
    DataSet = qryCode
    Left = 112
    Top = 196
  end
  object qryCode: TADOQuery
    Connection = DM.ADOConnection1
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
    Top = 192
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
  object ppReportPO: TppReport
    AutoStop = False
    DataPipeline = ppDBPipelinePO
    PrinterSetup.BinName = #32487#32493#21367#21160
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'TSC TTP-244 Pro'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 3350
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 45000
    PrinterSetup.mmPaperWidth = 95000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\sjsys\NIERP\Report\PoCodeprint.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 328
    Top = 288
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'ppDBPipelinePO'
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
        Caption = #26469#26009#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 32279
        mmWidth = 14023
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
        mmTop = 19315
        mmWidth = 7144
        BandType = 4
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 7938
        mmLeft = 23283
        mmTop = 5821
        mmWidth = 31221
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 4022
        mmLeft = 23283
        mmTop = 14288
        mmWidth = 26670
        BandType = 4
      end
      object ppDBBarCode2: TppDBBarCode
        UserName = 'DBBarCode2'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'rece_qty'
        DataPipeline = ppDBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 5821
        mmLeft = 23813
        mmTop = 31221
        mmWidth = 31221
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        AutoSize = True
        DataField = 'supplier_model'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 6350
        mmLeft = 22490
        mmTop = 19050
        mmWidth = 45508
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
        DataField = 'ABBR_NAME'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 4004
        mmLeft = 22490
        mmTop = 26458
        mmWidth = 15766
        BandType = 4
      end
    end
  end
  object ppDBPipelinePO: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBPipelinePO'
    Left = 248
    Top = 300
    object ppDBPipelinePOppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField2: TppField
      FieldAlias = 'rkey71'
      FieldName = 'rkey71'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField3: TppField
      FieldAlias = 'iqc_number'
      FieldName = 'iqc_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField4: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField5: TppField
      FieldAlias = 'unit_name'
      FieldName = 'unit_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField6: TppField
      FieldAlias = 'reason'
      FieldName = 'reason'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField7: TppField
      FieldAlias = 'req_name'
      FieldName = 'req_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField8: TppField
      FieldAlias = 'rkey17'
      FieldName = 'rkey17'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField9: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField10: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField11: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField12: TppField
      FieldAlias = 'purchase_name'
      FieldName = 'purchase_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField13: TppField
      FieldAlias = 'GROUP_PTR'
      FieldName = 'GROUP_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField14: TppField
      FieldAlias = 'IES_PARAMETER_VALUE2'
      FieldName = 'IES_PARAMETER_VALUE2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField15: TppField
      FieldAlias = 'IES_PARAMETER_VALUE3'
      FieldName = 'IES_PARAMETER_VALUE3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField16: TppField
      FieldAlias = 'IES_PARAMETER_VALUE4'
      FieldName = 'IES_PARAMETER_VALUE4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField17: TppField
      FieldAlias = 'IES_PARAMETER_VALUE8'
      FieldName = 'IES_PARAMETER_VALUE8'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField18: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField19: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField20: TppField
      FieldAlias = 'supplier_model'
      FieldName = 'supplier_model'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField21: TppField
      FieldAlias = 'sgs_no'
      FieldName = 'sgs_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField22: TppField
      FieldAlias = 'sgs_date'
      FieldName = 'sgs_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField23: TppField
      FieldAlias = 'rece_qty'
      FieldName = 'rece_qty'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField24: TppField
      FieldAlias = 'iqc_qty'
      FieldName = 'iqc_qty'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField25: TppField
      FieldAlias = 'barch_no'
      FieldName = 'barch_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField26: TppField
      FieldAlias = 'GROUP_DESC'
      FieldName = 'GROUP_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField27: TppField
      FieldAlias = 'appl_user_ptr'
      FieldName = 'appl_user_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField28: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField29: TppField
      FieldAlias = 'appl_date'
      FieldName = 'appl_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField30: TppField
      FieldAlias = 'manufacture_TDATE'
      FieldName = 'manufacture_TDATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField31: TppField
      FieldAlias = 'package_qualified'
      FieldName = 'package_qualified'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField32: TppField
      FieldAlias = 'package'
      FieldName = 'package'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField33: TppField
      FieldAlias = 'qty_qualified'
      FieldName = 'qty_qualified'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField34: TppField
      FieldAlias = 'qty'
      FieldName = 'qty'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField35: TppField
      FieldAlias = 'hasheepreport'
      FieldName = 'hasheepreport'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField36: TppField
      FieldAlias = 'haReport'
      FieldName = 'haReport'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField37: TppField
      FieldAlias = 'appr_user_ptr'
      FieldName = 'appr_user_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField38: TppField
      FieldAlias = 'user_appr'
      FieldName = 'user_appr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField39: TppField
      FieldAlias = 'appr_date'
      FieldName = 'appr_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField40: TppField
      FieldAlias = 'extra_req'
      FieldName = 'extra_req'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField41: TppField
      FieldAlias = 'auth_user_ptr'
      FieldName = 'auth_user_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField42: TppField
      FieldAlias = 'user_auth'
      FieldName = 'user_auth'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField43: TppField
      FieldAlias = 'auth_date'
      FieldName = 'auth_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField44: TppField
      FieldAlias = 'if_halogen'
      FieldName = 'if_halogen'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField45: TppField
      FieldAlias = 'halogen'
      FieldName = 'halogen'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField46: TppField
      FieldAlias = 'appearance'
      FieldName = 'appearance'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField47: TppField
      FieldAlias = 'SUPPLIER_NAME'
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField48: TppField
      FieldAlias = 'SUPPLIER_POINTER'
      FieldName = 'SUPPLIER_POINTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField49: TppField
      FieldAlias = 'part_size'
      FieldName = 'part_size'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField50: TppField
      FieldAlias = 'part_thickness'
      FieldName = 'part_thickness'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField51: TppField
      FieldAlias = 'tong_thickness'
      FieldName = 'tong_thickness'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField52: TppField
      FieldAlias = 'thick_tolerance'
      FieldName = 'thick_tolerance'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField53: TppField
      FieldAlias = 'ht_remark'
      FieldName = 'ht_remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField54: TppField
      FieldAlias = 'if_standard'
      FieldName = 'if_standard'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField55: TppField
      FieldAlias = 'extrl_date'
      FieldName = 'extrl_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField56: TppField
      FieldAlias = 'judge_result'
      FieldName = 'judge_result'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField57: TppField
      FieldAlias = 'remark'
      FieldName = 'remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField58: TppField
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField59: TppField
      FieldAlias = 'AUDIUSER'
      FieldName = 'AUDIUSER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField60: TppField
      FieldAlias = 'strStatus'
      FieldName = 'strStatus'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField61: TppField
      FieldAlias = 'IF_CAF'
      FieldName = 'IF_CAF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField62: TppField
      FieldAlias = 'INV_PART_DESCRIPTION'
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField63: TppField
      FieldAlias = 'strstock'
      FieldName = 'strstock'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppDBPipelinePOppField64: TppField
      FieldAlias = 'stock_over'
      FieldName = 'stock_over'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
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
    Left = 424
    Top = 288
  end
  object DataSource4: TDataSource
    DataSet = ADOQuery1
    Left = 168
    Top = 300
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = '391rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0391.rkey, dbo.data0391.rkey71,dbo.data0391.i' +
        'qc_number, dbo.Data0070.PO_NUMBER,dbo.data0002.unit_name,dbo.dat' +
        'a0071.reason,D05_req.employee_name as req_name,dbo.data0391.rkey' +
        '17 ,'
      
        '                   dbo.Data0017.INV_PART_NUMBER,dbo.Data0017.INV' +
        '_NAME, dbo.Data0017.INV_DESCRIPTION, purchase.employee_name as p' +
        'urchase_name,data0017.GROUP_PTR,'
      
        '                      dbo.Data0017.IES_PARAMETER_VALUE2, dbo.Dat' +
        'a0017.IES_PARAMETER_VALUE3, dbo.Data0017.IES_PARAMETER_VALUE4, '
      
        '                      dbo.Data0017.IES_PARAMETER_VALUE8, dbo.Dat' +
        'a0023.CODE, dbo.Data0023.ABBR_NAME,dbo.data0391.supplier_model, ' +
        'dbo.data0391.sgs_no, '
      
        '                      dbo.data0391.sgs_date, dbo.data0391.rece_q' +
        'ty, dbo.data0391.iqc_qty, dbo.data0391.barch_no, data0496.GROUP_' +
        'DESC,'
      
        '                       dbo.data0391.appl_user_ptr,dbo.data0005.e' +
        'mployee_name, dbo.data0391.appl_date,dbo.data0391.manufacture_TD' +
        'ATE,'
      
        #9#9#9#9#9'  dbo.data0391.package_qualified,case dbo.data0391.package_' +
        'qualified when 1 then '#39#21512#26684#39' when 0 then  '#39#19981#21512#26684#39' end as package,'
      
        #9#9#9#9#9'dbo.data0391.qty_qualified,case dbo.data0391.qty_qualified ' +
        'when 1 then '#39#21512#26684#39' when 0 then '#39#19981#21512#26684#39' end as qty,'
      
        #9#9#9#9#9'dbo.data0391.hasheepreport,case dbo.data0391.hasheepreport ' +
        'when 1 then '#39#26377#39' when 0 then '#39#26080#39' end as haReport,'
      
        '                      dbo.data0391.appr_user_ptr,D05_appr.employ' +
        'ee_name as user_appr, dbo.data0391.appr_date, data0071.extra_req' +
        ','
      
        '                      dbo.data0391.auth_user_ptr,D05_auth.employ' +
        'ee_name as user_auth, dbo.data0391.auth_date, dbo.data0391.if_ha' +
        'logen,'
      
        '                      case data0391.if_halogen when 1 then '#39#26159#39' e' +
        'lse '#39#21542#39' end as halogen,dbo.data0391.appearance, dbo.data0023.SUP' +
        'PLIER_NAME,dbo.Data0070.SUPPLIER_POINTER,'
      
        '                      dbo.data0391.part_size, dbo.data0391.part_' +
        'thickness, dbo.data0391.tong_thickness, dbo.data0391.thick_toler' +
        'ance, dbo.data0391.ht_remark, '
      
        '                      dbo.data0391.if_standard, dbo.data0391.ext' +
        'rl_date, dbo.data0391.judge_result, dbo.data0391.remark, dbo.dat' +
        'a0391.status,DATA0073.USER_FULL_NAME AS AUDIUSER,'
      
        '                     case dbo.data0391.status when 1 then '#39#24453#23457#26680#39' ' +
        'when 2 then '#39#23457#26680#21512#26684#39' when 3 then '#39#23457#26680#19981#21512#26684#39' end as strStatus,dbo.Data' +
        '0071.IF_CAF,dbo.data0017.INV_PART_DESCRIPTION,'
      
        '                     case when data0391.stock_over = 1 then '#39#24050#20837#24211 +
        #39' else '#39#26410#20837#24211#39' end as strstock,data0391.stock_over'
      'FROM         dbo.data0391 INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.data0391.rkey17 = dbo.' +
        'Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0071 ON dbo.data0391.rkey71 = dbo.' +
        'Data0071.RKEY INNER JOIN'#9#9#9#9#9'  '
      
        #9#9' dbo.Data0002 ON dbo.data0071.purchase_unit_ptr = dbo.Data0002' +
        '.RKEY INNER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.' +
        'Data0070.RKEY INNER JOIN'
      
        #9#9'dbo.Data0005 as purchase ON dbo.Data0070.employee_pointer = pu' +
        'rchase.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0070.SUPPLIER_POIN' +
        'TER = dbo.Data0023.RKEY inner join '
      
        '                     dbo.data0496 ON dbo.data0017.group_ptr=dbo.' +
        'data0496.rkey inner join'
      
        #9#9#9#9#9' dbo.data0005 ON dbo.data0391.appl_user_ptr = dbo.Data0005.' +
        'rkey left join '
      
        #9#9#9#9#9'dbo.data0005 as D05_appr ON dbo.data0391.appr_user_ptr = D0' +
        '5_appr.rkey left join'
      
        #9#9#9#9#9'dbo.data0005 as D05_auth ON dbo.data0391.auth_user_ptr = D0' +
        '5_auth.rkey left join'
      
        #9#9#9#9#9'dbo.data0069 ON dbo.Data0069.RKEY = dbo.Data0071.rkey69 lef' +
        't JOIN'
      
        #9#9#9#9#9'dbo.data0068 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_' +
        'PTR left JOIN'
      
        #9#9#9#9#9'dbo.data0005 as D05_req ON dbo.Data0068.REQ_BY = D05_req.RK' +
        'EY  LEFT OUTER JOIN'
      
        '                      dbo.Data0028 ON dbo.Data0071.INVT_PTR = db' +
        'o.Data0028.INVENTORY_PTR AND '
      
        '                      dbo.Data0070.SUPPLIER_POINTER = dbo.Data00' +
        '28.SUPPLIER_PTR LEFT OUTER JOIN'
      
        '                      dbo.data0805 ON dbo.Data0028.prot_report_p' +
        'tr = dbo.data0805.rkey LEFT JOIN'
      
        '                      DBO.DATA0073 ON DBO.DATA0805.AUDI_PTR =  D' +
        'BO.DATA0073.RKEY'
      'where dbo.data0391.rkey=:391rkey')
    Left = 80
    Top = 300
    object ADOQuery1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1rkey71: TIntegerField
      FieldName = 'rkey71'
    end
    object ADOQuery1iqc_number: TStringField
      FieldName = 'iqc_number'
      Size = 10
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOQuery1unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADOQuery1reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ADOQuery1req_name: TStringField
      FieldName = 'req_name'
      Size = 16
    end
    object ADOQuery1rkey17: TIntegerField
      FieldName = 'rkey17'
    end
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
    object ADOQuery1purchase_name: TStringField
      FieldName = 'purchase_name'
      Size = 16
    end
    object ADOQuery1GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ADOQuery1IES_PARAMETER_VALUE2: TStringField
      FieldName = 'IES_PARAMETER_VALUE2'
      Size = 30
    end
    object ADOQuery1IES_PARAMETER_VALUE3: TStringField
      FieldName = 'IES_PARAMETER_VALUE3'
      Size = 30
    end
    object ADOQuery1IES_PARAMETER_VALUE4: TStringField
      FieldName = 'IES_PARAMETER_VALUE4'
      Size = 30
    end
    object ADOQuery1IES_PARAMETER_VALUE8: TStringField
      FieldName = 'IES_PARAMETER_VALUE8'
      Size = 30
    end
    object ADOQuery1CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOQuery1supplier_model: TStringField
      FieldName = 'supplier_model'
    end
    object ADOQuery1sgs_no: TStringField
      FieldName = 'sgs_no'
      Size = 25
    end
    object ADOQuery1sgs_date: TDateTimeField
      FieldName = 'sgs_date'
    end
    object ADOQuery1rece_qty: TBCDField
      FieldName = 'rece_qty'
      Precision = 13
    end
    object ADOQuery1iqc_qty: TBCDField
      FieldName = 'iqc_qty'
      Precision = 13
    end
    object ADOQuery1barch_no: TStringField
      FieldName = 'barch_no'
      Size = 100
    end
    object ADOQuery1GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOQuery1appl_user_ptr: TIntegerField
      FieldName = 'appl_user_ptr'
    end
    object ADOQuery1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQuery1appl_date: TDateTimeField
      FieldName = 'appl_date'
    end
    object ADOQuery1manufacture_TDATE: TDateTimeField
      FieldName = 'manufacture_TDATE'
    end
    object ADOQuery1package_qualified: TBooleanField
      FieldName = 'package_qualified'
    end
    object ADOQuery1package: TStringField
      FieldName = 'package'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1qty_qualified: TBooleanField
      FieldName = 'qty_qualified'
    end
    object ADOQuery1qty: TStringField
      FieldName = 'qty'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1hasheepreport: TBooleanField
      FieldName = 'hasheepreport'
    end
    object ADOQuery1haReport: TStringField
      FieldName = 'haReport'
      ReadOnly = True
      Size = 2
    end
    object ADOQuery1appr_user_ptr: TIntegerField
      FieldName = 'appr_user_ptr'
    end
    object ADOQuery1user_appr: TStringField
      FieldName = 'user_appr'
      Size = 16
    end
    object ADOQuery1appr_date: TDateTimeField
      FieldName = 'appr_date'
    end
    object ADOQuery1extra_req: TStringField
      FieldName = 'extra_req'
      Size = 50
    end
    object ADOQuery1auth_user_ptr: TIntegerField
      FieldName = 'auth_user_ptr'
    end
    object ADOQuery1user_auth: TStringField
      FieldName = 'user_auth'
      Size = 16
    end
    object ADOQuery1auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object ADOQuery1if_halogen: TWideStringField
      FieldName = 'if_halogen'
      Size = 16
    end
    object ADOQuery1halogen: TStringField
      FieldName = 'halogen'
      ReadOnly = True
      Size = 2
    end
    object ADOQuery1appearance: TWideStringField
      FieldName = 'appearance'
      Size = 100
    end
    object ADOQuery1SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object ADOQuery1SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object ADOQuery1part_size: TStringField
      FieldName = 'part_size'
      Size = 16
    end
    object ADOQuery1part_thickness: TStringField
      FieldName = 'part_thickness'
      Size = 50
    end
    object ADOQuery1tong_thickness: TBCDField
      FieldName = 'tong_thickness'
      Precision = 5
      Size = 2
    end
    object ADOQuery1thick_tolerance: TStringField
      FieldName = 'thick_tolerance'
      Size = 15
    end
    object ADOQuery1ht_remark: TWideStringField
      FieldName = 'ht_remark'
    end
    object ADOQuery1if_standard: TWideStringField
      FieldName = 'if_standard'
      Size = 4
    end
    object ADOQuery1extrl_date: TDateTimeField
      FieldName = 'extrl_date'
    end
    object ADOQuery1judge_result: TWideStringField
      FieldName = 'judge_result'
      Size = 8
    end
    object ADOQuery1remark: TStringField
      FieldName = 'remark'
      Size = 100
    end
    object ADOQuery1status: TIntegerField
      FieldName = 'status'
    end
    object ADOQuery1AUDIUSER: TStringField
      FieldName = 'AUDIUSER'
      Size = 30
    end
    object ADOQuery1strStatus: TStringField
      FieldName = 'strStatus'
      ReadOnly = True
      Size = 10
    end
    object ADOQuery1IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object ADOQuery1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADOQuery1strstock: TStringField
      FieldName = 'strstock'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1stock_over: TBooleanField
      FieldName = 'stock_over'
    end
  end
  object ppReportNo: TppReport
    AutoStop = False
    DataPipeline = ppDBPipelinePO
    PrinterSetup.BinName = #32487#32493#21367#21160
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'TSC TTP-244 Pro'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 3350
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 3000
    PrinterSetup.mmPaperHeight = 45000
    PrinterSetup.mmPaperWidth = 95000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\sjsys\NIERP\Report\PoCodeprintNo.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 328
    Top = 344
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'ppDBPipelinePO'
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
        mmTop = 17992
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
        mmHeight = 4004
        mmLeft = 12700
        mmTop = 32279
        mmWidth = 7007
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
        mmTop = 19315
        mmWidth = 7144
        BandType = 4
      end
      object ppDBBarCode3: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDBPipelinePO
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 7938
        mmLeft = 23283
        mmTop = 5821
        mmWidth = 31221
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppDBText75: TppDBText
        UserName = 'DBText73'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 4022
        mmLeft = 23283
        mmTop = 14288
        mmWidth = 26670
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText76'
        AutoSize = True
        DataField = 'supplier_model'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 6350
        mmLeft = 22490
        mmTop = 19050
        mmWidth = 45508
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
        DataField = 'ABBR_NAME'
        DataPipeline = ppDBPipelinePO
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipelinePO'
        mmHeight = 4004
        mmLeft = 22490
        mmTop = 26458
        mmWidth = 15766
        BandType = 4
      end
    end
  end
end

object Form1: TForm1
  Left = 307
  Top = 203
  Width = 396
  Height = 449
  Caption = #38144#21806#35746#21333#33258#23450#20041#25253#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 11
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB0060
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #35746#21333#20449#24687
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\nierp\report\sales_order.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 184
    Top = 90
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB0060'
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 54240
      mmPrintPosition = 0
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 8731
        mmLeft = 98425
        mmTop = 45508
        mmWidth = 89694
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 8731
        mmLeft = 8996
        mmTop = 45508
        mmWidth = 89694
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
        mmHeight = 14552
        mmLeft = 6350
        mmTop = 4233
        mmWidth = 18785
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5842
        mmLeft = 60854
        mmTop = 4233
        mmWidth = 83312
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 21431
        mmWidth = 191559
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDocumentName
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 94721
        mmTop = 12700
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #23458#25143#35746#21333#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 11113
        mmTop = 24871
        mmWidth = 18785
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143#20195#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 14552
        mmTop = 29898
        mmWidth = 15240
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #35746#21333#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 70644
        mmTop = 24871
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #23458#25143#21517#31216':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 70644
        mmTop = 29898
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #29305#21035#35201#27714#39033#30446'        '#20869#23481'                ('#21333#20301')'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 9260
        mmTop = 39158
        mmWidth = 62230
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #29305#21035#35201#27714#39033#30446'        '#20869#23481'                 ('#21333#20301')'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 98690
        mmTop = 38894
        mmWidth = 63246
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'D97PO_NUMBER'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 33602
        mmTop = 24871
        mmWidth = 13843
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'po_date'
        DataPipeline = ppDB60
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4191
        mmLeft = 89694
        mmTop = 24871
        mmWidth = 18542
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'cust_code'
        DataPipeline = ppDB60
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4191
        mmLeft = 33602
        mmTop = 29898
        mmWidth = 11049
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = ppDB60
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4191
        mmLeft = 89694
        mmTop = 29898
        mmWidth = 42672
        BandType = 1
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 44450
        mmWidth = 191559
        BandType = 1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'SHIPPING_METHOD'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4163
        mmLeft = 137054
        mmTop = 24606
        mmWidth = 34008
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
        mmHeight = 6085
        mmLeft = 3969
        mmTop = 3704
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #35746#21333#32534#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 9525
        mmTop = 4763
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20135#21697#26495#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35454
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #23458#25143#22411#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 58208
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #29256#26412
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 97102
        mmTop = 4763
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #22238#22797#20132#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 109538
        mmTop = 4763
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #35746#21333#25968#37327
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135996
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #35746#21333#20215#26684
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 158486
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #24037#20855#36153#29992
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 180182
        mmTop = 4763
        mmWidth = 14288
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 29898
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 55033
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 93927
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 106363
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 131234
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 153723
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 176213
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 3969
        mmTop = 0
        mmWidth = 195527
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'SALES_ORDER'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 6615
        mmTop = 794
        mmWidth = 26543
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 32015
        mmTop = 794
        mmWidth = 49022
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 57944
        mmTop = 794
        mmWidth = 43561
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CP_REV'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 96838
        mmTop = 794
        mmWidth = 14351
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'DUE_DATE'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 110331
        mmTop = 794
        mmWidth = 18923
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'PARTS_ORDERED'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 118608
        mmTop = 794
        mmWidth = 31623
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PART_PRICE'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 151162
        mmTop = 794
        mmWidth = 22352
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'TOTAL_ADD_L_PRICE'
        DataPipeline = ppDB0060
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB0060'
        mmHeight = 4191
        mmLeft = 158422
        mmTop = 794
        mmWidth = 37846
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 3969
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 29898
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 55033
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 93927
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 106363
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 131234
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 153723
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 176213
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 199232
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #22791#27880#20449#24687
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 11906
        mmWidth = 14288
        BandType = 8
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'memo_text'
        DataPipeline = ppDB9711
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB9711'
        mmHeight = 10583
        mmLeft = 23813
        mmTop = 11642
        mmWidth = 140229
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDB90'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 2117
        mmWidth = 197300
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDB90
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #35746#21333#20449#24687
          PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB90'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = #35780#23457#37096#38376
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4163
              mmLeft = 24871
              mmTop = 11642
              mmWidth = 14111
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'DEPT_NAME'
              DataPipeline = ppDB90
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB90'
              mmHeight = 3969
              mmLeft = 24342
              mmTop = 2381
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'EMPLOYEE_NAME'
              DataPipeline = ppDB90
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB90'
              mmHeight = 3969
              mmLeft = 53446
              mmTop = 2381
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'auth_date'
              DataPipeline = ppDB90
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB90'
              mmHeight = 3969
              mmLeft = 81492
              mmTop = 2381
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'auth_flag'
              DataPipeline = ppDB90
              Font.Charset = GB2312_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB90'
              mmHeight = 3969
              mmLeft = 109538
              mmTop = 2381
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
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
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 184
    Top = 122
  end
  object ppDB0060: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB0060'
    Left = 144
    Top = 90
    object ppDB0060ppField1: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FieldLength = 12
      DisplayWidth = 12
      Position = 0
    end
    object ppDB0060ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB0060ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB0060ppField4: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppDB0060ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #25968#37327
      FieldName = 'PARTS_ORDERED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB0060ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #20215#26684
      FieldName = 'PART_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB0060ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB0060ppField8: TppField
      FieldAlias = #35745#21010#20132#26399
      FieldName = 'ORIG_SCHED_SHIP_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDB0060ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = #27719#29575
      FieldName = 'EXCH_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB0060ppField10: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDB0060ppField11: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 10
    end
    object ppDB0060ppField12: TppField
      FieldAlias = #19979#21333#26085#26399
      FieldName = 'ent_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB0060ppField13: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDB0060ppField14: TppField
      FieldAlias = #38754#31215'(PCS)'
      FieldName = 'unit_sq'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppDB0060ppField15: TppField
      FieldAlias = #23458#25143#29289#26009#32534#21495
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppDB0060ppField16: TppField
      FieldAlias = #20132#36135#23613#23544
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDB0060ppField17: TppField
      FieldAlias = #35746#21333#38754#31215
      FieldName = 'mianji'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppDB0060ppField18: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = 'fob'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
  end
  object ppDB9711: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB9711'
    Left = 144
    Top = 125
    object ppDB9711ppField1: TppField
      FieldAlias = #21512#21516#35760#20107#26412
      FieldName = 'memo_text'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 144
    Top = 159
    object ppDBPipeline4ppField1: TppField
      FieldAlias = #20844#21496#21517#31216
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 112
    Top = 56
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT dbo.Data0005.EMPLOYEE_NAME AS D5EMPLOYEE_NAME, '
      '      Data0005_1.EMPLOYEE_NAME, dbo.Data0060.SHIPPING_METHOD, '
      '      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, '
      '      dbo.Data0010.ABBR_NAME AS D10CUSTOMER_NAME,'
      
        '      dbo.Data0097.PO_NUMBER AS D97PO_NUMBER, dbo.Data0097.PO_DA' +
        'TE,'
      
        '      data0060.REFERENCE_NUMBER,data0060.so_style,data0060.conf_' +
        'date'
      'FROM Data0005 INNER JOIN'
      '      Data0060 ON'
      '      Data0005.RKEY = Data0060.ENTERED_BY_EMPL_PTR INNER JOIN'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      '      Data0097 ON'
      
        '      Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY LEFT OUTER JOI' +
        'N'
      '      Data0005 Data0005_1 ON'
      '      Data0060.CONF_BY_EMPL_PTR = Data0005_1.RKEY')
    Left = 80
    Top = 56
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 5
    end
    object ADOQuery1customer_name: TStringField
      FieldName = 'customer_name'
      Size = 45
    end
    object ADOQuery1D97PO_NUMBER: TStringField
      FieldName = 'D97PO_NUMBER'
      Size = 25
    end
    object ADOQuery1po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ADOQuery1D5EMPLOYEE_NAME: TStringField
      FieldName = 'D5EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ADOQuery1D10CUSTOMER_NAME: TStringField
      FieldName = 'D10CUSTOMER_NAME'
      Size = 10
    end
    object ADOQuery1REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object ADOQuery1so_style: TWordField
      FieldName = 'so_style'
    end
    object ADOQuery1sostyle: TStringField
      FieldKind = fkCalculated
      FieldName = 'sostyle'
      Size = 8
      Calculated = True
    end
    object ADOQuery1conf_date: TDateTimeField
      FieldName = 'conf_date'
    end
  end
  object ado60: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0060.SALES_ORDER, dbo.Data0050.CUSTOMER_PART_NUMB' +
        'ER, '
      '      dbo.Data0050.CUSTOMER_PART_DESC, dbo.Data0050.CP_REV, '
      
        '      dbo.Data0060.PARTS_ORDERED, dbo.Data0060.PART_PRICE,data00' +
        '60.fob, '
      
        '      dbo.Data0060.TOTAL_ADD_L_PRICE, dbo.Data0060.ORIG_SCHED_SH' +
        'IP_DATE, '
      
        '      dbo.Data0060.EXCH_RATE, dbo.Data0001.CURR_NAME, dbo.Data00' +
        '01.CURR_CODE, '
      
        '      dbo.Data0060.ENT_DATE, dbo.Data0060.SHIPPING_METHOD, dbo.D' +
        'ata0050.unit_sq, '
      
        '      dbo.Data0050.ANALYSIS_CODE_2, dbo.Data0050.ANALYSIS_CODE_1' +
        ', '
      
        '      dbo.Data0060.PARTS_ORDERED * dbo.Data0050.unit_sq AS mianj' +
        'i'
      'FROM dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0050 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0050.' +
        'RKEY INNER JOIN'
      'dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY'
      '')
    Left = 80
    Top = 90
    object ado60SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ado60CUSTOMER_PART_NUMBER: TStringField
      DisplayLabel = #20135#21697#26495#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
    end
    object ado60CUSTOMER_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      Size = 40
    end
    object ado60CP_REV: TStringField
      DisplayLabel = #29256#26412
      FieldName = 'CP_REV'
      FixedChar = True
      Size = 5
    end
    object ado60PARTS_ORDERED: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'PARTS_ORDERED'
    end
    object ado60PART_PRICE: TFloatField
      DisplayLabel = #35746#21333#20215#26684
      FieldName = 'PART_PRICE'
    end
    object ado60TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ado60ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object ado60EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object ado60CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ado60CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado60ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ado60SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object ado60unit_sq: TFloatField
      FieldName = 'unit_sq'
      ReadOnly = True
    end
    object ado60ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ado60ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object ado60mianji: TFloatField
      FieldName = 'mianji'
      ReadOnly = True
    end
    object ado60fob: TStringField
      FieldName = 'fob'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = ado60
    Left = 112
    Top = 90
  end
  object AQ9711: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select memo_text'
      'from data0011')
    Left = 79
    Top = 127
    object AQ9711memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource3: TDataSource
    DataSet = AQ9711
    Left = 112
    Top = 128
  end
  object DataSource4: TDataSource
    DataSet = DM.ADOdata0493
    Left = 112
    Top = 160
  end
  object ppDB60: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB60'
    Left = 144
    Top = 56
    object ppDB60ppField1: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'cust_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField2: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = 'customer_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField3: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'D97PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField4: TppField
      FieldAlias = 'PO'#25910#21040#26085#26399
      FieldName = 'po_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField5: TppField
      FieldAlias = #36755#20837#20154#21592
      FieldName = 'D5EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField6: TppField
      FieldAlias = #30830#35748#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField7: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField8: TppField
      FieldAlias = #23458#25143#31616#31216
      FieldName = 'D10CUSTOMER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField9: TppField
      FieldAlias = #35746#21333#31867#21035
      FieldName = 'sostyle'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDB60ppField10: TppField
      FieldAlias = #38468#21152#21442#32771
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDB60ppField11: TppField
      FieldAlias = #30830#35748#26085#26399
      FieldName = 'conf_date'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
  end
  object DataSource5: TDataSource
    DataSet = ADO25
    Left = 112
    Top = 200
  end
  object ADO25: TADOQuery
    Connection = DM.ADOConnection1
    LockType = ltReadOnly
    OnCalcFields = ADO25CalcFields
    Parameters = <>
    SQL.Strings = (
      
        'SELECT dbo.Data0025.REMARK, dbo.Data0025.ENG_NOTE, dbo.Data0273.' +
        'text, '
      
        '      dbo.Data0273.remark AS Data0273remark, dbo.Data0050.set_x_' +
        'qty, '
      '      dbo.Data0050.set_y_qty'
      'FROM dbo.Data0025 INNER JOIN'
      '      dbo.Data0050 ON '
      
        '      dbo.Data0025.ANCESTOR_PTR = dbo.Data0050.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0273 ON '
      '      dbo.Data0025.ANCESTOR_PTR = dbo.Data0273.CUSTOMER_PART_PTR'
      'WHERE (dbo.Data0025.PARENT_PTR = 0)')
    Left = 80
    Top = 200
    object ADO25REMARK: TStringField
      DisplayLabel = #21152#24037#25351#31034
      FieldName = 'REMARK'
      Size = 280
    end
    object ADO25ENG_NOTE: TStringField
      DisplayLabel = #24037#31243#22791#27880
      DisplayWidth = 200
      FieldName = 'ENG_NOTE'
      Size = 200
    end
    object ADO25TEXT: TStringField
      DisplayLabel = 'ECN'#24037#31243#26356#25913
      FieldName = 'TEXT'
      Size = 500
    end
    object ADO25Data0273remark: TStringField
      DisplayLabel = 'ECN'#22791#27880
      FieldName = 'Data0273remark'
      Size = 200
    end
    object ADO25set_x_qty: TIntegerField
      FieldName = 'set_x_qty'
    end
    object ADO25set_y_qty: TIntegerField
      FieldName = 'set_y_qty'
    end
    object ADO25part_out: TStringField
      FieldKind = fkCalculated
      FieldName = 'part_out'
      Size = 10
      Calculated = True
    end
  end
  object ppDB25: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'ppDB25'
    Left = 147
    Top = 200
    object ppField1: TppField
      FieldAlias = #21152#24037#25351#31034
      FieldName = 'REMARK'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppField2: TppField
      FieldAlias = #24037#31243#22791#27880
      FieldName = 'ENG_NOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppField3: TppField
      FieldAlias = 'ECN'#24037#31243#26356#25913
      FieldName = 'TEXT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppField4: TppField
      FieldAlias = 'ECN'#22791#27880
      FieldName = 'Data0273remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField1: TppField
      FieldAlias = #20986#36135#26495#26041#24335
      FieldName = 'part_out'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
  end
  object Aqinfor90: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = Aqinfor90CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0034.DEPT_NAME,Data0005.EMPLOYEE_NAME,'
      '      data0090.auth_date,data0090.rkey,data0090.dept_ptr'
      'FROM Data0034 INNER JOIN'
      
        '     data0090 ON Data0034.RKEY = data0090.dept_ptr LEFT OUTER JO' +
        'IN'
      '     Data0005 ON data0090.user_ptr = Data0005.RKEY'
      ''
      '')
    Left = 80
    Top = 235
    object Aqinfor90DEPT_NAME: TStringField
      DisplayLabel = #35780#23457#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqinfor90EMPLOYEE_NAME: TStringField
      DisplayLabel = #35780#23457#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqinfor90auth_date: TDateTimeField
      DisplayLabel = #35780#23457#26085#26399
      FieldName = 'auth_date'
    end
    object Aqinfor90rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqinfor90dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object Aqinfor90auth_flag: TStringField
      DisplayLabel = #35780#23457#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
  end
  object DataSource6: TDataSource
    DataSet = Aqinfor90
    Left = 113
    Top = 234
  end
  object ppDB90: TppDBPipeline
    DataSource = DataSource6
    OpenDataSource = False
    UserName = 'DB90'
    Left = 146
    Top = 235
    object ppDB90ppField1: TppField
      FieldAlias = #35780#23457#37096#38376
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB90ppField2: TppField
      FieldAlias = #35780#23457#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB90ppField3: TppField
      FieldAlias = #35780#23457#26085#26399
      FieldName = 'auth_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB90ppField6: TppField
      FieldAlias = #35780#23457#29366#24577
      FieldName = 'auth_flag'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object ADO62: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'D60RKEY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 10
      end>
    SQL.Strings = (
      'SELECT dbo.Data0061.CATEGORY, dbo.Data0062.AMOUNT,'
      '      dbo.Data0062.free_amount'
      'FROM dbo.Data0062 INNER JOIN'
      
        '      dbo.Data0061 ON dbo.Data0062.ADDL_CAT_PTR = dbo.Data0061.R' +
        'KEY'
      'where data0062.so_ptr=:D60RKEY')
    Left = 81
    Top = 266
    object ADO62CATEGORY: TStringField
      FieldName = 'CATEGORY'
    end
    object ADO62AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ADO62free_amount: TFloatField
      FieldName = 'free_amount'
    end
  end
  object DataSource7: TDataSource
    DataSet = ADO62
    Left = 113
    Top = 266
  end
  object ppDB62: TppDBPipeline
    DataSource = DataSource7
    OpenDataSource = False
    UserName = 'DB62'
    Left = 145
    Top = 266
    object ppDB62ppField1: TppField
      FieldAlias = #24037#20855#36153#29992#31867#21035
      FieldName = 'CATEGORY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB62ppField2: TppField
      FieldAlias = #24212#25910#37329#39069
      FieldName = 'AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB62ppField3: TppField
      FieldAlias = #20813#25910#37329#39069
      FieldName = 'free_amount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object ADO6011: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'd60rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select memo_text from data0011'
      'where  source_type=60 and'
      ' FILE_POINTER=:d60rkey')
    Left = 82
    Top = 312
    object ADO6011memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource8: TDataSource
    DataSet = ADO6011
    Left = 112
    Top = 312
  end
  object ppDB6011: TppDBPipeline
    DataSource = DataSource8
    OpenDataSource = False
    UserName = 'DB6011'
    Left = 144
    Top = 312
    object ppDB6011ppField1: TppField
      FieldAlias = #38144#21806#35746#21333#35760#20107#26412
      FieldName = 'memo_text'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
end

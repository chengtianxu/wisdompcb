object frmReport_Mod664: TfrmReport_Mod664
  Left = 498
  Top = 318
  Caption = 'frmReport_Mod664'
  ClientHeight = 384
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxdbdtst493: TfrxDBDataset
    UserName = 'frxDBDataset493'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Company_Name=Company_Name'
      'Company_Name2=Company_Name2'
      'Company_Name3=Company_Name3'
      'ship_address=ship_address'
      'Company_Icon=Company_Icon'
      'SITE_INFO_ADD_1=SITE_INFO_ADD_1'
      'SITE_INFO_ADD_2=SITE_INFO_ADD_2'
      'SITE_INFO_ADD_3=SITE_INFO_ADD_3'
      'SITE_INFO_PHONE=SITE_INFO_PHONE')
    DataSet = cds493
    BCDToCurrency = False
    Left = 120
    Top = 184
  end
  object repTongBan: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42699.717893275500000000
    ReportOptions.LastChange = 42719.695364155100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 184
    Datasets = <
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end
      item
        DataSet = frxdbdtst391
        DataSetName = 'frxDBDataset391'
      end
      item
        DataSet = frxdbdtst392
        DataSetName = 'frxDBDataset392'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 669.197209210000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 120.944960000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 23.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 245.669450000000000000
          Top = 39.133890000000000000
          Width = 226.771800000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #39640#39057#26495#26469#26009#26816#39564#25253#21578)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 255.118275000000000000
          Top = 67.031540000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Incoming Testing Report of CCL')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 18.897650000000000000
          Top = 87.149589210000000000
          Width = 680.315400000000000000
          Height = 582.047620000000000000
        end
        object Line1: TfrxLineView
          Left = 94.488250000000000000
          Top = 87.826840000000000000
          Height = 520.440952200000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 18.897650000000000000
          Top = 123.724490000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 245.669450000000000000
          Top = 86.708720000000000000
          Height = 143.622140000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 321.260050000000000000
          Top = 86.708720000000000000
          Height = 143.622140000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 510.236550000000000000
          Top = 86.708720000000000000
          Height = 173.858380000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 604.724800000000000000
          Top = 86.708720000000000000
          Height = 173.858380000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 27.897650000000000000
          Top = 95.606370000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 264.567100000000000000
          Top = 97.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22411#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 528.913730000000000000
          Top = 95.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25253#21578#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 18.897650000000000000
          Top = 177.196970000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 18.897650000000000000
          Top = 230.110390000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 18.897650000000000000
          Top = 260.346630000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 18.897650000000000000
          Top = 286.803340000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 18.897650000000000000
          Top = 313.260050000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 18.897650000000000000
          Top = 354.496290000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 139.401670000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 23.456710000000000000
          Top = 195.094620000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26469#26009#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 236.669450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20179#24211#39564#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 26.456710000000000000
          Top = 264.126160000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 22.677180000000000000
          Top = 290.582870000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 26.456710000000000000
          Top = 323.819110000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#39033#30446)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line13: TfrxLineView
          Left = 18.897650000000000000
          Top = 448.984540000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 94.488250000000000000
          Top = 354.496290000000000000
          Width = 226.771800000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24212#26377#30456#20851#26816#27979#25968#25454#65292#21253#25324#24615#33021#35201#27714#65292#23454#39564#32467#26524#31561#65292#23454#29289#26631#35782#30456#24212#35268#26684#22411#21495#12289#29983#20135#26085#26399#12289#29615#20445#26631#35782#31561)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 95.267780000000000000
          Top = 407.189240000000000000
          Width = 222.992270000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #34920#38754#26080#40635#28857#12289#20985#22353#12289#36215#30385#12289#25830#33457#21450#27687#21270#31561#65292#34432#21435#38108#31636#21518#22522#26448#26080#24322#29289#65292#32455#32441#26174#38706#31561#29616#35937)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line14: TfrxLineView
          Left = 18.897650000000000000
          Top = 524.677490000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 18.897650000000000000
          Top = 551.913730000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 18.897650000000000000
          Top = 582.149970000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 18.897650000000000000
          Top = 608.606680000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 18.897650000000000000
          Top = 638.842920000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo16: TfrxMemoView
          Left = 37.795300000000000000
          Top = 396.071120000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22806#35266)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 257.008040000000000000
          Top = 143.181200000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35268#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 264.567100000000000000
          Top = 196.094620000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25209#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 249.448980000000000000
          Top = 264.126160000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#26102#38388)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 249.448980000000000000
          Top = 290.582870000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line22: TfrxLineView
          Left = 245.669450000000000000
          Top = 260.346630000000000000
          Height = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 321.260050000000000000
          Top = 260.346630000000000000
          Height = 347.716760000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 94.488250000000000000
          Top = 403.630180000000000000
          Width = 604.724800000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 166.299320000000000000
          Top = 324.598640000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35201#27714#21450#20844#24046)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 22.456710000000000000
          Top = 483.000310000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26495#26009#23610#23544)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 22.677180000000000000
          Top = 528.693260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #38108#31636#21402#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 26.456710000000000000
          Top = 558.929500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #28909#24212#21147)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 26.456710000000000000
          Top = 586.827150000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26495#26009#21402#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 300.472635000000000000
          Top = 615.622450000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #27979#37327#26495#26009#21402#24230#25968#25454)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line25: TfrxLineView
          Left = 94.488250000000000000
          Top = 639.299630000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 510.236550000000000000
          Top = 286.803340000000000000
          Height = 321.260050000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 604.724800000000000000
          Top = 354.834880000000000000
          Height = 253.228510000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Top = 140.181200000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 522.575140000000000000
          Top = 195.874150000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25277#26816#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 530.913730000000000000
          Top = 237.448980000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35746#21333#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 517.795610000000000000
          Top = 290.362400000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26080#21348#32032#29289#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 576.488560000000000000
          Top = 316.819110000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#32467#26524)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 576.488560000000000000
          Top = 337.496290000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ACC/REJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 385.512060000000000000
          Top = 324.378170000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#24773#20917)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line28: TfrxLineView
          Left = 170.078850000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 245.669450000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          Left = 321.260050000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 396.850650000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 472.441250000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          Left = 548.031850000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          Left = 623.622450000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 26.456710000000000000
          Top = 645.638220000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #27979#37327#20301#32622)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 120.944960000000000000
          Top = 647.638220000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9312)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 196.884265710000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9313)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 272.823571430000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9314)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 348.762877140000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9315)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 424.702182860000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9316)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 500.641488570000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9317)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 576.580794290000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9318)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 652.520100000000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9319)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 94.488250000000000000
          Top = 88.047310000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          DataField = #20379#24212#21830#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#20379#24212#21830#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391: TfrxMemoView
          Left = 321.260050000000000000
          Top = 88.047310000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          DataField = #22411#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22411#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 94.488250000000000000
          Top = 124.063080000000000000
          Width = 151.181200000000000000
          Height = 52.913420000000000000
          DataField = #29289#26009#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#29289#26009#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3911: TfrxMemoView
          Left = 321.260050000000000000
          Top = 125.842610000000000000
          Width = 188.976500000000000000
          Height = 49.133890000000000000
          DataField = #35268#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35268#26684'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3912: TfrxMemoView
          Left = 321.260050000000000000
          Top = 176.976500000000000000
          Width = 188.976500000000000000
          Height = 52.913420000000000000
          DataField = #25209#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25209#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 608.504330000000000000
          Top = 93.826840000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #25253#21578#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25253#21578#32534#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 608.504330000000000000
          Top = 139.181200000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          DisplayFormat.FormatStr = 'YYYY-MM-DD'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 610.283860000000000000
          Top = 195.874150000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #26816#27979#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#27979#25968#37327'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 124.724490000000000000
          Top = 195.874150000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = #26469#26009#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26469#26009#25968#37327'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 219.212740000000000000
          Top = 195.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 676.535870000000000000
          Top = 195.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 102.047310000000000000
          Top = 236.669450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 230.551330000000000000
          Top = 237.448980000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21253#35013#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 359.055350000000000000
          Top = 237.448980000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#20986#36135#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3913: TfrxMemoView
          Left = 606.283860000000000000
          Top = 237.448980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #35746#21333#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35746#21333#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3914: TfrxMemoView
          Left = 102.047310000000000000
          Top = 263.905690000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#20154'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 366.614410000000000000
          Top = 263.905690000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS: TfrxMemoView
          Left = 102.047310000000000000
          Top = 290.362400000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'SGS'#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#32534#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS1: TfrxMemoView
          Left = 321.260050000000000000
          Top = 288.362400000000000000
          Width = 188.976500000000000000
          Height = 26.456710000000000000
          DataField = 'SGS'#27979#35797#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#27979#35797#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 322.819110000000000000
          Top = 355.393940000000000000
          Width = 185.196970000000000000
          Height = 49.133890000000000000
          DataField = #22806#35266#26816#27979#24773#20917
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22806#35266#26816#27979#24773#20917'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 249.448980000000000000
          Top = 479.338900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '+3/-0mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 120.944960000000000000
          Top = 479.338900000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = #26495#26009#23610#23544
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26495#26009#23610#23544'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 249.448980000000000000
          Top = 530.472790000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #177'10%um')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 113.385900000000000000
          Top = 558.709030000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '1)'#12289#26080#20998#23618)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 219.212740000000000000
          Top = 558.709030000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '2)'#12289#26080#36215#27873)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 270.346630000000000000
          Top = 587.165740000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape5: TfrxShapeView
          Left = 166.299320000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape6: TfrxShapeView
          Left = 294.803340000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          Left = 438.425480000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape8: TfrxShapeView
          Left = 597.165740000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape9: TfrxShapeView
          Left = 646.299630000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 166.299320000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 294.803340000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #21253#35013#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 438.425480000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26377#20986#36135#25253#21578
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object Memo86: TfrxMemoView
          Left = 619.622450000000000000
          Top = 292.141930000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26159)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 668.976810000000000000
          Top = 292.362400000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21542)
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox5: TfrxCheckBoxView
          Left = 597.165740000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26080#21348#32032
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox6: TfrxCheckBoxView
          Left = 646.299630000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26080#21348#32032#21453
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 748.346940000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtst392
        DataSetName = 'frxDBDataset392'
        RowCount = 0
        object Shape2: TfrxShapeView
          Left = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 30.236240000000000000
        end
        object Line35: TfrxLineView
          Left = 94.488250000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 170.078850000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 245.669450000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 321.260050000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 396.850650000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 472.441250000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 548.031850000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 623.622450000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo60: TfrxMemoView
          Left = 22.456710000000000000
          Top = 7.559060000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #31532)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 70.031540000000000000
          Top = 7.559060000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392sr_no: TfrxMemoView
          Left = 45.354360000000000000
          Top = 6.559060000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          DataField = 'sr_no'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."sr_no"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_1: TfrxMemoView
          Left = 98.267780000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_1'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_2: TfrxMemoView
          Left = 173.858380000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_2'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_3: TfrxMemoView
          Left = 245.669450000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_3'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_3"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_4: TfrxMemoView
          Left = 321.260050000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_4'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_4"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_5: TfrxMemoView
          Left = 396.850650000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_5'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_5"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_6: TfrxMemoView
          Left = 472.441250000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_6'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_6"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_7: TfrxMemoView
          Left = 548.031850000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_7'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_7"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_8: TfrxMemoView
          Left = 625.401980000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_8'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_8"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 154.204804960000000000
        Top = 839.055660000000000000
        Width = 718.110700000000000000
        object Shape3: TfrxShapeView
          Left = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 143.622140000000000000
        end
        object Line19: TfrxLineView
          Left = 18.897650000000000000
          Top = 31.236240000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 18.897650000000000000
          Top = 115.944960000000000000
          Width = 544.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 18.897650000000000000
          Top = 84.708720000000000000
          Width = 544.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 8.559060000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
        end
        object Memo43: TfrxMemoView
          Left = 60.472480000000000000
          Top = 8.559060000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399#26159#21542#31526#21512#35201#27714#35268#33539)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line43: TfrxLineView
          Left = 94.488250000000000000
          Top = 31.236240000000000000
          Height = 112.629974960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line44: TfrxLineView
          Left = 298.582870000000000000
          Top = 1.000000000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 564.031850000000000000
          Top = 1.000000000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo44: TfrxMemoView
          Left = 582.047620000000000000
          Top = 8.559060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #27979#37327#20301#32622#22914#19979#22270)
        end
        object Shape4: TfrxShapeView
          Left = 604.724800000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 60.472480000000000000
        end
        object Memo45: TfrxMemoView
          Left = 573.149970000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9312)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 619.283860000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9313)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 665.197280000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9314)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 574.149970000000000000
          Top = 78.149660000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9315)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 575.149970000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9316)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 623.063390000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9317)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 666.197280000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9318)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 665.197280000000000000
          Top = 79.149660000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9319)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 306.141930000000000000
          Top = 8.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399#20026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 26.456710000000000000
          Top = 53.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26368#32456#21028#23450)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 31.456710000000000000
          Top = 92.267780000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#21592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 26.456710000000000000
          Top = 122.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 317.480520000000000000
          Top = 53.913420000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 313.700990000000000000
          Top = 92.267780000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 306.921460000000000000
          Top = 123.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 136.063080000000000000
          Top = 53.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = #26368#32456#21028#23450
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26368#32456#21028#23450'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3915: TfrxMemoView
          Left = 379.732530000000000000
          Top = 34.015770000000000000
          Width = 181.417440000000000000
          Height = 56.692950000000000000
          DataField = #22791#27880
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22791#27880'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3916: TfrxMemoView
          Left = 124.724490000000000000
          Top = 93.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #26816#26597#21592
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#26597#21592'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3917: TfrxMemoView
          Left = 404.409710000000000000
          Top = 93.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #23457#26680#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#23457#26680#20154'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 117.165430000000000000
          Top = 123.504020000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #26816#26597#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#26597#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 393.071120000000000000
          Top = 123.504020000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #23457#26680#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#23457#26680#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Shape10: TfrxShapeView
          Left = 30.236240000000000000
          Top = 8.559060000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Memo85: TfrxMemoView
          Left = 389.291590000000000000
          Top = 8.559060000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #26377#25928#26399#33267
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26377#25928#26399#33267'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line45: TfrxLineView
          Left = 377.732530000000000000
          Top = 0.220470000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 1016.693570000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 461.102660000000000000
          Top = 21.677180000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #20445#23384#26399#38480#65306#19968#20010#26085#21382#24180)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 498.897960000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #21463#25511'No.'#65306'QC03001-006')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Picture1: TfrxPictureView
        Left = 3.779530000000000000
        Top = 11.897650000000000000
        Width = 105.826840000000000000
        Height = 56.692950000000000000
        DataField = 'Company_Icon'
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
    end
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 56
    Top = 184
  end
  object cds391: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.data0391.rkey, dbo.data0391.iqc_number as '#25253#21578#32534#21495', d' +
      'bo.Data0070.PO_NUMBER as '#35746#21333#21495',dbo.Data0017.INV_NAME as '#29289#26009#21517#31216', dbo.' +
      'Data0017.INV_DESCRIPTION as '#35268#26684', '#13#10'                      dbo.Data' +
      '0023.CODE as '#20379#24212#21830#20195#30721', dbo.Data0023.ABBR_NAME as '#20379#24212#21830#21517#31216',dbo.data0391' +
      '.supplier_model as '#22411#21495','#13#10'                     dbo.data0391.sgs_no' +
      ' as SGS'#32534#21495',  dbo.data0391.sgs_date SGS'#27979#35797#26085#26399', dbo.data0391.rece_qty' +
      ' as '#26469#26009#25968#37327', dbo.data0391.iqc_qty  as '#26816#27979#25968#37327', dbo.data0391.barch_no a' +
      's '#25209#21495', '#13#10#9'  dbo.data0391.appl_date as '#30003#35831#26085#26399',dbo.data0005.employee_' +
      'name as '#30003#35831#20154', dbo.data0391.if_halogen,case  dbo.data0391.rece_qty' +
      '-dbo.data0391.iqc_qty when 0  then '#39'True'#39' else '#39'False'#39' end as '#25277#26816 +
      ','#13#10'                      case data0391.if_halogen when 1 then '#39'T' +
      'rue'#39' else '#39'False'#39' end as '#26159#21542#26080#21348#32032',  dbo.data0391.appearance as '#22806#35266#26816#27979 +
      #24773#20917', '#13#10'                      dbo.data0391.part_size as '#26495#26009#23610#23544', dbo.' +
      'data0391.part_thickness as '#26495#26009#21402#24230', dbo.data0391.tong_thickness as ' +
      #38108#31636#21402#24230', dbo.data0391.thick_tolerance as '#21402#24230#20844#24046', dbo.data0391.ht_rema' +
      'rk ,'#13#10#9#9'dbo.data0391.if_standard,case dbo.data0391.if_standard w' +
      'hen '#39#26159#39' then '#39'True'#39' else '#39'False'#39' end as '#26159#21542#31526#21512#26631#20934','#13#10#9#9'dbo.data0391.' +
      'extrl_date as '#26377#25928#26399#33267',judge_result as '#26368#32456#21028#23450',dbo.data0391.remark as '#22791 +
      #27880',D05_appr.employee_name as '#26816#26597#21592',dbo.data0391.appr_date as '#26816#26597#26085#26399','#13 +
      #10#9#9'  D05_auth.employee_name as '#23457#26680#20154',dbo.data0391.auth_date as '#23457#26680#26085 +
      #26399', case when dbo.data0391.sgs_no='#39#39' then '#39'False'#39' else '#39'True'#39' end' +
      ' as SGS ,'#13#10'                       case data0391.qty_qualified wh' +
      'en 1 then '#39'True'#39' when 0 then '#39'False'#39'  end as '#25968#37327#26159#21542#21512#26684','#13#10'          ' +
      '             case data0391.package_qualified when 1 then '#39'True'#39' ' +
      ' when 0 then '#39'False'#39'  end as '#21253#35013#26159#21542#21512#26684','#13#10'                       cas' +
      'e data0391.hasheepreport  when 1 then '#39'True'#39'  when 0 then '#39'False' +
      #39'  end as '#26159#21542#26377#20986#36135#25253#21578','#13#10'                       case data0391.qty_qua' +
      'lified when 0 then '#39'True'#39' when 1 then '#39'False'#39'  end as '#25968#37327#26159#21542#21512#26684#21453','#13#10 +
      '                       case data0391.package_qualified when 0 th' +
      'en '#39'True'#39'  when 1 then '#39'False'#39'  end as '#21253#35013#26159#21542#21512#26684#21453','#13#10'               ' +
      '        case data0391.hasheepreport  when 0 then '#39'True'#39'  when 1 ' +
      'then '#39'False'#39'  end as '#26159#21542#26377#20986#36135#25253#21578#21453','#13#10'                       case data' +
      '0391.if_halogen when 1 then '#39'False'#39' else '#39'True'#39' end as '#26159#21542#26080#21348#32032#21453','#13#10 +
      '                      dbo.data0002.unit_name as '#21333#20301#13#10'FROM        ' +
      ' dbo.data0391 INNER JOIN'#13#10'                      dbo.Data0017 ON ' +
      'dbo.data0391.rkey17 = dbo.Data0017.RKEY INNER JOIN'#13#10'            ' +
      '          dbo.Data0071 ON dbo.data0391.rkey71 = dbo.Data0071.RKE' +
      'Y INNER JOIN'#13#10'                      dbo.Data0070 ON dbo.Data0071' +
      '.PO_PTR = dbo.Data0070.RKEY INNER JOIN'#13#10'                     dbo' +
      '.Data0002 ON dbo.data0071.purchase_unit_ptr = dbo.Data0002.RKEY ' +
      'inner join'#13#10'                      dbo.Data0023 ON dbo.Data0070.S' +
      'UPPLIER_POINTER = dbo.Data0023.RKEY inner join '#13#10#9#9#9#9#9'  dbo.data' +
      '0005 ON dbo.data0391.appl_user_ptr = dbo.Data0005.rkey left join' +
      ' '#13#10#9#9#9#9#9'  dbo.data0005 as D05_appr ON dbo.data0391.appr_user_ptr' +
      ' = D05_appr.rkey left join'#13#10#9#9#9#9#9'  dbo.data0005 as D05_auth ON d' +
      'bo.data0391.auth_user_ptr = D05_auth.rkey'#13#10#13#10
    Params = <>
    Left = 56
    Top = 240
  end
  object cds392: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select top 5  rkey391, sr_no, value_1, value_2, value_3, value_4' +
      ', value_5, value_6, value_7, value_8 '#13#10'from data0392 '#13#10
    Params = <>
    Left = 56
    Top = 296
  end
  object frxdbdtst391: TfrxDBDataset
    UserName = 'frxDBDataset391'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rkey=rkey'
      #25253#21578#32534#21495'='#25253#21578#32534#21495
      #35746#21333#21495'='#35746#21333#21495
      #29289#26009#21517#31216'='#29289#26009#21517#31216
      #35268#26684'='#35268#26684
      #20379#24212#21830#20195#30721'='#20379#24212#21830#20195#30721
      #20379#24212#21830#21517#31216'='#20379#24212#21830#21517#31216
      #22411#21495'='#22411#21495
      'SGS'#32534#21495'=SGS'#32534#21495
      'SGS'#27979#35797#26085#26399'=SGS'#27979#35797#26085#26399
      #26469#26009#25968#37327'='#26469#26009#25968#37327
      #26816#27979#25968#37327'='#26816#27979#25968#37327
      #25209#21495'='#25209#21495
      #30003#35831#26085#26399'='#30003#35831#26085#26399
      #30003#35831#20154'='#30003#35831#20154
      'if_halogen=if_halogen'
      #25277#26816'='#25277#26816
      #26159#21542#26080#21348#32032'='#26159#21542#26080#21348#32032
      #22806#35266#26816#27979#24773#20917'='#22806#35266#26816#27979#24773#20917
      #26495#26009#23610#23544'='#26495#26009#23610#23544
      #26495#26009#21402#24230'='#26495#26009#21402#24230
      #38108#31636#21402#24230'='#38108#31636#21402#24230
      #21402#24230#20844#24046'='#21402#24230#20844#24046
      'ht_remark=ht_remark'
      'if_standard=if_standard'
      #26159#21542#31526#21512#26631#20934'='#26159#21542#31526#21512#26631#20934
      #26377#25928#26399#33267'='#26377#25928#26399#33267
      #26368#32456#21028#23450'='#26368#32456#21028#23450
      #22791#27880'='#22791#27880
      #26816#26597#21592'='#26816#26597#21592
      #26816#26597#26085#26399'='#26816#26597#26085#26399
      #23457#26680#20154'='#23457#26680#20154
      #23457#26680#26085#26399'='#23457#26680#26085#26399
      'SGS=SGS'
      #25968#37327#26159#21542#21512#26684'='#25968#37327#26159#21542#21512#26684
      #21253#35013#26159#21542#21512#26684'='#21253#35013#26159#21542#21512#26684
      #26159#21542#26377#20986#36135#25253#21578'='#26159#21542#26377#20986#36135#25253#21578
      #25968#37327#26159#21542#21512#26684#21453'='#25968#37327#26159#21542#21512#26684#21453
      #21253#35013#26159#21542#21512#26684#21453'='#21253#35013#26159#21542#21512#26684#21453
      #26159#21542#26377#20986#36135#25253#21578#21453'='#26159#21542#26377#20986#36135#25253#21578#21453
      #26159#21542#26080#21348#32032#21453'='#26159#21542#26080#21348#32032#21453
      #21333#20301'='#21333#20301)
    DataSet = cds391
    BCDToCurrency = False
    Left = 120
    Top = 240
  end
  object frxdbdtst392: TfrxDBDataset
    UserName = 'frxDBDataset392'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rkey391=rkey391'
      'sr_no=sr_no'
      'value_1=value_1'
      'value_2=value_2'
      'value_3=value_3'
      'value_4=value_4'
      'value_5=value_5'
      'value_6=value_6'
      'value_7=value_7'
      'value_8=value_8')
    DataSet = cds392
    BCDToCurrency = False
    Left = 120
    Top = 296
  end
  object repTongZhiDan: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42709.398540138900000000
    ReportOptions.LastChange = 42719.660770706020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 184
    Datasets = <
      item
        DataSet = frxdbdtst391
        DataSetName = 'frxDBDataset391'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 362.834880000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          ShiftMode = smDontShift
          Left = 26.456710000000000000
          Top = 147.401670000000000000
          Width = 680.315400000000000000
          Height = 215.433210000000000000
        end
        object Shape2: TfrxShapeView
          ShiftMode = smDontShift
          Left = 185.196970000000000000
          Top = 268.346630000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Picture1: TfrxPictureView
          Width = 90.708720000000000000
          Height = 52.913420000000000000
          DataField = 'Company_Icon'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 98.267780000000000000
          Width = 347.716760000000000000
          Height = 30.236240000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 98.267780000000000000
          Top = 18.897650000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 279.685220000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#26816#39564#36890#30693#21333)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 257.008040000000000000
          Top = 64.252010000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Material Inspection Notification Form ')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 26.456710000000000000
          Top = 79.370130000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #33268#65306#21697#36136#37096'/IQC')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 71.811070000000000000
          Top = 100.708720000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20170#26377#20179#24211#22312)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 158.740260000000000000
          Top = 119.606370000000000000
          Width = 98.267780000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 272.126160000000000000
          Top = 100.708720000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25910#21040#19979#21015#29289#26009#19968#25209#65292#35831#21697#36136#37096'/IQC'#25910#21333#21518#20110)
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 555.590910000000000000
          Top = 119.606370000000000000
          Width = 94.488250000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 665.197280000000000000
          Top = 100.708720000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #23567)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 26.456710000000000000
          Top = 124.724490000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26102#20043#20869#23545#35813#25209#29289#26009#36827#34892#36136#37327#26816#39564#65292#20197#20415#25105#37096#38376#21450#26102#20837#24211#12290)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 26.456710000000000000
          Top = 241.889920000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 26.456710000000000000
          Top = 211.653680000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 347.716760000000000000
          Top = 181.417440000000000000
          Width = 359.055350000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 120.944960000000000000
          Top = 147.401670000000000000
          Height = 94.488250000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          Left = 347.716760000000000000
          Top = 147.401670000000000000
          Height = 94.488250000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 423.307360000000000000
          Top = 147.401670000000000000
          Height = 94.488250000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo8: TfrxMemoView
          Left = 30.236240000000000000
          Top = 170.078850000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 30.236240000000000000
          Top = 215.433210000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25910#36135#25968#37327)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 355.275820000000000000
          Top = 158.740260000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #35268#26684#22411#21495)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 359.055350000000000000
          Top = 188.976500000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 359.055350000000000000
          Top = 215.433210000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #35746#21333#21495)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 30.236240000000000000
          Top = 249.448980000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20179#24211#39564#25910#35760#24405#65306)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 34.015770000000000000
          Top = 268.346630000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '1'#12289#25968#37327#21512#26684)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 34.015770000000000000
          Top = 291.023810000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '2'#12289#21253#35013#21512#26684)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 34.015770000000000000
          Top = 313.700990000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '3'#12289#26377#20986#36135#25253#21578)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 275.905690000000000000
          Top = 268.346630000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #19981#21512#26684)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 275.905690000000000000
          Top = 291.023810000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #19981#21512#26684)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 275.905690000000000000
          Top = 313.700990000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26080#20986#36135#25253#21578)
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 34.015770000000000000
          Top = 340.157700000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25910#36135#20154#65306)
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 279.685220000000000000
          Top = 340.157700000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'IQC'#65306)
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 491.338900000000000000
          Top = 340.157700000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26085#26399#65306)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 129.504020000000000000
          Top = 153.181200000000000000
          Width = 207.874150000000000000
          Height = 52.913420000000000000
          DataField = #29289#26009#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#29289#26009#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391: TfrxMemoView
          Left = 423.307360000000000000
          Top = 147.401670000000000000
          Width = 283.464750000000000000
          Height = 34.015770000000000000
          DataField = #35268#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35268#26684'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 427.086890000000000000
          Top = 188.976500000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataField = #20379#24212#21830#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#20379#24212#21830#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3911: TfrxMemoView
          Left = 476.220780000000000000
          Top = 219.212740000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = #35746#21333#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35746#21333#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 162.519790000000000000
          Top = 218.433210000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = #26469#26009#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26469#26009#25968#37327'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3912: TfrxMemoView
          Left = 280.244280000000000000
          Top = 218.212740000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #21333#20301
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#21333#20301'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3913: TfrxMemoView
          Left = 102.047310000000000000
          Top = 340.157700000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#20154'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 536.693260000000000000
          Top = 340.157700000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Shape3: TfrxShapeView
          ShiftMode = smDontShift
          Left = 377.953000000000000000
          Top = 268.346630000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape4: TfrxShapeView
          ShiftMode = smDontShift
          Left = 377.953000000000000000
          Top = 291.023810000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape5: TfrxShapeView
          ShiftMode = smDontShift
          Left = 377.953000000000000000
          Top = 313.700990000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape6: TfrxShapeView
          ShiftMode = smDontShift
          Left = 185.196970000000000000
          Top = 291.023810000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          ShiftMode = smDontShift
          Left = 185.196970000000000000
          Top = 313.700990000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 185.196970000000000000
          Top = 291.023810000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #21253#35013#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 185.196970000000000000
          Top = 313.700990000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26377#20986#36135#25253#21578
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 377.953000000000000000
          Top = 268.346630000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684#21453
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox5: TfrxCheckBoxView
          Left = 377.953000000000000000
          Top = 291.023810000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #21253#35013#26159#21542#21512#26684#21453
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox6: TfrxCheckBoxView
          Left = 377.953000000000000000
          Top = 313.700990000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26377#20986#36135#25253#21578#21453
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox1: TfrxCheckBoxView
          ShiftMode = smDontShift
          Left = 185.196970000000000000
          Top = 268.346630000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 442.205010000000000000
        Width = 718.110700000000000000
        object Memo23: TfrxMemoView
          Left = 498.897960000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21463#25511'NO.'#65306'DG-WI-PMC-012-09/00')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 476.220780000000000000
          Top = 18.897650000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180)
          ParentFont = False
        end
      end
    end
  end
  object repGaoPingBan: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42699.717893275500000000
    ReportOptions.LastChange = 42719.695364155100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 240
    Datasets = <
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end
      item
        DataSet = frxdbdtst391
        DataSetName = 'frxDBDataset391'
      end
      item
        DataSet = frxdbdtst392
        DataSetName = 'frxDBDataset392'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 669.197209210000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 19.897650000000000000
          Top = 87.149589210000000000
          Width = 680.315400000000000000
          Height = 582.047620000000000000
        end
        object Shape5: TfrxShapeView
          Left = 167.299320000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 167.299320000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 120.944960000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 23.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 245.669450000000000000
          Top = 39.133890000000000000
          Width = 226.771800000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #39640#39057#26495#26469#26009#26816#39564#25253#21578)
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 255.118275000000000000
          Top = 67.031540000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Incoming Testing Report of CCL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 94.488250000000000000
          Top = 87.826840000000000000
          Height = 520.440952200000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 18.897650000000000000
          Top = 123.724490000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 245.669450000000000000
          Top = 86.708720000000000000
          Height = 143.622140000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          Left = 321.260050000000000000
          Top = 86.708720000000000000
          Height = 143.622140000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          Left = 510.236550000000000000
          Top = 86.708720000000000000
          Height = 173.858380000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 604.724800000000000000
          Top = 86.708720000000000000
          Height = 173.858380000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          Left = 27.897650000000000000
          Top = 95.606370000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 264.567100000000000000
          Top = 97.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22411#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 528.913730000000000000
          Top = 95.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25253#21578#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line7: TfrxLineView
          Left = 18.897650000000000000
          Top = 177.196970000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 18.897650000000000000
          Top = 230.110390000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 18.897650000000000000
          Top = 260.346630000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 18.897650000000000000
          Top = 286.803340000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 18.897650000000000000
          Top = 313.260050000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 18.897650000000000000
          Top = 354.496290000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 139.401670000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 23.456710000000000000
          Top = 195.094620000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26469#26009#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 236.669450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20179#24211#39564#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 26.456710000000000000
          Top = 264.126160000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 22.677180000000000000
          Top = 290.582870000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 26.456710000000000000
          Top = 323.819110000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#39033#30446)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line13: TfrxLineView
          Left = 18.897650000000000000
          Top = 448.984540000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 94.488250000000000000
          Top = 354.496290000000000000
          Width = 226.771800000000000000
          Height = 49.133890000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24212#26377#30456#20851#26816#27979#25968#25454#65292#21253#25324#24615#33021#35201#27714#65292#23454#39564#32467#26524#31561#65292#23454#29289#26631#35782#30456#24212#35268#26684#22411#21495#12289#29983#20135#26085#26399#12289#29615#20445#26631#35782#31561)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 95.267780000000000000
          Top = 407.189240000000000000
          Width = 222.992270000000000000
          Height = 41.574830000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #34920#38754#26080#40635#28857#12289#20985#22353#12289#36215#30385#12289#25830#33457#21450#27687#21270#31561#65292#34432#21435#38108#31636#21518#22522#26448#26080#24322#29289#65292#32455#32441#26174#38706#31561#29616#35937)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line14: TfrxLineView
          Left = 18.897650000000000000
          Top = 524.677490000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 18.897650000000000000
          Top = 551.913730000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 18.897650000000000000
          Top = 582.149970000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          Left = 18.897650000000000000
          Top = 608.606680000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 18.897650000000000000
          Top = 638.842920000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo16: TfrxMemoView
          Left = 37.795300000000000000
          Top = 396.071120000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22806#35266)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 257.008040000000000000
          Top = 143.181200000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35268#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 264.567100000000000000
          Top = 196.094620000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25209#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 249.448980000000000000
          Top = 264.126160000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#26102#38388)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 249.448980000000000000
          Top = 290.582870000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line22: TfrxLineView
          Left = 245.669450000000000000
          Top = 260.346630000000000000
          Height = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 321.260050000000000000
          Top = 260.346630000000000000
          Height = 347.716760000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 94.488250000000000000
          Top = 403.630180000000000000
          Width = 604.724800000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          Left = 166.299320000000000000
          Top = 324.598640000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35201#27714#21450#20844#24046)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 22.456710000000000000
          Top = 483.000310000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26495#26009#23610#23544)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 22.677180000000000000
          Top = 528.693260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #38108#31636#21402#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 26.456710000000000000
          Top = 558.929500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #28909#24212#21147)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 26.456710000000000000
          Top = 586.827150000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26495#26009#21402#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 300.472635000000000000
          Top = 615.622450000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #27979#37327#26495#26009#21402#24230#25968#25454)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line25: TfrxLineView
          Left = 94.488250000000000000
          Top = 639.299630000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 510.236550000000000000
          Top = 286.803340000000000000
          Height = 321.260050000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 604.724800000000000000
          Top = 354.834880000000000000
          Height = 253.228510000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo27: TfrxMemoView
          Left = 525.354670000000000000
          Top = 140.181200000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 522.575140000000000000
          Top = 195.874150000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25277#26816#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 530.913730000000000000
          Top = 237.448980000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35746#21333#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 517.795610000000000000
          Top = 290.362400000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26080#21348#32032#29289#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 576.488560000000000000
          Top = 316.819110000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#32467#26524)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 576.488560000000000000
          Top = 337.496290000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'ACC/REJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 385.512060000000000000
          Top = 324.378170000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#27979#24773#20917)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line28: TfrxLineView
          Left = 170.078850000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 245.669450000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          Left = 321.260050000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 396.850650000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 472.441250000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          Left = 548.031850000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          Left = 623.622450000000000000
          Top = 639.079160000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo34: TfrxMemoView
          Left = 26.456710000000000000
          Top = 645.638220000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #27979#37327#20301#32622)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 120.944960000000000000
          Top = 647.638220000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9312)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 196.884265710000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9313)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 272.823571430000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9314)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 348.762877140000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9315)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 424.702182860000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9316)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 500.641488570000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9317)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 576.580794290000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9318)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 652.520100000000000000
          Top = 647.638220000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #9319)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          Left = 94.488250000000000000
          Top = 88.047310000000000000
          Width = 151.181200000000000000
          Height = 34.015770000000000000
          DataField = #20379#24212#21830#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#20379#24212#21830#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391: TfrxMemoView
          Left = 321.260050000000000000
          Top = 88.047310000000000000
          Width = 188.976500000000000000
          Height = 34.015770000000000000
          DataField = #22411#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22411#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          Left = 94.488250000000000000
          Top = 124.063080000000000000
          Width = 151.181200000000000000
          Height = 52.913420000000000000
          DataField = #29289#26009#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#29289#26009#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3911: TfrxMemoView
          Left = 321.260050000000000000
          Top = 125.842610000000000000
          Width = 188.976500000000000000
          Height = 49.133890000000000000
          DataField = #35268#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35268#26684'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3912: TfrxMemoView
          Left = 321.260050000000000000
          Top = 176.976500000000000000
          Width = 188.976500000000000000
          Height = 52.913420000000000000
          DataField = #25209#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25209#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          Left = 608.504330000000000000
          Top = 93.826840000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #25253#21578#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25253#21578#32534#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Left = 608.504330000000000000
          Top = 139.181200000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          DisplayFormat.FormatStr = 'YYYY-MM-DD'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 610.283860000000000000
          Top = 195.874150000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = #26816#27979#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#27979#25968#37327'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 124.724490000000000000
          Top = 195.874150000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = #26469#26009#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26469#26009#25968#37327'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Left = 219.212740000000000000
          Top = 195.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo69: TfrxMemoView
          Left = 676.535870000000000000
          Top = 195.874150000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Left = 103.047310000000000000
          Top = 236.669450000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Left = 230.551330000000000000
          Top = 237.448980000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21253#35013#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo72: TfrxMemoView
          Left = 359.055350000000000000
          Top = 237.448980000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#20986#36135#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3913: TfrxMemoView
          Left = 606.283860000000000000
          Top = 237.448980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #35746#21333#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35746#21333#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3914: TfrxMemoView
          Left = 102.047310000000000000
          Top = 263.905690000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#20154'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo73: TfrxMemoView
          Left = 366.614410000000000000
          Top = 263.905690000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS: TfrxMemoView
          Left = 102.047310000000000000
          Top = 290.362400000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'SGS'#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#32534#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS1: TfrxMemoView
          Left = 321.260050000000000000
          Top = 288.362400000000000000
          Width = 188.976500000000000000
          Height = 26.456710000000000000
          DataField = 'SGS'#27979#35797#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#27979#35797#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo74: TfrxMemoView
          Left = 322.819110000000000000
          Top = 355.393940000000000000
          Width = 185.196970000000000000
          Height = 49.133890000000000000
          DataField = #22806#35266#26816#27979#24773#20917
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22806#35266#26816#27979#24773#20917'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo75: TfrxMemoView
          Left = 249.448980000000000000
          Top = 479.338900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '+3/-0mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo76: TfrxMemoView
          Left = 120.944960000000000000
          Top = 479.338900000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = #26495#26009#23610#23544
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26495#26009#23610#23544'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo77: TfrxMemoView
          Left = 249.448980000000000000
          Top = 530.472790000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #177'10%um')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo78: TfrxMemoView
          Left = 113.385900000000000000
          Top = 558.709030000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '1)'#12289#26080#20998#23618)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo79: TfrxMemoView
          Left = 219.212740000000000000
          Top = 558.709030000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '2)'#12289#26080#36215#27873)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo80: TfrxMemoView
          Left = 270.346630000000000000
          Top = 587.165740000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape6: TfrxShapeView
          Left = 294.803340000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          Left = 438.425480000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape8: TfrxShapeView
          Left = 597.165740000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape9: TfrxShapeView
          Left = 646.299630000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 294.803340000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #21253#35013#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 438.425480000000000000
          Top = 237.448980000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26377#20986#36135#25253#21578
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object Memo86: TfrxMemoView
          Left = 619.622450000000000000
          Top = 292.141930000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26159)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo87: TfrxMemoView
          Left = 668.976810000000000000
          Top = 292.362400000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21542)
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox5: TfrxCheckBoxView
          Left = 597.165740000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26080#21348#32032
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox6: TfrxCheckBoxView
          Left = 646.299630000000000000
          Top = 290.362400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26080#21348#32032#21453
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 748.346940000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtst392
        DataSetName = 'frxDBDataset392'
        RowCount = 0
        object Shape2: TfrxShapeView
          Left = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 30.236240000000000000
        end
        object Line35: TfrxLineView
          Left = 94.488250000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 170.078850000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Left = 245.669450000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          Left = 321.260050000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line39: TfrxLineView
          Left = 396.850650000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          Left = 472.441250000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          Left = 548.031850000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 623.622450000000000000
          Height = 29.480314960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo60: TfrxMemoView
          Left = 22.456710000000000000
          Top = 7.559060000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #31532)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          Left = 70.031540000000000000
          Top = 7.559060000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #24352)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392sr_no: TfrxMemoView
          Left = 45.354360000000000000
          Top = 6.559060000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          DataField = 'sr_no'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."sr_no"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_1: TfrxMemoView
          Left = 98.267780000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_1'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_1"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_2: TfrxMemoView
          Left = 173.858380000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_2'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_3: TfrxMemoView
          Left = 245.669450000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_3'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_3"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_4: TfrxMemoView
          Left = 321.260050000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_4'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_4"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_5: TfrxMemoView
          Left = 396.850650000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_5'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_5"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_6: TfrxMemoView
          Left = 472.441250000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_6'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_6"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_7: TfrxMemoView
          Left = 548.031850000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_7'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_7"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset392value_8: TfrxMemoView
          Left = 625.401980000000000000
          Top = 7.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'value_8'
          DataSet = frxdbdtst392
          DataSetName = 'frxDBDataset392'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset392."value_8"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 154.204804960000000000
        Top = 839.055660000000000000
        Width = 718.110700000000000000
        object Shape3: TfrxShapeView
          Left = 18.897650000000000000
          Width = 680.315400000000000000
          Height = 143.622140000000000000
        end
        object Line19: TfrxLineView
          Left = 18.897650000000000000
          Top = 31.236240000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 18.897650000000000000
          Top = 115.944960000000000000
          Width = 544.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 18.897650000000000000
          Top = 84.708720000000000000
          Width = 544.252320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 30.236240000000000000
          Top = 8.559060000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
        end
        object Memo43: TfrxMemoView
          Left = 60.472480000000000000
          Top = 8.559060000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399#26159#21542#31526#21512#35201#27714#35268#33539)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line43: TfrxLineView
          Left = 94.488250000000000000
          Top = 31.236240000000000000
          Height = 112.629974960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line44: TfrxLineView
          Left = 298.582870000000000000
          Top = 1.000000000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 564.031850000000000000
          Top = 1.000000000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo44: TfrxMemoView
          Left = 582.047620000000000000
          Top = 8.559060000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #27979#37327#20301#32622#22914#19979#22270)
        end
        object Shape4: TfrxShapeView
          Left = 604.724800000000000000
          Top = 56.692950000000000000
          Width = 49.133890000000000000
          Height = 60.472480000000000000
        end
        object Memo45: TfrxMemoView
          Left = 573.149970000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9312)
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 619.283860000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9313)
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 665.197280000000000000
          Top = 35.015770000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9314)
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 574.149970000000000000
          Top = 78.149660000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9315)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 575.149970000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9316)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 623.063390000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9317)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 666.197280000000000000
          Top = 125.283550000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9318)
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 665.197280000000000000
          Top = 79.149660000000000000
          Width = 18.897650000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #9319)
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 306.141930000000000000
          Top = 8.559060000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399#20026)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 26.456710000000000000
          Top = 53.913420000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26368#32456#21028#23450)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 31.456710000000000000
          Top = 92.267780000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#21592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 26.456710000000000000
          Top = 122.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 317.480520000000000000
          Top = 53.913420000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 313.700990000000000000
          Top = 92.267780000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          Left = 306.921460000000000000
          Top = 123.724490000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo82: TfrxMemoView
          Left = 136.063080000000000000
          Top = 53.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = #26368#32456#21028#23450
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26368#32456#21028#23450'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3915: TfrxMemoView
          Left = 379.732530000000000000
          Top = 34.015770000000000000
          Width = 181.417440000000000000
          Height = 56.692950000000000000
          DataField = #22791#27880
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22791#27880'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3916: TfrxMemoView
          Left = 124.724490000000000000
          Top = 93.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #26816#26597#21592
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#26597#21592'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3917: TfrxMemoView
          Left = 404.409710000000000000
          Top = 93.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #23457#26680#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#23457#26680#20154'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo83: TfrxMemoView
          Left = 117.165430000000000000
          Top = 123.504020000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #26816#26597#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26816#26597#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo84: TfrxMemoView
          Left = 393.071120000000000000
          Top = 123.504020000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #23457#26680#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#23457#26680#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Shape10: TfrxShapeView
          Left = 30.236240000000000000
          Top = 8.559060000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Memo85: TfrxMemoView
          Left = 389.291590000000000000
          Top = 8.559060000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = #26377#25928#26399#33267
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26377#25928#26399#33267'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line45: TfrxLineView
          Left = 377.732530000000000000
          Top = 0.220470000000000000
          Height = 142.866214960000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 1016.693570000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 461.102660000000000000
          Top = 21.677180000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #20445#23384#26399#38480#65306#19968#20010#26085#21382#24180)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 498.897960000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #21463#25511'No.'#65306'QC03001-006')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Picture1: TfrxPictureView
        Left = 3.779530000000000000
        Top = 11.897650000000000000
        Width = 105.826840000000000000
        Height = 56.692950000000000000
        DataField = 'Company_Icon'
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
    end
  end
  object repCheLiang: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42709.474894502300000000
    ReportOptions.LastChange = 42719.712221585650000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 280
    Top = 248
    Datasets = <
      item
        DataSet = frxdbdtst391
        DataSetName = 'frxDBDataset391'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 975.118740000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Shape2: TfrxShapeView
          Left = 457.323130000000000000
          Top = 292.567100000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 68.031540000000000000
          DataField = 'Company_Icon'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 120.944960000000000000
          Top = 4.000000000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 30.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 243.779685000000000000
          Top = 58.354360000000000000
          Width = 230.551330000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26469#26009#26816#39564#27979#37327#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 260.787570000000000000
          Top = 90.590600000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Incoming Inspection Report')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape1: TfrxShapeView
          Left = 18.897650000000000000
          Top = 112.488250000000000000
          Width = 680.315400000000000000
          Height = 833.385826770000000000
        end
        object Line1: TfrxLineView
          Left = 18.897650000000000000
          Top = 171.181200000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 18.897650000000000000
          Top = 227.874150000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 18.897650000000000000
          Top = 284.567100000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 18.897650000000000000
          Top = 315.362400000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 18.897650000000000000
          Top = 347.157700000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 18.897650000000000000
          Top = 377.953000000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 18.897650000000000000
          Top = 409.291590000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 18.897650000000000000
          Top = 443.307360000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 18.897650000000000000
          Top = 542.457020000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          Left = 18.897650000000000000
          Top = 575.134200000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 18.897650000000000000
          Top = 606.929500000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 18.897650000000000000
          Top = 638.724800000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Left = 18.897650000000000000
          Top = 700.756340000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Left = 18.897650000000000000
          Top = 732.772110000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 18.897650000000000000
          Top = 764.787880000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 18.897650000000000000
          Top = 793.024120000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          Left = 18.897650000000000000
          Top = 911.969080000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 18.897650000000000000
          Top = 877.953310000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 18.897650000000000000
          Top = 510.559370000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 18.897650000000000000
          Top = 671.079160000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line22: TfrxLineView
          Left = 18.897650000000000000
          Top = 477.323130000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Top = 133.385900000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line23: TfrxLineView
          Left = 98.267780000000000000
          Top = 114.488250000000000000
          Height = 585.827150000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 266.346630000000000000
          Top = 114.488250000000000000
          Height = 170.078850000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 340.157700000000000000
          Top = 114.488250000000000000
          Height = 170.078850000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 510.236550000000000000
          Top = 114.488250000000000000
          Height = 200.315090000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 589.606680000000000000
          Top = 114.488250000000000000
          Height = 200.315090000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 193.858380000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 26.456710000000000000
          Top = 246.771800000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26469#26009#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 292.126160000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20179#24211#39564#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 26.456710000000000000
          Top = 322.362400000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 26.456710000000000000
          Top = 354.598640000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 26.456710000000000000
          Top = 386.614410000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#39564#39033#30446)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 34.015770000000000000
          Top = 416.850650000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22806#35266)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 18.897650000000000000
          Top = 707.874460000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399#26159#21542#31526#21512#35201#27714#35268#33539)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 22.677180000000000000
          Top = 738.110700000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #39564#35777#21253#35013#26631#35782)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 22.677180000000000000
          Top = 769.346940000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #32467#35770)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 22.677180000000000000
          Top = 798.583180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 26.677180000000000000
          Top = 889.291900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#21592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 26.456710000000000000
          Top = 919.528140000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line17: TfrxLineView
          Left = 98.267780000000000000
          Top = 878.173780000000000000
          Height = 66.141732280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 415.748300000000000000
          Top = 879.173780000000000000
          Height = 66.141732280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 340.157700000000000000
          Top = 878.394250000000000000
          Height = 66.141732280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 343.937230000000000000
          Top = 885.953310000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 343.937230000000000000
          Top = 919.969080000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 287.244280000000000000
          Top = 130.047310000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22411#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 517.795610000000000000
          Top = 133.826840000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25253#21578#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 287.244280000000000000
          Top = 194.299320000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35268#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 287.244280000000000000
          Top = 247.212740000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25209#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 517.795610000000000000
          Top = 194.299320000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 520.575140000000000000
          Top = 247.212740000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25277#26816#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 102.047310000000000000
          Top = 292.567100000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 241.889920000000000000
          Top = 292.567100000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21253#35013#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 370.393940000000000000
          Top = 292.567100000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#20986#36135#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 525.354670000000000000
          Top = 292.567100000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35746#21333#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 272.126160000000000000
          Top = 322.803340000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#26102#38388)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line30: TfrxLineView
          Left = 264.567100000000000000
          Top = 315.244280000000000000
          Height = 62.362202280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 340.157700000000000000
          Top = 315.464750000000000000
          Height = 417.637795280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 270.346630000000000000
          Top = 353.039580000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 185.196970000000000000
          Top = 387.055350000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35201#27714)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 400.630180000000000000
          Top = 387.055350000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#39564#32467#26524)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 616.063390000000000000
          Top = 379.496290000000000000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21028#23450'  ACC/REJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line32: TfrxLineView
          Left = 589.606680000000000000
          Top = 379.496290000000000000
          Height = 321.260050000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 347.716760000000000000
          Top = 712.094930000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#25928#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line33: TfrxLineView
          Left = 415.748300000000000000
          Top = 700.756340000000000000
          Height = 32.125962280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo37: TfrxMemoView
          Left = 181.417440000000000000
          Top = 708.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26159)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 260.787570000000000000
          Top = 708.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21542)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 158.740260000000000000
          Top = 738.551640000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #31526#21512)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 238.110390000000000000
          Top = 738.551640000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #19981#31526#21512)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 109.606370000000000000
          Top = 768.787880000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25509#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 192.756030000000000000
          Top = 768.787880000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35753#27493#25509#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 298.582870000000000000
          Top = 768.787880000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25361#36873)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 102.047310000000000000
          Top = 114.929190000000000000
          Width = 158.740260000000000000
          Height = 52.913420000000000000
          DataField = #20379#24212#21830#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#20379#24212#21830#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391: TfrxMemoView
          Left = 343.937230000000000000
          Top = 114.929190000000000000
          Width = 162.519790000000000000
          Height = 52.913420000000000000
          DataField = #22411#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22411#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 102.047310000000000000
          Top = 174.401670000000000000
          Width = 158.740260000000000000
          Height = 52.913420000000000000
          DataField = #29289#26009#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#29289#26009#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3911: TfrxMemoView
          Left = 343.937230000000000000
          Top = 174.401670000000000000
          Width = 162.519790000000000000
          Height = 52.913420000000000000
          DataField = #35268#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35268#26684'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3912: TfrxMemoView
          Left = 343.937230000000000000
          Top = 232.094620000000000000
          Width = 162.519790000000000000
          Height = 49.133890000000000000
          DataField = #25209#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25209#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 113.385900000000000000
          Top = 247.212740000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = #26469#26009#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26469#26009#25968#37327'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3913: TfrxMemoView
          Left = 207.874150000000000000
          Top = 247.212740000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #21333#20301
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#21333#20301'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3914: TfrxMemoView
          Left = 653.858690000000000000
          Top = 247.212740000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = #21333#20301
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#21333#20301'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 593.386210000000000000
          Top = 194.299320000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          DisplayFormat.FormatStr = 'YYYY-MM-DD'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 593.386210000000000000
          Top = 133.826840000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = #25253#21578#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25253#21578#32534#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3915: TfrxMemoView
          Left = 117.165430000000000000
          Top = 322.803340000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#20154'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 393.071120000000000000
          Top = 322.803340000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS: TfrxMemoView
          Left = 102.047310000000000000
          Top = 353.039580000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'SGS'#27979#35797#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#27979#35797#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS1: TfrxMemoView
          Left = 340.157700000000000000
          Top = 348.260050000000000000
          Width = 355.275820000000000000
          Height = 30.236240000000000000
          DataField = 'SGS'#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#32534#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape3: TfrxShapeView
          Left = 207.874150000000000000
          Top = 708.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape4: TfrxShapeView
          Left = 287.244280000000000000
          Top = 708.315400000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape5: TfrxShapeView
          Left = 136.063080000000000000
          Top = 738.551640000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape6: TfrxShapeView
          Left = 215.433210000000000000
          Top = 738.551640000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          Left = 86.929190000000000000
          Top = 768.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape8: TfrxShapeView
          Left = 170.078850000000000000
          Top = 768.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape9: TfrxShapeView
          Left = 275.905690000000000000
          Top = 768.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape10: TfrxShapeView
          Left = 173.858380000000000000
          Top = 291.685290790000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 173.858380000000000000
          Top = 291.685290790000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object Shape11: TfrxShapeView
          Left = 311.700990000000000000
          Top = 292.126230790000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 311.700990000000000000
          Top = 292.126230790000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 457.323130000000000000
          Top = 292.567100000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object frxDBDataset3916: TfrxMemoView
          Left = 591.386210000000000000
          Top = 289.787570000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #35746#21333#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35746#21333#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 1054.488870000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 506.457020000000000000
          Top = 3.779530000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #21463#25511'No.'#65306'ZH-WI-QA-004-01/02')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 464.882190000000000000
          Top = 26.456710000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #20445#23384#26399#38480#65306#36710#36733#26495'16'#24180#65292#38750#36710#36733#26495'3'#24180)
          ParentFont = False
        end
      end
    end
  end
  object repDrill: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42709.474894502300000000
    ReportOptions.LastChange = 42719.707213240740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 192
    Top = 312
    Datasets = <
      item
        DataSet = frxdbdtst391
        DataSetName = 'frxDBDataset391'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 925.984850000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 109.606370000000000000
          Height = 68.031540000000000000
          DataField = 'Company_Icon'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 120.944960000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 22.456710000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 230.551330000000000000
          Top = 42.354360000000000000
          Width = 257.008040000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #38075#21632#38179#20992#26816#39564#27979#37327#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 227.771800000000000000
          Top = 72.590600000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'IIncoming Testing Report of Drilling Bit')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape1: TfrxShapeView
          Left = 18.897650000000000000
          Top = 92.488250000000000000
          Width = 680.315400000000000000
          Height = 833.385826770000000000
        end
        object Line1: TfrxLineView
          Left = 18.897650000000000000
          Top = 150.181200000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 18.897650000000000000
          Top = 205.874150000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = 18.897650000000000000
          Top = 243.669450000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Left = 15.118120000000000000
          Top = 282.023810000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 18.897650000000000000
          Top = 320.378170000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 18.897650000000000000
          Top = 355.953000000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 18.897650000000000000
          Top = 394.850650000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 18.897650000000000000
          Top = 545.354670000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 19.677180000000000000
          Top = 621.504330000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Left = 18.897650000000000000
          Top = 696.653990000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 18.897650000000000000
          Top = 736.228820000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 18.897650000000000000
          Top = 772.024120000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          Left = 18.897650000000000000
          Top = 887.189550000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          Left = 18.897650000000000000
          Top = 849.394250000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          Left = 18.897650000000000000
          Top = 507.457020000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          Left = 18.897650000000000000
          Top = 657.638220000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line22: TfrxLineView
          Left = 19.677180000000000000
          Top = 470.441250000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo5: TfrxMemoView
          Left = 34.015770000000000000
          Top = 112.385900000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line23: TfrxLineView
          Left = 98.267780000000000000
          Top = 92.488250000000000000
          Height = 604.724800000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 266.346630000000000000
          Top = 92.488250000000000000
          Height = 151.181200000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 340.157700000000000000
          Top = 92.488250000000000000
          Height = 151.181200000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 510.236550000000000000
          Top = 92.488250000000000000
          Height = 188.976500000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 589.606680000000000000
          Top = 92.488250000000000000
          Height = 188.976500000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          Left = 26.456710000000000000
          Top = 171.858380000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 24.677180000000000000
          Top = 218.992270000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26469#26009#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Top = 255.126160000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20179#24211#39564#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 30.236240000000000000
          Top = 291.023810000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 22.677180000000000000
          Top = 330.598640000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 22.677180000000000000
          Top = 368.393940000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#39564#39033#30446)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 34.015770000000000000
          Top = 425.086890000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22806#35266)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 22.677180000000000000
          Top = 709.551640000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #39564#35777#21253#35013#26631#35782)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 22.677180000000000000
          Top = 748.346940000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #32467#35770)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 22.677180000000000000
          Top = 777.583180000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 34.236240000000000000
          Top = 860.732840000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#21592)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 26.456710000000000000
          Top = 898.528140000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26816#26597#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line17: TfrxLineView
          Left = 98.267780000000000000
          Top = 849.614720000000000000
          Height = 73.700792280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 415.748300000000000000
          Top = 850.614720000000000000
          Height = 73.700792280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 340.157700000000000000
          Top = 849.835190000000000000
          Height = 73.700792280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo19: TfrxMemoView
          Left = 355.275820000000000000
          Top = 861.173780000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#20154)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 347.716760000000000000
          Top = 898.969080000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23457#26680#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 272.126160000000000000
          Top = 112.826840000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35268#26684#22411#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 518.016080000000000000
          Top = 112.826840000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25253#21578#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 518.016080000000000000
          Top = 172.299320000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 272.126160000000000000
          Top = 217.653680000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25277#26816#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 102.047310000000000000
          Top = 255.567100000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 241.889920000000000000
          Top = 255.567100000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21253#35013#21512#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 370.393940000000000000
          Top = 255.567100000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#20986#36135#25253#21578)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 525.354670000000000000
          Top = 255.567100000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35746#21333#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 272.126160000000000000
          Top = 289.464750000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25910#36135#26102#38388)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line30: TfrxLineView
          Left = 264.567100000000000000
          Top = 281.905690000000000000
          Height = 73.700792280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 340.157700000000000000
          Top = 282.126160000000000000
          Height = 413.858265280000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          Left = 270.346630000000000000
          Top = 331.039580000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'RoHS'#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 173.858380000000000000
          Top = 365.055350000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26631#20934#35201#27714)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 442.205010000000000000
          Top = 365.055350000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #23454#27979#25968#25454)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 616.063390000000000000
          Top = 361.496290000000000000
          Width = 64.252010000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21028#23450'  ACC/REJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line32: TfrxLineView
          Left = 589.606680000000000000
          Top = 357.496290000000000000
          Height = 338.267716540000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo39: TfrxMemoView
          Left = 158.740260000000000000
          Top = 709.992580000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #31526#21512)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Left = 238.110390000000000000
          Top = 709.992580000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #19981#31526#21512)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 109.606370000000000000
          Top = 747.787880000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25509#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 192.756030000000000000
          Top = 747.787880000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #35753#27493#25509#25910)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 298.582870000000000000
          Top = 747.787880000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25361#36873)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 102.047310000000000000
          Top = 93.929190000000000000
          Width = 158.740260000000000000
          Height = 52.913420000000000000
          DataField = #20379#24212#21830#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#20379#24212#21830#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset391: TfrxMemoView
          Left = 341.937230000000000000
          Top = 132.944960000000000000
          Width = 166.299320000000000000
          Height = 15.118120000000000000
          DataField = #22411#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#22411#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 102.047310000000000000
          Top = 152.401670000000000000
          Width = 158.740260000000000000
          Height = 52.913420000000000000
          DataField = #29289#26009#21517#31216
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#29289#26009#21517#31216'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 113.385900000000000000
          Top = 217.653680000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataField = #26469#26009#25968#37327
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#26469#26009#25968#37327'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3913: TfrxMemoView
          Left = 207.874150000000000000
          Top = 217.653680000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #21333#20301
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#21333#20301'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3914: TfrxMemoView
          Left = 464.882190000000000000
          Top = 217.653680000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = #21333#20301
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#21333#20301'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 597.165740000000000000
          Top = 172.299320000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          DisplayFormat.FormatStr = 'YYYY-MM-DD'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 593.386210000000000000
          Top = 112.826840000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = #25253#21578#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25253#21578#32534#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset3915: TfrxMemoView
          Left = 117.165430000000000000
          Top = 289.464750000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = #30003#35831#20154
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#20154'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 404.409710000000000000
          Top = 293.244280000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #30003#35831#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#30003#35831#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS: TfrxMemoView
          Left = 102.047310000000000000
          Top = 331.039580000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'SGS'#27979#35797#26085#26399
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#27979#35797#26085#26399'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frxDBDataset391SGS1: TfrxMemoView
          Left = 343.937230000000000000
          Top = 323.480520000000000000
          Width = 351.496290000000000000
          Height = 30.236240000000000000
          DataField = 'SGS'#32534#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."SGS'#32534#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape5: TfrxShapeView
          Left = 136.063080000000000000
          Top = 709.992580000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape6: TfrxShapeView
          Left = 215.433210000000000000
          Top = 709.992580000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape7: TfrxShapeView
          Left = 86.929190000000000000
          Top = 747.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape8: TfrxShapeView
          Left = 170.078850000000000000
          Top = 747.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape9: TfrxShapeView
          Left = 275.905690000000000000
          Top = 747.787880000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Line8: TfrxLineView
          Left = 18.897650000000000000
          Top = 583.827150000000000000
          Width = 680.315400000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDataset3912: TfrxMemoView
          Left = 340.157700000000000000
          Top = 92.488250000000000000
          Width = 166.299320000000000000
          Height = 37.795300000000000000
          DataField = #35268#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35268#26684'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3911: TfrxMemoView
          Left = 341.937230000000000000
          Top = 152.960730000000000000
          Width = 166.299320000000000000
          Height = 49.133890000000000000
          DataField = #25209#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#25209#21495'"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 275.905690000000000000
          Top = 168.078850000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #25209#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 518.016080000000000000
          Top = 217.212740000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #39564#25910#27700#24179)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 600.945270000000000000
          Top = 217.212740000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '0  '#25910'  1  '#36864)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset3916: TfrxMemoView
          Left = 589.606680000000000000
          Top = 255.008040000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #35746#21333#21495
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset391."'#35746#21333#21495'"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 102.047310000000000000
          Top = 398.630180000000000000
          Width = 230.551330000000000000
          Height = 64.252010000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #19981#20801#35768#26377#26029#12289#23849#20992#20995#12289#22278#35282#12289#37325#21472#12289#22823#23567#36793#12289#20998#31163#12289#20559#22823#35282#12289#20559#23567#35282#31561#29616#35937#65292#22871#29615#39068#33394#26159#21542#27491#24120)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 30.236240000000000000
          Top = 481.779840000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #24635#38271#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 34.015770000000000000
          Top = 519.575140000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26564#30452#24452)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo50: TfrxMemoView
          Left = 34.015770000000000000
          Top = 557.370440000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #30452#24452)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 30.236240000000000000
          Top = 591.386210000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20995#38271#24230)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 302.362400000000000000
          Top = 481.779840000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 302.362400000000000000
          Top = 519.575140000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 302.362400000000000000
          Top = 555.590910000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 302.362400000000000000
          Top = 595.165740000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'mm')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape2: TfrxShapeView
          Left = 170.078850000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape3: TfrxShapeView
          Left = 309.921460000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape4: TfrxShapeView
          Left = 453.543600000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 170.078850000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #25968#37327#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 309.921460000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #21253#35013#26159#21542#21512#26684
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 453.543600000000000000
          Top = 255.008040000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          Checked = False
          CheckStyle = csCheck
          DataField = #26159#21542#26377#20986#36135#25253#21578
          DataSet = frxdbdtst391
          DataSetName = 'frxDBDataset391'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 1005.354980000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #21463#25511'No.:QC03001-005')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 563.149970000000000000
          Top = 24.456710000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #20445#23384#26399#38480#65306#19968#20010#26085#21382#24180)
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end

object Form_TotalPrint: TForm_TotalPrint
  Left = 38
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#20851#27719#24635#25171#21360#26597#35810
  ClientHeight = 498
  ClientWidth = 1124
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1124
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 20
      Top = 12
      Width = 86
      Height = 13
      Caption = #25253#20851#26085#26399'  '#20174':'
    end
    object Label3: TLabel
      Left = 207
      Top = 12
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Label1: TLabel
      Left = 358
      Top = 11
      Width = 65
      Height = 13
      Caption = #27719#24635#26041#24335#65306
    end
    object Label2: TLabel
      Left = 510
      Top = 11
      Width = 65
      Height = 13
      Caption = #25253#20851#26041#24335#65306
    end
    object Button1: TButton
      Left = 657
      Top = 5
      Width = 63
      Height = 24
      Caption = #27719#24635#26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object dtpk1: TDateTimePicker
      Left = 107
      Top = 8
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
    end
    object dtpk2: TDateTimePicker
      Left = 229
      Top = 8
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 417
      Top = 7
      Width = 84
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #20840#37096
      OnClick = ComboBox1Click
      Items.Strings = (
        #20840#37096
        #32654#20803
        #28207#24065
        #27431#20803
        #26085#20803
        #20154#27665#24065)
    end
    object ComboBox2: TComboBox
      Left = 569
      Top = 7
      Width = 84
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #20840#37096
      OnClick = ComboBox1Click
      Items.Strings = (
        #20840#37096
        #30452#25509#20986#28207
        'DHL'
        #32852#37030
        #22269#20869#36716#21378
        #20837#29289#27969#22253
        #20986#28207#36208#24555#36882)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 457
    Width = 1124
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 696
      Top = 10
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 283
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360#35013#31665#21333
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 391
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360#21457#31080
      Enabled = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 490
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360#21512#21516
      Enabled = False
      TabOrder = 3
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 597
      Top = 10
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      Enabled = False
      TabOrder = 4
      OnClick = Button7Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 1124
    Height = 421
    Hint = #21452#20987#21024#38500#19968#26465#35760#24405
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = #24207#21495
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_code'
        Title.Caption = #23458#25143#20195#30721
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Title.Caption = #23458#25143#31616#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'orig_customer'
        Title.Caption = #20851#32852#21407#23458#25143
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21697#21517
        Width = 119
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#25253#20851#22411#21495
        Width = 127
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#22411#21495
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_5'
        Title.Caption = #21333#21482#23610#23544
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#20928#37325
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#20215
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#20540
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#27611#37325
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#31665#25968
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FLIGHT_NO'
        Title.Caption = #25253#20851#26041#24335
        Width = 90
        Visible = True
      end>
  end
  object DB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 373
    Top = 211
    object DB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
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
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\TotalPack529.rtm'
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
    Left = 405
    Top = 179
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'DB64'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 72761
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label4'
        Caption = #20080#26041': '#20116#26666#31185#25216'('#39321#28207')'#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 36513
        mmWidth = 56092
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        Caption = #22320#22336': '#39321#28207#20061#40857#35266#22616#25104#19994#34903'7'#21495#23425#26187#20013#24515'15'#27004'E'#23460
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 43392
        mmWidth = 88371
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label6'
        Caption = 'TEL: 00852-29470802'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 2381
        mmTop = 50006
        mmWidth = 42069
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label7'
        Caption = 'FAX: 00852-29470806'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 46567
        mmTop = 50006
        mmWidth = 42598
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label8'
        Caption = #20986#21475#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 142082
        mmTop = 36513
        mmWidth = 18119
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label9'
        Caption = #21253#35013#31867#22411': '#32440#31665
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 142082
        mmTop = 43392
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label11'
        Caption = #21407#20135#22269':  '#20013#22269
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 142082
        mmTop = 50271
        mmWidth = 24606
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentWidth = True
        mmHeight = 10319
        mmLeft = 0
        mmTop = 62442
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label12'
        Caption = #24207#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 2381
        mmTop = 65088
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label13'
        Caption = #36135#21697#21517#31216'/'#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 22490
        mmTop = 65088
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label14'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 70644
        mmTop = 63500
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #20928#37325
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 63500
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label18'
        Caption = #27611#37325
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 63500
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label20'
        Caption = #20214#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 183092
        mmTop = 65088
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label19'
        Caption = '(KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 164042
        mmTop = 67998
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label17'
        Caption = '(KG)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 143669
        mmTop = 67998
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label15'
        Caption = '(PCS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 69586
        mmTop = 67998
        mmWidth = 9525
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 12171
        mmTop = 62442
        mmWidth = 12965
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 64294
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 138377
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 157427
        mmTop = 62442
        mmWidth = 1058
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 178594
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label1'
        Caption = 'TEL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 80698
        mmTop = 19315
        mmWidth = 8932
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label3'
        Caption = #35013#31665#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6519
        mmLeft = 90049
        mmTop = 25400
        mmWidth = 17018
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = DB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'DB493'
        mmHeight = 19050
        mmLeft = 3175
        mmTop = 2381
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText9'
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
        mmLeft = 71173
        mmTop = 3175
        mmWidth = 55033
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'ship_address'
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
        mmTop = 12965
        mmWidth = 25135
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'SITE_INFO_PHONE'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4868
        mmLeft = 90752
        mmTop = 19315
        mmWidth = 39243
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 119327
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 84138
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 101071
        mmTop = 62442
        mmWidth = 529
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 88636
        mmTop = 65088
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label10'
        Caption = #24635#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 106098
        mmTop = 65088
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label21'
        Caption = #24037#20855#36153#29992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 120386
        mmTop = 65088
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label25'
        Caption = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 160867
        mmTop = 36513
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label26'
        Caption = #36135#24065':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 2381
        mmTop = 56356
        mmWidth = 9652
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label27'
        Caption = 'Label27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 12700
        mmTop = 56356
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 12171
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 64294
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 138377
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 157427
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 178594
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #24635#25968#37327
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 3979
        mmLeft = 65617
        mmTop = 3440
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #24635#20928#37325
        DataPipeline = DB64
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 4064
        mmLeft = 140229
        mmTop = 3440
        mmWidth = 10668
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #24635#27611#37325
        DataPipeline = DB64
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 4064
        mmLeft = 161925
        mmTop = 3440
        mmWidth = 10668
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #24635#31665#25968
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 4064
        mmLeft = 180975
        mmTop = 3440
        mmWidth = 10668
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 0
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label22'
        Caption = #21360#21047#30005#36335#26495'/'#31354#30333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 1058
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'LAYERS'
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 1058
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label23'
        Caption = #23618
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 49477
        mmTop = 1058
        mmWidth = 3556
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 3683
        mmLeft = 14817
        mmTop = 5556
        mmWidth = 30141
        BandType = 4
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'DB64'
        mmHeight = 4022
        mmLeft = 1852
        mmTop = 3440
        mmWidth = 13081
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 84138
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 101071
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 119327
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #21333#20215
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 4022
        mmLeft = 85461
        mmTop = 3440
        mmWidth = 7112
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #24635#20540
        DataPipeline = DB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 4022
        mmLeft = 102394
        mmTop = 3440
        mmWidth = 7112
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #24635#24037#20855#36153#29992
        DataPipeline = DB64
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB64'
        mmHeight = 3979
        mmLeft = 120650
        mmTop = 3440
        mmWidth = 17738
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 10054
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = #20998#32452
      DataPipeline = DB64
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DB64'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLine12: TppLine
          UserName = 'Line11'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 64294
          mmTop = 0
          mmWidth = 265
          BandType = 5
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line12'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 138377
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine14: TppLine
          UserName = 'Line13'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 157427
          mmTop = 0
          mmWidth = 794
          BandType = 5
          GroupNo = 0
        end
        object ppLine15: TppLine
          UserName = 'Line14'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 178594
          mmTop = 0
          mmWidth = 265
          BandType = 5
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label24'
          Caption = #21512#35745':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 53181
          mmTop = 1323
          mmWidth = 9790
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = #24635#25968#37327
          DataPipeline = DB64
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 65352
          mmTop = 1323
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = #24635#20928#37325
          DataPipeline = DB64
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 140229
          mmTop = 1492
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = #24635#27611#37325
          DataPipeline = DB64
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 161925
          mmTop = 1492
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc5'
          AutoSize = True
          DataField = #24635#31665#25968
          DataPipeline = DB64
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 181240
          mmTop = 1492
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'Line25'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 119327
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppLine26: TppLine
          UserName = 'Line26'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 101071
          mmTop = 0
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc6'
          AutoSize = True
          DataField = #24635#20540
          DataPipeline = DB64
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 101865
          mmTop = 1323
          mmWidth = 16764
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc7'
          AutoSize = True
          DataField = #24635#24037#20855#36153#29992
          DataPipeline = DB64
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          DataPipelineName = 'DB64'
          mmHeight = 4022
          mmLeft = 120386
          mmTop = 1323
          mmWidth = 27432
          BandType = 5
          GroupNo = 0
        end
        object ppLine27: TppLine
          UserName = 'Line27'
          ParentHeight = True
          ParentWidth = True
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 6350
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
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
    Left = 403
    Top = 211
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 315
    Top = 209
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
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 345
    Top = 211
  end
  object DB64: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB64'
    Left = 375
    Top = 181
    object DB64ppField1: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB64ppField2: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB64ppField3: TppField
      FieldAlias = 'layers'
      FieldName = 'layers'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB64ppField4: TppField
      FieldAlias = 'ANALYSIS_CODE_5'
      FieldName = 'ANALYSIS_CODE_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB64ppField6: TppField
      FieldAlias = #24635#20928#37325
      FieldName = #24635#20928#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB64ppField8: TppField
      FieldAlias = #24635#20540
      FieldName = #24635#20540
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB64ppField7: TppField
      FieldAlias = #24635#27611#37325
      FieldName = #24635#27611#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB64ppField9: TppField
      FieldAlias = #24635#25968#37327
      FieldName = #24635#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB64ppField10: TppField
      FieldAlias = #24635#31665#25968
      FieldName = #24635#31665#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB64ppField11: TppField
      FieldAlias = 'curr_code'
      FieldName = 'curr_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB64ppField12: TppField
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB64ppField13: TppField
      FieldAlias = #20998#32452
      FieldName = #20998#32452
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB64ppField14: TppField
      FieldAlias = #21333#20215
      FieldName = #21333#20215
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ABBR_Name: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object DB64ppField15: TppField
      FieldAlias = 'FLIGHT_NO'
      FieldName = 'FLIGHT_NO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object orig_customer: TppField
      FieldAlias = 'orig_customer'
      FieldName = 'orig_customer'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object DB64ppField18: TppField
      FieldAlias = #24635#24037#20855#36153#29992
      FieldName = #24635#24037#20855#36153#29992
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object DB64ppField5: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'str1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str3'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str4'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT '
      
        'distinct data0530.remark1 as MANU_PART_DESC,data0025.layers,Data' +
        '0010.ABBR_NAME,Data0010.cust_code,isnull(data0529.orig_customer,' +
        #39#39') as orig_customer,data0025.manu_part_desc as '#23458#25143#22411#21495','
      
        'isnull(Data0529.FLIGHT_NO,'#39#39') as FLIGHT_NO,Data0060.CUSTOMER_PTR' +
        ','
      
        'isnull(Data0025.ANALYSIS_CODE_5,'#39#39') as ANALYSIS_CODE_5 ,data0001' +
        '.curr_code,data0001.exch_rate,Data0529.empl_ptr,Data0005.employe' +
        'e_name'
      'FROM Data0530 Inner  JOIN '
      '      Data0064 ON Data0530.rkey64_ptr=Data0064.rkey  INNER JOIN'
      '      Data0529 ON Data0530.rkey529_ptr=Data0529.rkey inner join'
      '      Data0060 ON Data0064.SO_PTR=Data0060.rkey inner join'
      
        '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY inner j' +
        'oin '
      
        '      Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY inner jo' +
        'in'
      
        '      Data0010 ON Data0060.CUSTOMER_PTR=Data0010.rkey  inner joi' +
        'n '
      '      Data0005 ON Data0529.empl_ptr=Data0005.rkey'
      'WHERE '
      '       (Data0529.DEPA_DATE>=:dtpk1)'
      '      AND (Data0529.DEPA_DATE <=:dtpk2)'
      '      AND (data0529.final_ptr is not null)'
      '     AND (Data0529.audit_ptr is not null)'
      '      AND (Data0001.curr_code<>:str1)'
      '      AND (Data0001.curr_code<>:str2)'
      '      AND (Data0001.curr_code<>:str3)'
      '      AND (Data0001.curr_code<>:str4)'
      'order by data0025.layers,data0530.remark1'
      '')
    Left = 313
    Top = 181
    object ADOQuery1IntegerField3: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24207#21495
      Calculated = True
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 50
    end
    object ADOQuery1layers: TWordField
      FieldName = 'layers'
    end
    object ADOQuery1ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object ADOQuery1FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20928#37325
      Calculated = True
    end
    object ADOQuery1FloatField2: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#27611#37325
      Calculated = True
    end
    object ADOQuery1FloatField3: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20540
      Calculated = True
    end
    object ADOQuery1IntegerField: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24635#25968#37327
      Calculated = True
    end
    object ADOQuery1IntegerField2: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24635#31665#25968
      Calculated = True
    end
    object ADOQuery1curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQuery1exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object ADOQuery1IntegerField4: TIntegerField
      FieldKind = fkCalculated
      FieldName = #20998#32452
      Calculated = True
    end
    object ADOQuery1StringField: TStringField
      FieldKind = fkCalculated
      FieldName = #21697#21517
      Calculated = True
    end
    object ADOQuery1FloatField4: TFloatField
      FieldKind = fkCalculated
      FieldName = #21333#20215
      Calculated = True
    end
    object ADOQuery1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOQuery1CurrencyField: TCurrencyField
      FieldKind = fkCalculated
      FieldName = #24635#24037#20855#36153#29992
      Calculated = True
    end
    object ADOQuery1CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQuery1FLIGHT_NO: TStringField
      FieldName = 'FLIGHT_NO'
      ReadOnly = True
    end
    object ADOQuery1orig_customer: TStringField
      FieldName = 'orig_customer'
      ReadOnly = True
      Size = 30
    end
    object ADOQuery1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOQuery1empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADOQuery1DSDesigner: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 80
    end
    object ADOQuery1cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 344
    Top = 182
  end
  object ADO530: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'str1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
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
        Name = 'str2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'FLIGHT_NO'
        Attributes = [paNullable]
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
        Size = 30
        Value = Null
      end
      item
        Name = 'rkey05'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT'
      
        '      round(sum(Data0530.quan_declare*data0064.REPORT_UNIT_VALUE' +
        '1*0.001),2) as '#39#20928#37325'1'#39','
      '      round(sum(Data0530.nweight),2) as  '#39#20928#37325#39','
      '      round(sum(Data0530.WEIGHT),2) as '#39#27611#37325#39','
      
        '      sum(data0530.quan_declare) as '#39#25968#37327#39', sum(Data0530.CARTONS_N' +
        'O) as '#39#31665#25968#39','
      
        '      sum(data0530.cust_decl+isnull(data0530.total_amount,0)) as' +
        ' '#39#24635#20540#39','
      '      sum(isnull(data0530.total_amount,0)) as '#39#24037#20855#36153#29992#39
      'FROM Data0530 INNER JOIN '
      '      Data0064 ON Data0530.rkey64_ptr=Data0064.rkey  INNER JOIN'
      '      Data0529 ON Data0530.rkey529_ptr=Data0529.rkey INNER JOIN '
      '      Data0060 ON Data0064.SO_PTR=Data0060.rkey INNER JOIN'
      '      Data0010 ON Data0010.rkey=data0060.CUSTOMER_PTR INNER JOIN'
      '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY '
      'WHERE '
      '       (Data0529.DEPA_DATE >=:dtpk1)'
      '      and (Data0529.DEPA_DATE <=:dtpk2)'
      '      and (data0529.final_ptr is not null)'
      '      AND (Data0529.audit_ptr is not null)'
      '      and (Data0530.remark1=:str1)'
      '      and (Data0025.layers=:layers)'
      '      and (Data0025.ANALYSIS_CODE_5=:str2)'
      '      and (Data0060.CUSTOMER_PTR=:rkey10)'
      '      and (Data0529.flight_no=:FLIGHT_NO)'
      '      and (Data0529.orig_customer=:str3)'
      '      and (Data0529.empl_ptr=:rkey05)'
      ''
      '  ')
    Left = 315
    Top = 240
    object ADO530DSDesigner: TBCDField
      FieldName = #20928#37325
      ReadOnly = True
      Precision = 32
      Size = 7
    end
    object ADO530DSDesigner2: TIntegerField
      FieldName = #31665#25968
      ReadOnly = True
    end
    object ADO530DSDesigner3: TBCDField
      FieldName = #27611#37325
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADO530DSDesigner4: TIntegerField
      FieldName = #25968#37327
      ReadOnly = True
    end
    object ADO530DSDesigner5: TFloatField
      FieldName = #24635#20540
      ReadOnly = True
    end
    object ADO530DSDesigner1: TBCDField
      FieldName = #20928#37325'1'
      ReadOnly = True
      Precision = 32
      Size = 7
    end
    object ADO530DSDesigner6: TBCDField
      FieldName = #24037#20855#36153#29992
      ReadOnly = True
      Precision = 32
      Size = 3
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 328
    object N1: TMenuItem
      Caption = #28145#22323#20116#26666#31185#25216
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #26757#24030#24535#28009#31185#25216
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 336
    Top = 432
    object N3: TMenuItem
      Caption = #35013#31665#21333'('#22806#37096#25253#20851#20449#24687')'
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #35013#31665#21333'('#20869#37096#32852#32476#20449#24687')'
      OnClick = N4Click
    end
  end
  object ADOQuery2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'select Top 1 D05_1.employee_name as '#39#36130#21153#23457#26680#20154#39',D05_2.employee_name ' +
        'as '#39#25253#20851#23457#26680#20154#39' ,'
      'D05_3.employee_name as '#39#20179#31649#21592#39',D05_4.employee_name as '#39#36319#21333#21592#39
      'from data0529 inner join '
      'Data0530 ON Data0530.rkey529_ptr=Data0529.rkey inner join'
      'Data0064 ON Data0530.rkey64_ptr=Data0064.rkey  INNER JOIN'
      'data0005 D05_1 on data0529.audit_ptr=D05_1.rkey inner join '
      'data0005 D05_2 on data0529.final_ptr=D05_2.rkey inner join'
      'data0005 D05_3 on data0064.ENT_EMPL_PTR=D05_3.rkey inner join'
      'data0005 D05_4 on data0529.empl_ptr=D05_4.rkey'
      'where '
      '(Data0529.DEPA_DATE>=:dtpk1)'
      'AND (Data0529.DEPA_DATE <=:dtpk2)'
      'AND (Data0529.audit_ptr is not null)'
      'AND (data0529.final_ptr is not null)')
    Left = 312
    Top = 136
    object ADOQuery2DSDesigner: TStringField
      FieldName = #36130#21153#23457#26680#20154
      Size = 16
    end
    object ADOQuery2DSDesigner2: TStringField
      FieldName = #25253#20851#23457#26680#20154
      Size = 16
    end
    object ADOQuery2DSDesigner3: TStringField
      FieldName = #20179#31649#21592
      Size = 16
    end
    object ADOQuery2DSDesigner4: TStringField
      FieldName = #36319#21333#21592
      Size = 16
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 344
    Top = 136
  end
  object DB05: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB05'
    Left = 376
    Top = 136
    object DBPP1ppField1: TppField
      FieldAlias = #36130#21153#23457#26680#20154
      FieldName = #36130#21153#23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBPP1ppField2: TppField
      FieldAlias = #25253#20851#23457#26680#20154
      FieldName = #25253#20851#23457#26680#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBPP1ppField3: TppField
      FieldAlias = #20179#31649#21592
      FieldName = #20179#31649#21592
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object DBPP1ppField4: TppField
      FieldAlias = #36319#21333#21592
      FieldName = #36319#21333#21592
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
  end
end

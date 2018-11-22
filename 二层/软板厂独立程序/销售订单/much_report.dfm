object Form13: TForm13
  Left = 353
  Top = 242
  Width = 722
  Height = 480
  Caption = #38144#21806#35746#21333#22810#35760#24405#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 714
    Height = 356
    Hint = #21452#20987#21024#38500#19968#26465#35760#24405
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #19994#21153#21592#22995#21517
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#20195#30721
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = #38144#21806#35746#21333
        Width = 82
        Visible = True
      end
      item
        Expanded = False
        FieldName = #26412#21378#32534#21495
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#22411#21495
        Width = 124
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#29289#26009#21495
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rohs'
        Visible = True
      end
      item
        Expanded = False
        FieldName = #23458#25143#35746#21333#21495
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35780#23457#26631#35760
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35745#21010#20132#26399
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = #22238#22797#20132#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = #20135#21697#31867#22411
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#21333#25968#37327
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#21333#20215#26684
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #21333#21482#38754#31215
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#21333#38754#31215
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24037#20855#36153#29992
        Visible = True
      end
      item
        Expanded = False
        FieldName = #35746#21333#21442#32771
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = #36135#24065#21517#31216
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = #27719#29575
        Width = 36
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 714
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label1: TLabel
      Left = 186
      Top = 6
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#35746#21333#32534#21495
    end
    object Label2: TLabel
      Left = 186
      Top = 33
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #32467#26463#35746#21333#32534#21495
    end
    object Label4: TLabel
      Left = 6
      Top = 7
      Width = 72
      Height = 13
      Caption = #36755#20837#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 58
      Top = 33
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object lblso_tp: TLabel
      Left = 408
      Top = 6
      Width = 59
      Height = 13
      Caption = #21152#24037#24418#24335':'
    end
    object lblttype: TLabel
      Left = 408
      Top = 33
      Width = 59
      Height = 13
      Caption = #20135#21697#23646#24615':'
    end
    object rdgttype: TRadioGroup
      Left = 468
      Top = 23
      Width = 187
      Height = 32
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        #37327#20135
        #26679#26495
        #20840#37096)
      TabOrder = 6
    end
    object Edit1: TEdit
      Left = 272
      Top = 2
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 272
      Top = 29
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 1
      OnKeyDown = Edit2KeyDown
    end
    object Button1: TButton
      Left = 660
      Top = 29
      Width = 51
      Height = 24
      Caption = #26597#35810
      TabOrder = 2
      OnClick = Button1Click
    end
    object dtpk1: TDateTimePicker
      Left = 79
      Top = 2
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 3
    end
    object dtpk2: TDateTimePicker
      Left = 79
      Top = 30
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
    end
    object rdgso_tp: TRadioGroup
      Left = 468
      Top = -5
      Width = 246
      Height = 32
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243
        #20840#37096)
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 714
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button2: TButton
      Left = 346
      Top = 11
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 268
      Top = 11
      Width = 75
      Height = 25
      Caption = #25171#21360
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 112
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'so_tp'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'so_tp'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ttype'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'ttype'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'SO1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end
      item
        Name = 'SO1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end
      item
        Name = 'SO2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end
      item
        Name = 'SO2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0005.EMPLOYEE_NAME as '#19994#21153#21592#22995#21517 +
        ','
      
        ' dbo.Data0010.CUST_CODE as '#23458#25143#20195#30721', dbo.Data0060.SALES_ORDER as '#38144#21806#35746 +
        #21333','
      ' dbo.Data0060.ORIG_SCHED_SHIP_DATE as '#35745#21010#20132#26399', '
      
        ' dbo.Data0060.PARTS_ORDERED as '#35746#21333#25968#37327', dbo.Data0060.REFERENCE_NUMB' +
        'ER as '#35746#21333#21442#32771', '
      
        'dbo.Data0060.PART_PRICE as '#35746#21333#20215#26684', dbo.Data0060.TOTAL_ADD_L_PRICE ' +
        'as '#24037#20855#36153#29992', '
      
        '                      dbo.Data0060.EXCH_RATE as '#27719#29575', dbo.Data0001' +
        '.CURR_NAME as '#36135#24065#21517#31216','
      
        ' dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS '#35746#21333#38754#31215', dbo.' +
        'Data0008.PRODUCT_NAME as '#20135#21697#31867#22411', '
      
        '          case    dbo.Data0060.QUOTE_PRICE when 0 then '#39#26410#35780#23457#39' whe' +
        'n 1 then '#39#24050#35780#23457#39
      '           when 2 then '#39#34987#36864#22238#39' when 3 then '#39#19981#35780#23457#39' end as  '#35780#23457#26631#35760','
      'dbo.Data0060.FOB as '#21512#21516#21495', dbo.Data0097.PO_NUMBER as '#23458#25143#35746#21333#21495', '
      'dbo.Data0060.SCH_DATE as '#22238#22797#20132#26399', dbo.Data0060.so_oldnew as '#35746#21333#26032#26087', '
      '                      dbo.Data0025.MANU_PART_NUMBER as '#26412#21378#32534#21495','
      ' dbo.Data0025.MANU_PART_DESC as '#23458#25143#22411#21495', '
      
        'dbo.Data0025.ANALYSIS_CODE_2 as '#23458#25143#29289#26009#21495', dbo.Data0025.ANALYSIS_COD' +
        'E_3 as '#22823#26009#35268#26684',  '
      '                      dbo.Data0025.ANALYSIS_CODE_1 as '#20132#36135#23610#23544','
      
        ' dbo.Data0025.unit_sq as '#21333#21482#38754#31215', CASE data0025.green_flag WHEN '#39'Y'#39 +
        ' THEN '#39'ROHS'#39' WHEN '#39'N'#39' THEN '#39#38750'ROHS'#39' END AS rohs, '
      
        '                      dbo.Data0060.ENT_DATE as '#19979#21333#26085#26399', dbo.Data002' +
        '5.SAMPLE_NR as '#25104#22411#22791#27880', dbo.Data0025.set_qty as '#20132#36135#21333#20803#25968
      'FROM         dbo.Data0097 INNER JOIN'
      '                      dbo.Data0005 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0005.RKEY = dbo.Da' +
        'ta0010.SALES_REP_PTR INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0010.RKEY = dbo.Da' +
        'ta0060.CUSTOMER_PTR INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY ON '
      
        '                      dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_' +
        'ORDER_PTR INNER JOIN'
      '                      dbo.Data0025 INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY ON dbo.Data0060.CUST_PART_PTR = dbo.Data002' +
        '5.RKEY'
      'WHERE (( :so_tp = 3) or (Data0060.so_tp = :so_tp))'
      '      AND (( :ttype = 2) or (Data0025.ttype = :ttype))'
      '      AND (( :SO1 ='#39#39') or (Data0060.SALES_ORDER >=:SO1))'
      '      AND (( :SO2 ='#39#39') or (Data0060.SALES_ORDER <=:SO2))'
      '      AND (Data0060.ent_date >=:dtpk1)'
      '      AND (Data0060.ent_date <=:dtpk2)'
      'ORDER BY dbo.Data0060.SALES_ORDER')
    Left = 376
    Top = 112
    object ADOQuery1DSDesigner: TStringField
      FieldName = #19994#21153#21592#22995#21517
    end
    object ADOQuery1DSDesigner2: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADOQuery1DSDesigner3: TStringField
      FieldName = #38144#21806#35746#21333
      FixedChar = True
      Size = 12
    end
    object ADOQuery1DSDesigner4: TDateTimeField
      FieldName = #35745#21010#20132#26399
    end
    object ADOQuery1DSDesigner5: TFloatField
      FieldName = #35746#21333#25968#37327
    end
    object ADOQuery1DSDesigner6: TStringField
      FieldName = #35746#21333#21442#32771
      Size = 30
    end
    object ADOQuery1DSDesigner7: TFloatField
      FieldName = #35746#21333#20215#26684
    end
    object ADOQuery1DSDesigner8: TFloatField
      FieldName = #24037#20855#36153#29992
    end
    object ADOQuery1DSDesigner9: TFloatField
      FieldName = #27719#29575
    end
    object ADOQuery1DSDesigner10: TStringField
      FieldName = #36135#24065#21517#31216
    end
    object ADOQuery1DSDesigner11: TFloatField
      FieldName = #35746#21333#38754#31215
      ReadOnly = True
    end
    object ADOQuery1DSDesigner12: TStringField
      FieldName = #20135#21697#31867#22411
      Size = 30
    end
    object ADOQuery1DSDesigner13: TStringField
      FieldName = #35780#23457#26631#35760
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1DSDesigner14: TStringField
      FieldName = #21512#21516#21495
      Size = 50
    end
    object ADOQuery1DSDesigner15: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object ADOQuery1DSDesigner16: TDateTimeField
      FieldName = #22238#22797#20132#26399
    end
    object ADOQuery1DSDesigner17: TStringField
      FieldName = #35746#21333#26032#26087
      Size = 10
    end
    object ADOQuery1DSDesigner18: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADOQuery1DSDesigner19: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 80
    end
    object ADOQuery1DSDesigner20: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object ADOQuery1DSDesigner21: TStringField
      FieldName = #22823#26009#35268#26684
      Size = 50
    end
    object ADOQuery1DSDesigner22: TStringField
      FieldName = #20132#36135#23610#23544
      Size = 30
    end
    object ADOQuery1DSDesigner23: TFloatField
      FieldName = #21333#21482#38754#31215
    end
    object ADOQuery1rohs: TStringField
      FieldName = 'rohs'
      ReadOnly = True
      Size = 6
    end
    object ADOQuery1DSDesigner24: TDateTimeField
      FieldName = #19979#21333#26085#26399
    end
    object ADOQuery1DSDesigner25: TStringField
      FieldName = #25104#22411#22791#27880
      Size = 30
    end
    object ADOQuery1DSDesigner26: TIntegerField
      FieldName = #20132#36135#21333#20803#25968
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB60
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\SJSYS\NIERP\REPORT\much_Asoreport.rtm'
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
    Left = 482
    Top = 113
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB60'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7938
        mmLeft = 100542
        mmTop = 3440
        mmWidth = 92604
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #29983#20135#36890#30693#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4798
        mmLeft = 135732
        mmTop = 14552
        mmWidth = 21167
        BandType = 1
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
        mmLeft = 62971
        mmTop = 3969
        mmWidth = 29633
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
        ParentHeight = True
        mmHeight = 9790
        mmLeft = 7938
        mmTop = 0
        mmWidth = 268817
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #19994#21153#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 12171
        mmTop = 2117
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35746#21333#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 56356
        mmTop = 529
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 85196
        mmTop = 2117
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 120386
        mmTop = 265
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20132#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 181769
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 200819
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #38754#31215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 216165
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #35780#23457#32467#26524
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 228336
        mmTop = 2117
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 254794
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 27781
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 84138
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 108479
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 173832
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 196586
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 212725
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 226484
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 243946
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #26495#26009
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 5292
        mmWidth = 7144
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 148432
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #29615#20445#26631#35782
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 8128
        mmLeft = 165100
        mmTop = 1058
        mmWidth = 7112
        BandType = 0
      end
      object ppLine42: TppLine
        UserName = 'Line42'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 161925
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = #35746#21333#13#10#26032#26087#13#10
        CharWrap = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #35746#21333
          #26032#26087)
        Transparent = True
        mmHeight = 7408
        mmLeft = 151871
        mmTop = 1058
        mmWidth = 7144
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #23458#25143#29289#26009#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 4763
        mmWidth = 17727
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 7673
        mmTop = 0
        mmWidth = 268817
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #38144#21806#35746#21333
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3683
        mmLeft = 43656
        mmTop = 794
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 29898
        mmTop = 2646
        mmWidth = 10837
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #19994#21153#21592#22995#21517
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4233
        mmLeft = 10054
        mmTop = 2646
        mmWidth = 16383
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #26412#21378#32534#21495
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3598
        mmLeft = 84931
        mmTop = 2646
        mmWidth = 34925
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3260
        mmLeft = 115076
        mmTop = 1058
        mmWidth = 26882
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #35745#21010#20132#26399
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3979
        mmLeft = 174630
        mmTop = 2646
        mmWidth = 21421
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #35746#21333#25968#37327
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3979
        mmLeft = 198168
        mmTop = 2646
        mmWidth = 13504
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #35746#21333#38754#31215
        DataPipeline = ppDB60
        DisplayFormat = '#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3979
        mmLeft = 213514
        mmTop = 2646
        mmWidth = 12446
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #35780#23457#26631#35760
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3979
        mmLeft = 227008
        mmTop = 2646
        mmWidth = 17738
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #35746#21333#21442#32771
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 246063
        mmTop = 529
        mmWidth = 28829
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 7673
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 27781
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 42863
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 84138
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 108479
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 173832
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 196586
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 212725
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 226484
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 243946
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 276226
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = #22823#26009#35268#26684
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 5821
        mmWidth = 40217
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 148432
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'rohs'
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3429
        mmLeft = 165365
        mmTop = 2910
        mmWidth = 7154
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #35746#21333#26032#26087
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4064
        mmLeft = 149220
        mmTop = 2646
        mmWidth = 12446
        BandType = 4
      end
      object ppLine43: TppLine
        UserName = 'Line43'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 161925
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 2921
        mmLeft = 116941
        mmTop = 6615
        mmWidth = 23029
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 31485
        mmLeft = 7673
        mmTop = 1323
        mmWidth = 268817
        BandType = 8
      end
      object ppLine24: TppLine
        UserName = 'Line12'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7673
        mmTop = 8996
        mmWidth = 268817
        BandType = 8
      end
      object ppLine25: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31221
        mmLeft = 78317
        mmTop = 1323
        mmWidth = 265
        BandType = 8
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31221
        mmLeft = 153459
        mmTop = 1323
        mmWidth = 265
        BandType = 8
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #24066#22330#37096#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 9966
        mmTop = 3440
        mmWidth = 17639
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #35780#23457#37096#38376#20250#31614
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 81227
        mmTop = 3440
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #24076#26395#35843#25972#20869#23481
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 3440
        mmWidth = 21167
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #21046#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13141
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #22797#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13229
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #23457#25209':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 13229
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine27: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 16140
        mmWidth = 17727
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 23548
        mmWidth = 17727
        BandType = 8
      end
      object ppLine29: TppLine
        UserName = 'Line29'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 24077
        mmTop = 30427
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 43921
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 16140
        mmWidth = 17727
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 23548
        mmWidth = 17727
        BandType = 8
      end
      object ppLine32: TppLine
        UserName = 'Line32'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 54769
        mmTop = 30427
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #24037#31243':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 85108
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #21697#36136':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 85372
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = #35745#21010':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116064
        mmTop = 11906
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #29983#20135':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116329
        mmTop = 19579
        mmWidth = 8819
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = #26680#20934':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 116593
        mmTop = 26458
        mmWidth = 8819
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'Line301'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 94456
        mmTop = 16404
        mmWidth = 17727
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'Line34'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 94456
        mmTop = 23813
        mmWidth = 17727
        BandType = 8
      end
      object ppLine36: TppLine
        UserName = 'Line36'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 16404
        mmWidth = 17727
        BandType = 8
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 23813
        mmWidth = 17727
        BandType = 8
      end
      object ppLine38: TppLine
        UserName = 'Line38'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 127000
        mmTop = 30692
        mmWidth = 17727
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #23458#25143#24847#35265':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4064
        mmLeft = 158422
        mmTop = 19579
        mmWidth = 16002
        BandType = 8
      end
      object ppLine35: TppLine
        UserName = 'Line25'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 175684
        mmTop = 23813
        mmWidth = 96838
        BandType = 8
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = #31614#21517'/'#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 26458
        mmWidth = 17639
        BandType = 8
      end
      object ppLine39: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 178065
        mmTop = 30692
        mmWidth = 31221
        BandType = 8
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #21463#25511'NO'#65306'IGS02001-003A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3725
        mmLeft = 235744
        mmTop = 34660
        mmWidth = 33782
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #38754#31215#21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 184680
        mmTop = 1588
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'mian_ji'
        DataPipeline = ppDB60
        DisplayFormat = '#,0.000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 204523
        mmTop = 1588
        mmWidth = 21336
        BandType = 7
      end
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 448
    Top = 73
    object ppDBPipeline2ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField8: TppField
      FieldAlias = 'Company_name2'
      FieldName = 'Company_name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline2ppField9: TppField
      FieldAlias = 'Company_name3'
      FieldName = 'Company_name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object DataSource2: TDataSource
    DataSet = dm.AQ0493
    Left = 416
    Top = 73
  end
  object ppDB60: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB60'
    Left = 448
    Top = 112
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
    Left = 480
    Top = 152
  end
end

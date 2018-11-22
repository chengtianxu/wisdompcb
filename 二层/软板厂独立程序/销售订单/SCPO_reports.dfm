object frmSCPOrpt: TfrmSCPOrpt
  Left = 353
  Top = 242
  Width = 813
  Height = 480
  Caption = #22806#21457#37319#36141#35746#21333#22810#35760#24405#25171#21360
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
    Top = 54
    Width = 805
    Height = 358
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
        Visible = False
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
        Visible = False
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = #35745#21010#20132#26399
        Visible = False
      end
      item
        Expanded = False
        FieldName = #22238#22797#20132#26399
        Visible = False
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = #21333#20215
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
        Visible = False
      end
      item
        Expanded = False
        FieldName = #36135#24065#21517#31216
        Visible = False
      end
      item
        Expanded = False
        FieldName = #27719#29575
        Visible = False
      end
      item
        Expanded = False
        FieldName = #22806#21457#20379#24212#21830#20195#30721
        Visible = False
      end
      item
        Expanded = False
        FieldName = #22806#21457#20379#24212#21830
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblso_tp: TLabel
      Left = 408
      Top = 32
      Width = 59
      Height = 13
      Caption = #21152#24037#24418#24335':'
      Visible = False
    end
    object Label1: TLabel
      Left = 197
      Top = 6
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#35746#21333#32534#21495
    end
    object Label2: TLabel
      Left = 197
      Top = 32
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = #32467#26463#35746#21333#32534#21495
    end
    object Label4: TLabel
      Left = 11
      Top = 7
      Width = 72
      Height = 13
      Caption = #36755#20837#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 63
      Top = 23
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object lblttype: TLabel
      Left = 408
      Top = 32
      Width = 59
      Height = 13
      Caption = #20135#21697#23646#24615':'
    end
    object Label5: TLabel
      Left = 615
      Top = 6
      Width = 72
      Height = 13
      Caption = #22806#21457#20379#24212#21830':'
    end
    object Label85: TLabel
      Left = 619
      Top = 30
      Width = 7
      Height = 13
    end
    object Label6: TLabel
      Left = 407
      Top = 6
      Width = 72
      Height = 13
      Caption = #23458#25143#35746#21333#21495':'
    end
    object rdgso_tp: TRadioGroup
      Left = 468
      Top = 22
      Width = 141
      Height = 32
      Columns = 4
      ItemIndex = 1
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243
        #20840#37096)
      TabOrder = 6
      Visible = False
    end
    object rdgttype: TRadioGroup
      Left = 468
      Top = 22
      Width = 142
      Height = 32
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        #37327#20135
        #26679#26495
        #20840#37096)
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 277
      Top = 2
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 0
      OnKeyDown = Edit1KeyDown
    end
    object Edit2: TEdit
      Left = 277
      Top = 28
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 1
      OnKeyDown = Edit2KeyDown
    end
    object Button1: TButton
      Left = 749
      Top = 28
      Width = 51
      Height = 24
      Caption = #26597#35810
      TabOrder = 2
      OnClick = Button1Click
    end
    object dtpk1: TDateTimePicker
      Left = 89
      Top = 2
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 3
    end
    object dtpk2: TDateTimePicker
      Left = 89
      Top = 28
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
    end
    object Edit11: TEdit
      Left = 688
      Top = 3
      Width = 83
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 7
      OnKeyDown = Edit11KeyDown
    end
    object BitBtn10: TBitBtn
      Left = 775
      Top = 1
      Width = 25
      Height = 25
      Hint = #26356#25913#36135#24065
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BitBtn10Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object Edit3: TEdit
      Left = 479
      Top = 2
      Width = 130
      Height = 21
      MaxLength = 12
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 805
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Button2: TButton
      Left = 426
      Top = 11
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 332
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
        Size = 12
        Value = Null
      end
      item
        Name = 'SO1'
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = 'SO2'
        DataType = ftString
        Size = 12
        Value = Null
      end
      item
        Name = 'SO2'
        DataType = ftString
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
      end
      item
        Name = 'code'
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = 'code'
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = 'PO_NUMBER'
        DataType = ftString
        Size = 25
        Value = Null
      end
      item
        Name = 'PO_NUMBER'
        DataType = ftString
        Size = 25
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
      
        'ROUND(dbo.Data0060.PARTS_ALLOC*(SELECT 0.01*isnull(FEDTAXRATE,0)' +
        ' FROM Data0192),6) AS '#21333#20215','
      
        ' dbo.Data0060.PARTS_ORDERED*ROUND(dbo.Data0060.PARTS_ALLOC*(SELE' +
        'CT 0.01*isnull(FEDTAXRATE,0) FROM Data0192),6) AS '#39#37329#39069#39','
      
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
        '5.SAMPLE_NR as '#25104#22411#22791#27880', dbo.Data0025.set_qty as '#20132#36135#21333#20803#25968','
      
        'dbo.Data0023.code as '#22806#21457#20379#24212#21830#20195#30721',dbo.Data0023.ABBR_NAME AS '#22806#21457#20379#24212#21830',dbo' +
        '.Data0023.SUPPLIER_NAME AS '#22806#21457#20379#24212#21830#20840#31216','
      
        'dbo.Data0023.billing_address_1 as '#35814#32454#22320#22336',dbo.Data0023.phone as '#30005#35805',' +
        'dbo.Data0023.Fax as '#20256#30495',dbo.Data0023.contact_name_1 as '#32852#31995#20154','
      
        'dbo.Data0023.tax_id_number as '#20184#27454#26041#24335',dbo.Data0023.analysis_code2 a' +
        's '#20184#27454#22320#28857',dbo.Data0023.analysis_code1 as '#31080#25454#31181#31867
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
        '5.RKEY LEFT JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr=' +
        ' dbo.Data0023.RKEY'
      'WHERE (( :so_tp = 3) or (Data0060.so_tp = :so_tp))'
      '      AND (( :ttype = 2) or (Data0025.ttype = :ttype))'
      '      AND (( :SO1 ='#39#39') or (Data0060.SALES_ORDER >=:SO1))'
      '      AND (( :SO2 ='#39#39') or (Data0060.SALES_ORDER <=:SO2))'
      '      AND (Data0060.ent_date >=:dtpk1)'
      '      AND (Data0060.ent_date <=:dtpk2)'
      '      AND (( :code = '#39#39') or (dbo.Data0023.code = :code))'
      
        '      AND (( :PO_NUMBER = '#39#39') or (dbo.Data0097.PO_NUMBER = :PO_N' +
        'UMBER))'
      '      AND dbo.Data0060.so_tp=1'
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
    object ADOQuery1DSDesigner27: TFloatField
      FieldName = #21333#20215
      ReadOnly = True
    end
    object ADOQuery1DSDesigner30: TFloatField
      FieldName = #37329#39069
      ReadOnly = True
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
    object ADOQuery1DSDesigner28: TStringField
      FieldName = #22806#21457#20379#24212#21830#20195#30721
      Size = 10
    end
    object ADOQuery1DSDesigner29: TStringField
      FieldName = #22806#21457#20379#24212#21830
      Size = 16
    end
    object ADOQuery1DSDesigner31: TStringField
      FieldName = #22806#21457#20379#24212#21830#20840#31216
      Size = 100
    end
    object ADOQuery1DSDesigner32: TStringField
      FieldName = #35814#32454#22320#22336
      Size = 100
    end
    object ADOQuery1DSDesigner33: TStringField
      FieldName = #30005#35805
    end
    object ADOQuery1DSDesigner34: TStringField
      FieldName = #20256#30495
    end
    object ADOQuery1DSDesigner35: TStringField
      FieldName = #32852#31995#20154
    end
    object ADOQuery1DSDesigner36: TStringField
      FieldName = #20184#27454#26041#24335
    end
    object ADOQuery1DSDesigner37: TStringField
      FieldName = #20184#27454#22320#28857
    end
    object ADOQuery1DSDesigner38: TStringField
      FieldName = #31080#25454#31181#31867
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\SCPurPOrpt.rtm'
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
        mmHeight = 8043
        mmLeft = 100616
        mmTop = 3440
        mmWidth = 92456
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #22806#21457#37319#36141#35746#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 133617
        mmTop = 14552
        mmWidth = 25400
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
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #22806#21457#20379#24212#21830#20840#31216
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
        mmLeft = 29903
        mmTop = 20108
        mmWidth = 22479
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
        mmLeft = 9525
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
        mmLeft = 27252
        mmTop = 2117
        mmWidth = 20902
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
        mmLeft = 105569
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
        mmLeft = 134144
        mmTop = 2117
        mmWidth = 16933
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
        mmLeft = 217223
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 234686
        mmTop = 2117
        mmWidth = 7027
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
        mmLeft = 257176
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 25135
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
        mmLeft = 50006
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
        mmLeft = 98690
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
        mmLeft = 198702
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
        mmLeft = 212990
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
        mmLeft = 229394
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
        mmLeft = 246063
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
        mmLeft = 71702
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 158750
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
        mmLeft = 202407
        mmTop = 1058
        mmWidth = 7112
        BandType = 0
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
        mmLeft = 167217
        mmTop = 1852
        mmWidth = 21167
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 128059
        mmTop = 0
        mmWidth = 265
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
        mmLeft = 7938
        mmTop = 0
        mmWidth = 268817
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
        mmHeight = 4022
        mmLeft = 9790
        mmTop = 2646
        mmWidth = 14563
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
        mmLeft = 105040
        mmTop = 2646
        mmWidth = 12869
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
        mmLeft = 136261
        mmTop = 2646
        mmWidth = 11515
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
        mmHeight = 4022
        mmLeft = 214313
        mmTop = 2646
        mmWidth = 14055
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #21333#20215
        DataPipeline = ppDB60
        DisplayFormat = '#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 234686
        mmTop = 2646
        mmWidth = 7027
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
        mmLeft = 247121
        mmTop = 2646
        mmWidth = 14055
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 7938
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
        mmLeft = 25135
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
        mmLeft = 50006
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
        mmLeft = 98690
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
        mmLeft = 198702
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
        mmLeft = 212990
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
        mmLeft = 229394
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
        mmLeft = 246063
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
        mmLeft = 276490
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
        mmLeft = 51594
        mmTop = 2646
        mmWidth = 46038
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 158750
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
        mmHeight = 4022
        mmLeft = 202671
        mmTop = 2910
        mmWidth = 7112
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3260
        mmLeft = 167746
        mmTop = 2910
        mmWidth = 14393
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 128059
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#35746#21333#21495
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
        mmLeft = 29374
        mmTop = 2646
        mmWidth = 16129
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
        Caption = #37319#36141#37096#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 10002
        mmTop = 3440
        mmWidth = 17568
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
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #25968#37327#21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 193146
        mmTop = 1323
        mmWidth = 15833
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = #35746#21333#25968#37327
        DataPipeline = ppDB60
        DisplayFormat = '#,0;-#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 209815
        mmTop = 1323
        mmWidth = 22945
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = #37329#39069
        DataPipeline = ppDB60
        DisplayFormat = '#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 251355
        mmTop = 1323
        mmWidth = 15917
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #37329#39069#21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 234686
        mmTop = 1323
        mmWidth = 15875
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
  object ppDB60: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB60'
    Left = 448
    Top = 113
  end
end

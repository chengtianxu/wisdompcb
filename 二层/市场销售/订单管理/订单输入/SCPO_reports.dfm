object frmSCPOrpt: TfrmSCPOrpt
  Left = 353
  Top = 242
  Width = 899
  Height = 468
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
    Width = 891
    Height = 346
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
    Width = 891
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
    object Button4: TButton
      Left = 803
      Top = 23
      Width = 75
      Height = 28
      Caption = #23548#20986'EXCEL'
      TabOrder = 10
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 891
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
        Size = 32
        Value = Null
      end
      item
        Name = 'PO_NUMBER'
        DataType = ftString
        Size = 32
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT rank() over(order by dbo.Data0060.S' +
        'ALES_ORDER) as '#24207#21495',dbo.Data0005.EMPLOYEE_NAME as '#19994#21153#21592#22995#21517','
      
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
        '.CURR_NAME as '#36135#24065#21517#31216',dbo.Data0001.CURR_CODE as '#36135#24065#20195#30721','
      
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
        's '#20184#27454#22320#28857',dbo.Data0023.analysis_code1 as '#31080#25454#31181#31867','
      
        'case dbo.Data0060.so_style when 0 then '#39#27491#24335#39' when 1 then '#39#22791#21697#39' els' +
        'e '#39#39' end as '#35746#21333#31867#22411
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
      
        'ORDER BY  dbo.Data0010.CUST_CODE,dbo.Data0097.PO_NUMBER,dbo.Data' +
        '0023.code,dbo.Data0060.SALES_ORDER')
    Left = 376
    Top = 112
    object ADOQuery1DSDesigner39: TLargeintField
      FieldName = #24207#21495
      ReadOnly = True
    end
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
    object ADOQuery1DSDesigner40: TStringField
      FieldName = #36135#24065#20195#30721
      Size = 5
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
    object ADOQuery1DSDesigner41: TStringField
      FieldName = #35746#21333#31867#22411
      ReadOnly = True
      Size = 4
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB60
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
      mmHeight = 65352
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
        mmLeft = 56150
        mmTop = 1852
        mmWidth = 85344
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #37319#36141#35746#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5630
        mmLeft = 89361
        mmTop = 19844
        mmWidth = 19981
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
        mmLeft = 3440
        mmTop = 2381
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
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3683
        mmLeft = 22225
        mmTop = 29104
        mmWidth = 22479
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText2'
        DataField = 'ship_address'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4826
        mmLeft = 529
        mmTop = 11642
        mmWidth = 196586
        BandType = 1
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #20379'        '#26041':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 29104
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#35746#21333#21495
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3979
        mmLeft = 162984
        mmTop = 29104
        mmWidth = 17187
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label11'
        Caption = #37319#36141#21333#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 29104
        mmWidth = 18754
        BandType = 1
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 34925
        mmWidth = 8086
        BandType = 1
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
        mmLeft = 162984
        mmTop = 34925
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #35814#32454#22320#22336
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
        mmLeft = 22172
        mmTop = 34925
        mmWidth = 12277
        BandType = 1
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #22320'        '#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 34925
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #30005#35805
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
        mmLeft = 21283
        mmTop = 40481
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #30005'        '#35805':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 40481
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #20256#30495
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
        mmLeft = 21283
        mmTop = 46038
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #20256#30495#21495#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 46038
        mmWidth = 15198
        BandType = 1
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #32852#31995#20154
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
        mmLeft = 21283
        mmTop = 51594
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #32852'  '#31995'  '#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 51594
        mmWidth = 15536
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #20132#36135#22320#28857':  '#39321#28207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 57150
        mmWidth = 24257
        BandType = 1
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #36135#24065#20195#30721
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3683
        mmLeft = 158221
        mmTop = 46038
        mmWidth = 12192
        BandType = 1
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #36135#24065#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 46038
        mmWidth = 15198
        BandType = 1
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = #31080#25454#31181#31867
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
        mmLeft = 158337
        mmTop = 51594
        mmWidth = 14055
        BandType = 1
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #21457#31080#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 51594
        mmWidth = 15198
        BandType = 1
      end
      object ppLabel23: TppLabel
        UserName = 'Label201'
        Caption = #20184#27454#26041#24335':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 139171
        mmTop = 57150
        mmWidth = 15198
        BandType = 1
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = #20184#27454#26041#24335
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
        mmLeft = 158337
        mmTop = 57150
        mmWidth = 14055
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
        mmLeft = 794
        mmTop = 0
        mmWidth = 196057
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 2117
        mmWidth = 14288
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
        mmLeft = 88900
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
        mmHeight = 3969
        mmLeft = 105569
        mmTop = 2117
        mmWidth = 7144
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
        mmLeft = 176213
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
        mmLeft = 10054
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
        mmLeft = 34660
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
        mmLeft = 64029
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
        mmLeft = 117740
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
        mmLeft = 166159
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
        mmLeft = 142346
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line40'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 99748
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #29289#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 42069
        mmTop = 2117
        mmWidth = 14288
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9790
        mmLeft = 84402
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #24037#20855#36153#29992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147373
        mmTop = 2117
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20132#36135#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67204
        mmTop = 2117
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 126207
        mmTop = 2117
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #24207#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 2117
        mmWidth = 7144
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
        mmLeft = 794
        mmTop = 0
        mmWidth = 195527
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
        mmLeft = 14880
        mmTop = 2910
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
        mmLeft = 85180
        mmTop = 2910
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
        mmLeft = 105627
        mmTop = 2910
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
        mmHeight = 3979
        mmLeft = 166952
        mmTop = 2910
        mmWidth = 28829
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 794
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
        mmLeft = 10054
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
        mmLeft = 34660
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
        mmLeft = 64029
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
        mmLeft = 117740
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
        mmLeft = 166159
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
        mmLeft = 142346
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
        mmLeft = 196321
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 10319
        mmLeft = 99748
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #24037#20855#36153#29992
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 4022
        mmLeft = 147109
        mmTop = 2910
        mmWidth = 14055
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
        mmLeft = 42546
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
        mmLeft = 84402
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = #37329#39069
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
        mmLeft = 125148
        mmTop = 2910
        mmWidth = 7027
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #22238#22797#20132#26399
        DataPipeline = ppDB60
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB60'
        mmHeight = 3175
        mmLeft = 66940
        mmTop = 2910
        mmWidth = 14309
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = #24207#21495
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
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 2910
        mmWidth = 7938
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 43921
      mmPrintPosition = 0
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 
          #19968#12289#25152#36865#29289#26009#24517#39035#25353#25105#21496#35201#27714#36865#36135#65292#24182#20445#35777#26159#21407#21378#27491#21697#65292#22914#21457#29616#25152#36865#29289#26009#20013#25530#26377#20551#27425#36135#65292#25105#21496#23558#26377#26435#25298#20184#36135#27454#24182#20570#30456#24212#22788#32602#65307#13#10#20108#12289#25910#21040#35746#21333#21518 +
          #35831#20110#20108#20010#24037#20316#26085#20869#21152#31614#32473#25105#21496#65292#21542#21017#25105#21496#23558#35270#20026#40664#35748#12290#13#10#19977#12289#20132#36135#26041#24335#65288'FCA HK'#65289#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #19968#12289#25152#36865#29289#26009#24517#39035#25353#25105#21496#35201#27714#36865#36135#65292#24182#20445#35777#26159#21407#21378#27491#21697#65292#22914#21457#29616#25152#36865#29289#26009#20013#25530#26377#20551#27425#36135#65292#25105#21496#23558#26377#26435#25298#20184#36135#27454#24182#20570#30456#24212#22788#32602#65307
          #20108#12289#25910#21040#35746#21333#21518#35831#20110#20108#20010#24037#20316#26085#20869#21152#31614#32473#25105#21496#65292#21542#21017#25105#21496#23558#35270#20026#40664#35748#12290
          #19977#12289#20132#36135#26041#24335#65288'FCA HK'#65289)
        Transparent = True
        mmHeight = 14817
        mmLeft = 794
        mmTop = 1323
        mmWidth = 194998
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #38656#26041#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 4233
        mmTop = 21696
        mmWidth = 10541
        BandType = 8
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20379#26041#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 137319
        mmTop = 21696
        mmWidth = 10583
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 7408
        mmLeft = 794
        mmTop = 529
        mmWidth = 196057
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
        mmLeft = 84667
        mmTop = 2117
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
        mmLeft = 124354
        mmTop = 2117
        mmWidth = 15917
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #24635#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 70644
        mmTop = 2117
        mmWidth = 11642
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #24635#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 110331
        mmTop = 2117
        mmWidth = 11642
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
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'Company_name2'
      FieldName = 'Company_name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'Company_name3'
      FieldName = 'Company_name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
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
    object ppDB60ppField1: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField2: TppField
      FieldAlias = #19994#21153#21592#22995#21517
      FieldName = #19994#21153#21592#22995#21517
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField3: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField4: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = #38144#21806#35746#21333
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField5: TppField
      FieldAlias = #35745#21010#20132#26399
      FieldName = #35745#21010#20132#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField6: TppField
      FieldAlias = #35746#21333#25968#37327
      FieldName = #35746#21333#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField7: TppField
      FieldAlias = #35746#21333#21442#32771
      FieldName = #35746#21333#21442#32771
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField8: TppField
      FieldAlias = #21333#20215
      FieldName = #21333#20215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField9: TppField
      FieldAlias = #37329#39069
      FieldName = #37329#39069
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField10: TppField
      FieldAlias = #35746#21333#20215#26684
      FieldName = #35746#21333#20215#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField11: TppField
      FieldAlias = #24037#20855#36153#29992
      FieldName = #24037#20855#36153#29992
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField12: TppField
      FieldAlias = #27719#29575
      FieldName = #27719#29575
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField13: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = #36135#24065#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField14: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = #36135#24065#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField15: TppField
      FieldAlias = #35746#21333#38754#31215
      FieldName = #35746#21333#38754#31215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField16: TppField
      FieldAlias = #20135#21697#31867#22411
      FieldName = #20135#21697#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField17: TppField
      FieldAlias = #35780#23457#26631#35760
      FieldName = #35780#23457#26631#35760
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField18: TppField
      FieldAlias = #21512#21516#21495
      FieldName = #21512#21516#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField19: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = #23458#25143#35746#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField20: TppField
      FieldAlias = #22238#22797#20132#26399
      FieldName = #22238#22797#20132#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField21: TppField
      FieldAlias = #35746#21333#26032#26087
      FieldName = #35746#21333#26032#26087
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField22: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = #26412#21378#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField23: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField24: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField25: TppField
      FieldAlias = #22823#26009#35268#26684
      FieldName = #22823#26009#35268#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField26: TppField
      FieldAlias = #20132#36135#23610#23544
      FieldName = #20132#36135#23610#23544
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField27: TppField
      FieldAlias = #21333#21482#38754#31215
      FieldName = #21333#21482#38754#31215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField28: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField29: TppField
      FieldAlias = #19979#21333#26085#26399
      FieldName = #19979#21333#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField30: TppField
      FieldAlias = #25104#22411#22791#27880
      FieldName = #25104#22411#22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField31: TppField
      FieldAlias = #20132#36135#21333#20803#25968
      FieldName = #20132#36135#21333#20803#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField32: TppField
      FieldAlias = #22806#21457#20379#24212#21830#20195#30721
      FieldName = #22806#21457#20379#24212#21830#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField33: TppField
      FieldAlias = #22806#21457#20379#24212#21830
      FieldName = #22806#21457#20379#24212#21830
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField34: TppField
      FieldAlias = #22806#21457#20379#24212#21830#20840#31216
      FieldName = #22806#21457#20379#24212#21830#20840#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField35: TppField
      FieldAlias = #35814#32454#22320#22336
      FieldName = #35814#32454#22320#22336
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField36: TppField
      FieldAlias = #30005#35805
      FieldName = #30005#35805
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField37: TppField
      FieldAlias = #20256#30495
      FieldName = #20256#30495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField38: TppField
      FieldAlias = #32852#31995#20154
      FieldName = #32852#31995#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField39: TppField
      FieldAlias = #20184#27454#26041#24335
      FieldName = #20184#27454#26041#24335
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField40: TppField
      FieldAlias = #20184#27454#22320#28857
      FieldName = #20184#27454#22320#28857
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField41: TppField
      FieldAlias = #31080#25454#31181#31867
      FieldName = #31080#25454#31181#31867
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDB60ppField42: TppField
      FieldAlias = #35746#21333#31867#22411
      FieldName = #35746#21333#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
  end
end
